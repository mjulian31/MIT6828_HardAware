#include <stdio.h> 
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <unistd.h> 
#include <string.h> 
#include <cassert>

#include "hawsHAWS.h"

extern HAWS haws;
extern int testClientSocket;

int haws_help_open_socket(int port) {
    int sock = 0; 
    struct sockaddr_in serv_addr; 
    printf("TEST: open client socket\n");
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
    { 
        printf("\n Socket creation error \n"); 
        return -1;
    } 
   
    serv_addr.sin_family = AF_INET; 
    serv_addr.sin_port = htons(port); 
       
    // Convert IPv4 and IPv6 addresses from text to binary form 
    printf("TEST: inet pton \n");
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

void haws_help_close_socket(int socket) {
    printf("TEST: close client socket\n");
    int success = close(socket);
    assert(success == 0);
}

int haws_test_socket_bringup() {
    haws.Start();

    char *hello = (char*) "Hello from client"; 
    printf("TEST: go\n");    
    printf("TEST: send\n");
    send(testClientSocket, hello , strlen(hello) , 0 ); 
    printf("TEST: Hello message sent!\n"); 

    printf("TEST: PLZ STOP\n");
    haws.Stop();
    printf("TEST: STOPPED\n");
    return 0;
}
