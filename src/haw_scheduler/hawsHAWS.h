#ifndef HAWS_H
#define HAWS_H

#include "hawsClientRequest.h"
#include <mutex>
#include <queue>
#include <assert.h>

using namespace std;

class HAWS {
    private:
        mutex tasksToStartQueueLock; // synchronizes queue access
        queue<HAWSClientRequest*>* tasksToStartQueue;

        mutex globalTerminationFlagLock;
        mutex tasksActiveLock;
        bool globalTerminationFlag;
        //Map cpuTaskIDs[TaskID] -> status
        //Map cpuBinaryPaths[TaskID] -> string?
        int cpuTasksActive = 0;
        //Map gpuTaskIDs[TaskID] -> status
        //Map gpuBinaryPaths[TaskID] -> string?
        int gpuTasksActive = 0;

        //Map workloadTask[TaskID] -> string (args?)
        //Map offlineStaticAnalysis[TaskID] -> object TODO
    
        void ScheduleLoop() {
            
        }

        void ParseFields() {};
        void StartTaskCPUManager() {};
        void StartTaskGPUManager() {};
        void StopTaskCPUManager() {};
        void StopTaskGPUManager() {};
        void ColdQueryCPUManager() {};
        void ColdQueryGPUManager() {};
        void HotQueryCPUManager() {};
        void HotQueryGPUManager() {};

    public:
        HAWS()
        {
            printf("HAWS Constructed\n");
            tasksToStartQueue = new queue<HAWSClientRequest*>();
        }

        void PrintData()
        {
            printf("Hello from HAWS\n");
        }

        void Start();

        void Stop();

        void HardAwareSchedule(HAWSClientRequest* req)
        {
            tasksToStartQueueLock.lock();
            assert(tasksToStartQueue != NULL);
            tasksToStartQueue->push(req);
            tasksToStartQueueLock.unlock(); 
        }

        
};


#endif
