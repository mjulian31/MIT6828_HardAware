#include <unistd.h> 
#include <stdio.h> 
#include <sys/socket.h> 
#include <stdlib.h> 
#include <netinet/in.h> 
#include <string.h> 
#include <cassert>
#include <fcntl.h>

#include "hawsHAWS.h"
#include "hawsTest.h"


bool socket_set_blocking(int fd, bool blocking) { // SOCKET THREAD
   int flags = fcntl(fd, F_GETFL, 0);
   if (flags == -1) return false;
   flags = blocking ? (flags & ~O_NONBLOCK) : (flags | O_NONBLOCK);
   return (fcntl(fd, F_SETFL, flags) == 0) ? true : false;
}

int haws_socket_listen(int port) { // SOCKET THREAD
    int server_fd, new_socket, valread; 
    struct sockaddr_in address; 
    int opt = 1; 
    int addrlen = sizeof(address); 
     
       
    // Creating socket file descriptor 
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
    { 
        perror("socket failed"); 
        exit(EXIT_FAILURE); 
    } 
       
    // Forcefully attaching socket to the port 8080 
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, 
                                                  &opt, sizeof(opt))) 
    { 
        perror("setsockopt"); 
        exit(EXIT_FAILURE); 
    } 
    address.sin_family = AF_INET; 
    address.sin_addr.s_addr = INADDR_ANY; 
    address.sin_port = htons( port ); 
       
    // Forcefully attaching socket to the port 8080 
    if (bind(server_fd, (struct sockaddr *)&address,  
                                 sizeof(address))<0) 
    { 
        perror("bind failed"); 
        exit(EXIT_FAILURE); 
    } 
    if (listen(server_fd, 3) < 0) 
    { 
        perror("listen"); 
        exit(EXIT_FAILURE); 
    } 
    if ((new_socket = accept(server_fd, (struct sockaddr *)&address,  
                       (socklen_t*)&addrlen))<0) 
    { 
        perror("accept"); 
        exit(EXIT_FAILURE); 
    } 
    // set socket reusable 
    int optval = 1;
    int success = setsockopt(new_socket,SOL_SOCKET,SO_REUSEADDR,&optval,sizeof(int));
    assert(success == 0);
    success = socket_set_blocking(new_socket, false);
    assert(success);
    printf("SOCKET: accepted\n");
    return new_socket;
}

