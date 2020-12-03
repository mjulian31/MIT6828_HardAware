
//#include <stdio.h>
//#include <algorithm>
//#include <queue>
//#include <unistd.h>
//#include <cstring>
//#include <unordered_map>

#include <assert.h>
#include <mutex>
#include <queue>
#include <sys/wait.h>
#include "hawsUtil.h"
#include "hawsHAWS.h"
#include "hawsTargetMgr.h"
#include "hawsGPUMgr.h"
#include "hawsClientRequest.h"
#include "socket.h"

//using namespace std;

//std::mutex schedLoopKillFlagLock; // signal to stop schedule loop / running tasks
bool schedLoopKillFlag;
bool sockLoopKillFlag;

std::mutex tasksToStartQueueLock; // synchronizes queue access
std::queue<HAWSClientRequest*>* tasksToStartQueue;

HAWSTargetMgr* cpuMgr;
HAWSTargetMgr* gpuMgr;

// memory control - how much memory can the scheduler use for children?
std::mutex globalMemLock;


int globalPhysMemAvail = 0;
int globalGPUMemAvail = 0;
int globalGPUSharedMemAvail = 0;

std::list<pid_t> allCPUPids;
std::list<pid_t> allGPUPids;

float centsPerUnitTimeCPU = 0.000001; // 1 penny per second default
float centsPerUnitTimeGPU = 0.0000015; // 1.5 pennies per second default
long billableCPUus = 0;
long billableGPUus = 0;

time_point hawsStartTime;
time_point hawsStopTime;

int throttle = 0;

