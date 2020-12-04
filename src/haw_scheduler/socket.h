#ifndef _SOCKET_H
#define _SOCKET_H

#include <unistd.h> 
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <netinet/in.h>

int socket_open_send_socket(int port);
int socket_open_recv_socket(int port);

#endif
