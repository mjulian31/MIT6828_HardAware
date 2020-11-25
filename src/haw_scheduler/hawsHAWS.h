#ifndef HAWS_H_
#define HAWS_H_

#include "hawsClientRequest.h"
#include <mutex>
#include <queue>
#include <thread>
#include <unistd.h>
#include <assert.h>

using namespace std;

enum HAWSHWTarget { TargCPU, TargGPU };

enum TaskStatus { 
    TASK_RUNNING, 
    TASK_FINISHED_SUCCESS, 
    TASK_FINISHED_NONZERO, 
    TASK_FINISHED_ABNORMAL
};

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
   
        //SCHEDLOOP THREAD 
        static void ScheduleLoop(); 
        static void ReapChildren();
        static void DispatchConclusion(pid_t, TaskStatus, int status, long time_completed);
        static void ProcessClientRequest(HAWSClientRequest* req);
        static void RequeueReq(HAWSClientRequest* req);
        static void StartTaskCPU(HAWSClientRequest* req);
        static HAWSHWTarget DetermineReqTarget(HAWSClientRequest* req);

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
        int GetNumActiveTasks();
        //int GetNumActiveTasksGPU();
        void Stop();
        void PrintData();

};


#endif
