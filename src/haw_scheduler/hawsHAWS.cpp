
#include <stdio.h>
#include <mutex>
#include <queue>
#include <thread>
#include <unistd.h>
#include "hawsHAWS.h"
#include "hawsCPUMgr.h"
#include "hawsGPUMgr.h"
#include "hawsClientRequest.h"
#include <unordered_map>

using namespace std;

mutex globalKillFlagLock; // signal to stop schedule loop / running tasks
bool globalKillFlag;

mutex tasksToStartQueueLock; // synchronizes queue access
queue<HAWSClientRequest*>* tasksToStartQueue;

HAWSCPUMgr* cpuMgr;
int cpuActiveTasks = 0;
HAWSGPUMgr* gpuMgr;
int gpuActiveTasks = 0;

void HAWS::ScheduleLoop() { // run by separate thread
    printf("HAWS/SL: ScheduleLoop started...\n");
    HAWSClientRequest* req;
    while (!globalKillFlag) {
        bool gotReq = false;
        tasksToStartQueueLock.lock(); // lock queue
        if (!tasksToStartQueue->empty()) { // check if item is in queue
            HAWSClientRequest* next = tasksToStartQueue->front();
            req = new HAWSClientRequest(next); // copy it to local req buffer
            tasksToStartQueue->pop();  // calls destructor on object in queue
            gotReq = true;
        } 
        tasksToStartQueueLock.unlock(); // unlock queue
        if (gotReq) { // schedule removed item
            printf("HAWS/SL: dequeued %s\n", req->ToStr().c_str());
            ProcessClientRequest(req);
            free(req); // done processing client request
        } 
        cpuActiveTasks = cpuMgr->Monitor(); //poll and update state of CPU processes
        //gpuActiveTasks = gpuMgr->Monitor(); //poll and update state of GPU processes
        usleep(1000);
    }
    printf("HAWS: ScheduleLoop ended...\n");
}

void HAWS::ProcessClientRequest(HAWSClientRequest* req) {
    HAWSHWTarget HWTarget = DetermineReqTarget(req);
    if (HWTarget == TargCPU) {
        int success = cpuMgr->StartTask(req->GetCPUBinPath(), req->GetTaskArgs());
        assert(success == 0);
    } else if (HWTarget == TargGPU) {
        //int success gpuMgr->StartTask(req->GetGPUBinPath(), req->GetTaskArgs());
        //assert(success == 0);
    } else {
        assert(false); // "hardware target not implemented"
    }
    printf("HAWS/SL: processed %s\n", req->ToStr().c_str());
}

HAWSHWTarget HAWS::DetermineReqTarget(HAWSClientRequest* req) {
    bool shouldUseCPU = true;

    //TODO consult extra hints or profiling info to pick target intelligently
    // do analysis to determine if should use CPU or gpu

    return shouldUseCPU ? TargCPU : TargGPU;
}

HAWS::HAWS() {
    printf("HAWS: Constructed\n");
    tasksToStartQueue = new queue<HAWSClientRequest*>();
}

void HAWS::PrintData() {
    printf("HAWS: Hello From PrintData\n");
}

void HAWS::Start() {
    printf("HAWS: Starting ScheduleLoop\n");
    assert(!schedLoopThreadRunning); // must be stopped before started
    schedLoopThread = new thread(HAWS::ScheduleLoop); // start schedule loop
    globalKillFlag = false;          // disable killswitch for schedule loop 
    schedLoopThreadRunning = true;   // schedule loop thread active

    cpuMgr = new HAWSCPUMgr();
    gpuMgr = new HAWSGPUMgr();
}

void HAWS::Stop() {
    assert(schedLoopThreadRunning);  // must be started before stopped
    printf("HAWS: Stopping ScheduleLoop\n");
    globalKillFlag = true;           // enable killswitch for schedule loop thread
    schedLoopThread->join();         // block until thread exits and returns
    globalKillFlag = false;          // reset killswitch
    schedLoopThreadRunning = false;  // schedule loop thread gone
}

void HAWS::HardAwareSchedule(HAWSClientRequest* req) {
    assert(tasksToStartQueue != NULL);
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req);
    tasksToStartQueueLock.unlock(); 
}
