
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
#include "hawsClientRequest.h"
#include "hawsSocket.h"
#include "socket.h"
#include <stdlib.h>
#include <time.h>
#include <unordered_map>
#include <climits>

//using namespace std;

//std::mutex schedLoopKillFlagLock; // signal to stop schedule loop / running tasks
bool schedLoopKillFlag;
bool sockLoopKillFlag;

std::mutex tasksToStartQueueLock; // synchronizes queue access
std::queue<HAWSClientRequest*>* tasksToStartQueue;

std::mutex conclusionLock;
std::list<HAWSConclusion*> pendConclusions;
bool threadRespLoopRunning = false;
std::thread* threadRespLoop;

// target managers
HAWSTargetMgr* cpuMgr;     // CPU
HAWSTargetMgr* gpuMgr;     // GPU
//(other possible future targets)
//HAWSTargetMgr* tpuMgr;   // TPU
//HAWSTargetMgr* asicMgr;  // ASIC
//HAWSTargetMgr* fpgaMgr;  // FPGA

//std::mutex globalMemLock; //old

// thread control - how many threads can the scheduler use for children?
int globalCPUThreadsAvail = 0;
int globalGPUThreadsAvail = 0;
// memory control - how much memory can the scheduler use for children?
int globalPhysMemAvail = 0;
int globalGPUMemAvail = 0;
//int globalGPUSharedMemAvail = 0;

int reqCounter = 0;

std::list<pid_t> allCPUPids;
std::list<pid_t> allGPUPids;

