#include <stdio.h> 
#include <stdlib.h>
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <unistd.h> 
#include <string.h> 
#include <cmath>
#include <cassert>

#include "hawsHAWS.h"
#include "hawsTest.h"
#include "hawsSocket.h"
#include "socket.h"

extern HAWS haws;
extern int numTests;


#define CLIENT_SEND_BUFF_SIZE SOCKET_SEND_BUF_SIZE
#define CLIENT_RECV_BUFF_SIZE SOCKET_READ_BUF_SIZE 

// Req Format
/* int reqNum,                 // FIELD 2
   std::string cpuBinPath,     // FIELD 3
   std::string gpuBinPath,     // FIELD 4
   std::string jobArgv,        // FIELD 5
   std::string targHint,       // FIELD 6
   int cpuJobCPUThreads,       // FIELD 7
   int gpuJobCPUThreads,       // FIELD 8
   int gpuJobGPUThreads,       // FIELD 9
   int cpuJobCPUPhysMB,        // FIELD 10
   int gpuJobCPUPhysMB,        // FIELD 11
   int gpuJobGPUPhysMB,        // FIELD 12
   int gpuJobGPUShMB,          // FIELD 13
   std::string jobID,          // FIELD 14
   long stdinLen,              // FIELD 15
   char* freeableStdin)        // FIELD 16
*/

char* clientSendBuff;
char* clientRecvBuff;

bool testGlobalKillFlag;

int testClientSendSocket = -1;
int testClientRecvSocket = -1;
std::thread* testSockRecvLoop;

// test protos
int haws_test_socket_simple_send_recv();

//int haws_test_socket_many_cpu(); // disabled
//int haws_test_socket_many_gpu(); // now using resource limit tests

int haws_test_socket_memlimit_cpu();
int haws_test_socket_memlimit_gpu();
int haws_test_socket_cputrlimit_cpu();
int haws_test_socket_gputrlimit_gpu();

int haws_test_target_profile_up_to(char* target, int maxDim);
int haws_test_cpu_profile_up_to(int maxDim);
int haws_test_gpu_profile_up_to(int maxDim);

// test client recv loop
void haws_test_socket_recv_loop();

// helpers
int haws_help_load_client_buffer_sample_req(int reqNum, 
                                            char* targetRec, 
                                            char* cmdArgs, 
                                            int cpuCPUThreads,
                                            int gpuCPUThreads,
                                            int gpuGPUThreads,
                                            long maxCPUJobCPURAM,
                                            long maxGPUJobCPURAM,
                                            long maxGPUJobGPURAM,
                                            long maxGPUJobGPUSharedRAM,
                                            bool hasStdin);

// thread estimation 
int haws_estimate_gpujob_gpu_threads(int dim);
// memory estimation 
long haws_estimate_cpujob_cpu_ram(int dim);
long haws_estimate_gpujob_cpu_ram(int dim);
long haws_estimate_gpujob_gpu_ram(int dim);

// send hardware profile sweeps
void haws_req_cpu_profile_up_to(int maxDim);
void haws_req_gpu_profile_up_to(int maxDim);

int reqNum = 1;

void haws_test_socket_all() {
    // setup 
    clientSendBuff = (char*) malloc(CLIENT_SEND_BUFF_SIZE * sizeof(char));
    clientRecvBuff = (char*) malloc(CLIENT_RECV_BUFF_SIZE * sizeof(char));
    // bringup client recv thread
    testSockRecvLoop = new std::thread(haws_test_socket_recv_loop);
    haws.StartSocket(); // bringup server networking
    testClientSendSocket = socket_open_send_socket(8080, "TEST/CLIENT/SEND");
    assert(testClientSendSocket > 0);
    haws.Start();
    sleep(2); // give chance for server to come up and do handshake
    
    // requests over socket tests
    //RUN_TEST(haws_test_socket_simple_send_recv);
    //RUN_TEST(haws_test_socket_many_cpu());
    //RUN_TEST(haws_test_socket_memlimit_cpu());
    //RUN_TEST(haws_test_socket_memlimit_gpu());
    //RUN_TEST(haws_test_socket_cputrlimit_cpu());
    RUN_TEST(haws_test_socket_gputrlimit_gpu());

    //RUN_TEST(haws_test_gpu_profile_up_to(1024));

    //teardown
    free(clientSendBuff);
    free(clientRecvBuff);
    haws.Stop();
    socket_close_socket(testClientSendSocket, "TEST/CLIENT/SEND");
    haws.StopSocket();
    testGlobalKillFlag = true; // stop client recv thread
    printf("TEST/CLIENT: stopping recv loop...\n");
    testSockRecvLoop->join();
    delete(testSockRecvLoop);
    printf("TEST/CLIENT: stopped recv loop\n");
}


