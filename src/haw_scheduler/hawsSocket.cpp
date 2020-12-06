

#include "socket.h"
#include "hawsSocket.h"
#include "hawsClientRequest.h"
#include "hawsUtil.h"
#include "hawsHAWS.h"
#include "hawsTest.h"

HAWSClientRequest* haws_socket_create_client_request(char* socket_read_buf, long max_buf_size) {
    long pos = 0;
    long fieldLen = 0;
    long startPos = 0;

    // FIELD 1 - request begin marker
    pos = 0;
    assert(socket_read_buf[pos] == '^'); 
    pos++; // drop char

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
    CSV_BUF_PARSE_INT(socket_read_buf, cpuPhysmemMBStr, cpuPhysmemMBStrCpp, cpuPhysmemBytes);
    // FIELD 11 - gpu job physmem MB
    CSV_BUF_PARSE_INT(socket_read_buf, gpuPhysmemMBStr, gpuPhysmemMBStrCpp, gpuPhysmemBytes);
    // FIELD 12 - gpu job gpu mem MB
    CSV_BUF_PARSE_INT(socket_read_buf, gpuMemMBStr, gpuMemMBStrCpp, gpuMemBytes);
    // FIELD 13 - gpu job gpu shared mem MB
    CSV_BUF_PARSE_INT(socket_read_buf, gpuSharedMemMBStr, gpuSharedMemMBStrCpp, gpuSharedMemBytes);
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
    printf("HAWS/RECVLOOP/CSV/STDIN: got %ld chars of stdin\n", taskStdinLen);

    HAWSClientRequest* req = new HAWSClientRequest(reqNum,           // FIELD 2
                                                   cpuBinPathCpp,    // FIELD 3
                                                   gpuBinPathCpp,    // FIELD 4
                                                   cmdLineArgsCpp,   // FIELD 5
                                                   targHintCpp,      // FIELD 6
                                                   cpuThreadsCPU,    // FIELD 7
                                                   gpuThreadsCPU,    // FIELD 8
                                                   gpuThreadsGPU,    // FIELD 9
                                   cpuPhysmemBytes / (1024 * 1024),  // FIELD 10
                                   gpuPhysmemBytes / (1024 * 1024),  // FIELD 11
                                       gpuMemBytes / (1024 * 1024),  // FIELD 12
                                 gpuSharedMemBytes / (1024 * 1024),  // FIELD 13
                                                   taskIDCpp,        // FIELD 14
                                                   taskStdinLen,     // FIELD 15
                                                   freeable_stdin);  // FIELD 16
    req->Print();
    return req;
}

void haws_socket_req_loop(int socket) { // SOCKET THREAD
    printf("HAWS/RECVLOOP: hello from request loop thread\n");

    // blocks here until connection opened from a client
    // non blocking reads so thread can monitor kill flag and not get stuck on read()
    printf("HAWS/RECVLOOP: listening...\n");
    int socket_fd = socket_open_recv_socket(socket, false, "HAWS/RECVLOOP"); 
    printf("HAWS/RECVLOOP: ...client connected!\n");

    long readBufSize = SOCKET_READ_BUF_SIZE;
    // @mem socket_read_buf probably can be ~65K 
    // because read seems to always read up to that each call
    char* socket_read_buf = (char*) malloc(readBufSize);
    printf("HAWS/RECVLOOP: alloc read buf of %ld bytes\n", readBufSize);
    char* reqBuf = (char*) malloc(readBufSize);
    printf("HAWS/RECVLOOP: alloc reqBuf of %ld bytes\n", readBufSize);
    int throttle = 0;
    HAWSClientRequest* req;
    int bytes_in = 0; 
    int reqBufPos = 0;

    while (!sockLoopKillFlag) {
        memset(socket_read_buf, 0, SOCKET_READ_BUF_SIZE); // start with zero buffer for debugging
        bytes_in = read(socket_fd, socket_read_buf, SOCKET_READ_BUF_SIZE);
        assert(bytes_in != SOCKET_READ_BUF_SIZE); // request was too large - use workBuf for partial
        if (bytes_in > 0) {
            // on recv bytes from sender, connect to client if haven't already
            if (!haws.IsRespLoopRunning()) { 
                 haws.StartRespLoop();
            }

            // move incoming data to recv buffer
            printf("HAWS/RECVLOOP: read: %d \n", bytes_in); 
            memcpy(reqBuf + (reqBufPos * sizeof(char)), socket_read_buf, bytes_in);
            reqBufPos += bytes_in;
         
            // @perf  
            // this currently scans the entire reqBuf as new chunks come in looking for term char
            // i think we can do "i = reqBufPos - bytes_in" to skip scanning prev scanned bytes 
            for (int i = 0; i < reqBufPos; i++) {
                if (reqBuf[i] == '$') {
                    printf("HAWS/RECVLOOP: found end of request, processing\n"); 
                    req = haws_socket_create_client_request(reqBuf, SOCKET_READ_BUF_SIZE);
                    haws.HardAwareSchedule(req);
                    assert(reqBufPos < SOCKET_READ_BUF_SIZE);
                    memset(reqBuf, 0, reqBufPos + 1);
                    reqBufPos = 0;
                    break;
                }
            }   
        } else {
            if (throttle++ % 1000 == 0) {
                printf("HAWS/RECVLOOP: reading nothing\n");
            }
        }
        usleep(1000); // yield
    }
    printf("HAWS/RECVLOOP: got kill flag\n");
    printf("HAWS/RECVLOOP: close socket\n");
    close(socket_fd);
    printf("HAWS/RECVLOOP: free read buf\n");
    free(socket_read_buf);
    printf("HAWS/RECVLOOP: free req buf\n");
    free(reqBuf);
    printf("HAWS/RECVLOOP: freed buffers\n");
}
