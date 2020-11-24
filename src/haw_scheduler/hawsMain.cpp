
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
void haws_test_many_processes(HAWS* haws);

int main () {
    HAWS haws;
    haws_test_many_processes(&haws);    
}

void haws_test_1(HAWS* haws) {
    HAWSClientRequest* r1 = new HAWSClientRequest("/opt/haws/bin/matmul_cpu", 
                                                  "/opt/haws/bin/matmul_gpu",
                                                  "4096");
    printf("r1: %s \n", r1->ToStr().c_str());

    haws->Start();
    haws->HardAwareSchedule(r1);
    sleep(5);
    haws->Stop();

    printf("Yay from test1, done!\n");
}

void haws_test_2(HAWS* haws) {
    HAWSClientRequest r1("/opt/haws/bin/matmul_cpu", 
                         "/opt/haws/bin/matmul_gpu",
                         "64");
    HAWSClientRequest r2("/opt/haws/bin/matmul_cpu", 
                         "/opt/haws/bin/matmul_gpu",
                         "1024");
    HAWSClientRequest r3("/opt/haws/bin/matmul_cpu", 
                         "/opt/haws/bin/matmul_gpu",
                         "2048");
    HAWSClientRequest r4("/opt/haws/bin/matmul_cpu", 
                         "/opt/haws/bin/matmul_gpu",
                         "2048");
    HAWSClientRequest r5("/opt/haws/bin/matmul_cpu", 
                         "/opt/haws/bin/matmul_gpu",
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
    HAWSClientRequest r1("/usr/local/bin/julia",
                         "/usr/local/bin/julia",
                         "/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl");
    HAWSClientRequest r2("/usr/local/bin/julia",
                         "/usr/local/bin/julia",
                         "/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl");
    HAWSClientRequest r3("/usr/local/bin/julia",
                         "/usr/local/bin/julia",
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
     HAWSClientRequest r1("ls",
                          "ls",
                          "");
     haws->Start();
     haws->HardAwareSchedule(&r1);
     sleep(1);
     while(haws->GetNumActiveTasks() > 0) { usleep(1000); }
     haws->Stop();
}

void haws_test_5(HAWS* haws) {
    start_subprocess_test(); 
}

void haws_test_many_processes (HAWS* haws) {
    haws->Start();
    for (int i = 0; i < 800; i++) {
        HAWSClientRequest* r = new HAWSClientRequest("/opt/haws/bin/matmul_cpu", 
                                                     "/opt/haws/bin/matmul_gpu",
                                                     "1024");
        sleep(i % 5 == 0 ? 1 : 0);
        haws->HardAwareSchedule(r);
    }
    sleep(1);
    while (haws->GetNumActiveTasks() > 0) { usleep(1000); }
    haws->Stop();
}
