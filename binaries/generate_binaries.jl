print("loading packages...")
using LinearAlgebra
using SIMD
using CUDA
using StaticArrays
using InteractiveUtils
using LLVM
using GPUCompiler

println("done.")

print("loading globals and functions...")
const TILE_DIM = 32

struct CArray{T, N} <: AbstractArray{T, N}
  ptr::Ptr{T}
  dims::NTuple{N, Cint}
end

Base.IndexStyle(::Type{<:CArray}) = IndexLinear()
Base.size(ca::CArray) = ca.dims
function Base.getindex(A::CArray, i)
  unsafe_load(A.ptr, i)
end

function Base.setindex!(A::CArray, val, i)
  unsafe_store!(A.ptr, val, i)
end


function mul_tile!(ptr_C::Ptr{Cdouble}, ptr_A::Ptr{Cdouble}, ptr_B::Ptr{Cdouble}, N::Cint)
    # assuming square matrix
    NUM_TILES = div(N, TILE_DIM)
    A = CArray(ptr_A, (N, N))
    B = CArray(ptr_B, (N, N))
    C = CArray(ptr_C, (N, N))

    # loop over all tiles
    @inbounds for gj in 1:NUM_TILES
        @inbounds for gi in 1:NUM_TILES
            # loop over tiles needed for this calculation
            tile1 = @MArray zeros(TILE_DIM, TILE_DIM)
            tile2 = @MArray zeros(TILE_DIM, TILE_DIM)
            @simd for t in 0:NUM_TILES-1
                # load tiles needed for calculation
                @simd for i in 1:TILE_DIM
                    @simd for j in 1:TILE_DIM
                        # global tile
                        I = (gi-1) * TILE_DIM + i
                        J = (gj-1) * TILE_DIM + j
                        # get tile1 and tile2 values
                        tile1[i, j] = A[I, t*TILE_DIM + j]
                        tile2[i, j] = B[t*TILE_DIM + i, J]
                    end
                end
                # synchronize
                # loop over tiles to calculate for I, J spot
                @simd for j in 1:TILE_DIM
                    J = (gj-1) * TILE_DIM + j
                    # loop over row/col in tiles
                    @simd for k in 1:TILE_DIM
                        @simd for i in 1:TILE_DIM
                            # global tile
                            I = (gi-1) * TILE_DIM + i
                            # add tile1 * tile2
                            C[I, J] += tile1[i, k] * tile2[k, j]
                        end
                    end
                end
            end
        end
    end
    return nothing
end


function coalesced_matmul_kernel!(ptr_out::Ptr{Cdouble}, ptr_in1::Ptr{Cdouble}, ptr_in2::Ptr{Cdouble}, ptr_N::Ptr{Cint})
    N = unsafe_load(ptr_N)
    dptr_out = reinterpret(Core.LLVMPtr{Cdouble,1}, ptr_out)
    dptr_in1 = reinterpret(Core.LLVMPtr{Cdouble,1}, ptr_in1)
    dptr_in2 = reinterpret(Core.LLVMPtr{Cdouble,1}, ptr_in2)
    output = CuDeviceArray((N,N), dptr_out)
    input1 = CuDeviceArray((N,N), dptr_in1)
    input2 = CuDeviceArray((N,N), dptr_in2)
    gi = blockIdx().x
    gj = blockIdx().y
    i = threadIdx().x
    j = threadIdx().y

    # +1 to avoid bank conflicts on shared memory
    tile1 = @cuStaticSharedMem eltype(output) (TILE_DIM+1, TILE_DIM)
    tile2 = @cuStaticSharedMem eltype(output) (TILE_DIM+1, TILE_DIM)

    outval = zero(eltype(output))

    N = size(output,1)
    NUM_TILES = div(N, TILE_DIM)

    # loop over all tiles needed for this calculation
    for t in 0:NUM_TILES-1
        # Can't use @index(Global), because we use a smaller ndrange
        I = (gi-1) * TILE_DIM + i
        J = (gj-1) * TILE_DIM + j

        # load inputs into tiles
        @inbounds tile1[i, j] = input1[I, t*TILE_DIM+j]
        @inbounds tile2[i, j] = input2[t*TILE_DIM+i, J]

        # wait for all tiles to be loaded
        sync_threads()

        # get global values again
        I = (gi-1) * TILE_DIM + i
        J = (gj-1) * TILE_DIM + j

        # calculate value of spot in output
        for k in 1:TILE_DIM
            @inbounds outval += tile1[i, k] * tile2[k, j]
        end

        sync_threads()
    end

    I = (gi-1) * TILE_DIM + i
    J = (gj-1) * TILE_DIM + j

    @inbounds output[I, J] = outval
    return nothing
end

function mcjob(@nospecialize(func), @nospecialize(types);
               cpu::String = (LLVM.version() < v"8") ? "" : unsafe_string(LLVM.API.LLVMGetHostCPUName()),
               features::String=(LLVM.version() < v"8") ? "" : unsafe_string(LLVM.API.LLVMGetHostCPUFeatures()),
               kwargs...)
    source = FunctionSpec(func, Base.to_tuple_type(types), #=kernel=# false)
    target = NativeCompilerTarget(cpu=cpu, features=features)
    params = CompilerParams()
    CompilerJob(target, source, params), kwargs
end

module MockRuntime
    signal_exception() = return
    malloc(sz) = C_NULL
    report_oom(sz) = return
    report_exception(ex) = return
    report_exception_name(ex) = return
    report_exception_frame(idx, func, file, line) = return
end
struct CompilerParams <: AbstractCompilerParams end
GPUCompiler.runtime_module(::CompilerJob{<:Any,CompilerParams}) = MockRuntime

println("done.")

print("generating cpu binary...")
job, kwargs = mcjob(mul_tile!, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint))
ir, func = GPUCompiler.compile(:llvm, job; kwargs...)
name!(func, "matmul")
GPUCompiler.finish_module!(job, ir)
objfile = "matmul_cpu.o"
tm = GPUCompiler.llvm_machine(job.target)
LLVM.emit(tm, ir, LLVM.API.LLVMObjectFile, objfile)
run(`clang -o matmul_cpu main_cpu.c matmul_cpu.o`)
println("done. saved cpu binary to matmul_cpu")

print("generating gpu binary...")
DIM = 1024
a = CuArray{Float64}(undef, 10)
da = CUDA.cudaconvert(a)
aptr = reinterpret(Ptr{Cdouble}, da.ptr)
b = CuArray{Float64}(undef, 10)
db = CUDA.cudaconvert(b)
bptr = reinterpret(Ptr{Cdouble}, db.ptr)
c = CuArray{Float64}(undef, 10)
dc = CUDA.cudaconvert(c)
cptr = reinterpret(Ptr{Cdouble}, dc.ptr)
nptr = Ptr{Cint}(DIM)
run(`rm -f -r dump`)
CUDA.@device_code dir="dump" @cuda name="matmul" threads=(TILE_DIM, TILE_DIM) blocks=(div(DIM, TILE_DIM), div(DIM, TILE_DIM)) coalesced_matmul_kernel!(cptr, aptr, bptr, nptr)
run(`scp dump/matmul_1.asm matmul_gpu.ptx`)
run(`/usr/local/cuda-11.1/bin/nvcc -L/usr/local/cuda-11.1/lib64 -lcudart -lcuda -lnvrtc -I/usr/local/cuda-11.1/include main_gpu.cpp -o matmul_gpu`)
println("done. saved gpu binary to matmul_gpu")
