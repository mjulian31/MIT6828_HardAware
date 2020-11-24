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

static const char* TaskStatusToStr(TaskStatus ts) {
    return ts == TASK_RUNNING ? "TASK_RUNNING " :
           ts == TASK_FINISHED_SUCCESS ? "TASK_FINISHED_SUCCESS" :
           ts == TASK_FINISHED_NONZERO ? "TASK_FINISHED_NONZERO" :
           "TASK_FINISHED_ABNORMAL";
}

class HAWSCPUMgr {
    list<pid_t> allPids;
    unordered_map<pid_t, string> tasksActive;
    unordered_map<pid_t, TaskStatus> tasksStatus;
    unordered_map<pid_t, int> tasksStatusCode;
    unordered_map<pid_t, long> tasksStartTime;
    unordered_map<pid_t, long> tasksEndTime;
    std::mutex taskLock; 
    int activeTasks = 0;
    int printThrottle = 0;

    //unordered_map<int, std::chrono::steady_clock::time_point> tasksEndTime;

    //CPUCostModel cputCostModel; //object TODO

    private: 
        void MonitorProcess(int pid) {
           int status;
           pid_t state;

           // this checks a running PID (process) without stopping)
           /*
           if ((state = waitpid(pid, &status, WNOHANG)) >= 0) {  
               if (status == 0) {
                  tasksStatus[pid] = TASK_RUNNING;
               }         
           } else { 
               // waitpid() failed 
               printf("waitpid() was < 0\n"); 
               printf("errno error codes are ECHILD: %d, EINTR: %d, EINVAL %d\n", ECHILD, EINTR, EINVAL);
               printf("errno was = %d\n", errno);
               if (WIFEXITED(status) && !WEXITSTATUS(status)) {
                  printf("program execution successful\n"); 
                  tasksStatus[pid] = TASK_FINISHED_SUCCESS;
                  tasksActive.erase(pid);
               } else if (WIFEXITED(status) && WEXITSTATUS(status)) { 
                    if (WEXITSTATUS(status) == 127) { 
                        // execv failed 
                        printf("execv failed\n"); 
                        assert(false);
                    } 
                    else  {
                        printf("program terminated normally,"
                           " but returned a non-zero status\n");                 
                        tasksStatus[pid] = TASK_FINISHED_NONZERO;
                        tasksActive.erase(pid);
                    }
               } else {
                   printf("program didn't terminate normally - waitpid status %d\n", status); 
                   tasksStatus[pid] = TASK_FINISHED_ABNORMAL;
                   tasksActive.erase(pid);
               }
            } */
        }
    void SanityChecks () {
        std::unordered_map<int, string>::iterator it = tasksActive.begin();
        std::list<pid_t>::iterator allPidIt;
        while (it != tasksActive.end()) {
            pid_t pid = it->first;
            assert(this->tasksStatus[pid] == TASK_RUNNING);
            assert(this->tasksStatusCode[pid] == -1);
            assert(this->tasksStartTime[pid] > 0);
            assert(this->tasksEndTime[pid] == 0);
            it++;
        }
    }
    int TaskIsActiveProtected (pid_t pid) { // must lock before
        return this->tasksActive.find(pid) != this->tasksActive.end();
    }
    void PrintDataProtected () { // must lock before
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
    public:
        HAWSCPUMgr () {
           
        }
        int StartTask(string binpath, string args) {
            char* argv_list[] = {
                (char*) binpath.c_str(), 
                (char*) args.c_str(),
                (char*) 0
            };
            pid_t pid = start_subprocess_nonblocking(argv_list);
            taskLock.lock();
            allPids.insert(allPids.begin(), pid);
            tasksActive[pid] = binpath + " " + args;
            tasksStatus[pid] = TASK_RUNNING;
            tasksStatusCode[pid] = -1;
            tasksEndTime[pid] = 0; 
            tasksStartTime[pid] = (std::chrono::system_clock::now().time_since_epoch()).count();
            taskLock.unlock();
            return 0; // success
        }

        void Monitor () {
            taskLock.lock();

            //this->SanityChecks(); // make sure all invariants are satisfied

            /*
            while (it != tasksActive.end()) {
                this->MonitorProcess(it->first); // supply pid
                it++;
            }*/
            //if (printThrottle % 1000000 == 0) {
            //    this->PrintDataProtected();
            //}
            //printThrottle++;

            taskLock.unlock();
        }
        void PrintData () {
            taskLock.lock();
            this->PrintDataProtected();
            taskLock.unlock();
        }
        void TaskConclude(pid_t pid, TaskStatus task_status, int status) {  
            taskLock.lock();
            tasksEndTime[pid] = (std::chrono::system_clock::now().time_since_epoch()).count();
            tasksStatus[pid] = task_status;
            tasksStatusCode[pid] = status;
            tasksActive.erase(pid);
            taskLock.unlock();
        }
        int TaskIsActive (pid_t pid) { // must lock before
            taskLock.lock();
            bool active = this->TaskIsActiveProtected(pid);
            taskLock.unlock();
            return active;
        }
        int GetNumActiveTasks () { 
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
