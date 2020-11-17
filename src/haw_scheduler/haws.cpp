#include <stdio.h>
#include <sys/types.h> 
#include <unistd.h>  
#include <stdlib.h> 
#include <errno.h>   
#include <sys/wait.h> 

int start_subprocess_blocking(char** argv_list);
int start_subprocess_blocking_julia_test();


int main() {
    start_subprocess_blocking_julia_test(); 
}

int start_subprocess_blocking_julia_test() {
    char* binary_path = (char*) "/opt/julia/usr/bin/julia";
    char* julia_script_path = (char*) "/users/tandrews/MIT6828_HardAware/julia_code/matrix_multiply.jl";

    // set up command line strings
    char* argv_list[] = {
        (char*) binary_path,
        (char*) julia_script_path,
        (char*) 0
    };
    start_subprocess_blocking(argv_list);
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

