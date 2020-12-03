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

// stdin / stdout piping stuff from  
// https://jineshkj.wordpress.com/2006/12/22/how-to-capture-stdin-stdout-and-stderr-of-child-program/

int subprocess_close_parent_pipes(ChildHandle* handle) {
    return close(handle->pipes[PARENT_WRITE_PIPE][WRITE_FD]);
}

ChildHandle* start_subprocess_nonblocking(std::string binpath, std::string args,    
                                          char* stdin_buff, int stdin_buff_len) {
    pid_t  pid; 
    printf("SUBPROCESS: alloc ChildHandle\n");
    ChildHandle* handle = (ChildHandle*) malloc(sizeof(ChildHandle));
    int ret = 1; 

    // malloc new pipes for handle
//    printf("SUBPROCESS: alloc pipes\n");
//    int** pipes = (int**) malloc(sizeof(2 * 2 * sizeof(int)));

    // set up command line args array
    std::stringstream ss(args);
    std::vector<std::string> tokens;
    std::string temp_str;
    while (getline(ss, temp_str, ' ')) { // tokenize incoming string
        tokens.push_back(temp_str);
    } 
    // two extra spots; 1 for bin path and 1 for null terminator
    char** argv_list = (char**) calloc(2 + tokens.size(), sizeof(char*));
    int i = 0;
    argv_list[i] = (char*) binpath.c_str();
    printf("SUBPROCESS: ARGTOKEN[%d] %s\n", i, argv_list[i]);
    for (i = i + 1; i <= tokens.size(); i++) {
        argv_list[i] = (char*) tokens[i - 1].c_str();
        printf("SUBPROCESS: ARGTOKEN[%d] %s\n", i, argv_list[i]); 
    }
    argv_list[i+1] = (char*) 0;
    printf("SUBPROCESS: ARGTOKEN[%d] %s\n", i, argv_list[i]); 
    //argv_list now has [binpath, arg1, arg2, ..., argN, 0], read for execve
    //for(int j = 0; j < 2; j++) {
    //    pipes[j] = (int*) malloc(2 * sizeof(int));
    //}

    // malloc new pipes for handle
    printf("SUBPROCESS: alloc pipes\n");
    int** pipes = new int*[2];
    for(int i = 0; i < 2; i++) {
        pipes[i] = new int[2];
    }

    // init pipes for parent to write and read
    printf("SUBPROCESS: init pipes\n");
    //pipe(pipes[PARENT_READ_PIPE]); // leaving stdout routed normally
    pipe(pipes[PARENT_WRITE_PIPE]);
    printf("SUBPROCESS: starting subprocess nonblocking\n");

    // start child process
    pid = fork(); 
  
    if (pid == -1){ 
       // pid == -1 means error occured 
       printf("can't fork, error occured\n"); 
       exit(EXIT_FAILURE); 
    } 
    else if (pid == 0){ 
       // pid == 0 means child process created 
       // getpid() returns process id of calling process 
       // Here It will return process id of child process 
       //printf("child process, pid = %u\n",getpid()); 
       // Here It will return Parent of child Process means Parent process it self 
       //printf("parent of child process, pid = %u\n",getppid());  
  
       // the argv list first argument should point to   
       // filename associated with file being executed, ex argv_list[0] = /bin/ls
       // next are args to executed file ex. argv_list[1] = '-lrth' and argv_list[2] = "/home"
       // the array must be terminated by NULL to signal end of command line args
       // pointer 
 
       // the execv() only return if error occured. 
       // The return value is -1 

       printf("CHILD: dup pipe\n");
       dup2(pipes[PARENT_WRITE_PIPE][READ_FD], STDIN_FILENO);
       //dup2(pipes[PARENT_READ_PIPE][WRITE_FD], STDOUT_FILENO);

       printf("CHILD: close pipes\n");
       // close fds not required by child. Also, we don't
       // want the exec'ed program to know these existed 
       close(pipes[PARENT_WRITE_PIPE][READ_FD]);
       //close(pipes[PARENT_READ_PIPE][WRITE_FD]);
       //close(pipes[PARENT_READ_PIPE][READ_FD]);
       close(pipes[PARENT_WRITE_PIPE][WRITE_FD]);
 
       printf("CHILD: execv\n");
       execv(argv_list[0],argv_list); 
       exit(0);  // not reached?
    } else{ 
       // a positive number is returned for the pid of parent process 
       // getppid() returns process id of parent of calling process 
       // Here It will return parent of parent process's ID 
       //printf("Parent Of parent process, pid = %u\n",getppid()); 
       //printf("parent process, pid = %u\n",getpid());  
       //printf("caught pid %d\n", pid);

       // close fds not required by parent
       printf("SUBPROCESS: close pipes\n");
       close(pipes[PARENT_WRITE_PIPE][READ_FD]);
       //close(pipes[PARENT_READ_PIPE][WRITE_FD]);
     
       // write in pid first
       //char pidStr[15];
       //sprintf(pidStr, "%d\n", pid); 
       printf("SUBPROCESS: send PID\n");
       std::string pidStr = std::to_string(pid) + "\n";
       assert(pidStr.length() > 0);
       write(pipes[PARENT_WRITE_PIPE][WRITE_FD], pidStr.c_str(), strlen(pidStr.c_str()));

       // write in formal standardinput
       if (stdin_buff_len > 0) {
           printf("SUBPROCESS: sending STDIN[%d] '%s'", stdin_buff_len, stdin_buff);    
           printf("SUBPROCESS: strlen %d\n", (int) strlen(stdin_buff)); 
           write(pipes[PARENT_WRITE_PIPE][WRITE_FD], stdin_buff, stdin_buff_len);
       }

       //write(pipes[PARENT_WRITE_PIPE][WRITE_FD], "#_$_stdin_end\n", 14);
       printf("SUBPROCESS: pipe accounting\n");
       handle->pid = pid;
       handle->pipes[PARENT_WRITE_PIPE][READ_FD] = pipes[PARENT_WRITE_PIPE][READ_FD];
       handle->pipes[PARENT_WRITE_PIPE][WRITE_FD] = pipes[PARENT_WRITE_PIPE][WRITE_FD];
       //handle->pipes[PARENT_READ_PIPE][READ_FD] = pipes[PARENT_READ_PIPE][READ_FD];
       //handle->pipes[PARENT_READ_PIPE][WRITE_FD] = pipes[PARENT_READ_PIPE][WRITE_FD];
    
       printf("SUBPROCESS: freeing argv_list\n");
       free(argv_list); // free command line args that were sent
       return handle;
   }
   return 0;
}

