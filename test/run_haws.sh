
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
        bincmd="/opt/haws/bin/haws $RR1_PHYSMEM $RR1_GPUMEM $RR1_GPUSHAREDMEM"
    elif [ "$1" == "CL" ]; then
        bincmd="/opt/haws/bin/haws $CL_PHYSMEM $CL_GPUMEM $CL_GPUSHAREDMEM"
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