std::unordered_map<std::string, long> CPUTimeMap;
std::unordered_map<std::string, long> GPUTimeMap;
std::unordered_map<std::string, long> CPUChoicesMap;
std::unordered_map<std::string, long> GPUChoicesMap;

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
    time_point time_completed;
    while ((p=waitpid(-1, &status, WNOHANG)) > 0) {
       time_completed = std::chrono::system_clock::now();
       // debugging
       //DEBUGPR("WAIDPID: PID %d status %d\n", p, status);
       //DEBUGPR("waitpid() was < 0\n");
       //DEBUGPR("errno codes are ECHILD: %d, EINTR: %d, EINVAL %d\n", ECHILD, EINTR, EINVAL);
       //DEBUGPR("errno was = %d\n", errno);

       if (WIFEXITED(status) && !WEXITSTATUS(status)) {
          //DEBUGPR("program execution successful\n");
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
    if (reapedTasks > 0) { DEBUGPR("TARGMGR: subprocesses reaped: %d\n", reapedTasks); }
}

// SCHEDLOOP THREAD
void HAWS::DispatchConclusion(pid_t pid, TaskStatus task_status, int status, time_point ended) {
    HAWSConclusion* conclusion;
    if (IN_LIST(allCPUPids, pid)) {
       assert(cpuMgr->TaskIsActive(pid));
       assert(NOT_IN_LIST(allGPUPids, pid));
       conclusion = cpuMgr->TaskConclude(pid, task_status, status, ended);
       long wallTime = std::stol(conclusion->wallTime);
       std::string id = std::string(conclusion->taskID);
       // put min wall time in map
       if (CPUTimeMap.count(id) > 0) {
         // in map
         CPUTimeMap[id] = (wallTime < CPUTimeMap[id])? wallTime: CPUTimeMap[id];
       } else {
         // init
         CPUTimeMap[id] = wallTime;
       }
       if (CPUChoicesMap.count(id) > 0) {
         // in map
         CPUChoicesMap[id]++;
       } else {
         // init
         CPUChoicesMap[id] = 1;
       }
       billableCPUus += conclusion->targetRealBillableUS;
   } else if (IN_LIST(allGPUPids, pid)) {
       assert(gpuMgr->TaskIsActive(pid));
       assert(NOT_IN_LIST(allCPUPids, pid));
       conclusion = gpuMgr->TaskConclude(pid, task_status, status, ended);
       long wallTime = std::stol(conclusion->wallTime);
       std::string id = std::string(conclusion->taskID);
       // put min wall time in map
       if (GPUTimeMap.count(id) > 0) {
         // in map
         GPUTimeMap[id] = (wallTime < GPUTimeMap[id])? wallTime: GPUTimeMap[id];
       } else {
         // init
         GPUTimeMap[id] = wallTime;
       }
       if (GPUChoicesMap.count(id) > 0) {
         // in map
         GPUChoicesMap[id]++;
       } else {
         // init
         GPUChoicesMap[id] = 1;
       }
       billableGPUus += conclusion->targetRealBillableUS;
   }
   conclusionLock.lock();
   pendConclusions.push_back(conclusion);
   conclusionLock.unlock();
   // racy, remove
   DEBUGPR("HAWS/CONCLUSION: %ld pending conclusions\n", pendConclusions.size());
}

// SCHEDLOOP THREAD
void HAWS::ScheduleLoop(int cpuThreadLimit, int gpuThreadLimit,
                        int physMemLimitMB, int gpuMemLimitMB, int gpuSharedMemLimitMB) {
    DEBUGPR("HAWS/SL: ScheduleLoop started...\n");
    int freedMBRam; // from task completion
    HAWSClientRequest* next;
    while (!schedLoopKillFlag) {
        tasksToStartQueueLock.lock(); // lock queue
        if (!tasksToStartQueue->empty()) { // check if item is in queue
            next = tasksToStartQueue->front();

            // disabled -- resource checking now handled in ProcessClientRequest
            // if no binary has enough physmem to run on any target,
            // leave queue alone until a task completion frees physmem
            /*
            if (globalPhysMemAvail - next->GetCPUJobPhysMB() < 0 &&
                globalPhysMemAvail - next->GetGPUJobPhysMB() < 0) {
                tasksToStartQueueLock.unlock(); // unlock queue, we cannot start any target
                if (throttle % 10000 == 0) {
                    DEBUGPR("Phys mem at capacity, waiting...\n");
                }
                // do not deque next work and continue for another round to try
            } else {
            */

            // call holding tasksToStartQueue.lock()
            ProcessClientRequest(next); // UNLOCKS tasksToStartQueueLock

            //}
        } else {
            tasksToStartQueueLock.unlock(); // unlock queue
            //DEBUGPR("HAWS/SL: tasks to start queue empty!\n");
        }

        //monitor HW target CPU
        cpuMgr->Monitor(); // perodic call to update state while running tasks on target
        // reclaim resources from completed tasks
        globalCPUThreadsAvail += cpuMgr->GetFreedCPUThreads(); // replenish cpu threads
        globalPhysMemAvail += cpuMgr->GetFreedRam();           // replenish physmem

        //monitor HW target GPU
        gpuMgr->Monitor(); // periodic call to update state while running tasks on target
        // reclaim resources from completed tasks
        globalCPUThreadsAvail += gpuMgr->GetFreedCPUThreads(); // replenish cpu threads
        globalGPUThreadsAvail += gpuMgr->GetFreedGPUThreads(); // replenish gpu threads
        globalPhysMemAvail += gpuMgr->GetFreedRam();           // replenish physmem
        globalGPUMemAvail += gpuMgr->GetFreedGPURam();         // replenish gpu mem

        if (throttle++ % 5000 == 0) {
            printf("HAWS/RESMON: free cpu threads %d (%d%%)\n", globalCPUThreadsAvail,
                   (int)(((float) globalCPUThreadsAvail / (float) cpuThreadLimit)*100));
            printf("HAWS/RESMON: free gpu threads %d (%d%%)\n", globalGPUThreadsAvail,
                   (int)(((float) globalGPUThreadsAvail / (float) gpuThreadLimit)*100));
            printf("HAWS/RESMON: free phys mem %dMB (%d%%)\n", globalPhysMemAvail,
                   (int)(((float) globalPhysMemAvail / (float) physMemLimitMB)*100));
            printf("HAWS/RESMON: free gpu mem %dMB (%d%%)\n", globalGPUMemAvail,
                   (int)(((float) globalGPUMemAvail / (float) gpuMemLimitMB)*100));
            // print dictionaries
            for(std::unordered_map<std::string, long>::const_iterator it = CPUTimeMap.begin(); it != CPUTimeMap.end(); ++it) {
                printf("task id: %s -> cpu: %ld\n", (it->first).c_str(), it->second);
            }
            printf("\n");
            for(std::unordered_map<std::string, long>::const_iterator it = GPUTimeMap.begin(); it != GPUTimeMap.end(); ++it) {
                printf("task id: %s -> gpu: %ld\n", (it->first).c_str(), it->second);
            }
            // print freq dictionaries
            printf("\n");
            for(std::unordered_map<std::string, long>::const_iterator it = CPUChoicesMap.begin(); it != CPUChoicesMap.end(); ++it) {
                printf("task id: %s -> num on cpu: %ld\n", (it->first).c_str(), it->second);
            }
            printf("\n");
            for(std::unordered_map<std::string, long>::const_iterator it = GPUChoicesMap.begin(); it != GPUChoicesMap.end(); ++it) {
                printf("task id: %s -> num on gpu: %ld\n", (it->first).c_str(), it->second);
            }
        }

        ReapChildren(); // collect all completed child processes (notifies target managers)

        usleep(1000); // yield CPU
    }
    DEBUGPR("HAWS: ScheduleLoop ended...\n");
}

// SCHEDLOOP THREAD
void HAWS::RequeueReq(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req); //put it back in queue
    tasksToStartQueueLock.unlock();
}

