#ifndef CLIENTREQUEST_H
#define CLIENTREQUEST_H

//using namespace std;

#include <cstring>
#include <string>
#include <cassert>

class HAWSClientRequest {
    private:
        int reqNum;                 // FIELD 2
        std::string cpuBinPath;     // FIELD 3
        std::string gpuBinPath;     // FIELD 4
        std::string jobArgv;        // FIELD 5
        std::string targHint;       // FIELD 6 
        int cpuJobCPUThreads;       // FIELD 7
        int gpuJobCPUThreads;       // FIELD 8
        int gpuJobGPUThreads;       // FIELD 9
        int cpuJobCPUPhysMB;        // FIELD 10
        int gpuJobCPUPhysMB;        // FIELD 11
        int gpuJobGPUPhysMB;        // FIELD 12
        int gpuJobGPUShMB;          // FIELD 13
        std::string jobID;          // FIELD 14
        int stdinLen;               // FIELD 15
        char* freeableStdin;        // FIELD 16
    public:
          HAWSClientRequest(int reqNum,                 // FIELD 2
                            std::string cpuBinPath,     // FIELD 3
                            std::string gpuBinPath,     // FIELD 4
                            std::string jobArgv,        // FIELD 5
                            std::string targHint,       // FIELD 6
                            int cpuJobCPUThreads,       // FIELD 7
                            int gpuJobCPUThreads,       // FIELD 8
                            int gpuJobGPUThreads,       // FIELD 9
                            int cpuJobCPUPhysMB,        // FIELD 10
                            int gpuJobCPUPhysMB,        // FIELD 11
                            int gpuJobGPUPhysMB,        // FIELD 12
                            int gpuJobGPUShMB,          // FIELD 13
                            std::string jobID,          // FIELD 14
                            long stdinLen,              // FIELD 15
                            char* freeableStdin) {      // FIELD 16

            this->reqNum = reqNum;                        // FIELD 2
            this->cpuBinPath = cpuBinPath;                // FIELD 3
            this->gpuBinPath = gpuBinPath;                // FIELD 4
            this->jobArgv = jobArgv;                      // FIELD 5
            assert(targHint == "cpu-please" || 
                   targHint == "gpu-please" ||
                   targHint == "cpu-only"   ||
                   targHint == "gpu-only"   ||
                   targHint == "any");
            this->targHint = targHint;                    // FIELD 6
            this->cpuJobCPUThreads = cpuJobCPUThreads;    // FIELD 7
            this->gpuJobCPUThreads = gpuJobCPUThreads;    // FIELD 8
            this->gpuJobGPUThreads = gpuJobGPUThreads;    // FIELD 9
            this->cpuJobCPUPhysMB = cpuJobCPUPhysMB;      // FIELD 10
            this->gpuJobCPUPhysMB = gpuJobCPUPhysMB;      // FIELD 11
            this->gpuJobGPUPhysMB = gpuJobGPUPhysMB;      // FIELD 12
            this->gpuJobGPUShMB = gpuJobGPUShMB;          // FIELD 13
            this->jobID = jobID;                          // FIELD 14
            this->stdinLen = stdinLen;                    // FIELD 15
            this->freeableStdin = freeableStdin;          // FIELD 16
        }/*
        HAWSClientRequest() {
            targHint = "";
            cpuBinPath = "";
            gpuBinPath = "";
            stdinBuf = NULL;
            stdinBufLen = 0;
            taskArgs = "";
        }
        HAWSClientRequest(HAWSClientRequest* another) {
            targHint = another->GetTarget();
            cpuBinPath = another->GetCPUBinPath();
            cpuJobCPUPhysMB  = another->GetCPUBinRAM();
            gpuBinPath = another->GetGPUBinPath();
            gpuJobCPUPhysMB  = another->GetGPUBinRAM();
            stdinBuf = another->stdinBuf;
            stdinBufLen = another->stdinBufLen;
            //memcpy(stdinBuf, another->stdinBuf, stdinBufLen); // ??
            taskArgs = another->GetTaskArgs();
        }*/
        /* gets auto called when a req is popped from queue
        ~HAWSClientRequest() {
        }*/

        // manually called to free pointer holding (large) stdin
        void FreeStdinBuf() {
            if (this->stdinLen > 0) {
                printf("REQ: freeing stdin\n");
                assert(this->freeableStdin != NULL);
                free(this->freeableStdin);
            }
        }

        /*
        std::string GetTarget()        { return targHint;     }
        int GetCPUBinRAM()             { return cpuJobCPUPhysMB; }
        int GetGPUBinRAM()             { return cpuJobCPUPhysMB; }
        char* GetStdinBuf()            { return stdinBuf; }
        int GetStdinBufLen()           { return stdinBufLen; }
        std::string GetTaskArgs()      { return taskArgs;      }
        */

        int GetNum()                   { return this->reqNum;           }      // FIELD 2
        std::string GetCPUBinPath()    { return this->cpuBinPath;       }      // FIELD 3
        std::string GetGPUBinPath()    { return this->gpuBinPath;       }      // FIELD 4
        std::string GetJobArgv()       { return this->jobArgv;          }      // FIELD 5
        std::string GetTargHint()      { return this->targHint;         }      // FIELD 6
        int GetCPUJobCPUThreads()      { return this->cpuJobCPUThreads; }      // FIELD 7
        int GetGPUJobCPUThreads()      { return this->gpuJobCPUThreads; }      // FIELD 8
        int GetGPUJobGPUThreads()      { return this->gpuJobGPUThreads; }      // FIELD 9
        int GetCPUJobPhysMB()          { return this->cpuJobCPUPhysMB;  }      // FIELD 10
        int GetGPUJobPhysMB()          { return this->gpuJobCPUPhysMB;  }      // FIELD 11
        int GetGPUJobGPUPhysMB()       { return this->gpuJobGPUPhysMB;  }      // FIELD 12
        int GetGPUJobGPUSharedMB()     { return this->gpuJobGPUShMB;    }      // FIELD 13
        std::string GetJobID()         { return this->jobID;            }      // FIELD 14
        long GetStdinLen()             { return this->stdinLen;         }      // FIELD 15
        char* GetStdin()               { return this->freeableStdin;    }      // FIELD 16

        void Print() {
            std::string toStr = std::to_string(this->reqNum) + "," +           // FIELD 2
                                this->cpuBinPath + "," +                       // FIELD 3
                                this->gpuBinPath + "," +                       // FIELD 4
                                this->jobArgv    + "," +                       // FIELD 5
                                this->targHint   + "," +                       // FIELD 6
                                std::to_string(this->cpuJobCPUThreads) +","+   // FIELD 7
                                std::to_string(this->gpuJobCPUThreads) +","+   // FIELD 8
                                std::to_string(this->gpuJobGPUThreads) +","+   // FIELD 9
                                std::to_string(this->cpuJobCPUPhysMB)  +","+   // FIELD 10
                                std::to_string(this->gpuJobCPUPhysMB)  +","+   // FIELD 11
                                std::to_string(this->gpuJobGPUPhysMB)  +","+   // FIELD 12
                                std::to_string(this->gpuJobGPUShMB)    +","+   // FIELD 13
                                this->jobID + "," +                            // FIELD 14
                                std::to_string(this->stdinLen);                // FIELD 15
            printf("REQ:%s\n", toStr.c_str());
        }
};
#endif
