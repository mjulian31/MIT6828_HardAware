print("loading packages...")
using LinearAlgebra
using SIMD
# using CUDA
using StaticArrays
using InteractiveUtils
using Base.Threads
# using KernelAbstractions
using LLVM
using GPUCompiler

println("done.")

@show nthreads()

print("loading globals and functions...")
const TILE_DIM = 32

struct CArray{T, N} <: AbstractArray{T, N}
  ptr::Ptr{T}
  dims::NTuple{N, Int}
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


# @kernel function coalesced_matmul_kernel!(output, input1, input2,
#                                              ::Val{BANK}=Val(1)) where BANK
#      gi, gj = @index(Group, NTuple)
#      i, j   = @index(Local, NTuple)
#
#      TILE_DIM = @uniform groupsize()[1]
#
#      # +1 to avoid bank conflicts on shared memory
#      tile1 = @localmem eltype(output) (TILE_DIM+BANK, TILE_DIM)
#      tile2 = @localmem eltype(output) (TILE_DIM+BANK, TILE_DIM)
#
#      outval = @private eltype(output) 1
#      @inbounds outval[1] = -zero(eltype(output))
#
#      @uniform N = size(output,1)
#      @uniform NUM_TILES = div(N, TILE_DIM)
#
#      # loop over all tiles needed for this calculation
#      for t in 0:NUM_TILES-1
#          # Can't use @index(Global), because we use a smaller ndrange
#          I = (gi-1) * TILE_DIM + i
#          J = (gj-1) * TILE_DIM + j
#
#          # load inputs into tiles
#          @inbounds tile1[i, j] = input1[I, t*TILE_DIM+j]
#          @inbounds tile2[i, j] = input2[t*TILE_DIM+i, J]
#
#          # wait for all tiles to be loaded
#          @synchronize
#
#          # get global values again
#          I = (gi-1) * TILE_DIM + i
#          J = (gj-1) * TILE_DIM + j
#
#          # calculate value of spot in output
#          for k in 1:TILE_DIM
#              @inbounds outval[1] += tile1[i, k] * tile2[k, j]
#          end
#
#          @synchronize
#      end
#
#      I = (gi-1) * TILE_DIM + i
#      J = (gj-1) * TILE_DIM + j
#
#      @inbounds output[I, J] = outval[1]
# end

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
@show func
GPUCompiler.finish_module!(job, ir)
objfile = string("cpu_", DIM, ".o")
tm = GPUCompiler.llvm_machine(job.target)
LLVM.emit(tm, ir, LLVM.API.LLVMObjectFile, objfile)

println("done. saved cpu binary to ", objfile)

# print("generating gpu binary...")
#
# a = CUDA.rand(DIM, DIM)
# b = CUDA.rand(DIM, DIM)
# c = CUDA.zeros(DIM, DIM)
# kern = coalesced_matmul_kernel!(CUDADevice(), (TILE_DIM, TILE_DIM))
#
# outfile = string("gpu_", DIM, ".ll")
# open(outfile, "w") do out
#     redirect_stdout(out) do
#         CUDA.@device_code_llvm debuginfo=:none dump_module=true kern(c, a, b, ndrange=size(c))
#     end
# end
# println("done. saved gpu binary to ", outfile)