// SCHEDLOOP THREAD
void HAWS::StartTaskCPU(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    int maxCPUThreads = req->GetCPUJobCPUThreads();
    int maxRAM = req->GetCPUJobPhysMB();

    //alloc resources for this task
    globalPhysMemAvail -= maxRAM;
    globalCPUThreadsAvail -= maxCPUThreads;

    //launch it!
    DEBUGPR("HAWS: Starting CPU Task\n");
    int pid = cpuMgr->StartTask(req->GetNum(),
                                req->GetJobID(),
                                req->GetCPUBinPath(),
                                req->GetJobArgv(),
                                req->GetStdin(), req->GetStdinLen(),
                                maxCPUThreads, 0, // threads (GPU unusued = 0)
                                maxRAM, 0); // rams
    allCPUPids.insert(allCPUPids.begin(), pid);
    //DEBUGPR("HAWS/SL: CPU got %s\n", req->ToStr().c_str());
}

// SCHEDLOOP THREAD
void HAWS::StartTaskGPU(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    int maxCPUThreads = req->GetGPUJobCPUThreads();
    int maxGPUThreads = req->GetGPUJobGPUThreads();
    int maxRAM = req->GetGPUJobPhysMB();
    int maxGPURAM = req->GetGPUJobGPUPhysMB();

    // alloc resources for this task
    globalCPUThreadsAvail -= maxCPUThreads;
    globalGPUThreadsAvail -= maxGPUThreads;
    globalPhysMemAvail -= maxRAM;
    globalGPUMemAvail -= maxGPURAM;

    //launch it!
    DEBUGPR("HAWS: Starting GPU Task (Phys %dMB/GPU %dMB)\n", maxRAM, maxGPURAM);
    int pid = gpuMgr->StartTask(req->GetNum(),
                                req->GetJobID(),
                                req->GetGPUBinPath(),
                                req->GetJobArgv(),
                                req->GetStdin(), req->GetStdinLen(),
                                maxCPUThreads, maxGPUThreads, // threads (both CPU and GPU)
                                maxRAM, maxGPURAM); // rams
    allGPUPids.insert(allGPUPids.begin(), pid);
}

