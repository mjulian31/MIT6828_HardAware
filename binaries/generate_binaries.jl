print("loading packages...")
using LinearAlgebra
using SIMD
using CUDA
using StaticArrays
using InteractiveUtils
using Base.Threads
using LLVM
using GPUCompiler

println("done.")

@show nthreads()

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


function coalesced_matmul_kernel!(output, input1, input2)
     gi = blockIdx().x
     gj = blockIdx().y
     i = threadIdx().x
     j = threadIdx().y

     # +1 to avoid bank conflicts on shared memory
     tile1 = @shmem eltype(output) (TILE_DIM+1, TILE_DIM)
     tile2 = @shmem eltype(output) (TILE_DIM+1, TILE_DIM)

     outval = eltype(output) 1
     @inbounds outval[1] = -zero(eltype(output))

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
             @inbounds outval[1] += tile1[i, k] * tile2[k, j]
         end

         sync_threads()
     end

     I = (gi-1) * TILE_DIM + i
     J = (gj-1) * TILE_DIM + j

     @inbounds output[I, J] = outval[1]

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

# print("generating cpu binary...")
# job, kwargs = mcjob(mul_tile!, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint))
# ir, func = GPUCompiler.compile(:llvm, job; kwargs...)
# name!(func, "matmul")
# GPUCompiler.finish_module!(job, ir)
# objfile = "cpu.o"
# tm = GPUCompiler.llvm_machine(job.target)
# LLVM.emit(tm, ir, LLVM.API.LLVMObjectFile, objfile)
#
# println("done. saved cpu binary to ", objfile)

print("generating gpu binary...")

DIM = 1024
a = CUDA.rand(DIM, DIM)
b = CUDA.rand(DIM, DIM)
c = CUDA.zeros(DIM, DIM)
@cuda threads=(TILE_DIM, TILE_DIM) blocks=(div(DIM, TILE_DIM), div(DIM, TILE_DIM)) coalesced_matmul_kernel!(c, a, b)

# CUDA.@device_code debuginfo=:none dir="dump" kern(c, a, b, ndrange=size(c))

println("done. saved gpu binary to dump")
