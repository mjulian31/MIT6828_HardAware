#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
#include <cassert>
#include <fcntl.h>
#include "socket.h"

void socket_close_socket(int socket) {
    printf("SOCKET: close socket %d\n", socket);
    int success = close(socket);
    assert(success == 0);
}

bool socket_set_blocking(int fd, bool blocking) { // SOCKET THREAD
   int flags = fcntl(fd, F_GETFL, 0);
   if (flags == -1) return false;
   flags = blocking ? (flags & ~O_NONBLOCK) : (flags | O_NONBLOCK);
   return (fcntl(fd, F_SETFL, flags) == 0) ? true : false;
}

int socket_open_recv_socket(int port) { // SOCKET THREAD uses for req recv, tester resp recv
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
    // set socket nonblocking
    success = socket_set_blocking(new_socket, false);
    assert(success);
    printf("SOCKET: recv accepted (socket %d)\n", new_socket);
    return new_socket;
}

int socket_open_send_socket(int port) {
    int sock = 0; 
    struct sockaddr_in serv_addr; 
    printf("SOCKET: open send socket\n");
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
    { 
        printf("\n Socket creation error \n"); 
        return -1;
    } 
    serv_addr.sin_family = AF_INET; 
    serv_addr.sin_port = htons(port); 
    // Convert IPv4 and IPv6 addresses from text to binary form 
    printf("SOCKET: send inet pton \n");
    if(inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr)<=0)  
    { 
        printf("\nInvalid address/ Address not supported \n"); 
        return -1; 
    } 
    printf("SOCKET: send connect\n");
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) 
    { 
        printf("\nConnection Failed \n"); 
        return -1; 
    }
    printf("SOCKET: send created (socket %d)\n", sock);
    return sock;
}
