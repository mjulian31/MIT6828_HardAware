#ifndef _HAWS_SOCK_H
#define _HAWS_SOCK_H


// 10MB coming in per request
#define SOCKET_READ_BUF_SIZE ((uint64_t)1024 * (uint64_t)1024 * 100)
// 10MB going out per request 
#define SOCKET_SEND_BUF_SIZE ((uint64_t)1024 * (uint64_t)1024 * 100)

//void haws_socket_req_loop(int port);
void haws_socket_req_loop2(int port);

#endif
