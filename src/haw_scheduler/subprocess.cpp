#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h>  
#include <stdlib.h> 
#include <errno.h>   
#include <sys/wait.h> 
#include "subprocess.h"

char* pow8_julia_bin_path= (char*) "/opt/julia/usr/bin/julia";
char* x86_julia_bin_path= (char*) "/usr/local/bin/julia";

int start_subprocess_test() {
    // x86 machines
    // taylor 
    //char* julia_script_path = (char*)"/home/local/git/MIT6828_HardAware/julia_code/matrix_multiply.jl";
    //char* julia_bin_path = x86_julia_bin_path; // or pow8_julia_bin_path

    // cloudlab machines 
    char* julia_bin_path = pow8_julia_bin_path;
    // taylor
    //char* julia_script_path = (char*)"/users/tandrews/MIT6828_HardAware/julia_code/matrix_multiply.jl";
    // meredith
    char* julia_script_path = (char*)"/users/mjulian/MIT6828_HardAware/julia_code/matrix_multiply.jl";

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

int start_subprocess_nonblocking_monitor(char** argv_list) {
   int print_state_throttle = 0;
   int pid = start_subprocess_nonblocking(argv_list); 
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

int start_subprocess_nonblocking(char** argv_list) {
    pid_t  pid; 
    int ret = 1; 
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
       printf("caught pid %d\n", pid);
       return pid;
   } 
   return 0;

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

