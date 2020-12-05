#include <stdio.h> 
#include <stdlib.h>
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <unistd.h> 
#include <string.h> 
#include <cassert>

#include "hawsHAWS.h"
#include "hawsTest.h"
#include "socket.h"

extern HAWS haws;
extern int numTests;


#define CLIENT_SEND_BUFF_SIZE ((uint64_t) 1024 * (uint64_t) 1024 * (uint64_t) 1024 * (uint64_t) 10)
#define CLIENT_RECV_BUFF_SIZE CLIENT_SEND_BUFF_SIZE

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

int haws_test_socket_bringup();
int haws_test_socket_many_cpu();
void haws_test_socket_recv_loop();

void haws_test_socket_all() {
    // bringup client recv thread
    testSockRecvLoop = new std::thread(haws_test_socket_recv_loop);
    haws.StartSocket(); // bringup server networking

    testClientSendSocket = socket_open_send_socket(8080, "TEST/CLIENT");
    assert(testClientSendSocket > 0);
    
    RUN_TEST(haws_test_socket_bringup);
    //RUN_TEST(haws_test_socket_many_cpu);

    socket_close_socket(testClientSendSocket, "TEST/CLIENT");
    haws.StopSocket();
    testGlobalKillFlag = true; // stop client recv thread
    testSockRecvLoop->join();
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

int haws_help_load_client_buffer_sample_req(int reqNum) {
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
    char* cmdArgs = (char*) "3 4 2 norand";
    pos = haws_help_load_client_buffer_field(pos, cmdArgs, strlen(cmdArgs), true);

    // target rec - FIELD 6
    char* targetrec = (char*) "cpu-only";
    pos = haws_help_load_client_buffer_field(pos, targetrec, strlen(targetrec), true);

    // cpu job worst threads - FIELD 7
    char* cpuJobWorstThreads = (char*) "1";
    pos = haws_help_load_client_buffer_field(pos, cpuJobWorstThreads, 
                                             strlen(cpuJobWorstThreads), true);

    // gpu job worst CPU threads - FIELD 8
    char* gpuJobWorstCPUThreads = (char*) "2";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstCPUThreads, 
                                             strlen(gpuJobWorstCPUThreads), true);

    // gpu job worst GPU threads - FIELD 9
    char* gpuJobWorstGPUThreads = (char*) "4";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstGPUThreads, 
                                             strlen(gpuJobWorstGPUThreads), true);

    // cpu job worst phys MB - FIELD 10
    char* cpuJobWorstPhysMB = (char*) "35";
    pos = haws_help_load_client_buffer_field(pos, cpuJobWorstPhysMB, 
                                             strlen(cpuJobWorstPhysMB), true);

    // gpu job worst phys MB - FIELD 11
    char* gpuJobWorstPhysMB = (char*) "5";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstPhysMB,    
                                             strlen(gpuJobWorstPhysMB), true);

    // gpu job worst gpu MB - FIELD 12
    char* gpuJobWorstGpuMB = (char*) "100";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstGpuMB, 
                                             strlen(gpuJobWorstGpuMB), true);

    // gpu job worst gpu shared MB - FIELD 13
    char* gpuJobWorstGpuSharedMB = (char*) "200";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstGpuSharedMB, 
                                             strlen(gpuJobWorstGpuSharedMB), true);

    // task id - FIELD 14
    char* taskID = (char*) "matmul_3_4_2";
    pos = haws_help_load_client_buffer_field(pos, taskID, strlen(taskID), true);

    //task std input len - FIELD 15
    char* stdinBuf = (char*) "[0.5601922408747706 0.5498457394253573 0.24767881927397717 0.27187891952177856; 0.5730447732822026 0.392712621542896 0.7104079489586148 0.27725616994299096; 0.2728092392852186 0.16275014197633997 0.5345847176860559 0.7135436758420011][0.20318818433657682 0.2268235629705242; 0.5767023795601847 0.8770918376577908; 0.26442460894021313 0.9237210225088366; 0.43515479778688104 0.9401231927424645]";
    int stdinBufLen = strlen(stdinBuf);
    std::string stdinBufLenStr = std::to_string(stdinBufLen);
    pos = haws_help_load_client_buffer_field(pos, (char*) stdinBufLenStr.c_str(), 
                                             strlen((char*) stdinBufLenStr.c_str()), true);
    // task stdin - FIELD 16
    pos = haws_help_load_client_buffer_field(pos, stdinBuf, stdinBufLen, false);
   
    // end marker - FIELD 17
    pos = haws_help_load_client_buffer_field(pos, (char*) "$", 1, false);

    //TEMPORARY
    //pos = haws_help_load_client_buffer_field(pos, (char*) "\0", 1, false);
    
    return pos;
}

void haws_test_socket_recv_loop() {
    // responses
    clientRecvBuff = (char*) malloc(CLIENT_RECV_BUFF_SIZE * sizeof(char));
    testClientRecvSocket = socket_open_recv_socket(8081, true, "TEST/CLIENT/RECV");
    printf("TEST/CLIENT/RECV: client recv socket connected!\n");
    while(!testGlobalKillFlag) {
        // read and dump buffer 
        memset(clientRecvBuff, 0, sizeof(CLIENT_RECV_BUFF_SIZE));
        int bytes_in = read(testClientRecvSocket, clientRecvBuff, CLIENT_RECV_BUFF_SIZE);
        if (bytes_in > 0) {
            printf("TEST/CLIENT/RECV: recv %d bytes:%s\n", bytes_in, clientRecvBuff);
        }
        usleep(10); // yield
    }
    socket_close_socket(testClientRecvSocket, "TEST/CLIENT/RECV");
    free(clientRecvBuff);
    printf("TEST/CLIENT/RECV: socket recv thread done\n");
}

int haws_test_socket_bringup() {
    haws.Start();
    clientSendBuff = (char*) malloc(CLIENT_SEND_BUFF_SIZE * sizeof(char));
    
    int length = haws_help_load_client_buffer_sample_req(1);
    printf("TEST:\n\nsample req bytes[%d]:\n\n%s\n\n", length, clientSendBuff);
    printf("TEST: send it\n");
    send(testClientSendSocket, clientSendBuff, length, 0); 
    sleep(10);
    printf("TEST: sample request sent!\n"); 

    while (haws.IsDoingWork()) { usleep(1000); };
    haws.Stop();
    
    free(clientSendBuff);
    return 0;
}

int haws_test_socket_many_cpu() {
    haws.Start();
    clientRecvBuff = (char*) malloc(CLIENT_RECV_BUFF_SIZE * sizeof(char));
    clientSendBuff = (char*) malloc(CLIENT_SEND_BUFF_SIZE * sizeof(char));

    for (int i = 1; i <= 1000; i++) { 
        int length = haws_help_load_client_buffer_sample_req(i);
        //printf("TEST:\n\nsample req#%d bytes[%d]:\n\n%s\n\n", i, length, clientSendBuff);
        //printf("TEST: send it\n");
        send(testClientSendSocket, clientSendBuff, length, 0); 
    }
    printf("TEST: sample requests sent!\n"); 

    sleep(120); // give them a chance to be all be received and started

    while (haws.IsDoingWork()) { usleep(1000); };
    haws.Stop();

    free(clientSendBuff);
    free(clientRecvBuff);
    return 0;
}

