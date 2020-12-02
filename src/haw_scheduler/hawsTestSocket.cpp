#include <stdio.h> 
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <unistd.h> 
#include <string.h> 

#include "hawsHAWS.h"

int haws_test_socket_bringup() {
    HAWS* haws = new HAWS(); 
    haws->Start();

    printf("TEST: wait\n");    
    sleep(1); // give socket a chance to come up
    printf("TEST: go\n");    

    int sockClient1 = 8080;
    int sock = 0, valread; 
    struct sockaddr_in serv_addr; 
    char *hello = (char*) "Hello from client"; 
    char buffer[1024] = {0}; 
    printf("TEST: create socket\n");
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
    { 
        printf("\n Socket creation error \n"); 
        return 1;
    } 
   
    serv_addr.sin_family = AF_INET; 
    serv_addr.sin_port = htons(sockClient1); 
       
    // Convert IPv4 and IPv6 addresses from text to binary form 
    printf("TEST: inet pton \n");
    if(inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr)<=0)  
    { 
        printf("\nInvalid address/ Address not supported \n"); 
        return 1; 
    } 
   
    printf("TEST: connect\n");
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) 
    { 
        printf("\nConnection Failed \n"); 
        return 1; 
    } 
    printf("TEST: send\n");
    send(sock , hello , strlen(hello) , 0 ); 
    printf("TEST: Hello message sent!\n"); 
    printf("%s\n",buffer ); 

    printf("TEST: PLZ STOP\n");
    haws->Stop();
    printf("TEST: STOPPED\n");
    return 0;
}
