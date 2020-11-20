//#include "hawsHAWS.h" 
using namespace std;

#include <stdio.h>
#include <mutex>
#include <queue>
#include <thread>
#include <unistd.h>
#include "hawsHAWS.h"
#include "hawsClientRequest.h"


void HAWS::ScheduleLoop() { // run by separate thread
    printf("HAWS/SL: ScheduleLoop started...\n");
    HAWSClientRequest req;
    while (!globalKillFlag) {
        bool gotReq = false;
        tasksToStartQueueLock.lock(); // lock queue
        if (!tasksToStartQueue->empty()) { // check if item is in queue
            req.copyInReq(tasksToStartQueue->front());  // copy it to local buffer
            tasksToStartQueue->pop();  // calls destructor on object in queue
            gotReq = true;
        } 
        tasksToStartQueueLock.unlock(); // unlock queue
        if (gotReq) { // schedule removed item
            printf("HAWS/SL: dequeued %s\n", req.ToStr());
        } 
        usleep(1000);
    }
    printf("HAWS: ScheduleLoop ended...\n");
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
