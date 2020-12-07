#ifndef CPUMGR_H
#define CPUMGR_H

#include <list>
#include <chrono>
#include <unordered_map>
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fstream>
#include <string>

#include "subprocess.h"
#include "hawsUtil.h"

bool COMM_STDOUT = false;
bool COMM_FILE = true;

static const char* TaskStatusToStr(TaskStatus ts) {
    return ts == TASK_RUNNING ? "TASK_RUNNING " :
           ts == TASK_FINISHED_SUCCESS ? "TASK_FINISHED_SUCCESS" :
           ts == TASK_FINISHED_NONZERO ? "TASK_FINISHED_NONZERO" :
           "TASK_FINISHED_ABNORMAL";
}

class HAWSTargetMgr {
    std::string targStr;
    std::list<pid_t> allPids;
    std::unordered_map<pid_t, int> tasksReqNum;
    std::unordered_map<pid_t, std::string> tasksActive;
    std::unordered_map<pid_t, TaskStatus> tasksStatus;
    std::unordered_map<pid_t, int> tasksStatusCode;
    std::unordered_map<pid_t, time_point> tasksStartTime;
    std::unordered_map<pid_t, time_point> tasksEndTime;

    // resources
    int freedCPUThreads = 0;
    int freedGPUThreads = 0;
    int freedPhysMB = 0;
    int freedGPUMB = 0;
    std::unordered_map<pid_t, int> tasksMaxCPUThreads;
    std::unordered_map<pid_t, int> tasksMaxGPUThreads;
    std::unordered_map<pid_t, int> tasksMaxRAM;
    std::unordered_map<pid_t, int> tasksMaxGPURAM;

    std::unordered_map<pid_t, long> tasksBillableUS;

    std::unordered_map<pid_t, ChildHandle*> tasksHandles;
    std::unordered_map<pid_t, char*> tasksCompleted; //freeable, LARGE 
    std::unordered_map<pid_t, long> tasksFormalOutputLen;
    std::unordered_map<pid_t, char*> tasksFormalOutput; //ptr into tasksCompleted, no-freeable, LARGE
    std::unordered_map<pid_t, int> tasksOutWallTimeLen;
    std::unordered_map<pid_t, char*> tasksOutWallTime; // freeable 
    std::unordered_map<pid_t, int> tasksOutCPUTimeLen;
    std::unordered_map<pid_t, char*> tasksOutCPUTime; // freeable
    std::unordered_map<pid_t, long> tasksOutputLen;

    std::mutex taskLock; 
    std::mutex completionLock; 
    int activeTasks = 0;
    int throttle = 0;
    
    char* stdOutBuffer;

    //CPUCostModel cputCostModel; //object TODO

