RR1_THREADS_CPU=27
RR1_THREADS_GPU=1200
RR1_PHYSMEM=51200
RR1_GPUMEM=6000
RR1_GPUSHAREDMEM=5124

CL_THREADS_CPU=32
CL_THREADS_GPU=1200
CL_PHYSMEM=20480
CL_GPUMEM=16348
CL_GPUSHAREDMEM=5124

main () {
    local bincmd=""
    local vgrargs=""
    local mode="$2"
    if [ "$1" == "RR1" ]; then
        bincmd="/opt/haws/bin/haws $mode $RR1_THREADS_CPU $RR1_THREADS_GPU $RR1_PHYSMEM $RR1_GPUMEM $RR1_GPUSHAREDMEM"
    elif [ "$1" == "CL" ]; then
        bincmd="/opt/haws/bin/haws $mode $CL_THREADS_CPU $CL_THREADS_GPU $CL_PHYSMEM $CL_GPUMEM $CL_GPUSHAREDMEM"
    else 
        echo "usage: ./run_haws <machine: 'RR1' or 'CL'>"
        exit 1
    fi
    echo "$bincmd"
    echo "Running with resource limits for machine $1... 3, 2, 1.."
    sleep 3
    pushd `pwd` > /dev/null
    cd /opt/haws/bin # run from within /opt/haws/bin and then switch back 
    $bincmd 
    popd > /dev/null
}

main $*
