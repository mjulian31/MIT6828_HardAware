
#include <stdio.h>
#include <assert.h>
#include <thread>
#include <unistd.h>
#include "hawsHAWS.h"

//#define NDEBUG  // turn asserts off
#undef NDEBUG   // turn asserts on


void haws_test_1(HAWS* haws);

int main () {
    HAWS haws;
    haws.PrintData();

    haws_test_1(&haws);    
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
