#ifndef CLIENTREQUEST_H
#define CLIENTREQUEST_H

using namespace std;
#include <cstring>
#include <string>

class HAWSClientRequest {
    private:
        string cpuBinPath;
        int cpuBinRAM;
        string gpuBinPath;
        int gpuBinRAM;
        char* stdinBuf;
        int stdinBufLen;
        string taskArgs;

    public:
        HAWSClientRequest(string cpuBin, int cpuBinRAM, 
                          string gpuBin, int gpuBinRAM, 
                          char* stdinBuf, int stdinBufLen, string args) {
            this->cpuBinPath = cpuBin;
            this->cpuBinRAM = cpuBinRAM;
            this->gpuBinPath = gpuBin;
            this->gpuBinRAM = gpuBinRAM; 
            this->stdinBuf = stdinBuf;
            this->stdinBufLen = stdinBufLen;
            taskArgs = args;
        }
        HAWSClientRequest() {
            cpuBinPath = "";
            gpuBinPath = "";
            stdinBuf = NULL;
            stdinBufLen = 0;
            taskArgs = "";
        }
        HAWSClientRequest(HAWSClientRequest* another) {
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
        string GetCPUBinPath()    { return cpuBinPath; }
        int GetCPUBinRAM()        { return cpuBinRAM; }
        string GetGPUBinPath()    { return gpuBinPath; }
        int GetGPUBinRAM()        { return cpuBinRAM; }
        char* GetStdinBuf()       { return stdinBuf; }
        int GetStdinBufLen()      { return stdinBufLen; }
        string GetTaskArgs()      { return taskArgs;      }
        void SetCPUBinPath(string s) { cpuBinPath = s; }
        void SetGPUBinPath(string s) { gpuBinPath = s; }
        void SetTaskArgs(string s) { taskArgs = s; }
        string ToStr() {
            return "cpuBin: " + to_string(cpuBinRAM) + "MB RAM:" + cpuBinPath + 
                   ", gpuBin: " + to_string(gpuBinRAM) + "MB RAM:" + gpuBinPath + 
                   ", args: " + taskArgs;
        }
};
#endif