    private: 
    inline void SanityCheckActiveTasksProtected () { // holding lock
        std::unordered_map<int, std::string>::iterator it = tasksActive.begin();
        std::list<pid_t>::iterator allPidIt;
        while (it != tasksActive.end()) {
            pid_t pid = it->first;
            assert(this->tasksStatus[pid] == TASK_RUNNING);
            assert(this->tasksStatusCode[pid] == -1);
            assert(this->tasksBillableUS[pid] == 0);
            it++;
        }
    }
    inline void SanityCheckCompletedTasksProtected () { // holding lock
        if (tasksCompleted.size() == 0) {
            return;
        }
        std::unordered_map<pid_t, char*>::iterator it = tasksCompleted.begin();
        while (it != tasksCompleted.end()) {
            pid_t pid = it->first;
            assert(this->tasksStatus[pid] != TASK_RUNNING);
            assert(this->tasksStatusCode[pid] != -1);
            assert(this->tasksBillableUS[pid] > 0);
            it++;
        }
    }
    int TaskIsActiveProtected (pid_t pid) { // holding lock 
        return this->tasksActive.find(pid) != this->tasksActive.end();
    }
    void PrintProcessProtected(pid_t pid) { // holding lock
        printf("HWMGR: PID %d\n", pid);
        printf("HWMGR:  in active set: %d\n", this->TaskIsActiveProtected(pid));  
        printf("HWMGR:    task status: %s\n", TaskStatusToStr(tasksStatus[pid]));
        printf("HWMGR:    status code: %d\n", tasksStatusCode[pid]);
        printf("HWMGR:max cpu threads: %d\n", tasksMaxCPUThreads[pid]);  
        printf("HWMGR:max gpu threads: %d\n", tasksMaxGPUThreads[pid]);  
        printf("HWMGR:   max phys mem: %d\n", tasksMaxRAM[pid]);  
        printf("HWMGR:   max gpu  mem: %d\n", tasksMaxGPURAM[pid]);  
        printf("HWMGR:    billable ms: %ld\n", tasksBillableUS[pid]);  
    }
    void PrintAllProcessesProtected() { // holding lock
        std::list<pid_t>::iterator it = allPids.begin();
        for (it != allPids.begin(); it != allPids.end(); ++it) {
            this->PrintProcessProtected(*it);
        }
    }
    void PrintDataProtected () { // holding lock
        printf("TARGMGR/%s | processes %ld/%ld active/all\n", this->targStr.c_str(),
                tasksActive.size(), allPids.size());
        
    }
    bool FileExists(std::string name) {
        struct stat buffer;   
        return (stat (name.c_str(), &buffer) == 0);
    }
    long GetFileSize(std::string filename) {
        struct stat stat_buf;
        int rc = stat(filename.c_str(), &stat_buf);
        return rc == 0 ? stat_buf.st_size : -1;
    }
    void TaskCompleteGetDroppedOutput(pid_t pid) {
        printf("TARGMGR/%s/FILEIN picking up dropped output\n", this->targStr.c_str());

        std::string filepath = "/opt/haws/bin/out/" + std::to_string(pid) + ".txt";

        int timeout = 0; // wait up to 30 seconds for file to appear after proc finishes
        while (!FileExists(filepath)) {
            printf("TARGMGR/%s/FILEIN file %d.txt not there yet... wait %d/30\n", 
                       this->targStr.c_str(), pid, timeout);
            sleep(1); // try again
            if (timeout == 30) {
                printf("TARGMGR/%s/FILEIN file %d.txt didn't show up for %ds after bin exited\n", 
                       this->targStr.c_str(), pid, timeout);
                assert(false);
            } timeout++;
        }

        // read entire file contents in at once
        long output_bytes = GetFileSize(filepath);
        assert(output_bytes > 0);
        char* output = (char*) malloc(1 + output_bytes * sizeof(char));
        FILE *fp = fopen(filepath.c_str(), "r"); 
        assert(fp != NULL); 
        size_t len = fread(output, sizeof(char), output_bytes, fp);
        assert(ferror(fp) == 0);
        fclose(fp);
        output[len++] = '\0'; //just to be safe 
        printf("TARGMGR/%s/FILEIN save total output pointer\n", this->targStr.c_str());
        taskLock.lock();
        tasksCompleted[pid] = output;
        tasksOutputLen[pid] = len;
        taskLock.unlock();

        // disabled for debugging 
        //printf("TARGMGR/%s/FILEIN Delete dropped file\n", this->targStr.c_str());
        if( remove(filepath.c_str()) != 0 ) { // remove bin's output file now that its saved
            assert(false);
        }
        printf("TARGMGR/%s/FILEIN Done saving output\n", this->targStr.c_str());
    }

