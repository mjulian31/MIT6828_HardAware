#ifndef _TEST_SOCKET_H
#define _TEST_SOCKET_H

int haws_test_socket_bringup();
int haws_help_open_send_socket(int port);
int haws_help_open_recv_socket(int port);
void haws_help_close_socket(int socket);

#endif
