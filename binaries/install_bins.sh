#!/bin/bash
julia generate_binaries.jl --threads auto && \
mv ./matmul_cpu /opt/haws/bin && \
mv ./matmul_gpu /opt/haws/bin && \
mv ./matmul_gpu.ptx /opt/haws/bin 
