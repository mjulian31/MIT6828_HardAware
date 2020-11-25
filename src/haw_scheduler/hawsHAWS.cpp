
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

// memory control - how much memory can the scheduler use for children?
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

list<pid_t> allCPUPids;
list<pid_t> allGPUPids;
#define IN_LIST(list, item) (std::find(list.begin(), list.end(), item) != list.end())
#define NOT_IN_LIST(list, item) (std::find(list.begin(), list.end(), item) == list.end())

float centsPerUnitTimeCPU = 0.001; // 1 penny per second default
float centsPerUnitTimeGPU = 0.0015; // 1.5 pennies per second default
long billableCPUms = 0;
long billableGPUms = 0;

std::chrono::time_point<std::chrono::system_clock> hawsStartTime; //ms 
std::chrono::time_point<std::chrono::system_clock> hawsStopTime; //ms TODO check chrono

int throttle = 0;

void HAWS::ReapChildren() {
    pid_t p;
    int status;
    int reapedTasks = 0;
    TaskStatus task_status;
    while ((p=waitpid(-1, &status, WNOHANG)) > 0) {
       long time_completed = (std::chrono::system_clock::now().time_since_epoch()).count();
       // debugging
       //printf("WAIDPID: PID %d status %d\n", p, status);
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
                task_status = TASK_FINISHED_NONZERO;
            }
       } else {
           task_status = TASK_FINISHED_ABNORMAL;
       }
       DispatchConclusion(p, task_status, status, time_completed); 
    }
    if (reapedTasks > 0) { printf("TARGMGR: subprocesses reaped: %d\n", reapedTasks); }
}

void HAWS::DispatchConclusion(pid_t pid, TaskStatus task_status, int status, long time_completed) {
    if (IN_LIST(allCPUPids, pid)) {
       assert(cpuMgr->TaskIsActive(pid));
       assert(NOT_IN_LIST(allGPUPids, pid));
       billableCPUms += cpuMgr->TaskConclude(pid, task_status, status, time_completed); 
   } else if (IN_LIST(allGPUPids, pid)) {
       assert(false); //NOT IMPLEMENTED
       assert(gpuMgr->TaskIsActive(pid));
       assert(NOT_IN_LIST(allCPUPids, pid));
       //gpuMgr->ConcludeTask(p, task_status, status); 
   }
}

void HAWS::ScheduleLoop() { // SCHEDLOOP THREAD
    printf("HAWS/SL: ScheduleLoop started...\n");
    int freedMBRam; // from task completion
    HAWSClientRequest* req;
    while (!globalKillFlag) {
        bool gotReq = false;
        tasksToStartQueueLock.lock(); // lock queue
        if (!tasksToStartQueue->empty()) { // check if item is in queue
            HAWSClientRequest* next = tasksToStartQueue->front();
            req = new HAWSClientRequest(next); // copy it to local req buffer
            // if no binary has enough physmem to run, 
            // leave queue alone until a task completion frees physmem
            if (globalSchedRAMAvail - req->GetCPUBinRAM() < 0 &&
                globalSchedRAMAvail - req->GetGPUBinRAM() < 0) {
                if (throttle % 1000 == 0) {
                    printf("Phys mem at capacity, waiting...\n");
                }
                gotReq = false;
            } else {
                tasksToStartQueue->pop();  // calls destructor on object in queue, req gone
                gotReq = true;
            }
        }
        tasksToStartQueueLock.unlock(); // unlock queue
        if (gotReq) { // schedule removed item
            //printf("HAWS/SL: dequeued %s\n", req->ToStr().c_str());
            ProcessClientRequest(req);
            free(req); // done processing client request
        }

        ReapChildren(); // collect all completed child processes
        
        //monitor HW targets
        cpuMgr->Monitor(); //update state of processes in cpu manager  
        globalSchedRAMAvail += cpuMgr->GetFreedMBRam(); // replenish physmem of finished tasks
    
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

void HAWS::RequeueReq(HAWSClientRequest* req) {
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req); //put it back in queue
    tasksToStartQueueLock.unlock();
}

void HAWS::StartTaskCPU(HAWSClientRequest* req) {
    int maxRAM = req->GetCPUBinRAM();
    globalSchedRAMAvail -= maxRAM;
    int pid = cpuMgr->StartTask(req->GetCPUBinPath(), req->GetTaskArgs(), maxRAM);
    allCPUPids.insert(allCPUPids.begin(), pid);
    //printf("HAWS/SL: CPU got %s\n", req->ToStr().c_str());
}

void HAWS::ProcessClientRequest(HAWSClientRequest* req) { //SCHEDLOOP THREAD
    HAWSHWTarget HWTarget = DetermineReqTarget(req);
    if (HWTarget == TargCPU) {
        if (globalSchedRAMAvail - req->GetCPUBinRAM() < 0) {
            RequeueReq(req); // this target doesn't have enough memory to run
        } else {
            StartTaskCPU(req);        
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

void HAWS::PrintData() {
    printf("HAWS: Hello From PrintData\n");
    auto elapsedUS = std::chrono::duration_cast<std::chrono::microseconds>(hawsStopTime - hawsStartTime).count();
    auto elapsedMS = std::chrono::duration_cast<std::chrono::milliseconds>(hawsStopTime - hawsStartTime).count();
    auto elapsedS = std::chrono::duration_cast<std::chrono::seconds>(hawsStopTime - hawsStartTime).count();
    printf("HAWS: System runtime: %ld us (%ld ms) (%ld s)\n", elapsedUS, elapsedMS, elapsedS);
    printf("HAWS: Billable CPU ms: %ld\n", billableCPUms);
    printf("HAWS: Billable CPU cents/ms: %f\n", centsPerUnitTimeCPU);
    float billableCents = centsPerUnitTimeCPU * billableCPUms;
    printf("HAWS: Billable CPU cents: %f cents (%f$)\n", billableCents, billableCents / 100);
    cpuMgr->PrintData();
}

void HAWS::Start() {
    assert(!schedLoopThreadRunning); // must be stopped before started
    hawsStartTime = std::chrono::system_clock::now();
    printf("HAWS: Starting ScheduleLoop\n");
    schedLoopThread = new thread(HAWS::ScheduleLoop); // start schedule loop
    globalKillFlag = false;          // disable killswitch for schedule loop 
    schedLoopThreadRunning = true;   // schedule loop thread active
    cpuMgr = new HAWSTargetMgr();
    gpuMgr = new HAWSTargetMgr();
}

void HAWS::Stop() {
    assert(schedLoopThreadRunning);  // must be started before stopped
    hawsStopTime = std::chrono::system_clock::now();
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