// early dev code below - unused but kept for debugging 
/*
char* pow8_julia_bin_path= (char*) "/opt/julia/usr/bin/julia";
char* x86_julia_bin_path= (char*) "/usr/local/bin/julia";

int start_subprocess_test() {
    // x86 machines
    // taylor 
    char* julia_script_path = (char*)"/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl";
    char* julia_bin_path = x86_julia_bin_path; // or pow8_julia_bin_path

    // cloudlab machines 
    //char* julia_bin_path = pow8_julia_bin_path;
    // taylor
    //char* julia_script_path = (char*)"/users/tandrews/MIT6828_HardAware/julia_code/matrix_multiply.jl";
    // meredith
    //char* julia_script_path = (char*)"/users/mjulian/MIT6828_HardAware/julia_code/matrix_multiply.jl";

    //test workload to start as new process to monitor
    start_subprocess_nonblocking_julia_test(julia_bin_path, (char*) julia_script_path);

    // not as helpful test to start process and block until finished
    //start_subprocess_blocking_julia_test(julia_bin_path, (char*) julia_script_path);
    return 0;
}

int start_subprocess_nonblocking_julia_test(char* julia_bin_path, char* julia_script_path) {
    char* argv_list[] = {
        (char*) julia_bin_path,         // can be path to any binary on disk
        (char*) julia_script_path,      // first argv to binary, can add arbitrary number
        (char*) 0, //must terminate arg list
    };
    return start_subprocess_nonblocking_monitor(argv_list);
}

pid_t start_subprocess_nonblocking_monitor(char** argv_list) {
   int print_state_throttle = 0;
   ChildHandle *handle = start_subprocess_nonblocking(argv_list, (char*) "", 0); 
   pid_t pid = handle->pid;
   int status; 
   pid_t state;

   // the parent process calls waitpid() on the child 
   // waitpid() system call does not block with WNOHANG option specified
   // child pid status is returned, and is 0 if still running
   // see wait() man page for all the flags or options 
   // used here  
   while (true) {
     // for all started pids do... 
       if ((state = waitpid(pid, &status, WNOHANG)) >= 0) {  // this checks a running PID (process) without stopping)
           if (status == 0) {
              //if (print_state_throttle++ % 1000 == 0) { // print once a second
              //    printf("pid %d still running...\n", pid);
              //}
              //usleep(1000); // sleep for a millisecond
              continue;
           }         
       } else { 
           // waitpid() failed 
           printf("waitpid() was < 0\n"); 
           printf("errno error codes are ECHILD: %d, EINTR: %d, EINVAL %d\n", ECHILD, EINTR, EINVAL);
           printf("errno was = %d\n", errno);
           if (WIFEXITED(status) && !WEXITSTATUS(status)) {
              printf("program execution successful\n"); 
              return status;
           } else if (WIFEXITED(status) && WEXITSTATUS(status)) { 
                if (WEXITSTATUS(status) == 127) { 
                    // execv failed 
                    printf("execv failed\n"); 
                    return status;
                } 
                else  {
                    printf("program terminated normally,"
                       " but returned a non-zero status\n");                 
                    return status;
                }
           } else {
               printf("program didn't terminate normally\n");             
               return status;
           }
        } 
    }
    exit(0);
}


int start_subprocess_blocking_julia_test(char* julia_bin_path, char* julia_script_path) {
    // set up command line strings
    char* argv_list[] = {
        (char*) julia_bin_path,
        (char*) julia_script_path,
        (char*) 0 // end of command line arguments
    };
    return start_subprocess_blocking(argv_list);
}

// generic version based on example from 
// https://www.geeksforgeeks.org/difference-fork-exec/
int start_subprocess_blocking(char** argv_list) { 
    pid_t  pid; 
    int ret = 1; 
    int status; 
    pid = fork(); 
  
    if (pid == -1){ 
       // pid == -1 means error occured 
       printf("can't fork, error occured\n"); 
       exit(EXIT_FAILURE); 
    } 
    else if (pid == 0){ 
       // pid == 0 means child process created 
       // getpid() returns process id of calling process 
       // Here It will return process id of child process 
       printf("child process, pid = %u\n",getpid()); 
       // Here It will return Parent of child Process means Parent process it self 
       printf("parent of child process, pid = %u\n",getppid());  
  
       // the argv list first argument should point to   
       // filename associated with file being executed, ex argv_list[0] = /bin/ls
       // next are args to executed file ex. argv_list[1] = '-lrth' and argv_list[2] = "/home"
       // the array must be terminated by NULL to signal end of command line args
       // pointer 
 
       // the execv() only return if error occured. 
       // The return value is -1 
       execv(argv_list[0],argv_list); 
       exit(0); 
    } else{ 
       // a positive number is returned for the pid of 
       // parent process 
       // getppid() returns process id of parent of  
       // calling process 
       // Here It will return parent of parent process's ID 
       printf("Parent Of parent process, pid = %u\n",getppid()); 
       printf("parent process, pid = %u\n",getpid());  
  
       // the parent process calls waitpid() on the child 
       // waitpid() system call suspends execution of  
       // calling process until a child specified by pid 
       // argument has changed state 
       // see wait() man page for all the flags or options 
       // used here  
       if (waitpid(pid, &status, 0) > 0) { 
            if (WIFEXITED(status) && !WEXITSTATUS(status))  
              printf("program execution successful\n"); 
              
            else if (WIFEXITED(status) && WEXITSTATUS(status)) { 
                if (WEXITSTATUS(status) == 127) { 
  
                    // execv failed 
                    printf("execv failed\n"); 
                } 
                else 
                    printf("program terminated normally,"
                       " but returned a non-zero status\n");                 
            } 
            else 
               printf("program didn't terminate normally\n");             
        }  
        else { 
           // waitpid() failed 
           printf("waitpid() failed\n"); 
        } 
      exit(0); 
   } 
   return 0;
}
*/
