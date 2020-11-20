//#include "hawsHAWS.h" 
#include <stdio.h>
#include <mutex>
#include <queue>
#include <thread>
#include <unistd.h>
#include "hawsClientRequest.h"

using namespace std;

static void HAWS::ScheduleLoop() { // run by separate thread
    printf("HAWS/SL: ScheduleLoop started...\n");
    while (!globalTerminationFlag) {
        // lock queue
        // check if items in queue
        // rm item from queue
        // unlock queue
        // schedule removed item
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
    schedLoopThread = new thread(ScheduleLoop);
    schedLoopThreadRunning = true;   // schedule loop thread active
}

void HAWS::Stop() {
    printf("HAWS: Stopping ScheduleLoop\n");
    assert(schedLoopThreadRunning); // must be started before stopped
    globalTerminationFlag = true;    // killswitch for schedule loop thread to end
    schedLoopThread->join();          // block until thread exits and returns
    globalTerminationFlag = false;   // reset killswitch
    schedLoopThreadRunning = false;  // schedule loop thread gone
}

void HAWS::HardAwareSchedule(HAWSClientRequest* req) {
    assert(tasksToStartQueue != NULL);

    tasksToStartQueueLock.lock();
    tasksToStartQueue->push(req);
    tasksToStartQueueLock.unlock(); 
}
