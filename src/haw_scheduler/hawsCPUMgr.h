#ifndef CPUMGR_H
#define CPUMGR_H

#include "subprocess.h"
#include <unordered_map>
#include <chrono>
#include <stdio.h>


class HAWSCPUMgr {
    unordered_map<int, string> tasksActive;
    unordered_map<int, string> tasksStatus;
    unordered_map<int, long> tasksStartTime;

    //unordered_map<int, std::chrono::steady_clock::time_point> tasksEndTime;

    //CPUCostModel cputCostModel; //object TODO

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
            tasksStatus[pid] = "running";
            tasksStartTime[pid] = (std::chrono::system_clock::now().time_since_epoch()).count();
            return 0; // success
        }

        int Monitor () {
            std::unordered_map<int, string>::iterator it = tasksActive.begin();
            int activeTasks = 0;
            while (it != tasksActive.end()) {
                int pid = it->first;
                printf("CPUMGR: monitor PID %d\n", pid);
                printf("CPUMGR:         started at %ld\n", tasksStartTime[pid]);
                activeTasks++;
                it++;
            }
            printf("CPUMGR: I own %d tasks\n", activeTasks);
            return activeTasks;
        }

        void GetTaskStatus () {}
        void StopTask() {}
        void ColdQuery() {}
        void HotQuery() {}
};

#endif
