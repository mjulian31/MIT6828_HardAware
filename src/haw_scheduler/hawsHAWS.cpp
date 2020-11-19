
class HAWS {
    //Lock globalTerminationFlagLock;
    //Lock tasksActiveLock;
    //Lock tasksToStartQueue;
    bool globalTerminationFlag;
    //Map cpuTaskIDs[TaskID] -> status
    //Map cpuBinaryPaths[TaskID] -> string?
    int cpuTasksActive = 0;
    //Map gpuTaskIDs[TaskID] -> status
    //Map gpuBinaryPaths[TaskID] -> string?
    int gpuTasksActive = 0;

    //Map workloadTask[TaskID] -> string (args?)
    //Map offlineStaticAnalysis[TaskID] -> object TODO
    //Queue tasksToStartQueue[ClientRequests]

    int
    public:
        void HAWS_Main() {}
        void HAWS_ScheduleLoop {}

     
    private:
        void HAWSHardAwareSchedule() {};
        void HAWSParseFields() {};
        void HAWSStartTaskCPUManager() {};
        void HAWSStartTaskGPUManager() {};
        void HAWSStopTaskCPUManager() {};
        void HAWSStopTaskGPUManager() {};
        void HAWSColdQueryCPUManager() {};
        void HAWSColdQueryGPUManager() {};
        void HAWSHotQueryCPUManager() {};
        void HAWSHotQueryGPUManager() {};
        void PrintData() {};        
};
