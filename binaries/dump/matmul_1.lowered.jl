CodeInfo(
1 ──        Core.NewvarNode(:(val@_8))
│           Core.NewvarNode(:(I))
│           Core.NewvarNode(:(J))
│    %4   = Core.LLVMPtr
│    %5   = Core.apply_type(%4, Main.Cdouble, 1)
│           dptr_out = Main.reinterpret(%5, ptr_out)
│    %7   = Core.LLVMPtr
│    %8   = Core.apply_type(%7, Main.Cdouble, 1)
│           dptr_in1 = Main.reinterpret(%8, ptr_in1)
│    %10  = Core.LLVMPtr
│    %11  = Core.apply_type(%10, Main.Cdouble, 1)
│           dptr_in2 = Main.reinterpret(%11, ptr_in2)
│    %13  = Core.tuple(N, M)
│           output = Main.CuDeviceArray(%13, dptr_out)
│    %15  = Core.tuple(N, R)
│           input1 = Main.CuDeviceArray(%15, dptr_in1)
│    %17  = Core.tuple(R, M)
│           input2 = Main.CuDeviceArray(%17, dptr_in2)
│    %19  = Main.blockIdx()
│           gi = Base.getproperty(%19, :x)
│    %21  = Main.blockIdx()
│           gj = Base.getproperty(%21, :y)
│    %23  = Main.threadIdx()
│           i = Base.getproperty(%23, :x)
│    %25  = Main.threadIdx()
│           j = Base.getproperty(%25, :y)
│    %27  = Main.TILE_DIM + 1
│    %28  = Core.tuple(%27, Main.TILE_DIM)
│           len@_19 = CUDA.prod(%28)
│    %30  = CUDA.Val(Symbol("##static_shmem#285"))
│    %31  = Main.eltype(output)
│    %32  = CUDA.Val(len@_19)
│           ptr@_20 = CUDA.emit_shmem(%30, %31, %32)
│    %34  = Main.TILE_DIM + 1
│    %35  = Core.tuple(%34, Main.TILE_DIM)
│           tile1 = CUDA.CuDeviceArray(%35, ptr@_20)
│    %37  = Main.TILE_DIM + 1
│    %38  = Core.tuple(%37, Main.TILE_DIM)
│           len@_22 = CUDA.prod(%38)
│    %40  = CUDA.Val(Symbol("##static_shmem#286"))
│    %41  = Main.eltype(output)
│    %42  = CUDA.Val(len@_22)
│           ptr@_23 = CUDA.emit_shmem(%40, %41, %42)
│    %44  = Main.TILE_DIM + 1
│    %45  = Core.tuple(%44, Main.TILE_DIM)
│           tile2 = CUDA.CuDeviceArray(%45, ptr@_23)
│    %47  = Main.eltype(output)
│           outval = Main.zero(%47)
│    %49  = R + Main.TILE_DIM
│    %50  = R % Main.TILE_DIM
│    %51  = %49 - %50
│           NUM_TILES = Main.div(%51, Main.TILE_DIM)
│    %53  = NUM_TILES - 1
│    %54  = 0:%53
│           @_27 = Base.iterate(%54)
│    %56  = @_27 === nothing
│    %57  = Base.not_int(%56)
└───        goto #19 if not %57
2 ┄─        Core.NewvarNode(:(val@_31))
│           Core.NewvarNode(:(val@_32))
│           Core.NewvarNode(:(val@_33))
│           Core.NewvarNode(:(val@_34))
│           Core.NewvarNode(:(@_35))
│    %64  = @_27
│           t = Core.getfield(%64, 1)
│    %66  = Core.getfield(%64, 2)
│    %67  = gi - 1
│    %68  = %67 * Main.TILE_DIM
│           I = %68 + i
│    %70  = gj - 1
│    %71  = %70 * Main.TILE_DIM
│           J = %71 + j
│    %73  = I <= N
└───        goto #4 if not %73
3 ── %75  = t * Main.TILE_DIM
│    %76  = %75 + j
│           @_38 = %76 <= R
└───        goto #5
4 ──        @_38 = false
5 ┄─        goto #7 if not @_38
6 ──        $(Expr(:inbounds, true))
│    %82  = input1
│    %83  = I
│    %84  = t * Main.TILE_DIM
│    %85  = %84 + j
│    %86  = Base.getindex(%82, %83, %85)
│           Base.setindex!(tile1, %86, i, j)
│           val@_31 = %86
│           $(Expr(:inbounds, :pop))
│           val@_31
└───        goto #8
7 ──        $(Expr(:inbounds, true))
│    %93  = 0.0
│           Base.setindex!(tile1, %93, i, j)
│           val@_32 = %93
│           $(Expr(:inbounds, :pop))
└───        val@_32
8 ┄─ %98  = t * Main.TILE_DIM
│    %99  = %98 + i
│    %100 = %99 <= R
└───        goto #10 if not %100
9 ──        @_39 = J <= M
└───        goto #11
10 ─        @_39 = false
11 ┄        goto #13 if not @_39
12 ─        $(Expr(:inbounds, true))
│    %107 = input2
│    %108 = t * Main.TILE_DIM
│    %109 = %108 + i
│    %110 = Base.getindex(%107, %109, J)
│           Base.setindex!(tile2, %110, i, j)
│           val@_33 = %110
│           $(Expr(:inbounds, :pop))
│           val@_33
└───        goto #14
13 ─        $(Expr(:inbounds, true))
│    %117 = 0.0
│           Base.setindex!(tile2, %117, i, j)
│           val@_34 = %117
│           $(Expr(:inbounds, :pop))
└───        val@_34
14 ┄        Main.sync_threads()
│    %123 = gi - 1
│    %124 = %123 * Main.TILE_DIM
│           I = %124 + i
│    %126 = gj - 1
│    %127 = %126 * Main.TILE_DIM
│           J = %127 + j
│    %129 = 1:Main.TILE_DIM
│           @_35 = Base.iterate(%129)
│    %131 = @_35 === nothing
│    %132 = Base.not_int(%131)
└───        goto #17 if not %132
15 ┄ %134 = @_35
│           k = Core.getfield(%134, 1)
│    %136 = Core.getfield(%134, 2)
│           $(Expr(:inbounds, true))
│    %138 = outval
│    %139 = Base.getindex(tile1, i, k)
│    %140 = Base.getindex(tile2, k, j)
│    %141 = %139 * %140
│    %142 = %138 + %141
│           outval = %142
│           val@_37 = %142
│           $(Expr(:inbounds, :pop))
│           val@_37
│           @_35 = Base.iterate(%129, %136)
│    %148 = @_35 === nothing
│    %149 = Base.not_int(%148)
└───        goto #17 if not %149
16 ─        goto #15
17 ┄        Main.sync_threads()
│           @_27 = Base.iterate(%54, %66)
│    %154 = @_27 === nothing
│    %155 = Base.not_int(%154)
└───        goto #19 if not %155
18 ─        goto #2
19 ┄ %158 = gi - 1
│    %159 = %158 * Main.TILE_DIM
│           I = %159 + i
│    %161 = gj - 1
│    %162 = %161 * Main.TILE_DIM
│           J = %162 + j
│    %164 = I <= N
└───        goto #21 if not %164
20 ─        @_40 = J <= M
└───        goto #22
21 ─        @_40 = false
22 ┄        goto #24 if not @_40
23 ─        $(Expr(:inbounds, true))
│           Base.setindex!(output, outval, I, J)
│           val@_8 = outval
│           $(Expr(:inbounds, :pop))
└───        val@_8
24 ┄        return Main.nothing
)