int haws_test_socket_simple_send_recv() {
    int length = haws_help_load_client_buffer_sample_req(reqNum++, 
                 (char*)"cpu-only", (char*) "3 4 2 noargs", 1, 0, 0, MB_TO_BYTES(8), 0, 0, 0, true);
    printf("TEST/CLIENT:\n\nsample req bytes[%d]:", length);
    for (int i = 0; i < length; i++) { // safe print buff
        printf("%c", clientSendBuff[i]);
    }
    printf("TEST/CLIENT: send it\n");
    send(testClientSendSocket, clientSendBuff, length, 0); 
    printf("TEST/CLIENT: sample request sent!\n"); 
    sleep(10); // let job start
    while (haws.IsDoingWork()) { sleep(1); }; // wait until haws becomes idle
    return 0;
}

/*
int haws_test_socket_many_cpu() {
    int length;
    for (int i = 1; i <= 1000; i++) { 
        length = haws_help_load_client_buffer_sample_req(reqNum++, 
                 (char*) "cpu-only", (char*) "1024", 
                 1, // cpu cpu threads
                 0, // gpu cpu threads
                 0, // gpu gpu threads
                 haws_estimate_cpujob_cpu_ram(1024), 
                 0, 
                 0, 
                 0, 
                 false);
        //printf("TEST:\n\nsample req#%d bytes[%d]:\n\n%s\n\n", i, length, clientSendBuff);
        //printf("TEST: send it\n");
        send(testClientSendSocket, clientSendBuff, length, 0); 
    }
    printf("TEST: all sample requests sent!\n"); 
    sleep(5); // give them a chance to start being received and started
    while (haws.IsDoingWork()) { sleep(1); }; // wait until haws becomes idle
    return 0;
}*/

int haws_test_socket_memlimit_cpu() {
    int length;
    for (int i = 1; i <= 500; i++) { 
        length = haws_help_load_client_buffer_sample_req(reqNum++, 
                 (char*) "cpu-only", (char*) "1024", 
                 1, // cpu cpu threads
                 0, // gpu cpu threads
                 0, // gpu gpu threads
                 haws_estimate_cpujob_cpu_ram(1024) * 10, 
                 0, 
                 0, 
                 0, 
                 false);
        //printf("TEST:\n\nsample req#%d bytes[%d]:\n\n%s\n\n", i, length, clientSendBuff);
        //printf("TEST: send it\n");
        send(testClientSendSocket, clientSendBuff, length, 0); 
    }
    printf("TEST: all sample requests sent!\n"); 
    sleep(5); // give them a chance to start being received and started
    while (haws.IsDoingWork()) { sleep(1); }; // wait until haws becomes idle
    return 0;
}

int haws_test_socket_memlimit_gpu() {
    int length;
    for (int i = 1; i <= 500; i++) { 
        length = haws_help_load_client_buffer_sample_req(reqNum++, 
                 (char*) "gpu-only", (char*) "1024", 
                 0, // cpu cpu threads
                 1, // gpu cpu threads
                 haws_estimate_gpujob_gpu_threads(1024),  // gpu gpu threads
                 0, // cpu physmem
                 haws_estimate_gpujob_cpu_ram(1024),      // gpu physmem 
                 haws_estimate_gpujob_gpu_ram(1024) * 10, // gpu gpu mem (inflated)
                 haws_estimate_gpujob_gpu_ram(1024),      // gpu gpu shared mem
                 false);
        printf("TEST:\n\nsample req#%d bytes[%d]:\n\n%s\n\n", i, length, clientSendBuff);
        //printf("TEST: send it\n");
        send(testClientSendSocket, clientSendBuff, length, 0); 
    }
    printf("TEST: all sample requests sent!\n"); 
    sleep(5); // give them a chance to start being received and started
    while (haws.IsDoingWork()) { sleep(1); }; // wait until haws becomes idle
    return 0;
}

