#ifndef GPUMGR_H
#define GPUMGR_H

class HAWSGPUMgr {
    //Map tasksActive[TaskID] -> int (PID)
    //Map taskStatus[TaskID] -> enum status
    //Map tasksStartTime[TaskID] -> start timestamp
    //Map tasksEndTime[TaskID] -> end timestamp
    //GPUCostModel cputCostModel; //object TODO

    public:
        void GPUMgr_StartTask() {}
        void GPUMgr_GetTaskStatus () {}
        void GPUMgr_StopTask() {}
        void GPUMgr_ColdQuery() {}
        void GPUMgr_HotQuery() {}

};
#endif