// SCHEDLOOP THREAD
void HAWS::ProcessClientRequest(HAWSClientRequest* req) { //SCHEDLOOP THREAD
    HAWSHWTarget HWTarget = DetermineReqTarget(req);
    if (HWTarget == TargCPU) {
        if (globalPhysMemAvail - req->GetCPUJobPhysMB() < 0) {
            // @perf we should take req and requeue it at the back to try next req
            tasksToStartQueueLock.unlock();
            if (throttle % 10 == 0) {
                DEBUGPR("\nHAWS/PHYSFULL: not enough physmem to run CPU job\n\n");
            }
            return;
        }
        if (globalCPUThreadsAvail - req->GetCPUJobCPUThreads() < 0) {
            // @perf we should take req and requeue it at the back to try next req
            tasksToStartQueueLock.unlock();
            if (throttle % 10 == 0) {
                DEBUGPR("\nHAWS/CPUFULL: not enough free CPU threads to run CPU job\n\n");
            }
            return;
        }

        // all resources are available to run
        tasksToStartQueueLock.unlock();
        StartTaskCPU(req);
        DEBUGPR("HAWS/REQ: freeing stdin\n");
        req->FreeStdinBuf(); // FREES FREEABLE STDIN (LARGE)
        tasksToStartQueueLock.lock();
        tasksToStartQueue->pop();  // calls destructor on object in queue, next gone
        delete req; // req is really gone
        tasksToStartQueueLock.unlock();
        return;
    } else if (HWTarget == TargGPU) {
        if (globalPhysMemAvail - req->GetGPUJobPhysMB() < 0) { // do we have enough physmem
            // @perf we should take req and requeue it at the back to try next req
            tasksToStartQueueLock.unlock();
            if (throttle % 10 == 0) {
                DEBUGPR("\nHAWS/PHYSFULL: not enough physmem to run GPU job\n\n");
            }
            return;
        }
        if (globalGPUMemAvail - req->GetGPUJobGPUPhysMB() < 0) { // do we have enough gpu mem
            // @perf we should take req and requeue it at the back to try next req
            tasksToStartQueueLock.unlock();
            if (throttle % 10 == 0) {
                DEBUGPR("\nHAWS/GPUMEMFULL: not enough GPU mem to run GPU job\n\n");
            }
            return;
        }
        if (globalCPUThreadsAvail - req->GetGPUJobCPUThreads () < 0) {
            // @perf we should take req and requeue it at the back to try next req
            tasksToStartQueueLock.unlock();
            if (throttle % 10 == 0) {
                DEBUGPR("\nHAWS/CPUFULL: not enough free CPU threads to run GPU job\n\n");
            }
            return;
        }
        if (globalGPUThreadsAvail - req->GetGPUJobGPUThreads() < 0) {
            // @perf we should take req and requeue it at the back to try next req
            tasksToStartQueueLock.unlock();
            if (throttle % 10 == 0) {
                DEBUGPR("\nHAWS/GPUFULL: not enough free GPU threads to run GPU job\n\n");
            }
            return;
        }

        // resources are available to run
        tasksToStartQueueLock.unlock();
        StartTaskGPU(req);
        DEBUGPR("HAWS/REQ: freeing stdin\n");
        req->FreeStdinBuf(); // FREES FREEABLE STDIN (LARGE)
        tasksToStartQueueLock.lock();
        tasksToStartQueue->pop();  // calls destructor on object in queue, next gone
        delete req; // done processing client req
        tasksToStartQueueLock.unlock();
        return;
    } else {
        assert(false); // "hardware target not implemented"
    }
    assert(false); // not reached
}

HAWSHWTarget HAWS::DetermineReqTarget(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    std::string hint = req->GetTargHint();
    if (hint == "cpu-only") return TargCPU;
    if (hint == "gpu-only") return TargGPU;
    // now estimate for "please" and "any" hints
    long estGPU = LONG_MAX;
    if (GPUTimeMap.count(req->GetJobID()) > 0) {
      // in map
      estGPU = GPUTimeMap[req->GetJobID()];
    }
    long estCPU = LONG_MAX;
    if (CPUTimeMap.count(req->GetJobID()) > 0) {
      // in map
      estCPU = CPUTimeMap[req->GetJobID()];
    }
    if (hint == "cpu-please" && estCPU <= estGPU)
        return HAWS::RandomizeTarget(TargCPU, 0.75);
    if (hint == "gpu-please" && estGPU <= estCPU)
        return HAWS::RandomizeTarget(TargGPU, 0.75);
    if (hint == "any" && (estCPU == LONG_MAX || estGPU == LONG_MAX))
        return HAWS::RandomizeTarget(TargGPU, 0.50);
    if (hint == "any")
        return (estCPU <= estGPU) ? HAWS::RandomizeTarget(TargCPU, 0.65) :
                                    HAWS::RandomizeTarget(TargGPU, 0.65);
    return (estCPU <= estGPU) ? HAWS::RandomizeTarget(TargCPU, 0.65) :
                                HAWS::RandomizeTarget(TargGPU, 0.65);
}