    void TaskCompleteAccountingProtected(pid_t pid, TaskStatus ts, int s_code, time_point ended) {
        char* formalOutput = NULL;
        char* allOutput = tasksCompleted[pid];

        // find wall time - @dedup
        int pos = 0;
        int bufPos = 0;
        int wallTimeLen = 0; 
        char* wallTimeBuffer = (char*) malloc(100*sizeof(char));
        memset(wallTimeBuffer, 0, 100);
        for(pos = 0; pos < tasksOutputLen[pid]; pos++) {
            if (allOutput[pos] == '\n') {
                wallTimeBuffer[bufPos + 1] == '\0'; // null terminate  
                pos++; // get off newline
                break;
            }
            wallTimeBuffer[pos] = allOutput[pos];
            bufPos++;
        } assert(pos != tasksOutputLen[pid]); // didn't find a newline
        tasksOutWallTime[pid] = wallTimeBuffer; // freeable after resp send
        assert(bufPos > 0);
        tasksOutWallTimeLen[pid] = bufPos;

        // find cpu time - @dedup
        float cpuTime = 0.0;
        char* cpuTimeBuffer = (char*) malloc(100*sizeof(char));
        bufPos = 0;
        int cpuTimeLen = 0;
        memset(cpuTimeBuffer, 0, 100);
        for(pos = pos; pos < tasksOutputLen[pid]; pos++) {
            if (allOutput[pos] == '\n') {
                cpuTimeBuffer[bufPos + 1] == '\0'; // null terminate  
                pos++; // get off newline
                break;
            }
            cpuTimeBuffer[bufPos] = allOutput[pos];
            bufPos++;
        } assert(pos != tasksOutputLen[pid]); // didn't find a newline
        tasksOutCPUTime[pid] = cpuTimeBuffer; // freeable after resp send
        assert(bufPos > 0);
        tasksOutCPUTimeLen[pid] = bufPos;

        // store pointer to start of formal output
        tasksFormalOutput[pid] = allOutput + (pos * sizeof(char));

        // update after discounting wall and cpu time
        tasksFormalOutputLen[pid] = tasksOutputLen[pid] - pos - 1; 
        assert(tasksFormalOutputLen[pid] > 0);

        tasksEndTime[pid] = ended;
        tasksStatus[pid] = ts;
        tasksStatusCode[pid] = s_code;

        tasksActive.erase(pid); // TODO move to a general place we clear all maps

        // accumulate freed resources
        this->freedCPUThreads += tasksMaxCPUThreads[pid];
        this->freedGPUThreads += tasksMaxGPUThreads[pid];
        this->freedPhysMB += tasksMaxRAM[pid];
        this->freedGPUMB += tasksMaxGPURAM[pid];

        // server side actual runtime cost (early)
        tasksBillableUS[pid] = TIMEDIFF_CAST_USEC(tasksEndTime[pid] - tasksStartTime[pid]);
    }

    // ------ PUBLIC BELOW ------

    public:
        HAWSTargetMgr (std::string targStr) { 
            this->targStr = targStr;
        }
        int StartTask(int reqNum, std::string binpath, std::string args, 
                      char* stdin_buf, long stdin_buff_len, 
                      int maxCPUThreads, int maxGPUThreads, 
                      int maxRAM, int maxGPURAM) {
            ChildHandle* handle = start_subprocess_nonblocking(binpath, args, 
                                                               stdin_buf, stdin_buff_len);
            time_point start_time = std::chrono::system_clock::now();
            pid_t pid = handle->pid;

            taskLock.lock();

            allPids.insert(allPids.begin(), pid);
            tasksReqNum[pid] = reqNum;
            tasksActive[pid] = binpath + " " + args;
            tasksStatus[pid] = TASK_RUNNING;
            tasksStatusCode[pid] = -1;
            tasksStartTime[pid] = start_time; 
            tasksMaxCPUThreads[pid] = maxCPUThreads;
            tasksMaxGPUThreads[pid] = maxGPUThreads;
            tasksMaxRAM[pid] = maxRAM;
            tasksMaxGPURAM[pid] = maxGPURAM;
            tasksBillableUS[pid] = 0;
            tasksHandles[pid] = handle;

            taskLock.unlock();

            printf("HWMGR/%s: starting task done\n", this->targStr.c_str());
            return pid;
        }
        
        void Monitor () { //SCHEDLOOP THREAD
            //@perf this only should run in debug mode
            if (throttle % 1000 == 0) { // make sure all invariants are satisfied
                taskLock.lock();
                this->SanityCheckActiveTasksProtected(); 
                this->SanityCheckCompletedTasksProtected();
                if (throttle % 10000 == 0) {
                    this->PrintDataProtected();
                }
                taskLock.unlock();
            } throttle++;
        }

