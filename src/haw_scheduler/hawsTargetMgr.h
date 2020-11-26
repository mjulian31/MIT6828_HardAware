#ifndef CPUMGR_H
#define CPUMGR_H

#include <list>
#include <chrono>
#include <stdio.h>
#include <unordered_map>

#include "subprocess.h"
#include "hawsUtil.h"

using namespace std; 

static const char* TaskStatusToStr(TaskStatus ts) {
    return ts == TASK_RUNNING ? "TASK_RUNNING " :
           ts == TASK_FINISHED_SUCCESS ? "TASK_FINISHED_SUCCESS" :
           ts == TASK_FINISHED_NONZERO ? "TASK_FINISHED_NONZERO" :
           "TASK_FINISHED_ABNORMAL";
}

class HAWSTargetMgr {
    list<pid_t> allPids;
    unordered_map<pid_t, string> tasksCompleted;
    unordered_map<pid_t, string> tasksActive;
    unordered_map<pid_t, TaskStatus> tasksStatus;
    unordered_map<pid_t, int> tasksStatusCode;
    unordered_map<pid_t, time_point> tasksStartTime;
    unordered_map<pid_t, time_point> tasksEndTime;
    unordered_map<pid_t, int> tasksMaxRAM;
    unordered_map<pid_t, long> tasksBillableUS;
    std::mutex taskLock; 
    std::mutex completionLock; 
    int activeTasks = 0;
    int throttle = 0;
    int freedPhysMB = 0;

    //CPUCostModel cputCostModel; //object TODO

    private: 
    inline void SanityCheckActiveTasks () { // holding lock
        unordered_map<int, string>::iterator it = tasksActive.begin();
        list<pid_t>::iterator allPidIt;
        while (it != tasksActive.end()) {
            pid_t pid = it->first;
            assert(this->tasksStatus[pid] == TASK_RUNNING);
            assert(this->tasksStatusCode[pid] == -1);
            assert(this->tasksBillableUS[pid] == 0);
            it++;
        }
    }
    inline void SanityCheckCompletedTasks () { // holding lock
        if (tasksCompleted.size() == 0) {
            return;
        }
        unordered_map<pid_t, string>::iterator it = tasksCompleted.begin();
        while (it != tasksCompleted.end()) {
            pid_t pid = it->first;
            assert(this->tasksStatus[pid] != TASK_RUNNING);
            assert(this->tasksStatusCode[pid] != -1);
            assert(this->tasksBillableUS[pid] > 0);
            it++;
        }
    }
    int TaskIsActiveProtected (pid_t pid) { // holding lock 
        return this->tasksActive.find(pid) != this->tasksActive.end();
    }
    void PrintProcessProtected(pid_t pid) { // holding lock
        printf("HWMGR: PID %d\n", pid);
        printf("HWMGR:  in active set: %d\n", this->TaskIsActiveProtected(pid));  
        printf("HWMGR:    task status: %s\n", TaskStatusToStr(tasksStatus[pid]));
        printf("HWMGR:    status code: %d\n", tasksStatusCode[pid]);
        printf("HWMGR:   max phys mem: %d\n", tasksMaxRAM[pid]);  
        printf("HWMGR:    billable ms: %ld\n", tasksBillableUS[pid]);  
    }
    void PrintAllProcessesProtected() { // holding lock
        list<pid_t>::iterator it = allPids.begin();
        for (it != allPids.begin(); it != allPids.end(); ++it) {
            this->PrintProcessProtected(*it);
        }
    }
    void PrintDataProtected () { // holding lock
        printf("TARGMGR/CPU | processes %ld/%ld active/all\n", 
                tasksActive.size(), allPids.size());
        
    }
    void TaskCompleteAccountingProtected(pid_t pid, TaskStatus ts, int s_code, time_point ended) {
        tasksEndTime[pid] = ended;
        tasksStatus[pid] = ts;
        tasksStatusCode[pid] = s_code;
        tasksCompleted[pid] = "STDOUT"; //TODO
        tasksActive.erase(pid);
        this->freedPhysMB += tasksMaxRAM[pid];
        tasksBillableUS[pid] = TIMEDIFF_CAST_USEC(tasksEndTime[pid] - tasksStartTime[pid]);
    }
    public:
        HAWSTargetMgr () { }
        int StartTask(string binpath, string args, int maxRAM) {
            char* argv_list[] = { (char*) binpath.c_str(), (char*) args.c_str(), (char*) 0 };
            pid_t pid = start_subprocess_nonblocking(argv_list);
            time_point start_time = chrono::system_clock::now();
            taskLock.lock();
            allPids.insert(allPids.begin(), pid);
            tasksActive[pid] = binpath + " " + args;
            tasksStatus[pid] = TASK_RUNNING;
            tasksStatusCode[pid] = -1;
            tasksStartTime[pid] = start_time; 
            tasksMaxRAM[pid] = maxRAM;
            tasksBillableUS[pid] = 0;
            taskLock.unlock();
            return pid;
        }
        
        void Monitor () { //SCHEDLOOP THREAD
            if (throttle % 1000 == 0) { // make sure all invariants are satisfied
                //printf("-->doing sanity check\n");
                taskLock.lock();
                this->SanityCheckActiveTasks(); 
                this->SanityCheckCompletedTasks();
                if (throttle % 1000 == 0) {
                    this->PrintDataProtected();
                }
                taskLock.unlock();
                //printf("<--done doing sanity check\n");
            } throttle++;
            //usleep(1); //simulate extra work
        }
        void PrintData () {
            taskLock.lock();
            this->PrintDataProtected();
            taskLock.unlock();
        }   
        int GetFreedMBRam() {
            taskLock.lock();
            int freed = this->freedPhysMB;
            this->freedPhysMB = 0; // requester has been notified with reclaimed mem
            taskLock.unlock();
            return freed;
        }
        int TaskConclude(pid_t pid, TaskStatus ts, int status_code, 
                         time_point time_completed) { //SCHEDLOOP THREAD
            //printf("locking TaskConclude\n");
            taskLock.lock();
            //printf("doing accounting\n");
            this->TaskCompleteAccountingProtected(pid, ts, status_code, time_completed); 
            int billableUS = tasksBillableUS[pid];
            //printf("done doing accounting\n");
            taskLock.unlock();
            //printf("unlocked TaskConclude\n");
            return billableUS;
        }
        int TaskIsActive(pid_t pid) {
            taskLock.lock();
            bool active = this->TaskIsActiveProtected(pid);
            taskLock.unlock();
            return active;
        }
        int GetNumActiveTasks() { 
            taskLock.lock();
            int size = this->tasksActive.size(); 
            taskLock.unlock();
            return size;
        }

        // shelved
        void GetTaskStatus () {}
        void StopTask() {}
        void ColdQuery() {}
        void HotQuery() {}
};

#endif
