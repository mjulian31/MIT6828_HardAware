#ifndef _HAWS_SOCK_H
#define _HAWS_SOCK_H


// 200MB coming in as a request
#define SOCKET_READ_BUF_SIZE ((uint64_t)1024 * (uint64_t)1024 * 200)
// 200MB going out as response
#define SOCKET_SEND_BUF_SIZE ((uint64_t)1024 * (uint64_t)1024 * 200)

//void haws_socket_req_loop(int port);
void haws_socket_req_loop_newline(int port);

#endif
