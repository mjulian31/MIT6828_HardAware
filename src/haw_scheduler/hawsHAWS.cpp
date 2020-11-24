
#include <stdio.h>
#include <mutex>
#include <queue>
#include <thread>
#include <unistd.h>
#include <cstring>
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
HAWSGPUMgr* gpuMgr;

int globalNumTasksActive = 0;


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
        //MonitorHWTargets();
        cpuMgr->Monitor(); //update state of processes in cpu manager
        //gpuMgr->Monitor(); //update state of processes in gpu manager
    }
    printf("HAWS: ScheduleLoop ended...\n");
}

void HAWS::ProcessClientRequest(HAWSClientRequest* req) {
    HAWSHWTarget HWTarget = DetermineReqTarget(req);
    if (HWTarget == TargCPU) {
        int success = cpuMgr->StartTask(req->GetCPUBinPath(), req->GetTaskArgs());
        globalNumTasksActive++;
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

int HAWS::GetNumActiveTasks() {
    return globalNumTasksActive;
}
//int HAWS::GetNumActiveTasksGPU() {
//    return gpuMgr->GetNumActiveTasks();
//}

void HAWS::PrintData() {
    printf("HAWS: Hello From PrintData\n");
    cpuMgr->PrintData();
}

void SIGCHLD_Handler(int sig)
{
    pid_t p;
    int status;
    TaskStatus task_status;

    while ((p=waitpid(-1, &status, WNOHANG)) > 0) {
       long time_completed = (std::chrono::system_clock::now().time_since_epoch()).count();
       /* Handle the death of pid p */
       printf("SIGCHLD SIGNAL: PID %d status %d\n", p, status);
       //if (status == 0) {
              //if (print_state_throttle++ % 1000 == 0) { // print once a second
              //    printf("pid %d still running...\n", pid);
              //}
              //usleep(1000); // sleep for a millisecond
       //} else { 
           // waitpid() failed 
       //    printf("waitpid() was < 0\n"); 
       //    printf("errno error codes are ECHILD: %d, EINTR: %d, EINVAL %d\n", ECHILD, EINTR, EINVAL);
       //    printf("errno was = %d\n", errno);
           if (WIFEXITED(status) && !WEXITSTATUS(status)) {
              printf("program execution successful\n"); 
              task_status = TASK_FINISHED_SUCCESS;
           } else if (WIFEXITED(status) && WEXITSTATUS(status)) { 
                if (WEXITSTATUS(status) == 127) { 
                    // execv failed 
                    printf("execv failed\n"); 
                    task_status = TASK_FINISHED_ABNORMAL;
                    assert(false);
                } 
                else  {
                    printf("program terminated normally,"
                       " but returned a non-zero status\n");                 
                    task_status = TASK_FINISHED_NONZERO;
                }
           } else {
               printf("program didn't terminate normally\n");             
               task_status = TASK_FINISHED_ABNORMAL;
           }

           //if (cpuMgr->TaskIsActive(p)) {

           cpuMgr->TaskConclude(p, task_status, status, time_completed); 

           //}// else if (gpuMgr->TaskOwned(p) {
            //   gpuMgr->ConcludeTask(p, task_status, status); 
            // }
           //else {
           //    assert(false); //unclaimed process
           //}
           globalNumTasksActive--;
    }
}



void HAWS::Start() {
    printf("HAWS: Starting ScheduleLoop\n");
    assert(!schedLoopThreadRunning); // must be stopped before started
    schedLoopThread = new thread(HAWS::ScheduleLoop); // start schedule loop
    globalKillFlag = false;          // disable killswitch for schedule loop 
    schedLoopThreadRunning = true;   // schedule loop thread active

    cpuMgr = new HAWSCPUMgr();
    gpuMgr = new HAWSGPUMgr();

    //register SIGCHLD handler to handle all child processes that change state
    struct sigaction sa;
    memset(&sa, 0, sizeof(sa));
    sa.sa_handler = SIGCHLD_Handler;
    sigaction(SIGCHLD, &sa, NULL);
}

void HAWS::Stop() {
    assert(schedLoopThreadRunning);  // must be started before stopped
    printf("HAWS: Stopping ScheduleLoop\n");
    globalKillFlag = true;           // enable killswitch for schedule loop thread
    schedLoopThread->join();         // block until thread exits and returns
    globalKillFlag = false;          // reset killswitch
    schedLoopThreadRunning = false;  // schedule loop thread gone
    this->PrintData();
}

void HAWS::HardAwareSchedule(HAWSClientRequest* req) {
    assert(tasksToStartQueue != NULL);
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req);
    tasksToStartQueueLock.unlock(); 
}
