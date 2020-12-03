#include <stdio.h>
#include <assert.h>
#include <thread>
#include <unistd.h>
//socket stuff
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <string.h> 

#include "hawsHAWS.h"
#include "subprocess.h"
#include "hawsTestSocket.h"

//#define NDEBUG  // turn asserts off
#undef NDEBUG   // turn asserts on

int numTests = 0;

#define FAIL(test_name) \
    printf("TEST FAIL: test_name\n"); \
    exit(1);

#define RUN_TEST(test_name) \
    printf("TEST START: " #test_name "\n"); \
    if (test_name() != 0) { \
        FAIL(test_name); \
    } else { \
        printf("TEST PASS: " #test_name "\n"); \
    } \
    numTests++;


// physmem control 
#define SCHED_MEM_MAX_CLOUDLAB 62464
// gpu memory control
#define SCHED_MEM_GPU_MAX_CLOUDLAB (1024*6) // update on cloudlab


void haws_test_2(HAWS* haws);
void haws_test_3(HAWS* haws);
void haws_test_4(HAWS* haws);
void haws_test_phys_mem_management(HAWS* haws);
void haws_test_v4_8k(HAWS* haws);
void haws_test_billing(HAWS* haws);
void haws_test_stdout_cap(HAWS* haws);
void haws_test_stdin_stdout_cap(HAWS* haws);

#define MATMUL_PROD1_ITERS 1000

int haws_test_1();
int haws_test_physmem_limit_buffer();
int haws_test_matmul_cpu_prod1();
int haws_test_matmul_gpu_prod1();

//rr1 - current verion prod1
//cpu
int cpuBinRAM1024 = 35;
int cpuBinRAM2048 = 90;
int cpuBinRAM4096 = 385;
int cpuBinRAM8k = 1536;
//gpu
int cpuBinRAMGPUBase = 2;
int gpuBinRAMBase = 2;

HAWS haws;
int testClientSocket = -1;
int main (int argc, char *argv[]) {
    // set resource limits
    haws.SetPhysMemLimitMB(atoi(argv[1]));
    haws.SetGPUMemLimitMB(atoi(argv[2]));
    haws.SetGPUSharedMemLimitMB(atoi(argv[3]));

    haws.StartSocket(); // bringup server socket 
    testClientSocket = haws_help_open_socket(8080);
    assert(testClientSocket > 0);

    // WHITEBOX tests - directly call scheduler 
    // basic tests - no command line args or stdin
    RUN_TEST(haws_test_1);
    RUN_TEST(haws_test_1);
    RUN_TEST(haws_test_1);

    // test request buffering when out of physical memory
    RUN_TEST(haws_test_physmem_limit_buffer);

    // many parallel actual matrix multiplies
    RUN_TEST(haws_test_matmul_cpu_prod1);
    RUN_TEST(haws_test_matmul_gpu_prod1);

    // BLACKBOX tests - call scheduler through socket
    RUN_TEST(haws_test_socket_bringup);
    
    haws_help_close_socket(testClientSocket);
    haws.StopSocket();
    printf("\n\n");
    printf("%d TESTS PASSED\n", numTests);
}


int haws_test_1() {
    char* formal_stdin = (char*) "b";

    HAWSClientRequest* r1 = new HAWSClientRequest("cpu", 
                                                  "/opt/haws/bin/matmul_cpu", cpuBinRAM1024,
                                                  "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                  (char*) "", 0, 
                                                  "1024");
    printf("r1: %s \n", r1->ToStr().c_str());
    haws.Start();
    haws.HardAwareSchedule(r1);
    sleep(1);
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;
}

int haws_test_physmem_limit_buffer() {
    haws.Start();
    for (int i = 0; i < 200; i++) {
        // fake larger memory requirement to top out physical ram
        HAWSClientRequest* r = new HAWSClientRequest("cpu",
                                                     "/opt/haws/bin/matmul_cpu", cpuBinRAM1024 * 10,
                                                     "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                     (char*) "", 0,
                                                     "1024");
        haws.HardAwareSchedule(r);
    }
    sleep(1);
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;
}



int haws_test_matmul_cpu_prod1() {
    haws.Start();
    char* formal_stdin = (char*) "[0.5601922408747706 0.5498457394253573 0.24767881927397717 0.27187891952177856; 0.5730447732822026 0.392712621542896 0.7104079489586148 0.27725616994299096; 0.2728092392852186 0.16275014197633997 0.5345847176860559 0.7135436758420011][0.20318818433657682 0.2268235629705242; 0.5767023795601847 0.8770918376577908; 0.26442460894021313 0.9237210225088366; 0.43515479778688104 0.9401231927424645]\n";
        printf("TESTMAIN: stdinlen %d\n", (int) strlen(formal_stdin));
    for (int i = 0; i < MATMUL_PROD1_ITERS; i++) {
       // after parsing request, alloc freeable_stdin
       char* freeable_stdin = (char*) malloc(strlen(formal_stdin) * sizeof(char) + 1);
       strncpy(freeable_stdin, formal_stdin, strlen(formal_stdin) + 1);
       HAWSClientRequest* r  = new HAWSClientRequest("cpu",
                                                     "/opt/haws/bin/matmul_cpu", cpuBinRAMGPUBase,
                                                     "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                     (char*) freeable_stdin, strlen(freeable_stdin),
                                                     "3 4 2 norand");
       haws.HardAwareSchedule(r);
       // freeable_stdin will be freed after processing
    }
    sleep(1); //let jobs start
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;
}

int haws_test_matmul_gpu_prod1() {
    haws.Start();
    char* formal_stdin = (char*) "[0.5601922408747706 0.5498457394253573 0.24767881927397717 0.27187891952177856; 0.5730447732822026 0.392712621542896 0.7104079489586148 0.27725616994299096; 0.2728092392852186 0.16275014197633997 0.5345847176860559 0.7135436758420011][0.20318818433657682 0.2268235629705242; 0.5767023795601847 0.8770918376577908; 0.26442460894021313 0.9237210225088366; 0.43515479778688104 0.9401231927424645]\n";
    
    printf("TESTMAIN: stdinlen %d\n", (int) strlen(formal_stdin));
    for (int i = 0; i < MATMUL_PROD1_ITERS; i++) {
       // after parsing request, alloc freealbe_stdin
       char* freeable_stdin = (char*) malloc(strlen(formal_stdin) * sizeof(char) + 1);
       strncpy(freeable_stdin, formal_stdin, strlen(formal_stdin) + 1);
    
       HAWSClientRequest* r  = new HAWSClientRequest("gpu",
                                                     "/opt/haws/bin/matmul_cpu", cpuBinRAMGPUBase,
                                                     "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                     (char*) freeable_stdin, strlen(freeable_stdin),
                                                     "3 4 2 norand");
       haws.HardAwareSchedule(r);
       // freeable_stdin will be freed after processing
    }
    sleep(1); //let jobs start
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;
}


void haws_test_2() { // old, early, no longer used
    HAWSClientRequest r1("cpu",
                         "/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase, 
                         (char*) "", 0,
                         "64");
    HAWSClientRequest r2("cpu",
                         "/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                         (char*) "", 0,
                         "1024");
    HAWSClientRequest r3("cpu",
                         "/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                         (char*) "", 0,
                         "2048");
    HAWSClientRequest r4("cpu",
                         "/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                         (char*) "", 0,
                         "2048");
    HAWSClientRequest r5("cpu",
                         "/opt/haws/bin/matmul_cpu", cpuBinRAM2048,
                         "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                         (char*) "", 0,
                         "4096"); 
    haws.Start();
    haws.HardAwareSchedule(&r1);
    haws.HardAwareSchedule(&r2);
    haws.HardAwareSchedule(&r3);
    haws.HardAwareSchedule(&r4);
    haws.HardAwareSchedule(&r5);
    sleep(1); // let reqs move through queue and start
    while (haws.GetNumActiveTasks() > 0) {
        usleep(1000);
    }
    haws.Stop();
}

void haws_test_3() { // old, early, no longer used
    HAWSClientRequest r1("cpu",
                         "/usr/local/bin/julia", cpuBinRAM2048,
                         "/usr/local/bin/julia", gpuBinRAMBase,
                         (char*) "", 0,
                         "/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl");
    HAWSClientRequest r2("cpu",
                         "/usr/local/bin/julia", cpuBinRAM2048,
                         "/usr/local/bin/julia", gpuBinRAMBase,
                         (char*) "", 0,
                         "/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl");
    HAWSClientRequest r3("cpu",
                         "/usr/local/bin/julia", cpuBinRAM2048,
                         "/usr/local/bin/julia", gpuBinRAMBase,
                         (char*) "", 0,
                         "/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl");
    haws.Start();
    haws.HardAwareSchedule(&r1);
    sleep(2);
    haws.HardAwareSchedule(&r2);
    sleep(4);
    haws.HardAwareSchedule(&r3);
    while(haws.GetNumActiveTasks() > 0) {
        usleep(1000);
    }
    haws.Stop();
}

void haws_test_4() { // old, early, no longer used
     HAWSClientRequest r1("cpu",
                          "ls", 1,
                          "ls", 1,
                          (char*) "", 0,
                          (char*) "");
     haws.Start();
     haws.HardAwareSchedule(&r1);
     sleep(1);
     while(haws.GetNumActiveTasks() > 0) { usleep(1000); }
     haws.Stop();
}

void haws_test_phys_mem_management() { // old, early, no longer used
    haws.Start();
    for (int i = 0; i < 4000; i++) {
        HAWSClientRequest* r = new HAWSClientRequest("cpu",
                                                     "/opt/haws/bin/matmul_cpu_v4", cpuBinRAM1024,
                                                     "/opt/haws/bin/matmul_gpu_v4", gpuBinRAMBase,
                                                     (char*) "", 0,
                                                     "1024");
        haws.HardAwareSchedule(r);
    }
    sleep(1);
    while (haws.GetNumActiveTasks() > 0) { usleep(1000); }
    haws.Stop();
}

void haws_test_v4_8k() { // old, early, no longer used
    haws.Start();
    for (int i = 0; i < 31; i++) {
        HAWSClientRequest* r = new HAWSClientRequest("cpu",
                                                     "/opt/haws/bin/matmul_cpu_v4", cpuBinRAM8k,
                                                     "/opt/haws/bin/matmul_gpu_v4", gpuBinRAMBase,
                                                     (char *) "", 0,
                                                     "8192");
        haws.HardAwareSchedule(r);
    }
    sleep(1); // let jobs start
    while (haws.GetNumActiveTasks() > 0) { usleep(1000); }
    haws.Stop();
}

void haws_test_billing() { // old, early, no longer used
    haws.Start();
    for (int i = 0; i < 31; i++) {
        HAWSClientRequest* r  = new HAWSClientRequest("cpu",
                                                      "/opt/haws/bin/matmul_cpu_v4", cpuBinRAM1024,
                                                      "/opt/haws/bin/matmul_gpu_v4", gpuBinRAMBase,
                                                      (char*) "", 0,
                                                      "1024");
        haws.HardAwareSchedule(r);
    }
    sleep(1);
    while (haws.GetNumActiveTasks() > 0) { usleep(1000); }
    haws.Stop();
}


void haws_test_stdout_cap() { // old, early, no longer used
    haws.Start();
    for (int i = 0; i < 1; i++) {
        HAWSClientRequest* r  = new HAWSClientRequest("cpu",
                                                      "/usr/bin/echo", 1,
                                                      "/usr/bin/echo", 1,
                                                      (char*) "this is my first test\n", 22,
                                                      "ABCDEFGHIJ");
        haws.HardAwareSchedule(r);
    }
    sleep(1);
    while (haws.GetNumActiveTasks() > 0) { usleep(1000); }
    haws.Stop();
}

void haws_test_stdin_stdout_cap() { // old, early, no longer used
    haws.Start();
    for (int i = 0; i < 500; i++) {
        HAWSClientRequest* r  = new HAWSClientRequest("cpu",
                                                      "/opt/haws/bin/mockbin_file", 12,
                                                      "/opt/haws/bin/mockbin_file", 12,
                                                      (char*) "this is my first test\n", 22,
                                                      "2 3 4");
        usleep(10);
        haws.HardAwareSchedule(r);
    }
    sleep(1);
    while (haws.GetNumActiveTasks() > 0) { usleep(1000); }
    haws.Stop();
}

void haws_test_gpu_mgmt() { // old, early, no longer used
    haws.Start();
    for (int i = 0; i < 100; i++) {
        HAWSClientRequest* r = new HAWSClientRequest("gpu",
                                                     "/opt/haws/bin/matmul_gpu", cpuBinRAMGPUBase,
                                                     "/opt/haws/bin/matmul_gpu", gpuBinRAMBase,
                                                     (char*) "", 0,
                                                     "1024");
        haws.HardAwareSchedule(r);
    }
    sleep(1); // let jobs start
    while (haws.GetNumActiveTasks() > 0) { usleep(1000); }
    haws.Stop();
}

