CodeInfo(
1 ──        Core.NewvarNode(:(val@_8))
│           Core.NewvarNode(:(add))
│           Core.NewvarNode(:(NUM_TILES))
│           Core.NewvarNode(:(@_29))
│           Core.NewvarNode(:(I))
│           Core.NewvarNode(:(J))
│    %7   = Core.LLVMPtr
│    %8   = Core.apply_type(%7, Main.Cdouble, 1)
│           dptr_out = Main.reinterpret(%8, ptr_out)
│    %10  = Core.LLVMPtr
│    %11  = Core.apply_type(%10, Main.Cdouble, 1)
│           dptr_in1 = Main.reinterpret(%11, ptr_in1)
│    %13  = Core.LLVMPtr
│    %14  = Core.apply_type(%13, Main.Cdouble, 1)
│           dptr_in2 = Main.reinterpret(%14, ptr_in2)
│    %16  = Core.tuple(N, M)
│           output = Main.CuDeviceArray(%16, dptr_out)
│    %18  = Core.tuple(N, R)
│           input1 = Main.CuDeviceArray(%18, dptr_in1)
│    %20  = Core.tuple(R, M)
│           input2 = Main.CuDeviceArray(%20, dptr_in2)
│    %22  = Main.blockIdx()
│           gi = Base.getproperty(%22, :x)
│    %24  = Main.blockIdx()
│           gj = Base.getproperty(%24, :y)
│    %26  = Main.threadIdx()
│           i = Base.getproperty(%26, :x)
│    %28  = Main.threadIdx()
│           j = Base.getproperty(%28, :y)
│    %30  = Main.TILE_DIM + 1
│    %31  = Core.tuple(%30, Main.TILE_DIM)
│           len@_19 = CUDA.prod(%31)
│    %33  = CUDA.Val(Symbol("##static_shmem#285"))
│    %34  = Main.eltype(output)
│    %35  = CUDA.Val(len@_19)
│           ptr@_20 = CUDA.emit_shmem(%33, %34, %35)
│    %37  = Main.TILE_DIM + 1
│    %38  = Core.tuple(%37, Main.TILE_DIM)
│           tile1 = CUDA.CuDeviceArray(%38, ptr@_20)
│    %40  = Main.TILE_DIM + 1
│    %41  = Core.tuple(%40, Main.TILE_DIM)
│           len@_22 = CUDA.prod(%41)
│    %43  = CUDA.Val(Symbol("##static_shmem#286"))
│    %44  = Main.eltype(output)
│    %45  = CUDA.Val(len@_22)
│           ptr@_23 = CUDA.emit_shmem(%43, %44, %45)
│    %47  = Main.TILE_DIM + 1
│    %48  = Core.tuple(%47, Main.TILE_DIM)
│           tile2 = CUDA.CuDeviceArray(%48, ptr@_23)
│    %50  = Main.eltype(output)
│           outval = Main.zero(%50)
│           maxdim = Main.max(N, R, M)
│    %53  = maxdim % Main.TILE_DIM
│    %54  = %53 == 0
└───        goto #3 if not %54
2 ──        @_40 = 0
└───        goto #4
3 ──        @_40 = Main.TILE_DIM
4 ┄─        add = @_40
│    %60  = maxdim + add
│           NUM_TILES = Main.div(%60, Main.TILE_DIM)
│    %62  = NUM_TILES - 1
│    %63  = 0:%62
│           @_29 = Base.iterate(%63)
│    %65  = @_29 === nothing
│    %66  = Base.not_int(%65)
└───        goto #22 if not %66
5 ┄─        Core.NewvarNode(:(val@_33))
│           Core.NewvarNode(:(val@_34))
│           Core.NewvarNode(:(val@_35))
│           Core.NewvarNode(:(val@_36))
│           Core.NewvarNode(:(@_37))
│    %73  = @_29
│           t = Core.getfield(%73, 1)
│    %75  = Core.getfield(%73, 2)
│    %76  = gi - 1
│    %77  = %76 * Main.TILE_DIM
│           I = %77 + i
│    %79  = gj - 1
│    %80  = %79 * Main.TILE_DIM
│           J = %80 + j
│    %82  = I <= N
└───        goto #7 if not %82
6 ── %84  = t * Main.TILE_DIM
│    %85  = %84 + j
│           @_41 = %85 <= R
└───        goto #8
7 ──        @_41 = false
8 ┄─        goto #10 if not @_41
9 ──        $(Expr(:inbounds, true))
│    %91  = input1
│    %92  = I
│    %93  = t * Main.TILE_DIM
│    %94  = %93 + j
│    %95  = Base.getindex(%91, %92, %94)
│           Base.setindex!(tile1, %95, i, j)
│           val@_33 = %95
│           $(Expr(:inbounds, :pop))
│           val@_33
└───        goto #11
10 ─        $(Expr(:inbounds, true))
│    %102 = 0.0
│           Base.setindex!(tile1, %102, i, j)
│           val@_34 = %102
│           $(Expr(:inbounds, :pop))
└───        val@_34
11 ┄ %107 = t * Main.TILE_DIM
│    %108 = %107 + i
│    %109 = %108 <= R
└───        goto #13 if not %109
12 ─        @_42 = J <= M
└───        goto #14
13 ─        @_42 = false
14 ┄        goto #16 if not @_42
15 ─        $(Expr(:inbounds, true))
│    %116 = input2
│    %117 = t * Main.TILE_DIM
│    %118 = %117 + i
│    %119 = Base.getindex(%116, %118, J)
│           Base.setindex!(tile2, %119, i, j)
│           val@_35 = %119
│           $(Expr(:inbounds, :pop))
│           val@_35
└───        goto #17
16 ─        $(Expr(:inbounds, true))
│    %126 = 0.0
│           Base.setindex!(tile2, %126, i, j)
│           val@_36 = %126
│           $(Expr(:inbounds, :pop))
└───        val@_36
17 ┄        Main.sync_threads()
│    %132 = gi - 1
│    %133 = %132 * Main.TILE_DIM
│           I = %133 + i
│    %135 = gj - 1
│    %136 = %135 * Main.TILE_DIM
│           J = %136 + j
│    %138 = 1:Main.TILE_DIM
│           @_37 = Base.iterate(%138)
│    %140 = @_37 === nothing
│    %141 = Base.not_int(%140)
└───        goto #20 if not %141
18 ┄ %143 = @_37
│           k = Core.getfield(%143, 1)
│    %145 = Core.getfield(%143, 2)
│           $(Expr(:inbounds, true))
│    %147 = outval
│    %148 = Base.getindex(tile1, i, k)
│    %149 = Base.getindex(tile2, k, j)
│    %150 = %148 * %149
│    %151 = %147 + %150
│           outval = %151
│           val@_39 = %151
│           $(Expr(:inbounds, :pop))
│           val@_39
│           @_37 = Base.iterate(%138, %145)
│    %157 = @_37 === nothing
│    %158 = Base.not_int(%157)
└───        goto #20 if not %158
19 ─        goto #18
20 ┄        Main.sync_threads()
│           @_29 = Base.iterate(%63, %75)
│    %163 = @_29 === nothing
│    %164 = Base.not_int(%163)
└───        goto #22 if not %164
21 ─        goto #5
22 ┄ %167 = gi - 1
│    %168 = %167 * Main.TILE_DIM
│           I = %168 + i
│    %170 = gj - 1
│    %171 = %170 * Main.TILE_DIM
│           J = %171 + j
│    %173 = I <= N
└───        goto #24 if not %173
23 ─        @_43 = J <= M
└───        goto #25
24 ─        @_43 = false
25 ┄        goto #27 if not @_43
26 ─        $(Expr(:inbounds, true))
│           Base.setindex!(output, outval, I, J)
│           val@_8 = outval
│           $(Expr(:inbounds, :pop))
└───        val@_8
27 ┄        return Main.nothing
)