        void PrintData () {
            taskLock.lock();
            this->PrintDataProtected();
            taskLock.unlock();
        }   
        int GetFreedRam() {
            taskLock.lock();
            int freed = this->freedPhysMB;
            this->freedPhysMB = 0; // requester has been notified of reclaimed mem
            taskLock.unlock();
            return freed;
        }
        int GetFreedGPURam() {
            taskLock.lock();
            int freed = this->freedGPUMB;
            this->freedGPUMB = 0; // requester has been notified of reclaimed mem
            taskLock.unlock();
            return freed;
        }
        int GetFreedCPUThreads() {
            taskLock.lock();
            int freed = this->freedCPUThreads;
            this->freedCPUThreads = 0; // requester has been notified of reclaimed threads
            taskLock.unlock();
            return freed;
        }
        int GetFreedGPUThreads() {
            taskLock.lock();
            int freed = this->freedGPUThreads; 
            this->freedGPUThreads = 0; // requester has been notified of reclaimed threads
            taskLock.unlock();
            return freed;
        }
        HAWSConclusion* TaskConclude(pid_t pid, TaskStatus ts, int status_code, 
                                     time_point time_completed) { //SCHEDLOOP THREAD
            TaskCompleteGetDroppedOutput(pid);    
            // must be freed by caller
            HAWSConclusion* conclusion = (HAWSConclusion*) malloc(sizeof(HAWSConclusion));

            taskLock.lock();

            // close pipe to child's stdin
            int success = subprocess_close_parent_stdin_pipe(tasksHandles[pid]);
            assert(success == 0);

            this->TaskCompleteAccountingProtected(pid, ts, status_code, time_completed); 
           
            // create conclusion to return 
            conclusion->reqNum = tasksReqNum[pid];
            // targ ran
            conclusion->targRanLen = this->targStr.length();
            conclusion->targRan = (char*) this->targStr.c_str();
            conclusion->exitCode = tasksStatusCode[pid];
            // wall time
            conclusion->wallTimeLen = tasksOutWallTimeLen[pid];
            conclusion->wallTime = tasksOutWallTime[pid];
            // cpu time
            conclusion->cpuTimeLen = tasksOutCPUTimeLen[pid];
            conclusion->cpuTime = tasksOutCPUTime[pid]; // freeable after resp send
            // formal output 
            conclusion->outputLen = tasksFormalOutputLen[pid]; 
            conclusion->freeableOutput = tasksCompleted[pid]; // freeable after resp send
            conclusion->output = tasksFormalOutput[pid]; // freed as part of tasksCompleted
            // black box process total start to finish runtime (server-side)
            conclusion->targetRealBillableUS = tasksBillableUS[pid];

            // free info related to this task
            //@mem erase more maps now that conclusion is ready as response
            free(tasksHandles[pid]);
            tasksCompleted.erase(pid);
            tasksHandles.erase(pid);

            taskLock.unlock();
            return conclusion;
        }
        int TaskIsActive(pid_t pid) {
            taskLock.lock();
            bool active = this->TaskIsActiveProtected(pid);
            taskLock.unlock();
            return active;
        }        
        int GetNumActiveTasks() { 
            taskLock.lock();
            int size = this->tasksActive.size(); 
            taskLock.unlock();
            return size;
        }

        void Start() { }

        void Stop () { 
            taskLock.lock();

            /* we no longer keep tasksCompleted values after proc completes. 
            std::unordered_map<pid_t, char*>::iterator mit = tasksCompleted.begin();
            while (mit != tasksCompleted.end()) {
                printf("HWMGR/%s COMPLETED PID %d: formal output[%ld]\n", this->targStr.c_str(), 
                       mit->first, tasksFormalOutputLen[mit->first]);
                free(mit->second); 
                mit++;
            }*/

            // @perf @mem all member datastructures should really be already empty at this point 
            // ...after proper cleanup on task end / response send (TODO)
            assert(tasksCompleted.size() == 0); 
            assert(tasksActive.size() == 0);
            assert(tasksHandles.size() == 0);
            //(assert all task maps are empty)

            // for now forcibly clear the others that have been accumulating 
            // these accumulate small contents at least
            // the large freeable buffers should already have been freed on task completion
            allPids.clear();
            tasksActive.clear();
            tasksStatus.clear();
            tasksStatusCode.clear();
            tasksStartTime.clear();
            tasksEndTime.clear();
            tasksMaxCPUThreads.clear();
            tasksMaxGPUThreads.clear();
            tasksMaxRAM.clear();
            tasksMaxGPURAM.clear();
            tasksBillableUS.clear();
            tasksHandles.clear();
            //printf("HWMGR/%s tasksHandles.size = %ld\n", this->targStr.c_str(), 
            //       tasksHandles.size());

            taskLock.unlock();
        }
};

#endif