#define CSV_BUF_PARSE_CPP_STR(buf, cName, cppName) \
    fieldLen = 0; \
    startPos = pos; \
    for (pos = pos; buf[pos] != ','; pos++) { \
        assert(pos < max_buf_size); \
        fieldLen++; \
    } pos++; \
    char* cName = (char*) malloc(sizeof(char) * (fieldLen + 1)); \
    memcpy(cName, (buf + (startPos * sizeof(char))), fieldLen); \
    cName[fieldLen] = '\0'; \
    std::string cppName(cName); \
    assert(cppName.length() > 0);  \
    free(cName); \
    printf("CSVPARSER/CPPSTR: " #cppName ":'%s'\n", cppName.c_str());

//@dedup
#define CSV_BUF_PARSE_INT(buf, strName, strNameCpp, intName) \
    fieldLen = 0; \
    startPos = pos; \
    for (pos = pos; buf[pos] != ','; pos++) { \
        assert(pos < max_buf_size); \
        fieldLen++;  \
    } pos++;\
    char* strName = (char*) malloc(sizeof(char) * (fieldLen + 1)); \
    memcpy(strName, (buf + (startPos * sizeof(char))), fieldLen); \
    strName[fieldLen] = '\0'; \
    printf("CSVPARSER/STRINT: " #strName "[%ld]:%s\n", fieldLen, strName); \
    std::string strNameCpp(strName); \
    int intName = std::stoi(strName); \
    assert(intName > 0); \
    free(strName); \
    printf("CSVPARSER/INT: " #strName ":%d\n", intName);

//@dedup
#define CSV_BUF_PARSE_LONG(buf, strName, strNameCpp, varName) \
    fieldLen = 0; \
    startPos = pos; \
    for (pos = pos; buf[pos] != ','; pos++) { \
        assert(pos < max_buf_size); \
        fieldLen++;  \
    } pos++;\
    char* strName = (char*) malloc(sizeof(char) * (fieldLen + 1)); \
    memcpy(strName, (buf + (startPos * sizeof(char))), fieldLen); \
    strName[fieldLen] = '\0'; \
    printf("CSVPARSER/STRLONG: " #strName "[%ld]:%s\n", fieldLen, strName); \
    std::string strNameCpp(strName); \
    long varName = std::stol(strName); \
    assert(varName >= 0); \
    free(strName); \
    printf("CSVPARSER/LONG: " #strName ":%ld\n", varName);


// 10MB coming in per request
#define SOCKET_READ_BUF_SIZE ((uint64_t)1024 * (uint64_t)1024 * (uint64_t) 1024 * 10)
//#define SOCKET_READ_BUF_SIZE ((uint64_t)1024 * (uint64_t)1024 * (uint64_t)1024)

HAWSClientRequest* haws_socket_create_client_request(char* socket_read_buf, long max_buf_size) {
    long pos = 0;
    long fieldLen = 0;
    long startPos = 0;

    // FIELD 1 - request begin marker
    pos = 0;
    assert(socket_read_buf[pos] == '^'); 
    pos++; // drop char
    pos++; // drop delimiter

    // FIELD 2 - request number
    CSV_BUF_PARSE_INT(socket_read_buf, reqNumStr, reqNumStrCpp, reqNum);
    // FIELD 3 - cpu-job path
    CSV_BUF_PARSE_CPP_STR(socket_read_buf, cpuBinPath, cpuBinPathCpp);
    // FIELD 4 - gpu-job path
    CSV_BUF_PARSE_CPP_STR(socket_read_buf, gpuBinPath, gpuBinPathCpp);
    // FIELD 5 - command line args
    CSV_BUF_PARSE_CPP_STR(socket_read_buf, cmdLineArgs, cmdLineArgsCpp);
    // FIELD 6 - target hint 
    CSV_BUF_PARSE_CPP_STR(socket_read_buf, targHint, targHintCpp);
    // FIELD 7 - cpu job cpu threads
    CSV_BUF_PARSE_INT(socket_read_buf, cpuThreadsCPUStr, cpuThreadsCPUStrCpp, cpuThreadsCPU);
    // FIELD 8 - gpu job cpu threads
    CSV_BUF_PARSE_INT(socket_read_buf, gpuThreadsCPUStr, gpuThreadsCPUStrCpp, gpuThreadsCPU);
    // FIELD 9 - gpu job gpu threads
    CSV_BUF_PARSE_INT(socket_read_buf, gpuThreadsGPUStr, gpuThreadsGPUStrCpp, gpuThreadsGPU);
    // FIELD 10 - cpu job physmem MB
    CSV_BUF_PARSE_INT(socket_read_buf, cpuPhysmemMBStr, cpuPhysmemMBStrCpp, cpuPhysmemMB);
    // FIELD 11 - gpu job physmem MB
    CSV_BUF_PARSE_INT(socket_read_buf, gpuPhysmemMBStr, gpuPhysmemMBStrCpp, gpuPhysmemMB);
    // FIELD 12 - gpu job gpu mem MB
    CSV_BUF_PARSE_INT(socket_read_buf, gpuMemMBStr, gpuMemMBStrCpp, gpuMemMB);
    // FIELD 13 - gpu job gpu shared mem MB
    CSV_BUF_PARSE_INT(socket_read_buf, gpuSharedMemMBStr, gpuSharedMemMBStrCpp, gpuSharedMemMB);
    // FIELD 14 - task ID
    CSV_BUF_PARSE_CPP_STR(socket_read_buf, taskID, taskIDCpp);
    // FIELD 15 - task stdin len
    CSV_BUF_PARSE_LONG(socket_read_buf, taskStdInLenStr, tasksStdinLenStrCpp, taskStdinLen);
    // FIELD 16 - task stdin
    fieldLen = 0;
    startPos = pos;
    for (pos = pos; socket_read_buf[pos] != '$'; pos++) {
        assert(pos < max_buf_size); // end delim wasn't found - did half a request come in?
        fieldLen++; 
    } pos++; // drop delimiter - FIELD 17
    assert(pos < max_buf_size);
    assert(fieldLen == taskStdinLen); // double check their length calculation
    char* freeable_stdin = (char*) malloc(taskStdinLen * sizeof(char));
    memcpy(freeable_stdin, (socket_read_buf + (startPos * sizeof(char))), taskStdinLen);
    printf("CSVPARSER/STDIN: got %ld chars of stdin\n", taskStdinLen);

    HAWSClientRequest* req = new HAWSClientRequest(reqNum,           // FIELD 2
                                                   cpuBinPathCpp,    // FIELD 3
                                                   gpuBinPathCpp,    // FIELD 4
                                                   cmdLineArgsCpp,   // FIELD 5
                                                   targHintCpp,      // FIELD 6
                                                   cpuThreadsCPU,    // FIELD 7
                                                   gpuThreadsCPU,    // FIELD 8
                                                   gpuThreadsGPU,    // FIELD 9
                                                   cpuPhysmemMB,     // FIELD 10
                                                   gpuPhysmemMB,     // FIELD 11
                                                   gpuMemMB,         // FIELD 12
                                                   gpuSharedMemMB,   // FIELD 13
                                                   taskIDCpp,        // FIELD 14
                                                   taskStdinLen,     // FIELD 15
                                                   freeable_stdin);  // FIELD 16
    req->Print();
    return req;
}

void haws_socket_loop(int socket) { // SOCKET THREAD
    printf("SOCKET: hello from loop\n");
    printf("SOCKET: listening...\n");
    int socket_fd = haws_socket_listen(socket); // blocks until connection opened
    char* socket_read_buf = (char*) malloc(sizeof(char) * SOCKET_READ_BUF_SIZE);
    char* splitBuf = (char*) malloc(sizeof(char) * SOCKET_READ_BUF_SIZE);
    printf("SOCKET: ...accepted\n");
    int throttle = 0;
    HAWSClientRequest* req;
    bool splitReqPending = false;
    int splitBufPos = 0;
    while (!sockLoopKillFlag) {
        memset(socket_read_buf, 0, SOCKET_READ_BUF_SIZE); // start with zero buffer for debugging
        int bytes_in = read(socket_fd, socket_read_buf, SOCKET_READ_BUF_SIZE);
        assert(bytes_in != SOCKET_READ_BUF_SIZE); // request was too large - use workBuf for partial
        if (bytes_in > 0) {
            int pos = 0;
            printf("SOCKET: read: %d - '%s'\n", bytes_in, socket_read_buf); 
            if (splitReqPending) {            
                bool handledSplit = false;
                assert(splitBufPos > 0);
                for (int lingerBytes = 0; lingerBytes < bytes_in; lingerBytes++) {
                    if (socket_read_buf[lingerBytes] == '$') {
                        pos = lingerBytes;
                        memcpy(splitBuf + splitBufPos, socket_read_buf, pos);
                        splitBuf[splitBufPos + lingerBytes] = '$'; // reterminate finished request
                        handledSplit = true;
                        printf("SPLITBUFFER FIXED UP:%s\n", splitBuf);
                        //assert(false);
                        break;
                    }
                }
                // the end of split request still not found in new recv
                assert(handledSplit); // increase buffer sizes at this point?
                req = haws_socket_create_client_request(splitBuf, SOCKET_READ_BUF_SIZE); 
                haws.HardAwareSchedule(req);
                splitReqPending = false;
                pos++; // move on to where next '^' should be
                if (pos == bytes_in) { // if the $ was the last char in buffer
                    continue; // we are done 
                }
                // otherwise pos should be at the first next '^'
             }
             for (pos = pos; pos < bytes_in; pos++) { // should be pointing at next request
                if (socket_read_buf[pos] != '^') {
                    printf("socket_read_buf[pos]=%c\n", socket_read_buf[pos]);
                    assert(false); // didn't find next request
                }
                bool fullReqFound = false;
                int validate = pos;
                for (validate = pos; validate < bytes_in; validate++) {
                    if (socket_read_buf[validate] == '$') {
                        fullReqFound = true;
                        break;
                    } 
                }
                if (fullReqFound) {
                    req = haws_socket_create_client_request(socket_read_buf + pos, 
                                                            SOCKET_READ_BUF_SIZE);
                    haws.HardAwareSchedule(req);
                    pos = validate;
                } else {
                    // copy remaining part of request to other buffer
                    int bytesRemaining = bytes_in - pos;
                    memset(splitBuf, 0, SOCKET_READ_BUF_SIZE); // reset splitbuffer 
                    memcpy(splitBuf, socket_read_buf + pos, bytesRemaining);
                    splitBufPos = bytesRemaining;
                    printf("SPLITBUF NOW free at->[%d]:%s\n", splitBufPos, splitBuf);
                    splitReqPending = true;
                    break; // splitbuf now has half contents, done processing buffer
                }
            } 
        } else {
            if (throttle++ % 1000 == 0) {
                printf("SOCKET: reading nothing\n");
            }
        }
        usleep(1000);
    }
    shutdown(socket_fd, 2);
    close(socket_fd);
    free(socket_read_buf);
}
