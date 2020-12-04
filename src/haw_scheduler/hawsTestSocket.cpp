#include <stdio.h> 
#include <stdlib.h>
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <unistd.h> 
#include <string.h> 
#include <cassert>

#include "hawsHAWS.h"

extern HAWS haws;
extern int testClientSendSocket;

#define CLIENT_SEND_BUFF_SIZE ((uint64_t) 1024 * (uint64_t) 1024 * (uint64_t) 1024 * (uint64_t) 10)
#define CLIENT_RECV_BUFF_SIZE CLIENT_SEND_BUFF_SIZE

char* clientSendBuff;
char* clientRecvBuff;

int haws_help_open_send_socket(int port) {
    int sock = 0; 
    struct sockaddr_in serv_addr; 
    printf("TEST: send open client socket\n");
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
    { 
        printf("\n Socket creation error \n"); 
        return -1;
    } 
    serv_addr.sin_family = AF_INET; 
    serv_addr.sin_port = htons(port); 
    // Convert IPv4 and IPv6 addresses from text to binary form 
    printf("TEST: send inet pton \n");
    if(inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr)<=0)  
    { 
        printf("\nInvalid address/ Address not supported \n"); 
        return -1; 
    } 
    printf("TEST: connect\n");
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) 
    { 
        printf("\nConnection Failed \n"); 
        return -1; 
    }
    return sock;
}

int haws_help_open_recv_socket(int port) {
    int sock = 0; 
    struct sockaddr_in serv_addr; 
    printf("TEST: recv open client socket\n");
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
    { 
        printf("\n Socket creation error \n"); 
        return -1;
    } 
    serv_addr.sin_family = AF_INET; 
    serv_addr.sin_port = htons(port); 
    // Convert IPv4 and IPv6 addresses from text to binary form 
    printf("TEST: recv inet pton \n");
    if(inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr)<=0)  
    { 
        printf("\nInvalid address/ Address not supported \n"); 
        return -1; 
    } 
    printf("TEST: recv connect\n");
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) 
    { 
        printf("\nConnection Failed \n"); 
        return -1; 
    }
    return sock;
}

void haws_help_close_socket(int socket) {
    printf("TEST: close client socket\n");
    int success = close(socket);
    assert(success == 0);
}

long haws_help_load_client_buffer_field(int pos, char* content, int len, bool addDelim) {
    if (pos > 0) {
        if (addDelim) {
            assert(pos + 1 < CLIENT_SEND_BUFF_SIZE); // make sure will still be in buffer
            clientSendBuff[pos] = ',';
            pos++;
        }
    }
    assert(pos + len < CLIENT_SEND_BUFF_SIZE); // make sure still be in buffer
    memcpy(clientSendBuff + (pos * sizeof(char)), content, len);
    pos += len;
    return pos;
}

