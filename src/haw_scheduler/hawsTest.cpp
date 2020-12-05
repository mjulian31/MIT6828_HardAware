#include <stdio.h>
#include <assert.h>
#include <thread>
#include <unistd.h>

#include "socket.h"
#include "hawsHAWS.h"
#include "subprocess.h"
#include "hawsTest.h"
#include "hawsTestSocket.h"

//#define NDEBUG  // turn asserts off
#undef NDEBUG   // turn asserts on

// physmem control 
//#define SCHED_MEM_MAX_CLOUDLAB 62464
// gpu memory control
//#define SCHED_MEM_GPU_MAX_CLOUDLAB (1024*6) // update on cloudlab

#define MATMUL_PROD1_ITERS 1000

int haws_test_small();
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

int numTests = 0;
HAWS haws;

int main (int argc, char *argv[]) {
    if (argc != 5) {
        printf("error: usage ./haws <prod | test>" \
               "<phys limit mb> <gpu limit mb> <gpu shared limit mb>");
    }

    // set resource limits
    // memory
    haws.SetPhysMemLimitMB(atoi(argv[2]));
    haws.SetGPUMemLimitMB(atoi(argv[3]));
    haws.SetGPUSharedMemLimitMB(atoi(argv[4]));
    // threads
    // TODO

    if (strcmp(argv[1], "prod") == 0) {
        printf("HAWS: Standalone mode\n");
        haws.Start();
        haws.StartSocket();
        while (true) {
            // run until killed
        }
    } else if (strcmp(argv[1], "test") == 0) {
        printf("HAWS: Running tests\n");
        // WHITEBOX tests - directly call scheduler 
        // basic tests - no command line args or stdin
        bool allWhiteBox = false;
        if (allWhiteBox) {
            RUN_TEST(haws_test_small);
            RUN_TEST(haws_test_1);
            RUN_TEST(haws_test_1);
            RUN_TEST(haws_test_1);

            // test request buffering when out of physical memory
            RUN_TEST(haws_test_physmem_limit_buffer);

            // many parallel actual matrix multiplies
            RUN_TEST(haws_test_matmul_cpu_prod1);
            RUN_TEST(haws_test_matmul_gpu_prod1);
        }

        // BLACKBOX tests - call scheduler through socket
        bool allBlackBox = true;
        if (allBlackBox) {
            haws_test_socket_all();
        }
        printf("\n\n");
        printf("%d TESTS PASSED\n", numTests);
    } else {
        printf("error: usage ./haws <prod | test> " \
               "<phys limit mb> <gpu limit mb> <gpu shared limit mb>");
        exit(1);
    }
}

int haws_test_small() {
   HAWSClientRequest* r1 = new HAWSClientRequest(1, "/opt/haws/bin/matmul_cpu", 
                                                     "/opt/haws/bin/matmul_gpu", "4",
                                                     "cpu-only", 1, 1, 10, 
                                                     35, 2, 100, 200, 
                                                     "matmul_4", 0, (char*) "");
    r1->Print();
    haws.Start();
    haws.HardAwareSchedule(r1);
    sleep(1);
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;


}

int haws_test_1() {
    HAWSClientRequest* r1 = new HAWSClientRequest(1, "/opt/haws/bin/matmul_cpu", 
                                                     "/opt/haws/bin/matmul_gpu", "1024",
                                                     "cpu-only", 1, 1, 10, 
                                                     35, 2, 100, 200, 
                                                     "matmul_1024", 0, (char*) "");
    r1->Print();
    haws.Start();
    haws.HardAwareSchedule(r1);
    sleep(1);
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;
}

int haws_test_physmem_limit_buffer() {
    haws.Start();
    for (int i = 1; i <= 200; i++) {
        // fake larger memory requirement to top out physical ram
        HAWSClientRequest* r = new HAWSClientRequest(i, "/opt/haws/bin/matmul_cpu", 
                                                        "/opt/haws/bin/matmul_gpu", "1024",
                                                        "cpu-only", 1, 1, 10, 
                                                        (35 * 10), 2, 100, 200, 
                                                        "matmul_1024", 0, (char*) "");
        haws.HardAwareSchedule(r);
    }
    sleep(1);
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;
}


