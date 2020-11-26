#include <unistd.h>
#include <stdio.h>
 
/* since pipes are unidirectional, we need two pipes.
   one for data to flow from parent's stdout to child's
   stdin and the other for child's stdout to flow to
   parent's stdin */
 
#define NUM_PIPES          2
 
#define PARENT_WRITE_PIPE  0
#define PARENT_READ_PIPE   1
 
int pipes[NUM_PIPES][2];
 
/* always in a pipe[], pipe[0] is for read and 
   pipe[1] is for write */
#define READ_FD  0
#define WRITE_FD 1
 
//#define PARENT_READ_FD  ( pipes[PARENT_READ_PIPE][READ_FD]   )
//#define PARENT_WRITE_FD ( pipes[PARENT_WRITE_PIPE][WRITE_FD] )
 
//#define CHILD_READ_FD   ( pipes[PARENT_WRITE_PIPE][READ_FD]  )
//#define CHILD_WRITE_FD  ( pipes[PARENT_READ_PIPE][WRITE_FD]  )
 
int main() {
    int outfd[2];
    int infd[2];
     
    // pipes for parent to write and read
    pipe(pipes[PARENT_READ_PIPE]);
    pipe(pipes[PARENT_WRITE_PIPE]);
     
    if(!fork()) {
        char *argv[]={ (char*) "/usr/bin/bc", (char*) "-q", (char*) 0};
 
        dup2(pipes[PARENT_WRITE_PIPE][READ_FD], STDIN_FILENO);
        dup2(pipes[PARENT_READ_PIPE][WRITE_FD], STDOUT_FILENO);
 
        /* Close fds not required by child. Also, we don't
           want the exec'ed program to know these existed */
        close(pipes[PARENT_WRITE_PIPE][READ_FD]);
        close(pipes[PARENT_READ_PIPE][WRITE_FD]);
        close(pipes[PARENT_READ_PIPE][READ_FD]);
        close(pipes[PARENT_WRITE_PIPE][WRITE_FD]);
          
        execv(argv[0], argv);
    } else {
        char buffer[100];
        int count;
 
        /* close fds not required by parent */       
        close(pipes[PARENT_WRITE_PIPE][READ_FD]);
        close(pipes[PARENT_READ_PIPE][WRITE_FD]);
 
        // Write to child’s stdin
        write(pipes[PARENT_WRITE_PIPE][WRITE_FD], "2^32\n", 5);
  
        // Read from child’s stdout
        count = read(pipes[PARENT_READ_PIPE][READ_FD], buffer, sizeof(buffer)-1);
        if (count >= 0) {
            buffer[count] = 0;
            printf("%s", buffer);
        } else {
            printf("IO Error\n");
        }
        printf("I CAN STILL PRINT!");
    }
}