int haws_help_load_client_buffer_sample_req() {
    long pos = 0;
    long max_pos = CLIENT_SEND_BUFF_SIZE;

    // begin marker - FIELD 1
    pos = haws_help_load_client_buffer_field(0, (char*) "^", 1, true);

    // request number - FIELD 2
    pos = haws_help_load_client_buffer_field(pos, (char*) "1", 1, true);

    // cpu bin path - FIELD 3
    char* cpubinpath = (char*) "/opt/haws/bin/matmul_cpu";
    pos = haws_help_load_client_buffer_field(pos, cpubinpath, strlen(cpubinpath), true);
    
    // gpu bin bath - FIELD 4
    char* gpubinpath = (char*) "/opt/haws/bin/matmul_gpu";
    pos = haws_help_load_client_buffer_field(pos, gpubinpath, strlen(gpubinpath), true);

    // target rec - FIELD 5
    char* targetrec = (char*) "cpu-plz";
    pos = haws_help_load_client_buffer_field(pos, targetrec, strlen(targetrec), true);

    // cpu job worst threads - FIELD 6
    char* cpuJobWorstThreads = (char*) "1";
    pos = haws_help_load_client_buffer_field(pos, cpuJobWorstThreads, 
                                             strlen(cpuJobWorstThreads), true);

    // gpu job worst CPU threads - FIELD 7
    char* gpuJobWorstCPUThreads = (char*) "2";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstCPUThreads, 
                                             strlen(gpuJobWorstCPUThreads), true);

    // gpu job worst GPU threads - FIELD 8
    char* gpuJobWorstGPUThreads = (char*) "4";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstGPUThreads, 
                                             strlen(gpuJobWorstGPUThreads), true);

    // cpu job worst phys MB - FIELD 9
    char* cpuJobWorstPhysMB = (char*) "35";
    pos = haws_help_load_client_buffer_field(pos, cpuJobWorstPhysMB, 
                                             strlen(cpuJobWorstPhysMB), true);

    // gpu job worst phys MB - FIELD 10
    char* gpuJobWorstPhysMB = (char*) "5";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstPhysMB,    
                                             strlen(gpuJobWorstPhysMB), true);

    // gpu job worst gpu MB - FIELD 11
    char* gpuJobWorstGpuMB = (char*) "100";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstGpuMB, 
                                             strlen(gpuJobWorstGpuMB), true);

    // gpu job worst gpu shared MB - FIELD 12
    char* gpuJobWorstGpuSharedMB = (char*) "200";
    pos = haws_help_load_client_buffer_field(pos, gpuJobWorstGpuSharedMB, 
                                             strlen(gpuJobWorstGpuSharedMB), true);

    // task id - FIELD 13
    char* taskID = (char*) "matmul_3_4_2";
    pos = haws_help_load_client_buffer_field(pos, taskID, strlen(taskID), true);

    //task std input len - FIELD 14
    char* stdinBuf = (char*) "[0.5601922408747706 0.5498457394253573 0.24767881927397717 0.27187891952177856; 0.5730447732822026 0.392712621542896 0.7104079489586148 0.27725616994299096; 0.2728092392852186 0.16275014197633997 0.5345847176860559 0.7135436758420011][0.20318818433657682 0.2268235629705242; 0.5767023795601847 0.8770918376577908; 0.26442460894021313 0.9237210225088366; 0.43515479778688104 0.9401231927424645]";
    int stdinBufLen = strlen(stdinBuf);
    std::string stdinBufLenStr = std::to_string(stdinBufLen);
    pos = haws_help_load_client_buffer_field(pos, (char*) stdinBufLenStr.c_str(), 
                                             strlen((char*) stdinBufLenStr.c_str()), true);
    // task stdin - FIELD 15
    pos = haws_help_load_client_buffer_field(pos, stdinBuf, stdinBufLen, true);
   
    // end marker - FIELD 16 
    pos = haws_help_load_client_buffer_field(pos, (char*) "$", 1, false);

    //TEMPORARY
    pos = haws_help_load_client_buffer_field(pos, (char*) "\0", 1, false);
    
    return pos;
}

int haws_test_socket_bringup() {
    haws.Start();

    char* hello = (char*) "Hello from client"; 
    clientSendBuff = (char*) malloc(CLIENT_SEND_BUFF_SIZE * sizeof(char));
    clientRecvBuff = (char*) malloc(CLIENT_RECV_BUFF_SIZE * sizeof(char));
    
    printf("TEST: go\n");    
    printf("TEST: send\n");
    int length = haws_help_load_client_buffer_sample_req();
    printf("TEST:\n\nsample req size %d:\n\n%s\n\n", length, clientSendBuff);
    send(testClientSendSocket, clientSendBuff, length - 1, 0 ); 
    sleep(1);
    printf("TEST: sample request sent!\n"); 

    printf("TEST: PLZ STOP\n");

    free(clientSendBuff);
    free(clientRecvBuff);
    haws.Stop();
    printf("TEST: STOPPED\n");
    return 0;
}
