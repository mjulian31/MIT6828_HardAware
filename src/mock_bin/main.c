#include <stdio.h>
#include <unistd.h>
#include <thread>
#include <random>
#include <chrono>
#include <string.h>

#define TERM_SIGNAL_BUFFER_SIZE 10
#define STDIN_BUFFER_SIZE (1024 * 1024 * 10) // support 10MB of input

char term_signal_buffer[TERM_SIGNAL_BUFFER_SIZE];
char stdin_buffer[STDIN_BUFFER_SIZE];

int main() {
    fgets(stdin_buffer, STDIN_BUFFER_SIZE, stdin);

    // parse command line args and stdin_buffer to set up to do work
    int mypid = atoi(stdin_buffer);

    // begin profiled billable work
    auto start = std::chrono::high_resolution_clock::now();




    // DO BILLABLE WORK
    // sleep for random delay to simulate billable work
    std::mt19937_64 eng{std::random_device{}()};
    std::uniform_int_distribution<> dist{10, 100}; //sleep between 10-100 milliseconds
    std::this_thread::sleep_for(std::chrono::milliseconds{dist(eng)});
    // FINISH BILLABLE WORK
    




    // end profiled billable work 
    auto end = std::chrono::high_resolution_clock::now();
    auto elapsed = end - start;
    long long microseconds = std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count();
    
    // prepare output of the operation for reporting back
    int op_output = mypid; //example
    const char* end_of_output_str = "@"; // signal to scheduler binary is done outputting 
    printf("%lld,%d%s\n", microseconds, op_output, end_of_output_str);
    fflush(stdout); // _must flush_ stdout to get it all to scheduler

    // wait until scheduler finishes accounting output and then terminate on next stdin
    while (true) {
        if (fgets(term_signal_buffer,TERM_SIGNAL_BUFFER_SIZE,stdin)) {
            break;
        }
    }
    exit(12); // exit status code will be reported back to client
}
