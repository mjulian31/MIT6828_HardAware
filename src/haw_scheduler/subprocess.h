#ifndef SUBPROCESS_H
#define SUBPROCESS_H

#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h>  
#include <stdlib.h> 
#include <errno.h>   
#include <sys/wait.h> 

// block and wait for child process example
int start_subprocess_blocking(char**);
int start_subprocess_blocking_julia_test(char*, char*);

// don't block and poll child process example
int start_subprocess_nonblocking_monitor(char**);
int start_subprocess_nonblocking(char**);
int start_subprocess_nonblocking_julia_test(char*, char*);
int start_subprocess_test();

char* pow8_julia_bin_path= (char*) "/opt/julia/usr/bin/julia";
char* x86_julia_bin_path= (char*) "/usr/local/bin/julia";

#endif
