CodeInfo(
1 ─        N@_34 = N@_5
│          Core.NewvarNode(:(val@_6))
│          Core.NewvarNode(:(I))
│          Core.NewvarNode(:(J))
│   %5   = Core.LLVMPtr
│   %6   = Core.apply_type(%5, Main.Cdouble, 1)
│          dptr_out = Main.reinterpret(%6, ptr_out)
│   %8   = Core.LLVMPtr
│   %9   = Core.apply_type(%8, Main.Cdouble, 1)
│          dptr_in1 = Main.reinterpret(%9, ptr_in1)
│   %11  = Core.LLVMPtr
│   %12  = Core.apply_type(%11, Main.Cdouble, 1)
│          dptr_in2 = Main.reinterpret(%12, ptr_in2)
│   %14  = Core.tuple(N@_34, N@_34)
│          output = Main.CuDeviceArray(%14, dptr_out)
│   %16  = Core.tuple(N@_34, N@_34)
│          input1 = Main.CuDeviceArray(%16, dptr_in1)
│   %18  = Core.tuple(N@_34, N@_34)
│          input2 = Main.CuDeviceArray(%18, dptr_in2)
│   %20  = Main.blockIdx()
│          gi = Base.getproperty(%20, :x)
│   %22  = Main.blockIdx()
│          gj = Base.getproperty(%22, :y)
│   %24  = Main.threadIdx()
│          i = Base.getproperty(%24, :x)
│   %26  = Main.threadIdx()
│          j = Base.getproperty(%26, :y)
│   %28  = Main.TILE_DIM + 1
│   %29  = Core.tuple(%28, Main.TILE_DIM)
│          len@_17 = CUDA.prod(%29)
│   %31  = CUDA.Val(Symbol("##static_shmem#285"))
│   %32  = Main.eltype(output)
│   %33  = CUDA.Val(len@_17)
│          ptr@_18 = CUDA.emit_shmem(%31, %32, %33)
│   %35  = Main.TILE_DIM + 1
│   %36  = Core.tuple(%35, Main.TILE_DIM)
│          tile1 = CUDA.CuDeviceArray(%36, ptr@_18)
│   %38  = Main.TILE_DIM + 1
│   %39  = Core.tuple(%38, Main.TILE_DIM)
│          len@_20 = CUDA.prod(%39)
│   %41  = CUDA.Val(Symbol("##static_shmem#286"))
│   %42  = Main.eltype(output)
│   %43  = CUDA.Val(len@_20)
│          ptr@_21 = CUDA.emit_shmem(%41, %42, %43)
│   %45  = Main.TILE_DIM + 1
│   %46  = Core.tuple(%45, Main.TILE_DIM)
│          tile2 = CUDA.CuDeviceArray(%46, ptr@_21)
│   %48  = Main.eltype(output)
│          outval = Main.zero(%48)
│          N@_34 = Main.size(output, 1)
│          NUM_TILES = Main.div(N@_34, Main.TILE_DIM)
│   %52  = NUM_TILES - 1
│   %53  = 0:%52
│          @_25 = Base.iterate(%53)
│   %55  = @_25 === nothing
│   %56  = Base.not_int(%55)
└──        goto #7 if not %56
2 ┄ %58  = @_25
│          t = Core.getfield(%58, 1)
│   %60  = Core.getfield(%58, 2)
│   %61  = gi - 1
│   %62  = %61 * Main.TILE_DIM
│          I = %62 + i
│   %64  = gj - 1
│   %65  = %64 * Main.TILE_DIM
│          J = %65 + j
│          $(Expr(:inbounds, true))
│   %68  = input1
│   %69  = I
│   %70  = t * Main.TILE_DIM
│   %71  = %70 + j
│   %72  = Base.getindex(%68, %69, %71)
│          Base.setindex!(tile1, %72, i, j)
│          val@_29 = %72
│          $(Expr(:inbounds, :pop))
│          val@_29
│          $(Expr(:inbounds, true))
│   %78  = input2
│   %79  = t * Main.TILE_DIM
│   %80  = %79 + i
│   %81  = Base.getindex(%78, %80, J)
│          Base.setindex!(tile2, %81, i, j)
│          val@_30 = %81
│          $(Expr(:inbounds, :pop))
│          val@_30
│          Main.sync_threads()
│   %87  = gi - 1
│   %88  = %87 * Main.TILE_DIM
│          I = %88 + i
│   %90  = gj - 1
│   %91  = %90 * Main.TILE_DIM
│          J = %91 + j
│   %93  = 1:Main.TILE_DIM
│          @_31 = Base.iterate(%93)
│   %95  = @_31 === nothing
│   %96  = Base.not_int(%95)
└──        goto #5 if not %96
3 ┄ %98  = @_31
│          k = Core.getfield(%98, 1)
│   %100 = Core.getfield(%98, 2)
│          $(Expr(:inbounds, true))
│   %102 = outval
│   %103 = Base.getindex(tile1, i, k)
│   %104 = Base.getindex(tile2, k, j)
│   %105 = %103 * %104
│   %106 = %102 + %105
│          outval = %106
│          val@_33 = %106
│          $(Expr(:inbounds, :pop))
│          val@_33
│          @_31 = Base.iterate(%93, %100)
│   %112 = @_31 === nothing
│   %113 = Base.not_int(%112)
└──        goto #5 if not %113
4 ─        goto #3
5 ┄        Main.sync_threads()
│          @_25 = Base.iterate(%53, %60)
│   %118 = @_25 === nothing
│   %119 = Base.not_int(%118)
└──        goto #7 if not %119
6 ─        goto #2
7 ┄ %122 = gi - 1
│   %123 = %122 * Main.TILE_DIM
│          I = %123 + i
│   %125 = gj - 1
│   %126 = %125 * Main.TILE_DIM
│          J = %126 + j
│          $(Expr(:inbounds, true))
│          Base.setindex!(output, outval, I, J)
│          val@_6 = outval
│          $(Expr(:inbounds, :pop))
│          val@_6
└──        return Main.nothing
)
