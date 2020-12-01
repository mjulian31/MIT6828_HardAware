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
    assert(strlen(pid_buffer) > 0);
    std::string mypidstr(strtok(pid_buffer, "\n")); // must drop newline character
    assert(mypidstr.length() > 0);

    // parse formal stdin
    fgets(stdin_buffer, STDIN_BUFFER_SIZE, stdin);
    std::string my_supplied_stdin(strtok(stdin_buffer, "\n")); // must drop newline character
    // now my_supplied_stdin is whatever came to scheduler in the request 
    // ... setup data for billable operation

    // begin profiled billable work
    auto start = std::chrono::high_resolution_clock::now();

    // DO BILLABLE WORK -- MATRIX MUL

    // (this is fake work in the place where matrix mul work would go)
    // sleep for random delay to simulate billable work
    std::mt19937_64 eng{std::random_device{}()}; // fake some work
    std::uniform_int_distribution<> dist{10, 100}; //sleep between 10-100 milliseconds
    std::this_thread::sleep_for(std::chrono::milliseconds{dist(eng)});

    // FINISHED BILLABLE WORK -- MATRIX MUL DONE

    // end profiled billable work 
    auto end = std::chrono::high_resolution_clock::now();
    auto elapsed = end - start;
    long long microseconds = std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count();
    
    // prepare output of the operation for reporting back
        // dummy example for testing, replace with mat mul ans
    std::string OPERATION_ANSWER = mypidstr + my_supplied_stdin;

    // write output file string, format: "billable time count,operation output"
    std::ofstream myoutput;
    myoutput.open("/opt/haws/bin/out/" + mypidstr + ".txt");
    myoutput << std::to_string(microseconds) << "," << OPERATION_ANSWER;
    myoutput.close();

    exit(12); // exit status code will also be reported back to client
}
