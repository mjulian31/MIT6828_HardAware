#ifndef HAWS_H_
#define HAWS_H_

#include "hawsClientRequest.h"
#include <mutex>
#include <queue>
#include <thread>
#include <unistd.h>
#include <assert.h>

using namespace std;

class HAWS {
    private:
        bool schedLoopThreadRunning;
        thread* schedLoopThread;

        mutex tasksActiveLock;
        //Map cpuTaskIDs[TaskID] -> status
        //Map cpuBinaryPaths[TaskID] -> string?
        int cpuTasksActive = 0;
        //Map gpuTaskIDs[TaskID] -> status
        //Map gpuBinaryPaths[TaskID] -> string?
        int gpuTasksActive = 0;

        //Map workloadTask[TaskID] -> string (args?)
        //Map offlineStaticAnalysis[TaskID] -> object TODO
    
        static void ScheduleLoop(); 
        void ParseFields();
        void StartTaskCPUManager();
        void StartTaskGPUManager();
        void StopTaskCPUManager();
        void StopTaskGPUManager();
        void ColdQueryCPUManager();
        void ColdQueryGPUManager();
        void HotQueryCPUManager();
        void HotQueryGPUManager();

    public:
        HAWS();
        void Start();
        void HardAwareSchedule(HAWSClientRequest* req);
        void Stop();
        void PrintData();

};


#endif
