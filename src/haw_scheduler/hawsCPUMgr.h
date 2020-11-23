#ifndef CPUMGR_H
#define CPUMGR_H

#include "subprocess.h"
#include <unordered_map>
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
    unordered_map<int, string> tasksActive;
    unordered_map<int, TaskStatus> tasksStatus;
    unordered_map<int, long> tasksStartTime;
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

    public:
        HAWSCPUMgr () {
            
        }
        int StartTask(string binpath, string args) {
            char* argv_list[] = {
                (char*) binpath.c_str(), 
                (char*) args.c_str(),
                (char*) 0
            };
            int pid = start_subprocess_nonblocking(argv_list);

            tasksActive[pid] = binpath + " " + args;
            tasksStatus[pid] = TASK_RUNNING;
            tasksStartTime[pid] = (std::chrono::system_clock::now().time_since_epoch()).count();
            return 0; // success
        }

        void Monitor () {
            std::unordered_map<int, string>::iterator it = tasksActive.begin();
            while (it != tasksActive.end()) {
                this->MonitorProcess(it->first); // supply pid
                it++;
            }
            /*
            if (printThrottle % 1000000 == 0) {
                it = tasksActive.begin();
                while (it != tasksActive.end()) {
                    int pid = it->first;
                    printf("CPUMGR: monitor PID %d\n", pid);
                    printf("CPUMGR:         started at %ld\n", tasksStartTime[pid]);
                    printf("CPUMGR:         status: %s\n", TaskStatusToStr(tasksStatus[pid]));
                    it++;
                }
            }
            printThrottle++;
            */
        }
        int GetNumActiveTasks () { 
            return this->tasksActive.size(); 
        }
        void GetTaskStatus () {}
        void StopTask() {}
        void ColdQuery() {}
        void HotQuery() {}
};

#endif