void HAWS::ReapChildren() { // SCHEDLOOP THREAD
    pid_t p;
    int status;
    int reapedTasks = 0;
    TaskStatus task_status;
    while ((p=waitpid(-1, &status, WNOHANG)) > 0) {
       time_point time_completed = std::chrono::system_clock::now();
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

// SCHEDLOOP THREAD
void HAWS::DispatchConclusion(pid_t pid, TaskStatus task_status, int status, time_point ended) {
    if (IN_LIST(allCPUPids, pid)) {
       assert(cpuMgr->TaskIsActive(pid));
       assert(NOT_IN_LIST(allGPUPids, pid));
       billableCPUus += cpuMgr->TaskConclude(pid, task_status, status, ended); 
   } else if (IN_LIST(allGPUPids, pid)) {
       assert(gpuMgr->TaskIsActive(pid));
       assert(NOT_IN_LIST(allCPUPids, pid));
       billableGPUus += gpuMgr->TaskConclude(pid, task_status, status, ended); 
   }
}

// SCHEDLOOP THREAD
void HAWS::ScheduleLoop(int physMemLimitMB, int gpuMemLimitMB, int gpuSharedMemLimitMB) { 
    printf("HAWS/SL: ScheduleLoop started...\n");
    int freedMBRam; // from task completion
    while (!schedLoopKillFlag) {
        tasksToStartQueueLock.lock(); // lock queue
        if (!tasksToStartQueue->empty()) { // check if item is in queue
            HAWSClientRequest* next = tasksToStartQueue->front();
            // if no binary has enough physmem to run, 
            // leave queue alone until a task completion frees physmem
            if (globalPhysMemAvail - next->GetCPUBinRAM() < 0 &&
                globalPhysMemAvail - next->GetGPUBinRAM() < 0) {
                if (throttle % 1000 == 0) {
                    printf("Phys mem at capacity, waiting...\n");
                }
                // do not deque next work and continue for another round to try
            } else {
                ProcessClientRequest(next);
            }
        }
        tasksToStartQueueLock.unlock(); // unlock queue
        
        //monitor HW targets
        cpuMgr->Monitor(); //update state of processes in cpu manager  
        globalPhysMemAvail += cpuMgr->GetFreedMBRam(); // replenish physmem of finished tasks
    
        //freedMBRam = gpuMgr->Monitor();
        //globalPhysMemAvail += gpuMgr->GetFreedMBRam();
        //globalGPUMemAvail += gpuMgr->GetFreedGPUMBRam();

        if (throttle++ % 1000 == 0) {
            printf("HAWS/SL: free phys mem %dMB (%d%%)\n", globalPhysMemAvail, 
                   (int)(((float) globalPhysMemAvail / (float) physMemLimitMB)*100));
            printf("HAWS/SL: free gpu mem %dMB (%d%%)\n", globalGPUMemAvail, 
                   (int)(((float) globalGPUMemAvail / (float) gpuMemLimitMB)*100));
        }

        ReapChildren(); // collect all completed child processes
        usleep(50); // yield CPU
    }
    printf("HAWS: ScheduleLoop ended...\n");
}

void HAWS::RequeueReq(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req); //put it back in queue
    tasksToStartQueueLock.unlock();
}
 
void HAWS::StartTaskCPU(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    int maxRAM = req->GetCPUBinRAM();
    globalPhysMemAvail -= maxRAM;
    printf("HAWS: Starting CPU Task\n");
    int pid = cpuMgr->StartTask(req->GetCPUBinPath(), 
                                req->GetTaskArgs(), 
                                req->GetStdinBuf(), req->GetStdinBufLen(), maxRAM);
    allCPUPids.insert(allCPUPids.begin(), pid);
    //printf("HAWS/SL: CPU got %s\n", req->ToStr().c_str());
}

void HAWS::StartTaskGPU(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    int maxRAM = req->GetCPUBinRAM();
    //globalPhysMemAvail -= maxRAM;
    printf("HAWS: Starting GPU Task\n");
    int pid = gpuMgr->StartTask(req->GetCPUBinPath(),
                                req->GetTaskArgs(),
                                req->GetStdinBuf(), req->GetStdinBufLen(), maxRAM);
    allGPUPids.insert(allGPUPids.begin(), pid);
}

void HAWS::ProcessClientRequest(HAWSClientRequest* req) { //SCHEDLOOP THREAD
    HAWSHWTarget HWTarget = DetermineReqTarget(req);
    if (HWTarget == TargCPU) {
        if (globalPhysMemAvail - req->GetCPUBinRAM() < 0) {
            //RequeueReq(req); // this target doesn't have enough memory to run
            return;
        } else {
            StartTaskCPU(req);        
            req->FreeStdinBuf(); // FREES FREEABLE STDIN (LARGE)
            tasksToStartQueue->pop();  // calls destructor on object in queue, next gone
            delete req; // req is really gone
        }
    } else if (HWTarget == TargGPU) {
        StartTaskGPU(req);
        req->FreeStdinBuf(); // FREES FREEABLE STDIN (LARGE)
        tasksToStartQueue->pop();  // calls destructor on object in queue, next gone
        delete req; // done processing client req
    } else {
        assert(false); // "hardware target not implemented"
    }
}

HAWSHWTarget HAWS::DetermineReqTarget(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    bool shouldUseCPU = req->GetTarget() == "cpu";

    //TODO consult extra hints or profiling info to pick target intelligently
    // do analysis to determine if should use CPU or gpu

    return shouldUseCPU ? TargCPU : TargGPU;
}

// MAIN THREAD BELOW

HAWS::HAWS() {
    printf("HAWS: Constructed\n");
    
    tasksToStartQueue = new std::queue<HAWSClientRequest*>();
}

HAWS::~HAWS() {
    assert(tasksToStartQueue->size() == 0); // shouldn't leave stuff in queue
    delete tasksToStartQueue;
}

int HAWS::GetNumQueuedReqs() {
    tasksToStartQueueLock.lock();
    int size = tasksToStartQueue->size();
    tasksToStartQueueLock.unlock();
    return size;
}

int HAWS::GetNumActiveTasks() {
    return cpuMgr->GetNumActiveTasks() + gpuMgr->GetNumActiveTasks();
}

bool HAWS::IsDoingWork() {
    return GetNumQueuedReqs() > 0 || GetNumActiveTasks() > 0;
}

void HAWS::PrintData() {
    printf("HAWS: Hello From PrintData\n");
    auto elapsedUS = TIMEDIFF_CAST_USEC(hawsStopTime - hawsStartTime);
    auto elapsedMS = TIMEDIFF_CAST_MSEC(hawsStopTime - hawsStartTime);
    auto elapsedS = TIMEDIFF_CAST_SEC(hawsStopTime - hawsStartTime);
    printf("HAWS: System runtime: %ld us (%ld ms) (%ld s)\n", elapsedUS, elapsedMS, elapsedS);
    printf("HAWS: Billable CPU us: %ld\n", billableCPUus);
    printf("HAWS: Billable CPU cents/us: %f\n", centsPerUnitTimeCPU);
    float billableCents = centsPerUnitTimeCPU * billableCPUus;
    printf("HAWS: Billable CPU cents: %f cents (%f$)\n", billableCents, billableCents / 100);
    cpuMgr->PrintData();
    gpuMgr->PrintData();
}

void HAWS::Start() {
    hawsStartTime = std::chrono::system_clock::now();

    assert(!schedLoopThreadRunning); // must be stopped before started

    // set resource limits -- cpu and gpu memory
    assert(this->physMemLimitMB > 0);
    assert(this->gpuMemLimitMB > 0);
    assert(this->gpuSharedMemLimitMB > 0);
    globalPhysMemAvail = this->physMemLimitMB;
    globalGPUMemAvail = this->gpuMemLimitMB;
    globalGPUSharedMemAvail = this->gpuSharedMemLimitMB;

    schedLoopKillFlag = false; // disable killswitch for schedule loop and socket loops

    // start schedule loop
    printf("HAWS: Starting ScheduleLoop\n");
    schedLoopThread = new std::thread(HAWS::ScheduleLoop, 
                                      this->physMemLimitMB, 
                                      this->gpuMemLimitMB, 
                                      this->gpuSharedMemLimitMB);    
    schedLoopThreadRunning = true; // schedule loop thread active

    // create and start hardware target managers -- currently cpu and gpu
    cpuMgr = new HAWSTargetMgr("cpu");
    gpuMgr = new HAWSTargetMgr("gpu");
    cpuMgr->Start();
    gpuMgr->Start();
}

void HAWS::Stop() {
    hawsStopTime = std::chrono::system_clock::now(); // save full stop time

    tasksToStartQueueLock.lock();
    int enqueuedReqs = tasksToStartQueue->size();
    tasksToStartQueueLock.unlock();

    // should not stop with reqs in flight in queue
    assert(enqueuedReqs == 0); 

    // all memory should be relased from all tasks being completed
    assert(globalPhysMemAvail = this->physMemLimitMB);
    assert(globalGPUMemAvail = this->gpuMemLimitMB);
    assert(globalGPUSharedMemAvail = this->gpuSharedMemLimitMB);
    assert(schedLoopThreadRunning);   // must be started before stopped

    schedLoopKillFlag = true; // enable killswitch for schedule loop thread

    printf("HAWS: Stopping ScheduleLoop\n");
    schedLoopThread->join();          // block until thread exits and returns
    schedLoopThreadRunning = false;   // schedule loop thread gone
    delete(schedLoopThread);

    // print info once stopped
    this->PrintData();

    // stop and free target managers
    cpuMgr->Stop();
    gpuMgr->Stop();
    delete cpuMgr;
    delete gpuMgr;

    schedLoopKillFlag = false; // reset killswitch - scheduler is now off
}

void HAWS::StartSocket() {
    // start client1 socket loop
    printf("HAWS: Starting SocketLoop (Client1)\n");
    sockLoopKillFlag = false; // disable killswitch for socket loop thread
    sockThreadClient1 = new std::thread(haws_socket_loop, this->portClient1); 
    sockThreadClient1Running = true; // socket loop thread active
    sleep(1); // give it a chance to start
}

void HAWS::StopSocket() {
    printf("HAWS: Stopping Socket (Client1)\n");
    assert(sockThreadClient1Running); // must be started before stopped
    sockLoopKillFlag = true; // enable killswitch for socket loop thread
    sockThreadClient1->join();            // block until thread exits and returns
    sockThreadClient1Running = false;     // sock loop thread gone
    delete(sockThreadClient1);
}

void HAWS::HardAwareSchedule(HAWSClientRequest* req) {
    assert(tasksToStartQueue != NULL);
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req);
    tasksToStartQueueLock.unlock(); 
}
