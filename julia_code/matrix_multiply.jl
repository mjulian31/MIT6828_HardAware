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

function mul_tile!(A::Array{T,2}, B::Array{T,2}, C::Array{T,2}, N, R, M) where {T}
    NUM_TILES_ROW = div(N + TILE_DIM - N%TILE_DIM, TILE_DIM)
    NUM_TILES_COL = div(M + TILE_DIM - M%TILE_DIM, TILE_DIM)
    NUM_TILES = div(R + TILE_DIM - R%TILE_DIM, TILE_DIM)

    # loop over all tiles
    @inbounds @simd for gj in 1:NUM_TILES_COL
        @inbounds @simd for gi in 1:NUM_TILES_ROW
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
                        if I <= N && t*TILE_DIM + j <= R
                            tile1[i, j] = A[I, t*TILE_DIM + j]
                        else
                            tile1[i, j] = 0.0
                        end
                        if t*TILE_DIM + i <= R && J <= M
                            tile2[i, j] = B[t*TILE_DIM + i, J]
                        else
                            tile2[i, j] = 0.0
                        end
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
                            if I <= N && J <= M
                                C[I, J] += tile1[i, k] * tile2[k, j]
                            end
                        end
                    end
                end
            end
        end
    end
    return nothing
end


@kernel function coalesced_matmul_kernel!(output, input1, input2,
                                             ::Val{BANK}=Val(1)) where BANK
     gi, gj = @index(Group, NTuple)
     i, j   = @index(Local, NTuple)

     TILE_DIM = @uniform groupsize()[1]

     # +1 to avoid bank conflicts on shared memory
     tile1 = @localmem eltype(output) (TILE_DIM+BANK, TILE_DIM)
     tile2 = @localmem eltype(output) (TILE_DIM+BANK, TILE_DIM)

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
             @inbounds outval[1] += tile1[i, k] * tile2[k, j]
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

println("tile mul")
a = rand(DIM, DIM)
b = rand(DIM, DIM)
c = zeros(DIM, DIM)
@btime mul_tile!($a, $b, c) setup=(c = zeros(DIM, DIM))
c = zeros(DIM, DIM)
mul_tile!(a, b, c)
@show isapprox(a*b, c)

#println("kernel mul")
#a = rand(DIM, DIM)
#b = rand(DIM, DIM)
#c = zeros(DIM, DIM)
#kern = coalesced_matmul_kernel!(CPU(), (TILE_DIM, TILE_DIM))
#@btime wait(kern(c, $a, $b, ndrange=size(c))) setup=(c = zeros(DIM, DIM))
#wait(kern(c, a, b, ndrange=size(c)))
#@show isapprox(a*b, c)

#println("gpu kernel mul")
#a = CUDA.rand(DIM, DIM)
#b = CUDA.rand(DIM, DIM)
#c = CUDA.zeros(DIM, DIM)
#kern = coalesced_matmul_kernel!(CUDADevice(), (TILE_DIM, TILE_DIM))
#wait(kern(c, a, b, ndrange=size(c)))
#@show isapprox(a*b, c)
