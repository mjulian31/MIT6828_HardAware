#ifndef UTILS_H
#define UTILS_H

#include <algorithm>
#include <chrono>
#include <list>

//using namespace std;

//list stuff
#define IN_LIST(list, item) (std::find(list.begin(), list.end(), item) != list.end())
#define NOT_IN_LIST(list, item) (std::find(list.begin(), list.end(), item) == list.end())

//time stuff
typedef std::chrono::time_point<std::chrono::system_clock> time_point;
#define TIMEDIFF_CAST_USEC(timediff) \
        (std::chrono::duration_cast<std::chrono::microseconds>(timediff).count())
#define TIMEDIFF_CAST_MSEC(timediff) \
        (std::chrono::duration_cast<std::chrono::milliseconds>(timediff).count())
#define TIMEDIFF_CAST_SEC(timediff) \
        (std::chrono::duration_cast<std::chrono::seconds>(timediff).count())

#endif
