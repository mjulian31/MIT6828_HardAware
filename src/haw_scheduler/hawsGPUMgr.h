#ifndef GPUMGR_H
#define GPUMGR_H

class HAWSGPUMgr {
    //Map tasksActive[TaskID] -> int (PID)
    //Map taskStatus[TaskID] -> enum status
    //Map tasksStartTime[TaskID] -> start timestamp
    //Map tasksEndTime[TaskID] -> end timestamp
    //GPUCostModel cputCostModel; //object TODO

    public:
        void StartTask(std::string binpath, std::string args) {}
        void GetTaskStatus () {}
        //int GetNumActiveTasks();
        void StopTask() {}
        void ColdQuery() {}
        void HotQuery() {}

};
#endif
