#include <unistd.h> 
#include <stdio.h> 
#include <sys/socket.h> 
#include <stdlib.h> 
#include <netinet/in.h> 
#include <string.h> 
 
int haws_socket_listen(int port) {
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
    address.sin_port = htons( PORT ); 
       
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
    return new_socket
}

#define SOCKET_READ_BUF_SIZE (1024 * 1024 * 1024 * 50)
int haws_socket_loop(int socket) { // SOCKET THREAD
    char* socket_read_buf = (char*) malloc(SOCKET_READ_BUF_SIZE);
    int socket_fd = haws_socket_listen(socket); // waits until connection opened
    while true () {
        int bytes_in = socket_read(socket_fd, socket_read_buf);
        printf("read: %d - '%s'\n", valread, socket_read_buf); 
    }
    free(socket_read_buf);
}

int socket_read(int socket, char* buffer) { // SOCKET THREAD
    char *hello = "Hello from server";
    valread = read(socket, buffer, SOCKET_READ_BUF_SIZE);
    //send(new_socket , hello , strlen(hello) , 0 ); 
    //printf("Hello message sent\n"); 
    return valread; 
}
