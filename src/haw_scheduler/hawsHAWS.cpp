
#include <stdio.h>
#include <algorithm>
#include <mutex>
#include <queue>
#include <thread>
#include <unistd.h>
#include <cstring>
#include "hawsHAWS.h"
#include "hawsTargetMgr.h"
#include "hawsGPUMgr.h"
#include "hawsClientRequest.h"
#include <unordered_map>

using namespace std;

mutex globalKillFlagLock; // signal to stop schedule loop / running tasks
bool globalKillFlag;

mutex tasksToStartQueueLock; // synchronizes queue access
queue<HAWSClientRequest*>* tasksToStartQueue;

HAWSTargetMgr* cpuMgr;
HAWSTargetMgr* gpuMgr;

mutex globalMemLock;
// physmem control 
#define SCHED_MEM_MAX_RR1 (1024*58) // use up to 58GB of 64GB phys ram
#define SCHED_MEM_MAX_CLOUDLAB 62464
// gpu memory control
#define SCHED_MEM_GPU_MAX_RR1 (1024*5) // use up to 5GB of 6GB gpu ram
#define SCHED_MEM_GPU_MAX_CLOUDLAB (1024*6) // update on cloudlab

//must change when on other systems
#define SCHED_MEM_MAX     SCHED_MEM_MAX_RR1
#define SCHED_MEM_GPU_MAX SCHED_MEM_GPU_MAX_RR1

int globalSchedRAMAvail = SCHED_MEM_MAX;
int globalSchedRAMGPUAvail = SCHED_MEM_GPU_MAX;

int globalNumTasksActive = 0;

list<pid_t> allCPUPids;
list<pid_t> allGPUPids;

void HAWS::ReapChildren() {
    pid_t p;
    int status;
    int reapedTasks = 0;
    TaskStatus task_status;
    while ((p=waitpid(-1, &status, WNOHANG)) > 0) {
       long time_completed = (std::chrono::system_clock::now().time_since_epoch()).count();
       /* Handle the death of pid p */
       //printf("SIGCHLD SIGNAL: PID %d status %d\n", p, status);

       // debugging
       //printf("waitpid() was < 0\n"); 
       //printf("errno codes are ECHILD: %d, EINTR: %d, EINVAL %d\n", ECHILD, EINTR, EINVAL);
       //printf("errno was = %d\n", errno);

       if (WIFEXITED(status) && !WEXITSTATUS(status)) {
          //printf("program execution successful\n"); 
          task_status = TASK_FINISHED_SUCCESS;
       } else if (WIFEXITED(status) && WEXITSTATUS(status)) { 
            if (WEXITSTATUS(status) == 127) { 
                // execv failed 
                printf("execv failed\n"); 
                task_status = TASK_FINISHED_ABNORMAL;
                assert(false);
            } 
            else  {
                //printf("program terminated normally,"
                //   " but returned a non-zero status\n");                 
                task_status = TASK_FINISHED_NONZERO;
            }
       } else {
           //printf("program didn't terminate normally\n");             
           task_status = TASK_FINISHED_ABNORMAL;
       }

       if (std::find(allCPUPids.begin(), allCPUPids.end(), p) != allCPUPids.end()) {
           assert(cpuMgr->TaskIsActive(p));
           assert(std::find(allGPUPids.begin(), allGPUPids.end(), p) == allGPUPids.end());
           cpuMgr->TaskConclude(p, task_status, status, time_completed); 
       }

       //printf("concluding task\n");

       //printf("done!\n");

       //}// else if (gpuMgr->TaskOwned(p) {
        //   gpuMgr->ConcludeTask(p, task_status, status); 
        // }
       //else {
       //    assert(false); //unclaimed process
       //}
       //printf("globalNumTasksActive = %d\n", globalNumTasksActive);
    }
}

