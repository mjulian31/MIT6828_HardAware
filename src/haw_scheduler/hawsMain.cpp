
#include <stdio.h>
#include "hawsHAWS.h"
#include "hawsClientRequest.h"
#include <assert.h>

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

    haws->HardAwareSchedule(r1);

    printf("Hello from test1, done!\n");
}