int haws_test_socket_cputrlimit_cpu() {
    int length;
    for (int i = 1; i <= 500; i++) {
        length = haws_help_load_client_buffer_sample_req(reqNum++,
                 (char*) "cpu-only", (char*) "1024",
                 1,  // cpu cpu threads
                 0,  // gpu cpu threads 
                 0,  // gpu gpu threads 
                 haws_estimate_cpujob_cpu_ram(1024), // cpu physmem
                 0,  // gpu physmem
                 0,  // gpu gpu mem
                 0,  // gpu shared mem
                 false); // no stdin -- rand compute
        send(testClientSendSocket, clientSendBuff, length, 0);
    }
    printf("TEST: all sample requests sent\n");
    sleep(5); // give them a chance to start being received and started
    while (haws.IsDoingWork()) { sleep(1); }; 
    return 0;
}

int haws_test_socket_gputrlimit_gpu() {
    int length;
    for (int i = 1; i <= 500; i++) {
        length = haws_help_load_client_buffer_sample_req(reqNum++,
                 (char*) "gpu-only", (char*) "1024",
                 0,  // cpu cpu threads
                 1,  // gpu cpu threads 
                 haws_estimate_gpujob_gpu_threads(1024), // gpu gpu threads 
                 0,  // cpu physmem
                 haws_estimate_gpujob_cpu_ram(1024),     // gpu physmem
                 haws_estimate_gpujob_gpu_ram(1024),     // gpu gpu mem
                 haws_estimate_gpujob_gpu_ram(1024),     // gpu shared mem
                 false); // no stdin -- rand compute
        send(testClientSendSocket, clientSendBuff, length, 0);
    }
    printf("TEST: all sample requests sent\n");
    sleep(5); // give them a chance to start being received and started
    while (haws.IsDoingWork()) { sleep(1); }; 
    return 0;
}



/*
int haws_test_socket_many_gpu() {
    for (int i = 1; i <= 1000; i++) { 
        int length = haws_help_load_client_buffer_sample_req(reqNum++, 
                     (char*) "gpu-only", (char*) "1024", 
                     0, 
                     haws_estimate_gpujob_cpu_ram(1024),
                     haws_estimate_gpujob_gpu_ram(1024), 
                     haws_estimate_gpujob_gpu_ram(1024), 
                     false);
        //printf("TEST:\n\nsample req#%d bytes[%d]:\n\n%s\n\n", i, length, clientSendBuff);
        //printf("TEST: send it\n");
        send(testClientSendSocket, clientSendBuff, length, 0); 
    }
    printf("TEST: all sample requests sent!\n"); 
    sleep(5); // give them a chance to start being received and started

    while (haws.IsDoingWork()) { sleep(1); }; // can probably sleep(1)
    return 0;
}*/

long haws_estimate_cpujob_cpu_ram(int dim) {
    long cpuCpuOverheadBytes = MB_TO_BYTES(8);
    long cpuCpuMatmulBytes = (((dim * dim) * 2) * 4);
    return cpuCpuMatmulBytes + cpuCpuOverheadBytes;
}

long haws_estimate_gpujob_cpu_ram(int dim) {
    long gpuCpuOverheadBytes = MB_TO_BYTES(200);
    long cpuCpuMatmulBytes = (((dim * dim) * 2) * 4);
    return gpuCpuOverheadBytes + cpuCpuMatmulBytes;
}

long haws_estimate_gpujob_gpu_ram(int dim) {
    // this is whats measured at least for 1024
    // @perf set this more dynamically if overhead component changes on different dims
    long gpuGpuOverheadBytes = MB_TO_BYTES(53); 

    // account for data bytes
    long gpuGpuMatmulBytes = (((dim * dim) * 2) * 4);
    return gpuGpuOverheadBytes + gpuGpuMatmulBytes;
}

int haws_estimate_gpujob_gpu_threads(int dim) {
    float gpuThreadEstimate = sqrt(dim); //TODO make more accurate
    int gpuThreadEstimateInt = static_cast<int>(gpuThreadEstimate); 
    if (gpuThreadEstimateInt == 0) {
        gpuThreadEstimateInt = 1;
    }
    return gpuThreadEstimateInt;
}

void haws_req_cpu_profile_up_to(int maxDim) {
    std::string dim;
    for (int i = 2; i <= maxDim; i++) {
        dim = std::to_string(i);
        int length = haws_help_load_client_buffer_sample_req(reqNum++,
                     (char*) "cpu-only", (char*) dim.c_str(), 
                     1, 
                     0,
                     0,
                     haws_estimate_cpujob_cpu_ram(i), 
                     0, 
                     0, 
                     0, 
                     false);
        send(testClientSendSocket, clientSendBuff, length, 0);
    }
}

