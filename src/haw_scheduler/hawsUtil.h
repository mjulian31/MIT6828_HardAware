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

// bytes / kb / mb / gb stuff
#define MB_TO_BYTES(somemb) ((uint64_t) ((uint64_t) 1024 * (uint64_t) 1024 * (uint64_t) somemb))

//csv stuff
#define CSV_BUF_PARSE_CPP_STR(buf, cName, cppName) \
    fieldLen = 0; \
    startPos = pos; \
    for (pos = pos; buf[pos] != ','; pos++) { \
        assert(pos < max_buf_size); \
        fieldLen++; \
    } pos++; \
    char* cName = (char*) malloc(sizeof(char) * (fieldLen + 1)); \
    memcpy(cName, (buf + (startPos * sizeof(char))), fieldLen); \
    cName[fieldLen] = '\0'; \
    std::string cppName(cName); \
    assert(cppName.length() > 0);  \
    free(cName); \
    printf("CSVPARSER/CPPSTR: " #cppName ":'%s'\n", cppName.c_str());

//@dedup?
#define CSV_BUF_PARSE_INT(buf, strName, strNameCpp, intName) \
    fieldLen = 0; \
    startPos = pos; \
    for (pos = pos; buf[pos] != ','; pos++) { \
        assert(pos < max_buf_size); \
        fieldLen++;  \
    } pos++;\
    char* strName = (char*) malloc(sizeof(char) * (fieldLen + 1)); \
    memcpy(strName, (buf + (startPos * sizeof(char))), fieldLen); \
    strName[fieldLen] = '\0'; \
    printf("CSVPARSER/STRINT: " #strName "[%ld]:%s\n", fieldLen, strName); \
    std::string strNameCpp(strName); \
    int intName = std::stoi(strName); \
    assert(intName > 0); \
    free(strName); \
    printf("CSVPARSER/INT: " #strName ":%d\n", intName);

//@dedup?
#define CSV_BUF_PARSE_LONG(buf, strName, strNameCpp, varName) \
    fieldLen = 0; \
    startPos = pos; \
    for (pos = pos; buf[pos] != ','; pos++) { \
        assert(pos < max_buf_size); \
        fieldLen++;  \
    } pos++;\
    char* strName = (char*) malloc(sizeof(char) * (fieldLen + 1)); \
    memcpy(strName, (buf + (startPos * sizeof(char))), fieldLen); \
    strName[fieldLen] = '\0'; \
    printf("CSVPARSER/STRLONG: " #strName "[%ld]:%s\n", fieldLen, strName); \
    std::string strNameCpp(strName); \
    long varName = std::stol(strName); \
    assert(varName >= 0); \
    free(strName); \
    printf("CSVPARSER/LONG: " #strName ":%ld\n", varName);

#endif
