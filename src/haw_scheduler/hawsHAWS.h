#ifndef HAWS_H_
#define HAWS_H_

//#include <queue>
//#include <unistd.h>
//#include <assert.h>

#include <mutex>
#include <thread>

#include "hawsClientRequest.h"
#include "hawsUtil.h"

//using namespace std;

extern bool globalKillFlag;

enum HAWSHWTarget { TargCPU, TargGPU };

enum TaskStatus { 
    TASK_RUNNING, 
    TASK_FINISHED_SUCCESS, 
    TASK_FINISHED_NONZERO, 
    TASK_FINISHED_ABNORMAL
};

class HAWS {
    private:
        int physMemLimitMB;
        int gpuMemLimitMB;
        int gpuSharedMemLimitMB; 
    
        bool schedLoopThreadRunning;
        std::thread* schedLoopThread;

        bool sockThreadClient1Running;
        std::thread* sockThreadClient1;
        int portClient1 = 8080;

        std::mutex tasksActiveLock;
        //Map cpuTaskIDs[TaskID] -> status
        //Map cpuBinaryPaths[TaskID] -> string?
        int cpuTasksActive = 0;
        //Map gpuTaskIDs[TaskID] -> status
        //Map gpuBinaryPaths[TaskID] -> string?
        int gpuTasksActive = 0;

        //Map workloadTask[TaskID] -> string (args?)
        //Map offlineStaticAnalysis[TaskID] -> object TODO
   
        //SCHEDLOOP THREAD 
        static void ScheduleLoop(int physMemLimitMB, int gpuMemLimitMB, int gpuSharedMemLimitMB); 
        static void ReapChildren();
        static void DispatchConclusion(pid_t, TaskStatus, int status, time_point time_completed);
        static void ProcessClientRequest(HAWSClientRequest* req);
        static void RequeueReq(HAWSClientRequest* req);
        static void StartTaskCPU(HAWSClientRequest* req);
        static void StartTaskGPU(HAWSClientRequest* req);
        static HAWSHWTarget DetermineReqTarget(HAWSClientRequest* req);
    

        //unused
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
        ~HAWS();
        void SetPhysMemLimitMB(int limitMB) { this->physMemLimitMB = limitMB; }
        void SetGPUMemLimitMB(int limitMB) { this->gpuMemLimitMB = limitMB; }
        void SetGPUSharedMemLimitMB(int limitMB) { this->gpuSharedMemLimitMB = limitMB; }
        void Start();
        void HardAwareSchedule(HAWSClientRequest* req);
        int GetNumActiveTasks();
        int GetNumQueuedReqs();
        bool IsDoingWork();
        void PrintData();
        void Stop();
};


#endif
