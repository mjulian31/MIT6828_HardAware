#include <stdio.h>
#include <assert.h>
#include <thread>
#include <unistd.h>
#include "hawsHAWS.h"
#include "subprocess.h"

//#define NDEBUG  // turn asserts off
#undef NDEBUG   // turn asserts on

void haws_test_1(HAWS* haws);
void haws_test_2(HAWS* haws);
void haws_test_3(HAWS* haws);
void haws_test_4(HAWS* haws);
void haws_test_5(HAWS* haws);
void haws_test_phys_mem_management(HAWS* haws);
void haws_test_phys_mem_management2(HAWS* haws);
void haws_test_v4_8k(HAWS* haws);
void haws_test_billing(HAWS* haws);

#define TEST_MEMCAP haws_test_phys_mem_management
#define TEST_8K haws_test_v4_8k
#define TEST_BILLING haws_test_billing

#define SINGLE_TEST TEST_BILLING

//rr1 - current verion v4
//cpu
int cpuBinRAM1024 = 24;
int cpuBinRAM2048 = 90;
int cpuBinRAM4096 = 385;
int cpuBinRAM8k = 1536;
//gpu
int cpuBinRAMGPUBase = 2;
int gpuBinRAMBase = 2;

int main () {
    HAWS haws;
    SINGLE_TEST(&haws);
}

void haws_test_1(HAWS* haws) {
    HAWSClientRequest* r1 = new HAWSClientRequest("/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                                                  "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                  (char*) "", 0,
                                                  "4096");
    printf("r1: %s \n", r1->ToStr().c_str());

    haws->Start();
    haws->HardAwareSchedule(r1);
    sleep(5);
    haws->Stop();

    printf("Yay from test1, done!\n");
}

void haws_test_2(HAWS* haws) {
    HAWSClientRequest r1("/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase, 
                         (char*) "", 0,
                         "64");
    HAWSClientRequest r2("/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                         (char*) "", 0,
                         "1024");
    HAWSClientRequest r3("/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                         (char*) "", 0,
                         "2048");
    HAWSClientRequest r4("/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                         (char*) "", 0,
                         "2048");
    HAWSClientRequest r5("/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                         (char*) "", 0,
                         "4096"); 
    haws->Start();
    haws->HardAwareSchedule(&r1);
    haws->HardAwareSchedule(&r2);
    haws->HardAwareSchedule(&r3);
    haws->HardAwareSchedule(&r4);
    haws->HardAwareSchedule(&r5);
    sleep(1); // let reqs move through queue and start
    while (haws->GetNumActiveTasks() > 0) {
        usleep(1000);
    }
    haws->Stop();

    printf("Yay from test1, done!\n");
}

void haws_test_3(HAWS* haws) {
    HAWSClientRequest r1("/usr/local/bin/julia", cpuBinRAM2048,
                         "/usr/local/bin/julia", gpuBinRAMBase,
                         (char*) "", 0,
                         "/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl");
    HAWSClientRequest r2("/usr/local/bin/julia", cpuBinRAM2048,
                         "/usr/local/bin/julia", gpuBinRAMBase,
                         (char*) "", 0,
                         "/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl");
    HAWSClientRequest r3("/usr/local/bin/julia", cpuBinRAM2048,
                         "/usr/local/bin/julia", gpuBinRAMBase,
                         (char*) "", 0,
                         "/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl");
    haws->Start();
    haws->HardAwareSchedule(&r1);
    sleep(2);
    haws->HardAwareSchedule(&r2);
    sleep(4);
    haws->HardAwareSchedule(&r3);
    while(haws->GetNumActiveTasks() > 0) {
        usleep(1000);
    }
    haws->Stop();
}

void haws_test_4(HAWS* haws) {
     HAWSClientRequest r1("ls", 1,
                          "ls", 1,
                          (char*) "", 0,
                          (char*) "");
     haws->Start();
     haws->HardAwareSchedule(&r1);
     sleep(1);
     while(haws->GetNumActiveTasks() > 0) { usleep(1000); }
     haws->Stop();
}

void haws_test_5(HAWS* haws) {
    start_subprocess_test(); 
}

void haws_test_phys_mem_management(HAWS* haws) {
    haws->Start();
    for (int i = 0; i < 4000; i++) {
        HAWSClientRequest* r = new HAWSClientRequest("/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                                                     "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                     (char*) "", 0,
                                                     "1024");
        haws->HardAwareSchedule(r);
    }
    sleep(1);
    while (haws->GetNumActiveTasks() > 0) { usleep(1000); }
    haws->Stop();
}


void haws_test_phys_mem_management2(HAWS* haws) {
    haws->Start();
    for (int i = 0; i < 38; i++) {
        HAWSClientRequest* r = new HAWSClientRequest("/opt/haws/bin/matmul_cpu", cpuBinRAM8k,
                                                     "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                     (char*) "", 0,
                                                     "8k");
        haws->HardAwareSchedule(r);
    }
    sleep(1);
    while (haws->GetNumActiveTasks() > 0) { usleep(1000); }
    haws->Stop();
}

void haws_test_v4_8k(HAWS* haws) {
    haws->Start();
    for (int i = 0; i < 31; i++) {
        HAWSClientRequest* r = new HAWSClientRequest("/opt/haws/bin/matmul_cpu_v4", cpuBinRAM8k,
                                                     "/opt/haws/bin/matmul_gpu_v4", gpuBinRAMBase,
                                                     (char *) "", 0,
                                                     "8192");
        haws->HardAwareSchedule(r);
    }
    sleep(1); // let jobs start
    while (haws->GetNumActiveTasks() > 0) { usleep(1000); }
    haws->Stop();
}

void haws_test_billing(HAWS* haws) {
    haws->Start();
    for (int i = 0; i < 31; i++) {
        HAWSClientRequest* r  = new HAWSClientRequest("/opt/haws/bin/matmul_cpu_v4", cpuBinRAM1024,
                                                      "/opt/haws/bin/matmul_gpu_v4", gpuBinRAMBase,
                                                      (char*) "", 0,
                                                      "1024");
        haws->HardAwareSchedule(r);
    }
    sleep(1);
    while (haws->GetNumActiveTasks() > 0) { usleep(1000); }
    haws->Stop();
}

void haws_test_gpu_mgmt(HAWS* haws) {
    haws->Start();
    for (int i = 0; i < 100; i++) {
        HAWSClientRequest* r = new HAWSClientRequest("/opt/haws/bin/matmul_gpu", cpuBinRAMGPUBase,
                                                     "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                     (char*) "", 0,
                                                     "1024");
        haws->HardAwareSchedule(r);
    }
    sleep(1); // let jobs start
    while (haws->GetNumActiveTasks() > 0) { usleep(1000); }
    haws->Stop();
}


