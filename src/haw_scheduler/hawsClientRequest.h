#ifndef CLIENTREQUEST_H
#define CLIENTREQUEST_H

using namespace std;
#include <string>

class HAWSClientRequest {
    private:
        string cpuBinPath;
        int cpuBinRAM;
        string gpuBinPath;
        int gpuBinRAM;
        string taskArgs;

    public:
        HAWSClientRequest(string cpuBin, int cpuBinRAM, 
                          string gpuBin, int gpuBinRAM, string args) { 
            this->cpuBinPath = cpuBin;
            this->cpuBinRAM = cpuBinRAM;
            this->gpuBinPath = gpuBin;
            this->gpuBinRAM = gpuBinRAM; 
            taskArgs = args;
        }
        HAWSClientRequest() {
            cpuBinPath = "";
            gpuBinPath = "";
            taskArgs = "";
        }
        HAWSClientRequest(HAWSClientRequest* another) {
            cpuBinPath = another->GetCPUBinPath();
            cpuBinRAM  = another->GetCPUBinRAM();
            gpuBinPath = another->GetGPUBinPath();
            gpuBinRAM  = another->GetGPUBinRAM();
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
