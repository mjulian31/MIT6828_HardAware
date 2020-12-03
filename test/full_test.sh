#!/bin/bash

/opt/haws/bin/haws && \
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes -s /opt/haws/bin/haws &&
echo "TEST: FULL TEST PASS"
