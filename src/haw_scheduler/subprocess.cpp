#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h>  
#include <cstdlib>
#include <errno.h>   
#include <sys/wait.h> 
#include <stdlib.h>
#include "subprocess.h"
#include <cstring>
#include <cassert>
#include <string>
#include <iostream>
#include <vector>
#include <sstream>
#include "hawsUtil.h"

// stdin / stdout piping stuff from  
// https://jineshkj.wordpress.com/2006/12/22/how-to-capture-stdin-stdout-and-stderr-of-child-program/

int subprocess_close_parent_stdin_pipe(ChildHandle* handle) {
    return close(handle->pipes[PARENT_WRITE_PIPE][WRITE_FD]);
}

ChildHandle* start_subprocess_nonblocking(std::string binpath, std::string args,    
                                          char* stdin_buff, int stdin_buff_len) {
    DEBUGPR("HAWS/SUBPROC: start subproc nonblocking \n");
    pid_t  pid; 
    ChildHandle* handle = (ChildHandle*) malloc(sizeof(ChildHandle));
    int ret = 1; 

    bool PIPE_STDIN = true;   // enabled
    bool PIPE_STDOUT = false; // disabled

    // malloc new pipes for handle
    int** pipes = new int*[2];
    for(int j = 0; j < 2; j++) { pipes[j] = new int[2]; }

    // set up command line args array
    std::stringstream ss(args);
    std::vector<std::string> tokens;
    std::string temp_str;
    while (getline(ss, temp_str, ' ')) { // tokenize incoming string
        tokens.push_back(temp_str);
    } 
    //DEBUGPR("HAWS/SUBPROC: calloc argv_list[%ld] (token size is %ld)\n", 
    //       2 + tokens.size(), tokens.size());

    char** argv_list;
    // two extra spots; 1 for bin path and 1 for null terminator
    argv_list = (char**) calloc(2 + tokens.size(), sizeof(char*));
    int i = 0;
    argv_list[i] = (char*) binpath.c_str();
    //DEBUGPR("HAWS/SUBPROC: ARGTOKEN[%d] %s\n", i, argv_list[i]);
    for (i = 1; i <= tokens.size(); i++) {
        argv_list[i] = (char*) tokens[i - 1].c_str();
        //DEBUGPR("HAWS/SUBPROC: ARGTOKEN[%d] %s\n", i, argv_list[i]); 
    }
    argv_list[i] = (char*) 0;
    //DEBUGPR("SUBPROCESS: ARGTOKEN[%d] %s\n", i+1, argv_list[i]); 
    int argv_list_len = i;

    //argv_list now has [binpath, <arg1, arg2, ..., argN,> 0], read for execve

    // init pipes for parent to write and read
    if (PIPE_STDOUT){ pipe(pipes[PARENT_READ_PIPE]); }
    if (PIPE_STDIN) { pipe(pipes[PARENT_WRITE_PIPE]); }

    // start child process
    pid = fork(); 
  
    if (pid == -1){ 
       // pid == -1 means error occured 
       printf("can't fork, error occured\n"); 
       assert(false);
       exit(EXIT_FAILURE); 
    } else if (pid == 0) { 
       // pid == 0 means child process created 
       // getpid() returns process id of calling process 
       // Here It will return process id of child process 
       //DEBUGPR("child process, pid = %u\n",getpid()); 
       // Here It will return Parent of child Process means Parent process it self 
       //DEBUGPR("parent of child process, pid = %u\n",getppid());  
  
       // the argv list first argument should point to   
       // filename associated with file being executed, ex argv_list[0] = /bin/ls
       // next are args to executed file ex. argv_list[1] = '-lrth' and argv_list[2] = "/home"
       // the array must be terminated by NULL to signal end of command line args
       // pointer 
 
       // the execv() only return if error occured. 
       // The return value is -1 

       //DEBUGPR("CHILD: dup pipe\n");
       if (PIPE_STDIN)  { dup2(pipes[PARENT_WRITE_PIPE][READ_FD], STDIN_FILENO);  }
       if (PIPE_STDOUT) { dup2(pipes[PARENT_READ_PIPE][WRITE_FD], STDOUT_FILENO); }

       //DEBUGPR("CHILD: close pipes\n");
       // close fds not required by child. Also, we don't
       // want the exec'ed program to know these existed 
       if (PIPE_STDIN) { 
            close(pipes[PARENT_WRITE_PIPE][READ_FD]); 
            close(pipes[PARENT_WRITE_PIPE][WRITE_FD]);
       }
       if (PIPE_STDOUT) {
            close(pipes[PARENT_READ_PIPE][WRITE_FD]);
            close(pipes[PARENT_READ_PIPE][READ_FD]);
       }
 
       //DEBUGPR("CHILD: execv\n");
       execv(argv_list[0],argv_list); 
       exit(0);  // not reached?
    } else{ 
       DEBUGPR("HAWS/SUBPROC: starting subprocess nonblocking\n");
       // a positive number is returned for the pid of parent process 
       // getppid() returns process id of parent of calling process 
       // Here It will return parent of parent process's ID 
       //DEBUGPR("Parent Of parent process, pid = %u\n",getppid()); 
       //DEBUGPR("parent process, pid = %u\n",getpid());  
       //DEBUGPR("caught child pid %d\n", pid);

       // close fds not required by parent
       //DEBUGPR("SUBPROCESS: close pipes\n");
       if (PIPE_STDIN)  { close(pipes[PARENT_WRITE_PIPE][READ_FD]); }
       if (PIPE_STDOUT) { close(pipes[PARENT_READ_PIPE][WRITE_FD]); }
    
       if (PIPE_STDIN) {
           // write in pid first
           std::string pidStr = std::to_string(pid) + "\n";
           assert(pidStr.length() > 0);
           DEBUGPR("HAWS/SUBPROC: send PID %d\n", pid); 
           write(pipes[PARENT_WRITE_PIPE][WRITE_FD], pidStr.c_str(), strlen(pidStr.c_str()));

           // write in formal stdin
           if (stdin_buff_len > 0) {
               DEBUGPR("HAWS/SUBPROC: sending STDIN[%d]\n", stdin_buff_len);    
               write(pipes[PARENT_WRITE_PIPE][WRITE_FD], stdin_buff, stdin_buff_len);
               write(pipes[PARENT_WRITE_PIPE][WRITE_FD], (char*) "\n", 1); // end of input
               DEBUGPR("HAWS/SUBPROC: done sending STDIN[%d]\n", stdin_buff_len);    
           } else {
               DEBUGPR("HAWS/SUBPROC: no stdin to send to bin\n");
           }
       }

       handle->pid = pid; // store pid for caller

       if (PIPE_STDIN) {
           handle->pipes[PARENT_WRITE_PIPE][READ_FD] = pipes[PARENT_WRITE_PIPE][READ_FD];
           handle->pipes[PARENT_WRITE_PIPE][WRITE_FD] = pipes[PARENT_WRITE_PIPE][WRITE_FD];
       }
       if (PIPE_STDOUT) {
           handle->pipes[PARENT_READ_PIPE][READ_FD] = pipes[PARENT_READ_PIPE][READ_FD];
           handle->pipes[PARENT_READ_PIPE][WRITE_FD] = pipes[PARENT_READ_PIPE][WRITE_FD];
       }
    
       // free temporary pipes holder now that its in handle
       for(int j = 0; j < 2; j++) { delete[] pipes[j]; }
       delete[] pipes;

       free(argv_list); // free command line args that were sent

       DEBUGPR("HAWS/SUBPROC: started successfully\n");
       return handle;
   }
   assert(false); // not reached
   return 0;
}
