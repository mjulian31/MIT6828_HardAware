#ifndef CLIENTREQUEST_H
#define CLIENTREQUEST_H

using namespace std;
#include <string>

class HAWSClientRequest {
    private:
        string cpuBinPath;
        string gpuBinPath;
        string taskArgs;

    public:
        HAWSClientRequest(string cpuBin, string gpuBin, string args) { 
            cpuBinPath = cpuBin;
            gpuBinPath = gpuBin;
            taskArgs = args;
        }
        HAWSClientRequest() {
            cpuBinPath = "";
            gpuBinPath = "";
            taskArgs = "";
        }
        void copyInReq(HAWSClientRequest* another) {
            cpuBinPath = another->GetCPUBinPath();
            gpuBinPath = another->GetGPUBinPath();
            taskArgs = another->GetTaskArgs();
        }
        string GetCPUBinPath() { return cpuBinPath; }
        string GetGPUBinPath() { return gpuBinPath; }
        string GetTaskArgs()      { return taskArgs;      }
        string SetCPUBinPath(string s) { cpuBinPath = s; }
        string SetGPUBinPath(string s) { gpuBinPath = s; }
        string SetTaskArgs(string s) { taskArgs = s; }
        string ToStr() {
            return "cpuBinPath: " + cpuBinPath + 
                   ", gpuBinPath: " + gpuBinPath + ", args: " + taskArgs;
        }
};
#endif
