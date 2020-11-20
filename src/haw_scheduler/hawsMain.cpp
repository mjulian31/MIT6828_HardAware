
#include <stdio.h>
#include "hawsHAWS.h"
#include "hawsClientRequest.h"

int main () {
    HAWS haws;
    haws.PrintData();

    HAWSClientRequest* r1 = new HAWSClientRequest("/opt/haws/bin/matmul_cpu", 
                                                  "/opt/haws/bin/matmul_gpu",
                                                  "4096");
    printf("r1: %s ", r1->ToStr().c_str());
    printf("Hello from main\n");
}
