#!/bin/bash
julia --threads auto generate_binaries.jl && \
mv ./matmul_cpu /opt/haws/bin/ && \
mv ./matmul_gpu /opt/haws/bin/ && \
mv ./matmul_gpu.ptx /opt/haws/bin/ && \
echo "Binaries and ptx copied to /opt/haws/bin"