void haws_req_gpu_profile_up_to(int maxDim) {
    std::string dim;
    for (int i = 2; i <= maxDim; i++) {
        dim = std::to_string(i);
        long gpuMemEstimate = haws_estimate_gpujob_gpu_ram(i);
        int length = haws_help_load_client_buffer_sample_req(reqNum++,
                     (char*) "gpu-only", (char*) dim.c_str(), 
                     1, 
                     1,
                     haws_estimate_gpujob_gpu_threads(i),
                     0, 
                     haws_estimate_gpujob_cpu_ram(i), 
                     gpuMemEstimate,
                     gpuMemEstimate,
                     false);
        send(testClientSendSocket, clientSendBuff, length, 0);
    }
}

long haws_help_load_client_buffer_field(int pos, char* content, int len, bool addDelim) {
    //if (pos > 0) {

    //}
    assert(pos + len < CLIENT_SEND_BUFF_SIZE); // make sure still be in buffer
    memcpy(clientSendBuff + (pos * sizeof(char)), content, len);
    pos += len;
    if (addDelim) {
        assert(pos + 1 < CLIENT_SEND_BUFF_SIZE); // make sure will still be in buffer
        clientSendBuff[pos] = ',';
        pos++;
    }
    return pos;
}

int haws_help_load_client_buffer_sample_req(int reqNum, 
                                            char* targetRec, 
                                            char* cmdArgs, 
                                            int cpuCPUThreads,
                                            int gpuCPUThreads,
                                            int gpuGPUThreads,
                                            long maxCPUJobCPURAM,
                                            long maxGPUJobCPURAM,
                                            long maxGPUJobGPURAM,
                                            long maxGPUJobGPUSharedRAM,
                                            bool hasStdin) {

    printf("TEST/CLIENT/REQ/MEM: cpu-cpu %ld, gpu-cpu %ld, gpu-gpu %ld, gpu-shgpu %ld\n", 
           maxCPUJobCPURAM, maxGPUJobCPURAM, maxGPUJobGPURAM, maxGPUJobGPUSharedRAM);
    long pos = 0;
    long max_pos = CLIENT_SEND_BUFF_SIZE;

    // begin marker - FIELD 1
    pos = haws_help_load_client_buffer_field(0, (char*) "^", 1, false);

    // request number - FIELD 2
    std::string reqNumStr = std::to_string(reqNum);
    pos = haws_help_load_client_buffer_field(pos, 
                                             (char*) reqNumStr.c_str(), reqNumStr.length(), true);

    // cpu bin path - FIELD 3
    char* cpubinpath = (char*) "/opt/haws/bin/matmul_cpu";
    pos = haws_help_load_client_buffer_field(pos, cpubinpath, strlen(cpubinpath), true);
    
    // gpu bin bath - FIELD 4
    char* gpubinpath = (char*) "/opt/haws/bin/matmul_gpu";
    pos = haws_help_load_client_buffer_field(pos, gpubinpath, strlen(gpubinpath), true);

    // job command line args - FIELD 5
    //char* cmdArgs = (char*) "3 4 2 norand";
    pos = haws_help_load_client_buffer_field(pos, cmdArgs, strlen(cmdArgs), true);

    // target rec - FIELD 6
    //char* targetrec = (char*) "cpu-only";
    pos = haws_help_load_client_buffer_field(pos, targetRec, strlen(targetRec), true);

    // cpu job worst threads - FIELD 7
    std::string cpuJobWorstThreads = std::to_string(cpuCPUThreads);
    pos = haws_help_load_client_buffer_field(pos, (char*) cpuJobWorstThreads.c_str(), 
                                             cpuJobWorstThreads.length(), true);

    // gpu job worst CPU threads - FIELD 8
    std::string gpuJobWorstCPUThreads = std::to_string(gpuCPUThreads);
    pos = haws_help_load_client_buffer_field(pos, (char*) gpuJobWorstCPUThreads.c_str(), 
                                             gpuJobWorstCPUThreads.length(), true);

    // gpu job worst GPU threads - FIELD 9
    std::string gpuJobWorstGPUThreads = std::to_string(gpuGPUThreads);
    pos = haws_help_load_client_buffer_field(pos, (char*) gpuJobWorstGPUThreads.c_str(), 
                                             gpuJobWorstGPUThreads.length(), true);

    // cpu job worst phys MB - FIELD 10
    std::string cpuJobWorstPhysMB = std::to_string(maxCPUJobCPURAM);
    pos = haws_help_load_client_buffer_field(pos, (char*) cpuJobWorstPhysMB.c_str(), 
                                             cpuJobWorstPhysMB.length(), true);

    // gpu job worst phys MB - FIELD 11
    std::string gpuJobWorstPhysMB = std::to_string(maxGPUJobCPURAM);
    pos = haws_help_load_client_buffer_field(pos, (char*) gpuJobWorstPhysMB.c_str(),    
                                             gpuJobWorstPhysMB.length(), true);

    // gpu job worst gpu MB - FIELD 12
    std::string gpuJobWorstGPUMB = std::to_string(maxGPUJobGPURAM);
    pos = haws_help_load_client_buffer_field(pos, (char*) gpuJobWorstGPUMB.c_str(), 
                                             gpuJobWorstGPUMB.length(), true);

    // gpu job worst gpu shared MB - FIELD 13
    std::string gpuJobWorstGPUSharedMB = std::to_string(maxGPUJobGPUSharedRAM);
    pos = haws_help_load_client_buffer_field(pos, (char*) gpuJobWorstGPUSharedMB.c_str(), 
                                             gpuJobWorstGPUSharedMB.length(), true);

    // task id - FIELD 14
    char* taskID = (char*) "matmul_3_4_2";
    pos = haws_help_load_client_buffer_field(pos, taskID, strlen(taskID), true);

    //task std input len - FIELD 15
    char* stdinBuf;
    if (hasStdin) {
        stdinBuf = (char*) "[0.5601922408747706 0.5498457394253573 0.24767881927397717 0.27187891952177856; 0.5730447732822026 0.392712621542896 0.7104079489586148 0.27725616994299096; 0.2728092392852186 0.16275014197633997 0.5345847176860559 0.7135436758420011][0.20318818433657682 0.2268235629705242; 0.5767023795601847 0.8770918376577908; 0.26442460894021313 0.9237210225088366; 0.43515479778688104 0.9401231927424645]";
    } else {
        stdinBuf = (char*) "";
    }

    int stdinBufLen = strlen(stdinBuf);
    std::string stdinBufLenStr = std::to_string(stdinBufLen);
    pos = haws_help_load_client_buffer_field(pos, (char*) stdinBufLenStr.c_str(), 
                                             strlen((char*) stdinBufLenStr.c_str()), true);
    // task stdin - FIELD 16
    pos = haws_help_load_client_buffer_field(pos, stdinBuf, stdinBufLen, false);
   
    // end marker - FIELD 17
    pos = haws_help_load_client_buffer_field(pos, (char*) "$", 1, false);

    // end transmission marker
    pos = haws_help_load_client_buffer_field(pos, (char*) "\n", 1, false);
    
    return pos;
}