void HAWS::ScheduleLoop() { // SCHEDLOOP THREAD
    printf("HAWS/SL: ScheduleLoop started...\n");
    int throttle = 0;
    int freedMBRam; // from task completion
    HAWSClientRequest* req;
    while (!globalKillFlag) {
        bool gotReq = false;
        tasksToStartQueueLock.lock(); // lock queue
        if (!tasksToStartQueue->empty()) { // check if item is in queue
            HAWSClientRequest* next = tasksToStartQueue->front();
            req = new HAWSClientRequest(next); // copy it to local req buffer
            // if neither binary has enough mem to run, leave queue alone until a task completion
            if (globalSchedRAMAvail - req->GetCPUBinRAM() < 0 &&
                globalSchedRAMAvail - req->GetGPUBinRAM() < 0) {
                if (throttle % 1000 == 0) {
                    printf("Phys mem at capacity, waiting...\n");
                }
                gotReq = false;
            } else {
                tasksToStartQueue->pop();  // calls destructor on object in queue
                gotReq = true;
            }
        } 
        tasksToStartQueueLock.unlock(); // unlock queue
        if (gotReq) { // schedule removed item
            //printf("HAWS/SL: dequeued %s\n", req->ToStr().c_str());
            ProcessClientRequest(req);
            free(req); // done processing client request
        }

        ReapChildren();
        
        //monitor HW targets
        cpuMgr->Monitor(); //update state of processes in cpu manager  
        globalSchedRAMAvail += cpuMgr->GetFreedMBRam(); // replenish mem of finished tasks
    
        //freedMBRam = gpuMgr->Monitor();
        //globalSchedRAMAvail += gpuMgr->GetFreedMBRam();
        //globalSchedRAMGPUAvail += gpuMgr->GetFreedGPUMBRam();

        if (throttle++ % 1000 == 0) {
            printf("HAWS/SL: free phys mem %dMB (%d%%)\n", globalSchedRAMAvail, 
                   (int)(((float) globalSchedRAMAvail / (float) SCHED_MEM_MAX)*100));
            printf("HAWS/SL: free gpu mem %dMB (%d%%)\n", globalSchedRAMGPUAvail, 
                   (int)(((float) globalSchedRAMGPUAvail / (float) SCHED_MEM_GPU_MAX)*100));
        }

        usleep(50); // yield CPU
    }
    printf("HAWS: ScheduleLoop ended...\n");
}

void HAWS::ProcessClientRequest(HAWSClientRequest* req) { //SCHEDLOOP THREAD
    HAWSHWTarget HWTarget = DetermineReqTarget(req);
    if (HWTarget == TargCPU) {
        // this target doesn't have enough memory to run
        if (globalSchedRAMAvail - req->GetCPUBinRAM() < 0) {
            tasksToStartQueueLock.lock();
            tasksToStartQueue->push(req); //put it back in queue
            tasksToStartQueueLock.unlock();
            //printf("HAWS/SL: requed a CPU task request");
        } else {
            int maxRAM = req->GetCPUBinRAM();
            globalSchedRAMAvail -= maxRAM;
            int pid = cpuMgr->StartTask(req->GetCPUBinPath(), req->GetTaskArgs(), maxRAM);
            allCPUPids.insert(allCPUPids.begin(), pid);
            globalNumTasksActive++;
            //printf("HAWS/SL: CPU got %s\n", req->ToStr().c_str());
        }
    } else if (HWTarget == TargGPU) {
        //int success gpuMgr->StartTask(req->GetGPUBinPath(), req->GetTaskArgs());
        //assert(success == 0);
    } else {
        assert(false); // "hardware target not implemented"
    }
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
    return cpuMgr->GetNumActiveTasks();
}
//int HAWS::GetNumActiveTasksGPU() {
//    return gpuMgr->GetNumActiveTasks();
//}

void HAWS::PrintData() {
    printf("HAWS: Hello From PrintData\n");
    cpuMgr->PrintData();
}

/*
void SIGCHLD_Handler(int sig)
{
    pid_t p;
    int status;
    TaskStatus task_status;
    while ((p=waitpid(-1, &status, WNOHANG)) > 0) {
       long time_completed = (std::chrono::system_clock::now().time_since_epoch()).count();
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
              //printf("program execution successful\n"); 
              task_status = TASK_FINISHED_SUCCESS;
           } else if (WIFEXITED(status) && WEXITSTATUS(status)) { 
                if (WEXITSTATUS(status) == 127) { 
                    // execv failed 
                    printf("execv failed\n"); 
                    task_status = TASK_FINISHED_ABNORMAL;
                    assert(false);
                } 
                else  {
                    //printf("program terminated normally,"
                    //   " but returned a non-zero status\n");                 
                    task_status = TASK_FINISHED_NONZERO;
                }
           } else {
               //printf("program didn't terminate normally\n");             
               task_status = TASK_FINISHED_ABNORMAL;
           }

           //if (cpuMgr->TaskIsActive(p)) {
           printf("concluding task\n");
           cpuMgr->TaskConclude(p, task_status, status, time_completed); 
           printf("done!\n");

           //}// else if (gpuMgr->TaskOwned(p) {
            //   gpuMgr->ConcludeTask(p, task_status, status); 
            // }
           //else {
           //    assert(false); //unclaimed process
           //}
           globalNumTasksActive--;
           printf("globalNumTasksActive = %d\n", globalNumTasksActive);
    }
}*/



void HAWS::Start() {
    printf("HAWS: Starting ScheduleLoop\n");
    assert(!schedLoopThreadRunning); // must be stopped before started
    schedLoopThread = new thread(HAWS::ScheduleLoop); // start schedule loop
    globalKillFlag = false;          // disable killswitch for schedule loop 
    schedLoopThreadRunning = true;   // schedule loop thread active

    cpuMgr = new HAWSTargetMgr();
    gpuMgr = new HAWSTargetMgr();

    //register SIGCHLD handler to handle all child processes that change state
//    struct sigaction sa;
//    memset(&sa, 0, sizeof(sa));
//    sa.sa_handler = SIGCHLD_Handler;
//    sigaction(SIGCHLD, &sa, NULL);
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
