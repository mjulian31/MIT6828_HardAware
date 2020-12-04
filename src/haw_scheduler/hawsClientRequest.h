#ifndef CLIENTREQUEST_H
#define CLIENTREQUEST_H

//using namespace std;

#include <cstring>
#include <string>

class HAWSClientRequest {
    private:
        // FIELD 1 
        int reqNumber;
        // FIELD 2
        std::string cpuBinPath;
        // FIELD 3
        std::string gpuBinPath;
        // FIELD 4
        std::string taskArgs;
        // FIELD 5
        std::string targHint;
        // FIELD 6
        int cpuJobCPUThreads;
        // FIELD 7
        int gpuJobCPUThreads; 
        // FIELD 8
        int gpuJobGPUThreads;
        // FIELD 9
        int cpuBinRAM;
        // FIELD 10
        int gpuBinRAM;
        // FIELD 11
        int gpuBinGPURAM;
        // FIELD 12
        int gpuBinGPUSharedRAM;
        // FIELD 13
        std::string taskID;
        // FIELD 14
        int stdinBufLen;
        // FIELD 15
        char* stdinBuf;

    public:
        HAWSClientRequest(std::string targHint, std::string cpuBin, int cpuBinRAM, 
                          std::string gpuBin, int gpuBinRAM, 
                          char* stdinBuf, int stdinBufLen, std::string args) {
            this->targHint = targHint;
            this->cpuBinPath = cpuBin;
            this->cpuBinRAM = cpuBinRAM;
            this->gpuBinPath = gpuBin;
            this->gpuBinRAM = gpuBinRAM; 
            this->stdinBuf = stdinBuf;
            this->stdinBufLen = stdinBufLen;
            taskArgs = args;
        }
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
            cpuBinRAM  = another->GetCPUBinRAM();
            gpuBinPath = another->GetGPUBinPath();
            gpuBinRAM  = another->GetGPUBinRAM();
            stdinBuf = another->stdinBuf;
            stdinBufLen = another->stdinBufLen;
            //memcpy(stdinBuf, another->stdinBuf, stdinBufLen); // ??
            taskArgs = another->GetTaskArgs();
        }
        /* gets auto called when a req is popped from queue
        ~HAWSClientRequest() {
        }*/

        // manually called to free pointer holding stdin
        void FreeStdinBuf() {
            if (this->stdinBufLen > 0) {
                printf("REQ: freeing stdinbuf\n");
                free(this->stdinBuf);
            }
        }

        std::string GetTarget()        { return targHint;     }
        std::string GetCPUBinPath()    { return cpuBinPath; }
        int GetCPUBinRAM()             { return cpuBinRAM; }
        std::string GetGPUBinPath()    { return gpuBinPath; }
        int GetGPUBinRAM()             { return cpuBinRAM; }
        char* GetStdinBuf()            { return stdinBuf; }
        int GetStdinBufLen()           { return stdinBufLen; }
        std::string GetTaskArgs()      { return taskArgs;      }

        void SetCPUBinPath(std::string s) { cpuBinPath = s; }
        void SetGPUBinPath(std::string s) { gpuBinPath = s; }
        void SetTaskArgs(std::string s) { taskArgs = s; }

        std::string ToStr() {
            return "targHint: " + targHint + 
                   ", cpuBin: " + std::to_string(cpuBinRAM) + "TargCPU RAM:" + cpuBinPath + 
                   ", gpuBin: " + std::to_string(gpuBinRAM) + "TargGPU RAM:" + gpuBinPath + 
                   ", args: " + taskArgs;
        }
};
#endif
