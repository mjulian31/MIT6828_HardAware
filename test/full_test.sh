#!/bin/bash

RR1_PHYSMEM=51200
RR1_GPUMEM=6000
RR1_GPUSHAREDMEM=5124

CL_PHYSMEM=20480
CL_GPUMEM=16348
CL_GPUSHAREDMEM=5124

main () {
    local bincmd=""
    local vgrargs=""
    if [ "$1" == "RR1" ]; then
        bincmd="/opt/haws/bin/haws test $RR1_PHYSMEM $RR1_GPUMEM $RR1_GPUSHAREDMEM"
	    #vgrargs="--leak-check=full --show-leak-kinds=all --track-origins=yes -s"
	    vgrargs="--leak-check=full --show-leak-kinds=all -s"
    elif [ "$1" == "CL" ]; then
        bincmd="/opt/haws/bin/haws test $CL_PHYSMEM $CL_GPUMEM $CL_GPUSHAREDMEM"
	    vgrargs="--leak-check=full --show-leak-kinds=all --track-origins=yes"
    else 
        echo "usage: ./full_test <machine: 'RR1' or 'CL'>"
        exit 1
    fi
    echo "$bincmd"
    echo "Running with resource limits for machine $1... 3, 2, 1.."
    sleep 3
    pushd `pwd` > /dev/null
    cd /opt/haws/bin # run from within /opt/haws/bin and then switch back 
    #$bincmd && \
    valgrind $vgrargs $bincmd &&
    echo "TEST: FULL TEST PASS"
    popd > /dev/null
}

main $*
