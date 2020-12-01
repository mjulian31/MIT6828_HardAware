#ifndef CLIENTREQUEST_H
#define CLIENTREQUEST_H

//using namespace std;

#include <cstring>
#include <string>

class HAWSClientRequest {
    private:
        std::string target;
        std::string cpuBinPath;
        int cpuBinRAM;
        std::string gpuBinPath;
        int gpuBinRAM;
        char* stdinBuf;
        int stdinBufLen;
        std::string taskArgs;

    public:
        HAWSClientRequest(std::string target, std::string cpuBin, int cpuBinRAM, 
                          std::string gpuBin, int gpuBinRAM, 
                          char* stdinBuf, int stdinBufLen, std::string args) {
            this->target = target;
            this->cpuBinPath = cpuBin;
            this->cpuBinRAM = cpuBinRAM;
            this->gpuBinPath = gpuBin;
            this->gpuBinRAM = gpuBinRAM; 
            this->stdinBuf = stdinBuf;
            this->stdinBufLen = stdinBufLen;
            taskArgs = args;
        }
        HAWSClientRequest() {
            target = "";
            cpuBinPath = "";
            gpuBinPath = "";
            stdinBuf = NULL;
            stdinBufLen = 0;
            taskArgs = "";
        }
        HAWSClientRequest(HAWSClientRequest* another) {
            target = another->GetTarget();
            cpuBinPath = another->GetCPUBinPath();
            cpuBinRAM  = another->GetCPUBinRAM();
            gpuBinPath = another->GetGPUBinPath();
            gpuBinRAM  = another->GetGPUBinRAM();
            stdinBufLen = another->stdinBufLen;
            stdinBuf = (char*) malloc(sizeof(stdinBufLen));
            memcpy(stdinBuf, another->stdinBuf, stdinBufLen);
            taskArgs = another->GetTaskArgs();
        }
        /* destructor disabled
        ~HAWSClientRequest() {
            free(...) 
        } */
        std::string GetTarget()        { return target;     }
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
            return "targ: " + target + 
                   ", cpuBin: " + std::to_string(cpuBinRAM) + "TargCPU RAM:" + cpuBinPath + 
                   ", gpuBin: " + std::to_string(gpuBinRAM) + "TargGPU RAM:" + gpuBinPath + 
                   ", args: " + taskArgs;
        }
};
#endif
