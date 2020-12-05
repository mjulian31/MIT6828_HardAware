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
    std::list<pid_t> terminatingPids;
    std::unordered_map<pid_t, std::string> tasksActive;
    std::unordered_map<pid_t, TaskStatus> tasksStatus;
    std::unordered_map<pid_t, int> tasksStatusCode;
    std::unordered_map<pid_t, time_point> tasksStartTime;
    std::unordered_map<pid_t, time_point> tasksEndTime;
    std::unordered_map<pid_t, int> tasksMaxRAM;
    std::unordered_map<pid_t, long> tasksBillableUS;
    std::unordered_map<pid_t, ChildHandle*> tasksHandles;

    // file monitoring - set COMM_FILE true to use
    //std::unordered_map<pid_t, std::string> tasksStdout;
    std::unordered_map<pid_t, char*> tasksCompleted; //LARGE 
    std::unordered_map<pid_t, long> tasksFormalOutputLen;
    std::unordered_map<pid_t, char*> tasksFormalOutput; //LARGE 
    std::unordered_map<pid_t, float> tasksOutWallTime;
    std::unordered_map<pid_t, float> tasksOutCPUTime;
    std::unordered_map<pid_t, long> tasksOutputLen;

    // stdout monitoring - set COMM_STDOUT true to use 
    //std::unordered_map<pid_t, char*> tasksStdoutBuff;
    std::unordered_map<pid_t, int> tasksStdoutBuffLen;
    std::unordered_map<pid_t, int> tasksStdoutBuffScan;

    std::mutex taskLock; 
    std::mutex completionLock; 
    int activeTasks = 0;
    int throttle = 0;
    int freedPhysMB = 0;
    char* stdOutBuffer;
    std::string endOfStdoutStr = "@";

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
        printf("HWMGR:   max phys mem: %d\n", tasksMaxRAM[pid]);  
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
        printf("TARGMGR/%s Picking Up Dropped Output\n", this->targStr.c_str());
        std::string filepath = "/opt/haws/bin/out/" + std::to_string(pid) + ".txt";
        int timeout = 0;
        while (!FileExists(filepath)) {
            //assert(false); // binary did not drop the right outfileA
            sleep(1); // try again
            if (timeout == 30) {
                printf("TARGMGR/%s file %d.txt didn't show up for %ds after bin exited\n", 
                       this->targStr.c_str(), pid, timeout);
                assert(false);
            } timeout++;
        }
        long output_bytes = GetFileSize(filepath);
        assert(output_bytes > 0);
        //printf("TARGMGR/%s Malloc for storing output\n", this->targStr.c_str());
        char* output = (char*) malloc(1 + output_bytes * sizeof(char));
        //printf("TARGMGR/%s Open file\n", this->targStr.c_str());
        FILE *fp = fopen(filepath.c_str(), "r"); 
        assert(fp != NULL); 
        //printf("TARGMGR/%s Read it all \n", this->targStr.c_str());
        size_t len = fread(output, sizeof(char), output_bytes, fp);
        assert(ferror(fp) == 0);
        //printf("TARGMGR/%s Close file\n", this->targStr.c_str());
        fclose(fp);
        output[len++] = '\0'; //just to be safe 
         
        //std::ifstream infile(filepath.c_str());
        //std::string content((std::istreambuf_iterator<char>(infile)),
        //                    (std::istreambuf_iterator<char>()));
        //assert(content.length() > 0); // there was nothing in the file
        printf("TARGMGR/%s Save pointer\n", this->targStr.c_str());
        taskLock.lock();
        tasksCompleted[pid] = output;
        tasksOutputLen[pid] = len;
        taskLock.unlock();

        printf("TARGMGR/%s Delete dropped file\n", this->targStr.c_str());
        if( remove(filepath.c_str()) != 0 ) { // remove bin's output file now that its saved
            assert(false);
        }
        printf("TARGMGR/%s Done saving output\n", this->targStr.c_str());
    }
    void TaskCompleteAccountingProtected(pid_t pid, TaskStatus ts, int s_code, time_point ended) {
        char* formalOutput = NULL;
        char* allOutput = tasksCompleted[pid];

        // find wall time
        int pos = 0;
        float wallTime = 0.0;
        char* wallTimeBuffer = (char*) malloc(100*sizeof(char));
        for(pos = 0; pos < tasksOutputLen[pid]; pos++) {
            if (allOutput[pos] == '\n') {
                wallTimeBuffer[pos] == '\0'; // null terminate  
                std::string wallClock(wallTimeBuffer);
                assert(wallClock.length() > 0);
                free(wallTimeBuffer);
                wallTime = std::stof(wallClock);
                pos++; // get off newline
                break;
            }
            wallTimeBuffer[pos] = allOutput[pos];
        } assert(pos != tasksOutputLen[pid]); // didn't find a newline
        //printf("HACK: test wall time got FLOAT:%f\n", wallTime); 
        assert(wallTime > 0.0);
        tasksOutWallTime[pid] = wallTime; 

        // find cpu time
        float cpuTime = 0.0;
        char* cpuTimeBuffer = (char*) malloc(100*sizeof(char));
        int bufPos = 0;
        for(pos = pos; pos < tasksOutputLen[pid]; pos++) {
            if (allOutput[pos] == '\n') {
                cpuTimeBuffer[pos] == '\0'; // null terminate  
                std::string cpuClock(cpuTimeBuffer);
                assert(cpuClock.length() > 0);
                free(cpuTimeBuffer);
                cpuTime = std::stof(cpuClock);
                pos++; // get off newline
                break;
            }
            cpuTimeBuffer[bufPos] = allOutput[pos];
            bufPos++;
        } assert(pos != tasksOutputLen[pid]); // didn't find a newline
        assert(cpuTime > 0.0);
        tasksOutCPUTime[pid] = cpuTime;

        // store pointer to start of formal output
        tasksFormalOutput[pid] = allOutput + (pos * sizeof(char));

        // update after discounting wall and cpu time
        tasksFormalOutputLen[pid] = tasksOutputLen[pid] - pos; 

        //printf("HAWS/ACCOUNTING: test cpu time got FLOAT:%f\n", cpuTime); 
        //printf("HAWS/ACCOUNTING: output len: %ld\n", tasksOutputLen[pid]);
        //printf("HAWS/ACCOUNTING: formal output:%s\n", tasksFormalOutput[pid]); 

        tasksEndTime[pid] = ended;
        tasksStatus[pid] = ts;
        tasksStatusCode[pid] = s_code;

        //RM??
        if (COMM_STDOUT) {
            assert(false);
            //std::string cppStdOut(tasksStdoutBuff[pid]);
            //tasksStdout[pid] = cppStdOut;
        } else if (COMM_FILE) {
            //TaskCompleteGetDroppedOutputProtected(pid);    
        } else {
            assert(false); //not implemented
        }
        //tasksCompleted[pid] = tasksStdout[pid].substr(0, tasksStdout[pid].find(endOfStdoutStr));

        tasksActive.erase(pid);
        this->freedPhysMB += tasksMaxRAM[pid];
        tasksBillableUS[pid] = TIMEDIFF_CAST_USEC(tasksEndTime[pid] - tasksStartTime[pid]);
    }

    /*
    void SendTermChildStdin(ChildHandle* handle) {
        terminatingPids.insert(terminatingPids.begin(), handle->pid);
        write(handle->pipes[PARENT_WRITE_PIPE][WRITE_FD], "_$_term\n", 8);
        //printf("TERMINATED IT\n");
    }*/

    /*
    void ProcessChildStdout(ChildHandle* handle, char* stdOutBuffer) {
        pid_t pid = handle->pid;
        bool useCPPStrs = false;
        //taskLock.lock(); // needed ?

        if (useCPPStrs) {
            tasksStdout[pid].append(stdOutBuffer);
            //printf("STDOUT NOW: %s\n", tasksStdout[pid].c_str());
            if (tasksStdout[pid].find(endOfStdoutStr) != std::string::npos) {
                SendTermChildStdin(handle);
            }
        } else {
            // append new output to stdout buffer       
            memcpy(tasksStdoutBuff[pid] + (tasksStdoutBuffLen[pid] * sizeof(char)), 
                   stdOutBuffer, 
                   strlen(stdOutBuffer));
            tasksStdoutBuffLen[pid] += strlen(stdOutBuffer);
            tasksStdoutBuff[pid][tasksStdoutBuffLen[pid] + 1] = (char) NULL; // terminate new string
            //printf("STDOUT NOW: %s\n", tasksStdoutBuff[pid]);
            for (int i = tasksStdoutBuffScan[pid]; i < tasksStdoutBuffLen[pid]; i++) {
                tasksStdoutBuffScan[pid] = i; 
                if (tasksStdoutBuff[pid][i] == '@') {
                    SendTermChildStdin(handle);
                    break;
                }
            }
        }
        //taskLock.unlock(); // needed ?
    }*/
    /*
    void CollectChildrenStdout() {
        std::unordered_map<pid_t, std::string>::iterator it = tasksActive.begin();
        while (it != tasksActive.end()) {
            pid_t pid = it->first;
            ChildHandle* handle = tasksHandles[pid];
            std::list<pid_t>::iterator termIt = terminatingPids.begin();
            // only collect stdout from children that have not been told to exit
            if (std::find(terminatingPids.begin(), terminatingPids.end(), handle->pid) == 
                terminatingPids.end()) {
                int count = read(handle->pipes[PARENT_READ_PIPE][READ_FD], 
                                 stdOutBuffer, sizeof(stdOutBuffer)-1);
                if (count >= 0) {
                    stdOutBuffer[count] = 0;
                    //printf("COLLECTED %s\n", stdOutBuffer);
                    ProcessChildStdout(handle, stdOutBuffer);
                } else {
                    printf("readlen 0\n");
                }
            }
            it++;
        }
    }*/

    // ------ PUBLIC BELOW ------

    public:
        HAWSTargetMgr (std::string targStr) { 
            this->targStr = targStr;
        }
        int StartTask(std::string binpath, std::string args, 
                      char* stdin_buf, long stdin_buff_len, int maxRAM) {
            //if (strlen(stdin_buf) != stdin_buff_len) {
            //    printf("HWMGR/%s: STDIN SIZE MISMATCH req says %ld but stdin_buf is %ld\n", 
            //           this->targStr.c_str(), stdin_buff_len, strlen(stdin_buf));
            //    assert(strlen(stdin_buf) == stdin_buff_len);
            //}

            ChildHandle* handle = start_subprocess_nonblocking(binpath, args, 
                                                               stdin_buf, stdin_buff_len);
            time_point start_time = std::chrono::system_clock::now();
            pid_t pid = handle->pid;

            taskLock.lock();
            allPids.insert(allPids.begin(), pid);
            tasksActive[pid] = binpath + " " + args;
            tasksStatus[pid] = TASK_RUNNING;
            tasksStatusCode[pid] = -1;
            tasksStartTime[pid] = start_time; 
            tasksMaxRAM[pid] = maxRAM;
            tasksBillableUS[pid] = 0;
            tasksHandles[pid] = handle;
            tasksStdoutBuffLen[pid] = 0;
            tasksStdoutBuffScan[pid] = 0;
            taskLock.unlock();

            printf("HWMGR/%s: starting task done\n", this->targStr.c_str());
            return pid;
        }
        
        void Monitor () { //SCHEDLOOP THREAD
            if (COMM_STDOUT) {
                //CollectChildrenStdout();
            }

            if (throttle % 1000 == 0) { // make sure all invariants are satisfied
                //printf("-->doing sanity check\n");
                taskLock.lock();
                this->SanityCheckActiveTasksProtected(); 
                this->SanityCheckCompletedTasksProtected();
                if (throttle % 1000 == 0) {
                    this->PrintDataProtected();
                }
                taskLock.unlock();
                //printf("<--done doing sanity check\n");
            } throttle++;
            //usleep(1); //simulate extra work
        }
        void PrintData () {
            taskLock.lock();
            this->PrintDataProtected();
            taskLock.unlock();
        }   
        int GetFreedMBRam() {
            taskLock.lock();
            int freed = this->freedPhysMB;
            this->freedPhysMB = 0; // requester has been notified with reclaimed mem
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
            conclusion->reqNum = -1; //tasksReqNum[pid];
            conclusion->targRan = (char*) this->targStr.c_str();
            conclusion->wallTime = tasksOutWallTime[pid];
            conclusion->cpuTime = tasksOutCPUTime[pid];
            conclusion->exitCode = tasksStatusCode[pid];
            conclusion->outputLen = tasksFormalOutputLen[pid]; 
            conclusion->freeableOutput = tasksCompleted[pid];
            conclusion->output = tasksFormalOutput[pid];
            conclusion->targetRealBillableUS = tasksBillableUS[pid];
        
            // free this task
            //TODO
            //free(tasksComplted[pid]); // free temporary stored output
            free(tasksHandles[pid]); 
            tasksHandles.erase(pid);
            taskLock.unlock();
            //printf("done doing accounting\n");
            //printf("unlocked TaskConclude\n");
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
        void Start() {
            // Read from child’s stdout
            //stdOutBuffer = (char*) malloc(1024 * 3);
        }
        void Stop () {
            /*
            std::list<pid_t>::iterator it = allPids.begin();
            while (it != allPids.end()) {
                printf("HWMGR/%s OUTPUT PID %d: %s\n", this->targStr.c_str(),
                       *it, tasksStdout[*it].c_str()); //TODO rename
                it++;
            }*/
            //free(stdOutBuffer);

            // clear all member datastructures
            taskLock.lock();
            std::unordered_map<pid_t, char*>::iterator mit = tasksCompleted.begin();
            while (mit != tasksCompleted.end()) {
                printf("HWMGR/%s COMPLETED PID %d: formal output[%ld]\n", this->targStr.c_str(), 
                       mit->first, tasksFormalOutputLen[mit->first]);
                free(mit->second); 
                mit++;
            }
            allPids.clear();
            terminatingPids.clear(); // rm? 
            assert(tasksCompleted.size() == tasksOutputLen.size());
            printf("HWMGR/%s tasksActive.size = %ld\n", this->targStr.c_str(), 
                   tasksActive.size());
            assert(tasksActive.size() == 0);
            tasksActive.clear();
            tasksStatus.clear();
            tasksStatusCode.clear();
            tasksStartTime.clear();
            tasksEndTime.clear();
            tasksMaxRAM.clear();
            tasksBillableUS.clear();
            printf("HWMGR/%s tasksHandles.size = %ld\n", this->targStr.c_str(), 
                   tasksHandles.size());
            assert(tasksHandles.size() == 0);
            tasksHandles.clear();
            taskLock.unlock();
        }

        // shelved
        void GetTaskStatus () {}
        void StopTask() {}
        void ColdQuery() {}
        void HotQuery() {}
};

#endif