void haws_test_socket_recv_loop() {
    // responses
    //clientRecvBuff = (char*) malloc(CLIENT_RECV_BUFF_SIZE * sizeof(char));
    testClientRecvSocket = socket_open_recv_socket(8081, false, "TEST/CLIENT/RECVLOOP");
    printf("TEST/CLIENT/RECVLOOP: client recv socket connected!\n");
    int bytes_in = 0;
    int throttle = 0;
    while(!testGlobalKillFlag) {
        // read and dump buffer 
        bytes_in = read(testClientRecvSocket, clientRecvBuff, CLIENT_RECV_BUFF_SIZE);
        if (bytes_in > 0) {
            printf("TEST/CLIENT/RECVLOOP: recv %d bytes:\n", bytes_in);
            printf("TEST/CLIENT/RECVLOOP buf[%d]:", bytes_in);
           
            // to dump recv buffer for debugging enable this 
            /*for (int i = 0; i < bytes_in; i++) {
                printf("%c", clientRecvBuff[i]); 
            }*/

            // do any response processing

            // clear buffer after processing
            memset(clientRecvBuff, 0, sizeof(CLIENT_RECV_BUFF_SIZE)); 
        } else {
            if (throttle++ % 10000 == 0) {
                printf("TEST/CLIENT/RECVLOOP: receving nothing\n");
            }
        }
        usleep(1000); // yield
    }
    socket_close_socket(testClientRecvSocket, "TEST/CLIENT/RECVLOOP");
    //printf("TEST/CLIENT/RECVLOOP: freeing client recv buffer\n");
    //free(clientRecvBuff);
    printf("TEST/CLIENT/RECVLOOP: socket recv thread done\n");
}


