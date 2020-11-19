
class CPUMgr {
    //Map tasksActive[TaskID] -> int (PID)
    //Map taskStatus[TaskID] -> enum status
    //Map tasksStartTime[TaskID] -> start timestamp
    //Map tasksEndTime[TaskID] -> end timestamp
    //CPUCostModel cputCostModel; //object TODO

    public:
        void CPUMgr_StartTask() {}
        void CPUMgr_GetTaskStatus () {}
        void CPUMgr_StopTask() {}
        void CPUMgr_ColdQuery() {}
        void CPUMgr_HotQuery() {}
};
