
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
#include "hawsSocket.h"
#include "socket.h"

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

HAWSTargetMgr* cpuMgr;
HAWSTargetMgr* gpuMgr;

// memory control - how much memory can the scheduler use for children?
std::mutex globalMemLock;

int globalPhysMemAvail = 0;
int globalGPUMemAvail = 0;
int globalGPUSharedMemAvail = 0;

int reqCounter = 0;

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
    time_point time_completed;
    while ((p=waitpid(-1, &status, WNOHANG)) > 0) {
       time_completed = std::chrono::system_clock::now();
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
    HAWSConclusion* conclusion;
    if (IN_LIST(allCPUPids, pid)) {
       assert(cpuMgr->TaskIsActive(pid));
       assert(NOT_IN_LIST(allGPUPids, pid));
       conclusion = cpuMgr->TaskConclude(pid, task_status, status, ended); 
       billableCPUus += conclusion->targetRealBillableUS;
   } else if (IN_LIST(allGPUPids, pid)) {
       assert(gpuMgr->TaskIsActive(pid));
       assert(NOT_IN_LIST(allCPUPids, pid));
       conclusion = gpuMgr->TaskConclude(pid, task_status, status, ended); 
       billableGPUus += conclusion->targetRealBillableUS;
   }
   conclusionLock.lock();
   pendConclusions.push_back(conclusion);
   conclusionLock.unlock();
   // racy, remove 
   printf("HAWS/CONCLUSION: %ld pending conclusions\n", pendConclusions.size());
}

