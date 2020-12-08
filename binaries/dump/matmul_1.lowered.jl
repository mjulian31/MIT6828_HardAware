CodeInfo(
1 ──        Core.NewvarNode(:(val@_8))
│           Core.NewvarNode(:(I))
│           Core.NewvarNode(:(J))
│    %4   = Core.LLVMPtr
│    %5   = Core.apply_type(%4, Main.Cfloat, 1)
│           dptr_out = Main.reinterpret(%5, ptr_out)
│    %7   = Core.LLVMPtr
│    %8   = Core.apply_type(%7, Main.Cfloat, 1)
│           dptr_in1 = Main.reinterpret(%8, ptr_in1)
│    %10  = Core.LLVMPtr
│    %11  = Core.apply_type(%10, Main.Cfloat, 1)
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
│    %50  = %49 - 1
│           NUM_TILES = Main.div(%50, Main.TILE_DIM)
│    %52  = NUM_TILES - 1
│    %53  = 0:%52
│           @_27 = Base.iterate(%53)
│    %55  = @_27 === nothing
│    %56  = Base.not_int(%55)
└───        goto #19 if not %56
2 ┄─        Core.NewvarNode(:(val@_31))
│           Core.NewvarNode(:(val@_32))
│           Core.NewvarNode(:(val@_33))
│           Core.NewvarNode(:(val@_34))
│           Core.NewvarNode(:(@_35))
│    %63  = @_27
│           t = Core.getfield(%63, 1)
│    %65  = Core.getfield(%63, 2)
│    %66  = gi - 1
│    %67  = %66 * Main.TILE_DIM
│           I = %67 + i
│    %69  = gj - 1
│    %70  = %69 * Main.TILE_DIM
│           J = %70 + j
│    %72  = I <= N
└───        goto #4 if not %72
3 ── %74  = t * Main.TILE_DIM
│    %75  = %74 + j
│           @_38 = %75 <= R
└───        goto #5
4 ──        @_38 = false
5 ┄─        goto #7 if not @_38
6 ──        $(Expr(:inbounds, true))
│    %81  = input1
│    %82  = I
│    %83  = t * Main.TILE_DIM
│    %84  = %83 + j
│    %85  = Base.getindex(%81, %82, %84)
│           Base.setindex!(tile1, %85, i, j)
│           val@_31 = %85
│           $(Expr(:inbounds, :pop))
│           val@_31
└───        goto #8
7 ──        $(Expr(:inbounds, true))
│    %92  = 0.0
│           Base.setindex!(tile1, %92, i, j)
│           val@_32 = %92
│           $(Expr(:inbounds, :pop))
└───        val@_32
8 ┄─ %97  = t * Main.TILE_DIM
│    %98  = %97 + i
│    %99  = %98 <= R
└───        goto #10 if not %99
9 ──        @_39 = J <= M
└───        goto #11
10 ─        @_39 = false
11 ┄        goto #13 if not @_39
12 ─        $(Expr(:inbounds, true))
│    %106 = input2
│    %107 = t * Main.TILE_DIM
│    %108 = %107 + i
│    %109 = Base.getindex(%106, %108, J)
│           Base.setindex!(tile2, %109, i, j)
│           val@_33 = %109
│           $(Expr(:inbounds, :pop))
│           val@_33
└───        goto #14
13 ─        $(Expr(:inbounds, true))
│    %116 = 0.0
│           Base.setindex!(tile2, %116, i, j)
│           val@_34 = %116
│           $(Expr(:inbounds, :pop))
└───        val@_34
14 ┄        Main.sync_threads()
│    %122 = gi - 1
│    %123 = %122 * Main.TILE_DIM
│           I = %123 + i
│    %125 = gj - 1
│    %126 = %125 * Main.TILE_DIM
│           J = %126 + j
│    %128 = 1:Main.TILE_DIM
│           @_35 = Base.iterate(%128)
│    %130 = @_35 === nothing
│    %131 = Base.not_int(%130)
└───        goto #17 if not %131
15 ┄ %133 = @_35
│           k = Core.getfield(%133, 1)
│    %135 = Core.getfield(%133, 2)
│           $(Expr(:inbounds, true))
│    %137 = outval
│    %138 = Base.getindex(tile1, i, k)
│    %139 = Base.getindex(tile2, k, j)
│    %140 = %138 * %139
│    %141 = %137 + %140
│           outval = %141
│           val@_37 = %141
│           $(Expr(:inbounds, :pop))
│           val@_37
│           @_35 = Base.iterate(%128, %135)
│    %147 = @_35 === nothing
│    %148 = Base.not_int(%147)
└───        goto #17 if not %148
16 ─        goto #15
17 ┄        Main.sync_threads()
│           @_27 = Base.iterate(%53, %65)
│    %153 = @_27 === nothing
│    %154 = Base.not_int(%153)
└───        goto #19 if not %154
18 ─        goto #2
19 ┄ %157 = gi - 1
│    %158 = %157 * Main.TILE_DIM
│           I = %158 + i
│    %160 = gj - 1
│    %161 = %160 * Main.TILE_DIM
│           J = %161 + j
│    %163 = I <= N
└───        goto #21 if not %163
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
