
#include <stdio.h>
#include <assert.h>
#include <thread>
#include <unistd.h>
#include "hawsHAWS.h"

//#define NDEBUG  // turn asserts off
#undef NDEBUG   // turn asserts on


void haws_test_1(HAWS* haws);
void haws_test_2(HAWS* haws);

int main () {
    HAWS haws;
    haws.PrintData();

    haws_test_2(&haws);    
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
                         "4096");
    HAWSClientRequest r5("/opt/haws/bin/matmul_cpu", 
                         "/opt/haws/bin/matmul_gpu",
                         "8182"); 
    haws->Start();
    haws->HardAwareSchedule(&r1);
    haws->HardAwareSchedule(&r2);
    haws->HardAwareSchedule(&r3);
    haws->HardAwareSchedule(&r4);
    haws->HardAwareSchedule(&r5);
    sleep(5);
    haws->Stop();

    printf("Yay from test1, done!\n");
}
