#ifndef _HAWS_MAIN_H
#define _HAWS_MAIN_H

#include "hawsHAWS.h"

extern HAWS haws;
extern int numTests;

#define FAIL(test_name) \
    printf("TEST FAIL: test_name\n"); \
    exit(1);

#define RUN_TEST(test_name) \
    printf("TEST START: " #test_name "\n"); \
    if (test_name != 0) { \
        FAIL(test_name); \
    } else { \
        printf("TEST PASS: " #test_name "\n"); \
    } \
    numTests++;

#endif
