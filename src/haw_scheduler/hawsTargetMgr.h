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
    std::unordered_map<pid_t, std::string> tasksStdout;
    std::unordered_map<pid_t, std::string> tasksCompleted;

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
        std::unordered_map<pid_t, std::string>::iterator it = tasksCompleted.begin();
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
    void TaskCompleteAccountingProtected(pid_t pid, TaskStatus ts, int s_code, time_point ended) {
        tasksEndTime[pid] = ended;
        tasksStatus[pid] = ts;
        tasksStatusCode[pid] = s_code;
        if (COMM_STDOUT) {
            assert(false);
            //std::string cppStdOut(tasksStdoutBuff[pid]);
            //tasksStdout[pid] = cppStdOut;
        } else if (COMM_FILE) {
            std::string filepath = "/opt/haws/bin/out/" + std::to_string(pid) + ".txt";
            if (!FileExists(filepath)) {
                assert(false); // binary did not drop the right outfile
            }
            std::ifstream infile(filepath.c_str());
            std::string content((std::istreambuf_iterator<char>(infile)),
                                (std::istreambuf_iterator<char>()));
            assert(content.length() > 0); // there was nothing in the file
            tasksStdout[pid] = content;
            if( remove(filepath.c_str()) != 0 ) { // remove bin's output file now that its saved
                assert(false);
            }
        } else {
            assert(false); //not implemented
        }
        tasksCompleted[pid] = tasksStdout[pid].substr(0, tasksStdout[pid].find(endOfStdoutStr));
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
                      char* stdin_buf, int stdin_buff_len, int maxRAM) {
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
            //tasksStdoutBuff[pid] = (char*) malloc(1024);
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
        int TaskConclude(pid_t pid, TaskStatus ts, int status_code, 
                         time_point time_completed) { //SCHEDLOOP THREAD
            
            // free stdout buffer (currently unused)
            //free(tasksStdoutBuff[pid]);

            //printf("doing accounting\n");
            taskLock.lock();

            // close pipe to child's stdin
            int success = subprocess_close_parent_stdin_pipe(tasksHandles[pid]);
            assert(success == 0);


            this->TaskCompleteAccountingProtected(pid, ts, status_code, time_completed); 
            int billableUS = tasksBillableUS[pid];

            // free this ChildHandle
            free(tasksHandles[pid]); 
            tasksHandles.erase(pid);

            taskLock.unlock();
            //printf("done doing accounting\n");
            //printf("unlocked TaskConclude\n");
            return billableUS;
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
            std::list<pid_t>::iterator it = allPids.begin();
            while (it != allPids.end()) {
                printf("HWMGR/%s OUTPUT PID %d: %s\n", this->targStr.c_str(),
                       *it, tasksStdout[*it].c_str()); //TODO rename
                it++;
            }
            std::unordered_map<pid_t, std::string>::iterator mit = tasksCompleted.begin();
            while (mit != tasksCompleted.end()) {
                printf("HWMGR/%s COMPLETED PID %d: %s\n", this->targStr.c_str(), 
                       mit->first, mit->second.c_str());
                mit++;
            }
            //free(stdOutBuffer);

            // clear all member datastructures
            taskLock.lock();
            allPids.clear();
            terminatingPids.clear();
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
