using SIMD
using BenchmarkTools
using LinearAlgebra
using KernelAbstractions
using Base.Threads
using StaticArrays
using InteractiveUtils
using CUDA

const TILE_DIM = 32
@show nthreads()
@show CUDA.version()


function mul!(A::Array{T,2}, B::Array{T,2}, C::Array{T,2}, ::Type{Vec{N,T}}) where {N, T}
    @assert size(B,1) == size(A,2)
    @assert size(A,1) == size(C,1)
    @assert size(B,2) == size(C,2)
    @assert size(C,1) % N == 0
    # @assert size(C,2) % M == 0
    # lane1 = VecRange{N}(0)
    # lane2 = VecRange{M}(0)
    @inbounds for j in 1:1:size(C)[2]
        @simd for k in 1:1:size(A)[2]
            @simd for i in 1:1:size(C)[1]
                C[i, j] += A[i, k] * B[k, j]
            end
        end
    end
end

function mul_nonvec!(A::Array{T,2}, B::Array{T,2}, C::Array{T,2}) where {T}
    @assert size(B,1) == size(A,2)
    @assert size(A,1) == size(C,1)
    @assert size(B,2) == size(C,2)
    @assert size(B) == size(A) == size(C)
    @inbounds for j in 1:1:size(C)[2]
        for k in 1:1:size(A)[2]
            for i in 1:1:size(C)[1]
                C[i, j] += A[i, k] * B[k, j]
            end
        end
    end
end


function mul_tile!(A::Array{T,2}, B::Array{T,2}, C::Array{T,2}) where {T}
    @assert size(B,1) == size(A,2)
    @assert size(A,1) == size(C,1)
    @assert size(B,2) == size(C,2)
    @assert size(B) == size(A) == size(C)
    # assuming square matrix
    N = size(C)[1]
    NUM_TILES = Int(N/TILE_DIM)

    # loop over all tiles
    @inbounds @threads for gj in 1:NUM_TILES
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
end


@kernel function coalesced_matmul_kernel!(output, @Const(input1), @Const(input2),
                                             ::Val{BANK}=Val(1)) where BANK
     gi, gj = @index(Group, NTuple)
     i, j   = @index(Local, NTuple)

     TILE_DIM = @uniform groupsize()[1]

     # +1 to avoid bank conflicts on shared memory
     tile1 = @localmem eltype(output) (TILE_DIM+BANK, TILE_DIM)
     tile2 = @localmem eltype(output) (TILE_DIM+BANK, TILE_DIM)

     # tile1[:] = NaN
     # tile2[:] = NaN

     outval = @private eltype(output) 1
     @inbounds outval[1] = -zero(eltype(output))

     @uniform N = size(output,1)
     @uniform NUM_TILES = div(N, TILE_DIM)

     # loop over all tiles needed for this calculation
     for t in 0:NUM_TILES-1
         # Can't use @index(Global), because we use a smaller ndrange
         I = (gi-1) * TILE_DIM + i
         J = (gj-1) * TILE_DIM + j

         # load inputs into tiles
         @inbounds tile1[i, j] = input1[I, t*TILE_DIM+j]
         @inbounds tile2[i, j] = input2[t*TILE_DIM+i, J]

         # wait for all tiles to be loaded
         @synchronize

         # get global values again
         I = (gi-1) * TILE_DIM + i
         J = (gj-1) * TILE_DIM + j

         # calculate value of spot in output
         for k in 1:TILE_DIM
             # isnan(tile1[i, k]) && @print("nan at tile", t)
             # isnan(tile2[k, j]) && @print("nan at tile", t)
             @inbounds outval[1] += tile1[i, k] * tile2[k, j]
             # isnan(outval[1]) && @print("nan at outval", t)
         end

         @synchronize
     end

     I = (gi-1) * TILE_DIM + i
     J = (gj-1) * TILE_DIM + j

     @inbounds output[I, J] = outval[1]
end


# benchmark versions

const DIM = 1024
@show DIM

# println("normal mul")
# a = rand(DIM, DIM)
# b = rand(DIM, DIM)
# c = zeros(DIM, DIM)
# @btime LinearAlgebra.mul!(c, $a, $b) setup=(c = zeros(DIM, DIM))
# LinearAlgebra.mul!(c, a, b)
# @show isapprox(a*b, c)
# # 45 ms for 1024x1024
# # 28.769 s for 8192x8192

# println("non vector mul")
# a = rand(DIM, DIM)
# b = rand(DIM, DIM)
# c = zeros(DIM, DIM)
# @btime mul_nonvec!($a, $b, c) setup=(c = zeros(DIM, DIM))
# mul_nonvec!(a, b, c)
# @show isapprox(a*b, c)
# # 450 ms for 1024x1024
# # 348.518 s for 8192x8192
#
# println("vector mul")
# a = rand(DIM, DIM)
# b = rand(DIM, DIM)
# c = zeros(DIM, DIM)
# @btime mul!($a, $b, c, Vec{32, Float64}) setup=(c = zeros(DIM, DIM))
# mul!(a, b, c, Vec{32, Float64})
# @show isapprox(a*b, c)
# # 450 ms for 1024x1024
# # should be similar to non vector mul for 8192x8192 (auto-vectorizes)

println("tile mul")
a = rand(DIM, DIM)
b = rand(DIM, DIM)
c = zeros(DIM, DIM)
# @btime mul_tile!($a, $b, c) setup=(c = zeros(DIM, DIM))
c = zeros(DIM, DIM)
mul_tile!(a, b, c)
@show isapprox(a*b, c)

println("kernel mul")
a = rand(DIM, DIM)
b = rand(DIM, DIM)
c = zeros(DIM, DIM)
kern = coalesced_matmul_kernel!(CPU(), (TILE_DIM, TILE_DIM))
# @btime wait(kern(c, $a, $b, ndrange=size(c))) setup=(c = zeros(DIM, DIM))
wait(kern(c, a, b, ndrange=size(c)))
@show isapprox(a*b, c)

println("gpu kernel mul")
a = CUDA.rand(DIM, DIM)
b = CUDA.rand(DIM, DIM)
c = CUDA.zeros(DIM, DIM)
kern = coalesced_matmul_kernel!(CUDADevice(), (TILE_DIM, TILE_DIM))
wait(kern(c, a, b, ndrange=size(c)))
@show isapprox(a*b, c)
