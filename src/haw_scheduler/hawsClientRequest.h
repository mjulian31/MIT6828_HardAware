#ifndef CLIENTREQUEST_H
#define CLIENTREQEUST_H

using namespace std;
#include <string>

class ClientRequest {
    private:
        string cpuBinaryPath;
        string gpuBinaryPath;
        string taskArgs;

    public:
        string GetCPUBinaryPath() { return cpuBinaryPath; }
        string GetGPUBinaryPath() { return gpuBinaryPath; }
        string GetTaskArgs()      { return taskArgs;      }
        string SetCPUBinaryPath(string s) { cpuBinaryPath = s; }
        string SetGPUBinaryPath(string s) { gpuBinaryPath = s; }
        string SetTaskArgs(string s) { taskArgs = s; }
};
#endif
