RR1_THREADS_CPU=27
RR1_THREADS_GPU=1200
RR1_PHYSMEM=51200
RR1_GPUMEM=6000
RR1_GPUSHAREDMEM=5124 #todo unused

CL_THREADS_CPU=150
CL_THREADS_GPU=3584 # / 3584
CL_PHYSMEM=204800
CL_GPUMEM=3000 # / 16348 (test jobs are taking 250MB vs 65MB on RR1 so scale)
CL_GPUSHAREDMEM=16348 #todo unused

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
