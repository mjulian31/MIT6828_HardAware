

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
    //pos++; // drop delimiter // TODO REMOVE THIS IN NEW VERSION

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
    printf("CSVPARSER/STDIN: got %ld chars of stdin\n", taskStdinLen);

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

void haws_socket_send_resp(int socket, int reqNum, std::string targRan, 
                           float wallTime, float cpuTime, 
                           int exitCode, long outputLen, char* output) {

}

void haws_socket_req_loop2(int socket) { // SOCKET THREAD
    printf("HAWS/RECVLOOP: hello from request loop thread\n");
    printf("HAWS/RECVLOOP: listening...\n");
    // blocks here until connection opened
    int socket_fd = socket_open_recv_socket(socket, false, "HAWS/RECVLOOP"); // non blocking reads
    printf("HAWS/RECVLOOP: ...client connected!\n");

    long readBufSize = SOCKET_READ_BUF_SIZE;
    char* socket_read_buf = (char*) malloc(readBufSize);
    printf("HAWS/RECVLOOP: alloc read buf of %ld bytes\n", readBufSize);
    char* reqBuf = (char*) malloc(readBufSize);
    printf("HAWS/RECVLOOP: alloc reqBuf of %ld bytes\n", readBufSize);
    int throttle = 0;
    HAWSClientRequest* req;
    int bytes_in = 0; 

    int splitBufPos = 0;
    bool splitReqPending = false;
    bool handledSplit = false;
    int pos = 0;
    int validate = 0;
    bool fullReqFound = false;
    int bytesRemaining = 0;
    int recvLen = 0; 
    int reqBufPos = 0;
    while (!sockLoopKillFlag) {
        memset(socket_read_buf, 0, SOCKET_READ_BUF_SIZE); // start with zero buffer for debugging
        bytes_in = read(socket_fd, socket_read_buf, SOCKET_READ_BUF_SIZE);
        assert(bytes_in != SOCKET_READ_BUF_SIZE); // request was too large - use workBuf for partial
        if (bytes_in > 0) {
            if (!haws.IsRespLoopRunning()) { // connect to client if haven't already
                 haws.StartRespLoop();
            }
            pos = 0;
            printf("HAWS/RECVLOOP: read: %d \n", bytes_in); 
            // move incoming data to recv buffer
            memcpy(reqBuf + (reqBufPos * sizeof(char)), socket_read_buf, bytes_in);
            reqBufPos += bytes_in;
         
            // @perf  
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
        usleep(1000);
    }
    printf("HAWS/RECVLOOP: got kill flag\n");
    //shutdown(socket_fd, 2);
    printf("HAWS/RECVLOOP: close socket\n");
    close(socket_fd);
    printf("HAWS/RECVLOOP: free read buf\n");
    free(socket_read_buf);
    printf("HAWS/RECVLOOP: free req buf\n");
    free(reqBuf);
    printf("HAWS/RECVLOOP: freed buffers\n");
}

/* old version only handling 1 split 
void haws_socket_req_loop(int socket) { // SOCKET THREAD
    printf("HAWS/RECVLOOP: hello from request loop thread\n");
    printf("HAWS/RECVLOOP: listening...\n");
    // blocks here until connection opened
    int socket_fd = socket_open_recv_socket(socket, false, "HAWS/RECVLOOP"); // non blocking reads
    printf("HAWS/RECVLOOP: ...client connected!\n");

    long readBufSize = SOCKET_READ_BUF_SIZE;
    char* socket_read_buf = (char*) malloc(readBufSize);
    printf("HAWS/RECVLOOP: alloc read buf of %ld bytes\n", readBufSize);
    char* splitBuf = (char*) malloc(readBufSize);
    printf("HAWS/RECVLOOP: alloc read split buf of %ld bytes\n", readBufSize);
    int throttle = 0;
    HAWSClientRequest* req;
    int bytes_in = 0; 

    int splitBufPos = 0;
    bool splitReqPending = false;
    bool handledSplit = false;
    int pos = 0;
    int validate = 0;
    bool fullReqFound = 0;
    int bytesRemaining = 0;
    
    while (!sockLoopKillFlag) {
        memset(socket_read_buf, 0, SOCKET_READ_BUF_SIZE); // start with zero buffer for debugging
        bytes_in = read(socket_fd, socket_read_buf, SOCKET_READ_BUF_SIZE);
        assert(bytes_in != SOCKET_READ_BUF_SIZE); // request was too large - use workBuf for partial
        if (bytes_in > 0) {
            if (!haws.IsRespLoopRunning()) { // connect to client if haven't already
                 haws.StartRespLoop();
            }
            pos = 0;
            printf("HAWS/RECVLOOP: read: %d - '%s'\n", bytes_in, socket_read_buf); 
            if (splitReqPending) {            
                handledSplit = false;
                assert(splitBufPos > 0);
                for (int lingerBytes = 0; lingerBytes < bytes_in; lingerBytes++) {
                    if (socket_read_buf[lingerBytes] == '$') {
                        pos = lingerBytes;
                        memcpy(splitBuf + splitBufPos, socket_read_buf, pos);
                        splitBuf[splitBufPos + lingerBytes] = '$'; // reterminate finished request
                        handledSplit = true;
                        printf("HAWS/RECVLOOP: SPLITBUFFER FIXED UP:%s\n", splitBuf);
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
                fullReqFound = false;
                validate = pos;
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
                    bytesRemaining = bytes_in - pos;
                    memset(splitBuf, 0, SOCKET_READ_BUF_SIZE); // reset splitbuffer 
                    memcpy(splitBuf, socket_read_buf + pos, bytesRemaining);
                    splitBufPos = bytesRemaining;
                    printf("HAWS/RECVLOOP: SPLITBUF NOW free at->[%d]:%s\n", splitBufPos, splitBuf);
                    splitReqPending = true;
                    break; // splitbuf now has half contents, done processing buffer
                }
            } 
        } else {
            if (throttle++ % 1000 == 0) {
                printf("HAWS/RECVLOOP: reading nothing\n");
            }
        }
        usleep(1000);
    }
    printf("HAWS/RECVLOOP: got kill flag\n");
    //shutdown(socket_fd, 2);
    printf("HAWS/RECVLOOP: close socket\n");
    close(socket_fd);
    printf("HAWS/RECVLOOP: free read buf\n");
    free(socket_read_buf);
    printf("HAWS/RECVLOOP: free split buf\n");
    free(splitBuf);
    printf("HAWS/RECVLOOP: freed buffers\n");
}
*/
