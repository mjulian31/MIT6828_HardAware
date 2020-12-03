#include <unistd.h> 
#include <stdio.h> 
#include <sys/socket.h> 
#include <stdlib.h> 
#include <netinet/in.h> 
#include <string.h> 
#include <cassert>
#include <fcntl.h>

#include "hawsHAWS.h"


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

// 50MB coming in per request
#define SOCKET_READ_BUF_SIZE ((uint64_t)1024 * (uint64_t)1024 * (uint64_t)1024 * (uint64_t)50)

//char socket_read_buf[SOCKET_READ_BUF_SIZE];
void haws_socket_loop(int socket) { // SOCKET THREAD
    printf("SOCKET: hello from loop\n");
    printf("SOCKET: listening...\n");
    int socket_fd = haws_socket_listen(socket); // blocks until connection opened
    char* socket_read_buf = (char*) malloc(sizeof(char) * SOCKET_READ_BUF_SIZE);
    printf("SOCKET: ...accepted\n");
    int throttle = 0;
    while (!sockLoopKillFlag) {
        int bytes_in = read(socket_fd, socket_read_buf, SOCKET_READ_BUF_SIZE);
        assert(bytes_in != SOCKET_READ_BUF_SIZE); // request was too large
        if (bytes_in > 0) {
            printf("SOCKET: read: %d - '%s'\n", bytes_in, socket_read_buf); 
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
