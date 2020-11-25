#ifndef CPUMGR_H
#define CPUMGR_H

#include "subprocess.h"
#include <unordered_map>
#include <list>
#include <chrono>
#include <stdio.h>

using namespace std; 

enum TaskStatus { 
    TASK_RUNNING, 
    TASK_FINISHED_SUCCESS, 
    TASK_FINISHED_NONZERO, 
    TASK_FINISHED_ABNORMAL
};

/*
typdef struct TaskCompleted {
    pid_t pid;
    TaskStatus task_status;
    int status_code;
    long time_completed;
} TaskCompleted; */

static const char* TaskStatusToStr(TaskStatus ts) {
    return ts == TASK_RUNNING ? "TASK_RUNNING " :
           ts == TASK_FINISHED_SUCCESS ? "TASK_FINISHED_SUCCESS" :
           ts == TASK_FINISHED_NONZERO ? "TASK_FINISHED_NONZERO" :
           "TASK_FINISHED_ABNORMAL";
}

static void hassert(bool cond, string msg) {
    if (!cond) {
        printf("ASSERT %s:", msg.c_str());
        exit(1);
    }
}

class HAWSTargetMgr {
    list<pid_t> allPids;
    unordered_map<pid_t, string> tasksCompleted;
    unordered_map<pid_t, string> tasksActive;
    unordered_map<pid_t, TaskStatus> tasksStatus;
    unordered_map<pid_t, int> tasksStatusCode;
    unordered_map<pid_t, long> tasksStartTime;
    unordered_map<pid_t, long> tasksEndTime;
    unordered_map<pid_t, int> tasksMaxRAM;
    std::mutex taskLock; 
    std::mutex completionLock; 
    int activeTasks = 0;
    int printThrottle = 0;
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
            assert(this->tasksStartTime[pid] > 0);
            assert(this->tasksEndTime[pid] == 0);
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
            assert(this->tasksStartTime[pid] > 0);
            assert(this->tasksEndTime[pid] > this->tasksStartTime[pid]);
            it++;
        }
    }
    int TaskIsActiveProtected (pid_t pid) { // holding lock 
        return this->tasksActive.find(pid) != this->tasksActive.end();
    }
    void PrintDataProtected () { // holding lock
        list<pid_t>::iterator it = allPids.begin();
        printf("\nPROCESS SET | CPU processes %ld/%ld active/all\n", 
                tasksActive.size(), allPids.size());
        for (it != allPids.begin(); it != allPids.end(); ++it) {
            pid_t pid = *it;
            printf("CPUMGR: PID %d\n", pid);
            printf("CPUMGR:  in active set: %d\n", this->TaskIsActiveProtected(pid));  
            printf("CPUMGR:        started: %ld\n", tasksStartTime[pid]);
            printf("CPUMGR:          ended: %ld\n", tasksEndTime[pid]);
            printf("CPUMGR:    task status: %s\n", TaskStatusToStr(tasksStatus[pid]));
            printf("CPUMGR:    status code: %d\n", tasksStatusCode[pid]);
        }
    }
    void TaskCompleteAccountingProtected(pid_t pid, TaskStatus ts, int s_code, long time_completed) {
        tasksEndTime[pid] = time_completed;
        tasksStatus[pid] = ts;
        tasksStatusCode[pid] = s_code;
        tasksCompleted[pid] = "STDOUT";
        tasksActive.erase(pid);
        this->freedPhysMB += tasksMaxRAM[pid];
    }
    public:
        HAWSTargetMgr () { }
        int StartTask(string binpath, string args, int maxRAM) {
            char* argv_list[] = {
                (char*) binpath.c_str(), (char*) args.c_str(), (char*) 0
            };
            pid_t pid = start_subprocess_nonblocking(argv_list);
            long start_time = (chrono::system_clock::now().time_since_epoch()).count();
            assert(start_time > 0);
            taskLock.lock();
            allPids.insert(allPids.begin(), pid);
            tasksActive[pid] = binpath + " " + args;
            tasksStatus[pid] = TASK_RUNNING;
            tasksStatusCode[pid] = -1;
            tasksEndTime[pid] = 0; 
            tasksStartTime[pid] = start_time; 
            tasksMaxRAM[pid] = maxRAM;
            taskLock.unlock();
            return 0; // success
        }
        
        void Monitor () { //SCHEDLOOP THREAD
            pid_t p;
            int status;
            int reapedTasks = 0;
            TaskStatus task_status;
            while ((p=waitpid(-1, &status, WNOHANG)) > 0) {
               long time_completed = (std::chrono::system_clock::now().time_since_epoch()).count();
               /* Handle the death of pid p */
               //printf("SIGCHLD SIGNAL: PID %d status %d\n", p, status);

               // debugging
               //printf("waitpid() was < 0\n"); 
               //printf("errno codes are ECHILD: %d, EINTR: %d, EINVAL %d\n", ECHILD, EINTR, EINVAL);
               //printf("errno was = %d\n", errno);

               if (WIFEXITED(status) && !WEXITSTATUS(status)) {
                  //printf("program execution successful\n"); 
                  task_status = TASK_FINISHED_SUCCESS;
               } else if (WIFEXITED(status) && WEXITSTATUS(status)) { 
                    if (WEXITSTATUS(status) == 127) { 
                        // execv failed 
                        printf("execv failed\n"); 
                        task_status = TASK_FINISHED_ABNORMAL;
                        assert(false);
                    } 
                    else  {
                        //printf("program terminated normally,"
                        //   " but returned a non-zero status\n");                 
                        task_status = TASK_FINISHED_NONZERO;
                    }
               } else {
                   //printf("program didn't terminate normally\n");             
                   task_status = TASK_FINISHED_ABNORMAL;
               }

               //if (cpuMgr->TaskIsActive(p)) {
               //printf("concluding task\n");
               this->TaskConclude(p, task_status, status, time_completed); 

               //printf("done!\n");

               //}// else if (gpuMgr->TaskOwned(p) {
                //   gpuMgr->ConcludeTask(p, task_status, status); 
                // }
               //else {
               //    assert(false); //unclaimed process
               //}
               //printf("globalNumTasksActive = %d\n", globalNumTasksActive);
            }

            //printf("-->doing sanity check\n");
            taskLock.lock();
            if (printThrottle % 1000 == 0) { // make sure all invariants are satisfied
                this->SanityCheckActiveTasks(); 
                this->SanityCheckCompletedTasks();
            //    this->PrintDataProtected();
            }
            printThrottle++;
            //usleep(1); //simulate work
            taskLock.unlock();
            //printf("<--done doing sanity check\n");

            if (reapedTasks > 0) {
                printf("TARGMGR: subprocesses reaped: %d\n", reapedTasks);
            }
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
        void TaskConclude(pid_t pid, TaskStatus ts, int status_code, 
                         long time_completed) { //SCHEDLOOP THREAD
            //printf("locking TaskConclude\n");
            taskLock.lock();
            //printf("doing accounting\n");
            this->TaskCompleteAccountingProtected(pid, ts, status_code, 
                                                                      time_completed); 
            //printf("done doing accounting\n");
            taskLock.unlock();
            //printf("unlocked TaskConclude\n");
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
        void GetTaskStatus () {}
        void StopTask() {}
        void ColdQuery() {}
        void HotQuery() {}
};

#endif