HAWSHWTarget HAWS::RandomizeTarget(HAWSHWTarget best_target, float favor) {
    if (best_target == TargCPU) {
      if (rand() / static_cast<float>(RAND_MAX) > favor) return TargGPU;
      return TargCPU;
    } else {
      if (rand() / static_cast<float>(RAND_MAX) > favor) return TargCPU;
      return TargGPU;
    }
}

HAWS::HAWS() {
    DEBUGPR("HAWS: Constructed\n");
    reqCounter = 0;
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

// MAIN THREAD (in test mode)
int HAWS::GetNumActiveTasks() {
    return cpuMgr->GetNumActiveTasks() + gpuMgr->GetNumActiveTasks();
}

// MAIN THREAD (in test mode)
bool HAWS::IsDoingWork() {
    int pendResp = 0;
    conclusionLock.lock();
    pendResp = pendConclusions.size();
    conclusionLock.unlock();
    // either running tasks or have responses to send
    return GetNumQueuedReqs() > 0 || GetNumActiveTasks() > 0 || pendResp > 0;
}

void HAWS::PrintData() {
    DEBUGPR("HAWS: PrintData\n");
    DEBUGPR("HAWS:   serviced %d requests\n", reqCounter);
    auto elapsedUS = TIMEDIFF_CAST_USEC(hawsStopTime - hawsStartTime);
    auto elapsedMS = TIMEDIFF_CAST_MSEC(hawsStopTime - hawsStartTime);
    auto elapsedS = TIMEDIFF_CAST_SEC(hawsStopTime - hawsStartTime);
    float billableCents = centsPerUnitTimeCPU * billableCPUus;
    //DEBUGPR("HAWS: System runtime: %ld us (%ld ms) (%ld s)\n", elapsedUS, elapsedMS, elapsedS);
    //DEBUGPR("HAWS: Billable CPU us: %ld\n", billableCPUus);
    //DEBUGPR("HAWS: Billable CPU cents/us: %f\n", centsPerUnitTimeCPU);
    //DEBUGPR("HAWS: Billable CPU cents: %f cents (%f$)\n", billableCents, billableCents / 100);
    cpuMgr->PrintData();
    gpuMgr->PrintData();
}

// MAIN THREAD
void HAWS::Start() {
    hawsStartTime = std::chrono::system_clock::now();

    srand(time(NULL)); // initialize random seed

    assert(!schedLoopThreadRunning); // must be stopped before started

    // set resource limits -- cpu and gpu threads
    assert(this->cpuThreadLimit > 0);
    assert(this->gpuThreadLimit > 0);
    globalCPUThreadsAvail = this->cpuThreadLimit;
    globalGPUThreadsAvail = this->gpuThreadLimit;
    // set resource limits -- cpu and gpu memory
    assert(this->physMemLimitMB > 0);
    assert(this->gpuMemLimitMB > 0);
    assert(this->gpuSharedMemLimitMB > 0);
    globalPhysMemAvail = this->physMemLimitMB;
    globalGPUMemAvail = this->gpuMemLimitMB;
    //globalGPUSharedMemAvail = this->gpuSharedMemLimitMB; // currently unused

    schedLoopKillFlag = false; // disable killswitch for schedule loop

    // start schedule loop
    DEBUGPR("HAWS: Starting ScheduleLoop\n");
    schedLoopThread = new std::thread(HAWS::ScheduleLoop,
                                      this->cpuThreadLimit,
                                      this->gpuThreadLimit,
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

// MAIN THREAD
void HAWS::Stop() {
    hawsStopTime = std::chrono::system_clock::now(); // save full stop time
    tasksToStartQueueLock.lock();
    int enqueuedReqs = tasksToStartQueue->size();
    tasksToStartQueueLock.unlock();

    // should not stop with reqs in flight in queue
    assert(enqueuedReqs == 0);

    // should not stop with conclusions to be sent back
    conclusionLock.lock();
    assert(pendConclusions.size() == 0);
    pendConclusions.clear();
    conclusionLock.unlock();

    // all threads should be released from all tasks being completed
    assert(globalCPUThreadsAvail = this->cpuThreadLimit);
    assert(globalGPUThreadsAvail = this->gpuThreadLimit);
    // all memory should be released from all tasks being completed
    assert(globalPhysMemAvail = this->physMemLimitMB);
    assert(globalGPUMemAvail = this->gpuMemLimitMB);
    //assert(globalGPUSharedMemAvail = this->gpuSharedMemLimitMB);
    assert(schedLoopThreadRunning);   // must be started before stopped

    schedLoopKillFlag = true; // enable killswitch for schedule loop thread

    DEBUGPR("HAWS: Stopping ScheduleLoop\n");
    schedLoopThread->join();
    schedLoopThreadRunning = false;
    delete(schedLoopThread);


    // print info once stopped
    this->PrintData();

    // stop and free target managers
    cpuMgr->Stop();
    gpuMgr->Stop();
    delete cpuMgr;
    delete gpuMgr;
}

// RESPONSE HANDLER THREAD
void HAWS::SendConclusion(int socket, char* buf, long max_bytes, HAWSConclusion* resp) {
    memset(buf, 0, max_bytes);

    DEBUGPR("HAWS/SEND: conclusion: \n");
    DEBUGPR("HAWS/SEND:        reqNum: %d\n", resp->reqNum);
    DEBUGPR("HAWS/SEND:       targRan: %s\n", resp->targRan);
    DEBUGPR("HAWS/SEND:   wallTimeLen: %d\n", resp->wallTimeLen);
    DEBUGPR("HAWS/SEND:      wallTime: %s\n", resp->wallTime);
    DEBUGPR("HAWS/SEND:    cpuTimeLen: %d\n", resp->cpuTimeLen);
    DEBUGPR("HAWS/SEND:       cpuTime: %s\n", resp->cpuTime);
    DEBUGPR("HAWS/SEND:     exit code: %d\n", resp->exitCode);
    DEBUGPR("HAWS/SEND:    output len: %d\n", resp->outputLen);
    //DEBUGPR("HAWS/SEND:        output: %s\n", resp->output);

    long pos = 0;
    buf[pos] = '^';
    pos++;
    buf[pos] = ',';
    pos++;

    std::string reqNum = std::to_string(resp->reqNum);
    memcpy(buf + (pos * sizeof(char)), reqNum.c_str(), reqNum.length());
    pos += reqNum.length();

    buf[pos] = ',';
    pos++;

    memcpy(buf + (pos * sizeof(char)), resp->targRan, resp->targRanLen);
    pos += resp->targRanLen;

    buf[pos] = ',';
    pos++;

    memcpy(buf + (pos * sizeof(char)), resp->wallTime, resp->wallTimeLen);
    pos += resp->wallTimeLen;

    buf[pos] = ',';
    pos++;

    memcpy(buf + (pos * sizeof(char)), resp->cpuTime, resp->cpuTimeLen);
    pos += resp->cpuTimeLen;

    buf[pos] = ',';
    pos++;

    std::string exitCode = std::to_string(resp->exitCode);
    memcpy(buf + (pos * sizeof(char)), exitCode.c_str(), exitCode.length());
    pos += exitCode.length();

    buf[pos] = ',';
    pos++;

    std::string outLen = std::to_string(resp->outputLen);
    memcpy(buf + (pos * sizeof(char)), outLen.c_str(), outLen.length());
    pos += outLen.length();

    buf[pos] = ',';
    pos++;

    memcpy(buf + (pos * sizeof(char)), resp->output, resp->outputLen);
    pos += resp->outputLen;

    buf[pos] = ',';
    pos++;
    buf[pos] = '$';
    pos++;
    buf[pos] = '\n';
    pos++;

    DEBUGPR("HAWS/RESP: SEND[%ld]:", pos);
    for (int i = 0; i < pos; i++) {
        if (buf[i] == '\0') {
            DEBUGPR("null byte in send buffer at spot %d\n", i);
            assert(false);
        }
    }
    DEBUGPR("\n");
    assert(pos < max_bytes);
    send(socket, buf, pos, 0); // send it
    reqCounter++;
}

// RESPONSE HANDLER THREAD
bool HAWS::IsRespLoopRunning() {
    return threadRespLoopRunning;
}

// RESPONSE HANDLER THREAD
void HAWS::RespLoop(int portResp1) {
    DEBUGPR("HAWS/RESPLOOP: response loop running\n");
    assert(threadRespLoopRunning);
    int sockResp1 = socket_open_send_socket(portResp1, "HAWS/RESP");
    int sendBufSize = sizeof(char) * SOCKET_SEND_BUF_SIZE;
    char* sendBuf = (char*) malloc(sendBufSize);
    DEBUGPR("HAWS/RESPLOOP: connected to client\n");
    std::list<HAWSConclusion*>::iterator it;
    int numSent = 0;
    while (!sockLoopKillFlag) {
        numSent = 0;
        conclusionLock.lock();
        if (pendConclusions.size() > 0) {
            memset(sendBuf, 0, sendBufSize); // zero to start
            for (it = pendConclusions.begin(); it != pendConclusions.end(); it++) {
                SendConclusion(sockResp1, sendBuf, SOCKET_SEND_BUF_SIZE, *it);
                free((*it)->wallTime);
                free((*it)->cpuTime);
                free((*it)->freeableOutput);
                free(*it);
                numSent++;
            }
            pendConclusions.clear(); //TODO
        }
        conclusionLock.unlock();
        if (numSent > 0) {
            DEBUGPR("HAWS/RESP: sent %d response(s)\n", numSent);
        }
        usleep(1000); // yield
    }
    DEBUGPR("HAWS/RESPLOOP: saw stop request\n");
    DEBUGPR("HAWS/RESPLOOP: freeing response buffer\n");
    free(sendBuf);
    DEBUGPR("HAWS/RESPLOOP: closing socket\n");
    socket_close_socket(sockResp1, "HAWS/RESP");
    DEBUGPR("HAWS/RESPLOOP: stopped\n");
}

// REQUEST HANDLER THREAD (starts the response loop)
void HAWS::StartRespLoop() {
    assert(!threadRespLoopRunning);
    threadRespLoopRunning = true;
    threadRespLoop = new std::thread(RespLoop, 8081);
}

// MAIN THREAD
void HAWS::StartSocket() {
    // start client1 socket loop
    reqCounter = 0; // racy but other thread hasn't started
    DEBUGPR("HAWS: Starting SocketLoop (Client1)\n");
    sockLoopKillFlag = false; // disable killswitch for socket loop threads
    sockThreadReqs = new std::thread(haws_socket_req_loop_newline, this->portReqs);
    sockThreadReqsRunning = true; // socket loop thread active
    sleep(1); // give things a chance to start
}

// MAIN THREAD
void HAWS::StopSocket() {
    DEBUGPR("HAWS: Stopping Socket Loops\n");
    DEBUGPR("HAWS: Stopping Requst Loop\n");
    assert(sockThreadReqsRunning); // must be started before stopped
    sockLoopKillFlag = true; // enable killswitch for socket loop thread
    DEBUGPR("HAWS: waiting on req thread\n");
    sockThreadReqs->join();            // block until thread exits and returns
    sockThreadReqsRunning = false;     // sock loop thread gone
    delete(sockThreadReqs);
    DEBUGPR("HAWS: Stopped Request Loop\n");

    assert(threadRespLoopRunning);
    DEBUGPR("HAWS: Stoping Response Loop\n");
    threadRespLoop->join();
    threadRespLoopRunning = false;
    delete(threadRespLoop);

    DEBUGPR("HAWS: Stopped Socket Loops\n");
    DEBUGPR("HAWS: Stopped with %d requests serviced\n", reqCounter);
}

// REQUEST HANDLER THREAD / MAIN THREAD (in test mode)
void HAWS::HardAwareSchedule(HAWSClientRequest* req) {
    /* requests can come in out of order
    if (this->reqCounter + 1 != req->GetNum()) {
        DEBUGPR("reqCounter was at %d, req number in is %d\n", this->reqCounter, req->GetNum());
        assert(false);
    } this->reqCounter++; */

    assert(tasksToStartQueue != NULL);
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req);
    tasksToStartQueueLock.unlock();
}
