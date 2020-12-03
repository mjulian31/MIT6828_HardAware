#ifndef SUBPROCESS_H
#define SUBPROCESS_H

#include <unistd.h>
#include <stdio.h>
#include <string>

/* since pipes are unidirectional, we need two pipes.
   one for data to flow from parent's stdout to child's
   stdin and the other for child's stdout to flow to
   parent's stdin */
 
#define NUM_PIPES          2
 
#define PARENT_WRITE_PIPE  0
#define PARENT_READ_PIPE   1

typedef struct ChildHandle {
    pid_t pid;
    int pipes[2][2];
} ChildHandle;
 
/* always in a pipe[], pipe[0] is for read and 
   pipe[1] is for write */
#define READ_FD  0
#define WRITE_FD 1

// production use
int subprocess_close_parent_pipes(ChildHandle* handle);
ChildHandle* start_subprocess_nonblocking(std::string binpath, std::string args, 
                                          char* stdin_buff, int stdin_buff_len);

// testing
// block and wait for child process example
int start_subprocess_blocking(char**);
int start_subprocess_blocking_julia_test(char*, char*);

// don't block and poll child process example
int start_subprocess_nonblocking_monitor(char**);
int start_subprocess_nonblocking_julia_test(char*, char*);
int start_subprocess_test();

#endif
