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
    int targRanLen;
    char* targRan;
    int wallTimeLen;
    char* wallTime;
    int cpuTimeLen;
    char* cpuTime;
    int exitCode;
    int outputLen;
    char* freeableOutput;
    char* output;
    char* taskID;
    // cost accumulation stuff
    long targetRealBillableUS;
} HAWSResponse;

class HAWS {
    private:
        int cpuThreadLimit;
        int gpuThreadLimit;
        int physMemLimitMB;
        int gpuMemLimitMB;
        int gpuSharedMemLimitMB;

        bool schedLoopThreadRunning;
        std::thread* schedLoopThread;

        // requests
        bool sockThreadReqsRunning;
        std::thread* sockThreadReqs;
        int portReqs = 8080;

        std::mutex tasksActiveLock;
        int cpuTasksActive = 0; // unused?
        int gpuTasksActive = 0; // unused?

        //SCHEDLOOP THREAD
        static void ScheduleLoop(int cpuThreadLimit, int gpuThreadLimit,
                                 int physMemLimitMB, int gpuMemLimitMB, int gpuSharedMemLimitMB);
        static void ReapChildren();
        static void DispatchConclusion(pid_t, TaskStatus, int status, time_point time_completed);
        static void ProcessClientRequest(HAWSClientRequest* req);
        static void RequeueReq(HAWSClientRequest* req);
        static void StartTaskCPU(HAWSClientRequest* req);
        static void StartTaskGPU(HAWSClientRequest* req);
        static HAWSHWTarget DetermineReqTarget(HAWSClientRequest* req);
        static HAWSHWTarget RandomizeTarget(HAWSHWTarget best_target, float favor);

        //RESPONSE THREAD
        static void RespLoop(int port);
        static void SendConclusion(int socket, char* buf, long max_bytes, HAWSConclusion* resp);

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
        void SetCPUThreadLimit(int limitTrs) { this->cpuThreadLimit = limitTrs; };
        void SetGPUThreadLimit(int limitTrs) { this->gpuThreadLimit = limitTrs; };
        void SetPhysMemLimitMB(int limitMB) { this->physMemLimitMB = limitMB; }
        void SetGPUMemLimitMB(int limitMB) { this->gpuMemLimitMB = limitMB; }
        void SetGPUSharedMemLimitMB(int limitMB) { this->gpuSharedMemLimitMB = limitMB; }
        void Start();
        void StartSocket();
        void HardAwareSchedule(HAWSClientRequest* req);
        static bool IsRespLoopRunning();
        static void StartRespLoop();
        int GetNumActiveTasks();
        int GetNumQueuedReqs();
        bool IsDoingWork();
        void PrintData();
        void Stop();
        void StopSocket();
};

#endif
