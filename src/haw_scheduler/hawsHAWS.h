#ifndef HAWS_H_
#define HAWS_H_

//#include <queue>
//#include <unistd.h>
//#include <assert.h>

#include <mutex>
#include <thread>

#include "hawsClientRequest.h"
#include "hawsUtil.h"

extern bool sockLoopKillFlag;

enum HAWSHWTarget { TargCPU, TargGPU };

enum TaskStatus { 
    TASK_RUNNING, 
    TASK_FINISHED_SUCCESS, 
    TASK_FINISHED_NONZERO, 
    TASK_FINISHED_ABNORMAL
};

typedef struct HAWSConclusion {
    int reqNum;
    std::string targRun;
    float wallTime;
    float cpuTime;
    int exitCode;
    int outputLen;
    std::string output;
    // cost accumulation stuff
    long targetRealBillableUS;
} HAWSResponse;

class HAWS {
    private:
        int reqCounter;

        int physMemLimitMB;
        int gpuMemLimitMB;
        int gpuSharedMemLimitMB; 
    
        bool schedLoopThreadRunning;
        std::thread* schedLoopThread;
        
        // requests
        bool sockThreadReqsRunning;
        std::thread* sockThreadReqs;
        int portReqs = 8080;
        // responses
        
        int sockResp1 = -1;
        int portResp1 = 8081;

        std::mutex tasksActiveLock;
        int cpuTasksActive = 0;
        int gpuTasksActive = 0;

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
        /*
        void ParseFields();
        void StartTaskCPUManager();
        void StartTaskGPUManager();
        void StopTaskCPUManager();
        void StopTaskGPUManager();
        void ColdQueryCPUManager();
        void ColdQueryGPUManager();
        void HotQueryCPUManager();
        void HotQueryGPUManager();
        */
    public:
        HAWS();
        ~HAWS();
        void SetPhysMemLimitMB(int limitMB) { this->physMemLimitMB = limitMB; }
        void SetGPUMemLimitMB(int limitMB) { this->gpuMemLimitMB = limitMB; }
        void SetGPUSharedMemLimitMB(int limitMB) { this->gpuSharedMemLimitMB = limitMB; }
        void StartSocket();
        void Start();
        void HardAwareSchedule(HAWSClientRequest* req);
        int GetNumActiveTasks();
        int GetNumQueuedReqs();
        bool IsDoingWork();
        void PrintData();
        void Stop();
        void StopSocket();
};

#endif
