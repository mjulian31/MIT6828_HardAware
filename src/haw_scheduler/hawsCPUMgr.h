#ifndef CPUMGR_H
#define CPUMGR_H

#include "subprocess.h"

class HAWSCPUMgr {
    //Map tasksActive[TaskID] -> int (PID)
    //Map taskStatus[TaskID] -> enum status
    //Map tasksStartTime[TaskID] -> start timestamp
    //Map tasksEndTime[TaskID] -> end timestamp
    //CPUCostModel cputCostModel; //object TODO

    public:
        void StartTask(string binpath, string args) {
            char* argv_list[] = {
                (char*) binpath.c_str(), 
                (char*) args.c_str(),
                (char*) 0
            };
            start_subprocess_nonblocking_monitor(argv_list);
        }
        void GetTaskStatus () {}
        void StopTask() {}
        void ColdQuery() {}
        void HotQuery() {}
};

#endif
