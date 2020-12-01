#include <stdio.h>
#include <unistd.h>
#include <thread>
#include <random>
#include <chrono>
#include <string.h>
#include <iostream>
#include <fstream>
#include <cassert>

#define TERM_SIGNAL_BUFFER_SIZE 10
#define STDIN_BUFFER_SIZE (1024 * 1024 * 10) // support 10MB of input
#define PID_BUFFER_SIZE 32 // support a very huge PID

char pid_buffer[PID_BUFFER_SIZE];
char term_signal_buffer[TERM_SIGNAL_BUFFER_SIZE];
char stdin_buffer[STDIN_BUFFER_SIZE];

int main() {
    // parse command line args
    // ...  argv[..]

    // parse incoming pid (this process's UUID)
    fgets(pid_buffer, PID_BUFFER_SIZE, stdin);
    std::string mypidstr(strtok(pid_buffer, "\n")); // must drop newline character
    assert(mypidstr.length() > 0);

    // parse formal stdin
    fgets(stdin_buffer, STDIN_BUFFER_SIZE, stdin);
    // ... setup data for billable operation

    // begin profiled billable work
    auto start = std::chrono::high_resolution_clock::now();

    // DO BILLABLE WORK -- MATRIX MUL
    // sleep for random delay to simulate billable work
    std::mt19937_64 eng{std::random_device{}()}; // fake some work
    std::uniform_int_distribution<> dist{10, 100}; //sleep between 10-100 milliseconds
    std::this_thread::sleep_for(std::chrono::milliseconds{dist(eng)});
    // FINISH BILLABLE WORK -- MATRIX MUL DONE

    // end profiled billable work 
    auto end = std::chrono::high_resolution_clock::now();
    auto elapsed = end - start;
    long long microseconds = std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count();
    
    // prepare output of the operation for reporting back
    std::string OPERATION_ANSWER = mypidstr; // dummy example for testing, replace with mat mul ans

    // write output file
    std::ofstream myoutput;
    myoutput.open("/opt/haws/bin/out/" + mypidstr + ".txt");
    myoutput << std::to_string(microseconds) << "," << OPERATION_ANSWER << std::endl;
    myoutput.close();

    exit(12); // exit status code will also be reported back to client
}