// SCHEDLOOP THREAD
void HAWS::ScheduleLoop(int physMemLimitMB, int gpuMemLimitMB, int gpuSharedMemLimitMB) { 
    printf("HAWS/SL: ScheduleLoop started...\n");
    int freedMBRam; // from task completion
    HAWSClientRequest* next;
    while (!schedLoopKillFlag) {
        tasksToStartQueueLock.lock(); // lock queue
        if (!tasksToStartQueue->empty()) { // check if item is in queue
            next = tasksToStartQueue->front();
            // if no binary has enough physmem to run, 
            // leave queue alone until a task completion frees physmem
            if (globalPhysMemAvail - next->GetCPUJobPhysMB() < 0 &&
                globalPhysMemAvail - next->GetGPUJobPhysMB() < 0) {
                if (throttle % 10000 == 0) {
                    printf("Phys mem at capacity, waiting...\n");
                }
                // do not deque next work and continue for another round to try
            } else {
                ProcessClientRequest(next);
            }
        }
        tasksToStartQueueLock.unlock(); // unlock queue
        
        //monitor HW targets
        cpuMgr->Monitor(); // do work while processes running in cpu manager  
        globalPhysMemAvail += cpuMgr->GetFreedMBRam(); // replenish physmem
    
        gpuMgr->Monitor(); // do work while processes running in gpu manager
        globalPhysMemAvail += gpuMgr->GetFreedMBRam(); // replenish physmem
        //globalGPUMemAvail += gpuMgr->GetFreedGPUMBRam();

        if (throttle++ % 10000 == 0) {
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

// SCHEDLOOP THREAD
void HAWS::RequeueReq(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req); //put it back in queue
    tasksToStartQueueLock.unlock();
}

// SCHEDLOOP THREAD 
void HAWS::StartTaskCPU(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    int maxRAM = req->GetCPUJobPhysMB();
    globalPhysMemAvail -= maxRAM;
    printf("HAWS: Starting CPU Task\n");
    int pid = cpuMgr->StartTask(req->GetNum(),
                                req->GetCPUBinPath(), 
                                req->GetJobArgv(), 
                                req->GetStdin(), req->GetStdinLen(), maxRAM);
    allCPUPids.insert(allCPUPids.begin(), pid);
    //printf("HAWS/SL: CPU got %s\n", req->ToStr().c_str());
}

// SCHEDLOOP THREAD
void HAWS::StartTaskGPU(HAWSClientRequest* req) { // SCHEDLOOP THREAD
    int maxRAM = req->GetCPUJobPhysMB();
    globalPhysMemAvail -= maxRAM;
    printf("HAWS: Starting GPU Task\n");
    int pid = gpuMgr->StartTask(req->GetNum(), 
                                req->GetCPUBinPath(),
                                req->GetJobArgv(),
                                req->GetStdin(), req->GetStdinLen(), maxRAM);
    allGPUPids.insert(allGPUPids.begin(), pid);
}

// SCHEDLOOP THREAD
void HAWS::ProcessClientRequest(HAWSClientRequest* req) { //SCHEDLOOP THREAD
    HAWSHWTarget HWTarget = DetermineReqTarget(req);
    if (HWTarget == TargCPU) {
        if (globalPhysMemAvail - req->GetCPUJobPhysMB() < 0) {
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
    bool shouldUseCPU = req->GetTargHint() == "cpu-only" || 
                        req->GetTargHint() == "cpu-please"  ||
                        req->GetTargHint() == "any";

    //TODO consult extra hints or profiling info to pick target intelligently
    // do analysis to determine if should use CPU or gpu

    return shouldUseCPU ? TargCPU : TargGPU;
}

HAWS::HAWS() {
    printf("HAWS: Constructed\n");
    this->reqCounter = 0; 
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
    return GetNumQueuedReqs() > 0 || GetNumActiveTasks() > 0;
}

void HAWS::PrintData() {
    printf("HAWS: PrintData\n");
    printf("HAWS:   serviced %d requests\n", this->reqCounter);
    auto elapsedUS = TIMEDIFF_CAST_USEC(hawsStopTime - hawsStartTime);
    auto elapsedMS = TIMEDIFF_CAST_MSEC(hawsStopTime - hawsStartTime);
    auto elapsedS = TIMEDIFF_CAST_SEC(hawsStopTime - hawsStartTime);
    //printf("HAWS: System runtime: %ld us (%ld ms) (%ld s)\n", elapsedUS, elapsedMS, elapsedS);
    //printf("HAWS: Billable CPU us: %ld\n", billableCPUus);
    //printf("HAWS: Billable CPU cents/us: %f\n", centsPerUnitTimeCPU);
    float billableCents = centsPerUnitTimeCPU * billableCPUus;
    //printf("HAWS: Billable CPU cents: %f cents (%f$)\n", billableCents, billableCents / 100);
    cpuMgr->PrintData();
    gpuMgr->PrintData();
}

// MAIN THREAD
void HAWS::Start() {
    hawsStartTime = std::chrono::system_clock::now();
    
    this->reqCounter = 0; 

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

// MAIN THREAD
void HAWS::Stop() {
    hawsStopTime = std::chrono::system_clock::now(); // save full stop time
    tasksToStartQueueLock.lock();
    int enqueuedReqs = tasksToStartQueue->size();
    tasksToStartQueueLock.unlock();

    // should not stop with reqs in flight in queue
    assert(enqueuedReqs == 0); 

    // should not stop with conclusions to be sent back
    // racy ?
    printf("HAWS/CONCLUSION: ended with %ld conclusions generated\n", pendConclusions.size());
    //conclusionLock.lock();
    //assert(pendConclusions.size() == 0);
    //pendConclusions.clear(); //TODO REMOVE ME -- MEMLEAK
    //conclusionLock.unlock();

    // all memory should be relased from all tasks being completed
    assert(globalPhysMemAvail = this->physMemLimitMB);
    assert(globalGPUMemAvail = this->gpuMemLimitMB);
    assert(globalGPUSharedMemAvail = this->gpuSharedMemLimitMB);
    assert(schedLoopThreadRunning);   // must be started before stopped

    schedLoopKillFlag = true; // enable killswitch for schedule loop thread

    printf("HAWS: Stopping ScheduleLoop\n");
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

    schedLoopKillFlag = false; // reset killswitch - scheduler is now off
}

// RESPONSE HANDLER THREAD
void HAWS::SendConclusion(int socket, char* buf, long max_bytes, HAWSConclusion* resp) {
    memset(buf, 0, max_bytes);

    long pos = 0;
    buf[pos] = '^';
    pos++;
    buf[pos] = ',';
    
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
    
    buf[pos] + ',';
    pos++;

    memcpy(buf + (pos * sizeof(char)), resp->output, resp->outputLen);
    pos += resp->outputLen;
    
    buf[pos] = ',';
    pos++;
    buf[pos] = '$';
    pos++;

    printf("HAWS/RESP: SEND[%ld]:", pos);
    for (int i = 0; i < pos; i++) {
        printf("%c", buf[pos]); 
    }
    printf("\n");
    send(socket, buf, pos, 0); // send it!
}

// RESPONSE HANDLER THREAD
bool HAWS::IsRespLoopRunning() {
    return threadRespLoopRunning;
}

// RESPONSE HANDLER THREAD
void HAWS::RespLoop(int portResp1) {
    printf("HAWS/RESPLOOP: response loop running\n");
    assert(threadRespLoopRunning);
    int sockResp1 = socket_open_send_socket(portResp1, "HAWS/RESP");
    int sendBufSize = sizeof(char) * SOCKET_SEND_BUF_SIZE;
    char* sendBuf = (char*) malloc(sendBufSize);
    printf("HAWS/RESPLOOP: connected to client\n");
    std::list<HAWSConclusion*>::iterator it;
    int numSent = 0;
    while (!schedLoopKillFlag) {
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
            printf("HAWS/RESP: sent %d response(s)\n", numSent);
        }
        usleep(1000); // yield
    }
    printf("HAWS/RESPLOOP: saw stop request\n");
    printf("HAWS/RESPLOOP: freeing response buffer\n");
    free(sendBuf);
    printf("HAWS/RESPLOOP: closing socket\n");
    socket_close_socket(sockResp1, "HAWS/RESP");
    printf("HAWS/RESPLOOP: stopped\n");
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
    printf("HAWS: Starting SocketLoop (Client1)\n");
    sockLoopKillFlag = false; // disable killswitch for socket loop thread
    sockThreadReqs = new std::thread(haws_socket_req_loop, this->portReqs); 
    sockThreadReqsRunning = true; // socket loop thread active
    sleep(1); // give things a chance to start
}

// MAIN THREAD
void HAWS::StopSocket() {
    printf("HAWS: Stopping Socket Loops\n");
    printf("HAWS: Stopping Requst Loop\n");
    assert(sockThreadReqsRunning); // must be started before stopped
    sockLoopKillFlag = true; // enable killswitch for socket loop thread
    printf("HAWS: waiting on req thread\n");
    sockThreadReqs->join();            // block until thread exits and returns
    sockThreadReqsRunning = false;     // sock loop thread gone
    delete(sockThreadReqs);
    printf("HAWS: Stopped Request Loop\n");

    assert(threadRespLoopRunning);
    printf("HAWS: Stoping Response Loop\n");
    threadRespLoop->join();
    threadRespLoopRunning = false; 
    delete(threadRespLoop);
    printf("HAWS: Stopped Socket Loops\n");
}

// REQUEST HANDLER THREAD / MAIN THREAD (in test mode)
void HAWS::HardAwareSchedule(HAWSClientRequest* req) {
    if (this->reqCounter + 1 != req->GetNum()) {
        printf("reqCounter was at %d, req number in is %d\n", this->reqCounter, req->GetNum());
        assert(false);
    } this->reqCounter++;

    assert(tasksToStartQueue != NULL);
    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req);
    tasksToStartQueueLock.unlock(); 
}
