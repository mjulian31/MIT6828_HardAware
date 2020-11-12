#!/bin/bash

# uncomment to place sample code in home directory 
#cuda-install-samples-11.1.sh ~

# use sample code stored in /opt
cd /opt/CUDA/NVIDIA_CUDA-11.1_Samples/
make
echo "sample binaries are in /opt/CUDA/NVIDIA_CUDA-11.1_Samples/bin/ppc64le/linux/release/"