int haws_test_matmul_cpu_prod1() {
    haws.Start();
    char* formal_stdin = (char*) "[0.5601922408747706 0.5498457394253573 0.24767881927397717 0.27187891952177856; 0.5730447732822026 0.392712621542896 0.7104079489586148 0.27725616994299096; 0.2728092392852186 0.16275014197633997 0.5345847176860559 0.7135436758420011][0.20318818433657682 0.2268235629705242; 0.5767023795601847 0.8770918376577908; 0.26442460894021313 0.9237210225088366; 0.43515479778688104 0.9401231927424645]";
        printf("TESTMAIN: stdinlen %d\n", (int) strlen(formal_stdin));
    for (int i = 1; i <= MATMUL_PROD1_ITERS; i++) {
       // freeable_stdin will be freed after req is processed 
       char* freeable_stdin = (char*) malloc(strlen(formal_stdin) * sizeof(char) + 1); // TODO RM 1
       strncpy(freeable_stdin, formal_stdin, strlen(formal_stdin) + 1); // TODO RM + 1
       HAWSClientRequest* r = new HAWSClientRequest(i, "/opt/haws/bin/matmul_cpu", 
                                                       "/opt/haws/bin/matmul_gpu", "3 4 2 norand",
                                                       "cpu-only", 1, 1, 10, 
                                                       20, 2, 100, 200,  //TODO TIGHTEN
                                                       "matmul_3_4_2", strlen(freeable_stdin), 
                                                       (char*) freeable_stdin);
       haws.HardAwareSchedule(r);
    }
    sleep(1); //let jobs start
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;
}

int haws_test_matmul_gpu_prod1() {
    haws.Start();
    char* formal_stdin = (char*) "[0.5601922408747706 0.5498457394253573 0.24767881927397717 0.27187891952177856; 0.5730447732822026 0.392712621542896 0.7104079489586148 0.27725616994299096; 0.2728092392852186 0.16275014197633997 0.5345847176860559 0.7135436758420011][0.20318818433657682 0.2268235629705242; 0.5767023795601847 0.8770918376577908; 0.26442460894021313 0.9237210225088366; 0.43515479778688104 0.9401231927424645]";
    
    printf("TESTMAIN: stdinlen %d\n", (int) strlen(formal_stdin));
    for (int i = 1; i <= MATMUL_PROD1_ITERS; i++) {
       // freeable_stdin will be freed after processing
       char* freeable_stdin = (char*) malloc(strlen(formal_stdin) * sizeof(char) + 1); //TODO RM +1
       strncpy(freeable_stdin, formal_stdin, strlen(formal_stdin) + 1); // TODO RM + 1
       HAWSClientRequest* r = new HAWSClientRequest(i, "/opt/haws/bin/matmul_cpu", 
                                                       "/opt/haws/bin/matmul_gpu", "3 4 2 norand",
                                                       "gpu-only", 1, 1, 10, 
                                                       20, 2, 100, 200, // TODO TIGHTEN
                                                       "matmul_3_4_2", strlen(freeable_stdin), 
                                                       (char*) freeable_stdin);
       haws.HardAwareSchedule(r);
    }
    sleep(1); //let jobs start
    while (haws.IsDoingWork()) { usleep(1000); }
    haws.Stop();
    return 0;
}

/* // old, early, no longer used
void haws_test_2(HAWS* haws);
void haws_test_3(HAWS* haws);
void haws_test_4(HAWS* haws);
void haws_test_phys_mem_management(HAWS* haws);
void haws_test_v4_8k(HAWS* haws);
void haws_test_billing(HAWS* haws);
void haws_test_stdout_cap(HAWS* haws);
void haws_test_stdin_stdout_cap(HAWS* haws);
*/


/*
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
*/
