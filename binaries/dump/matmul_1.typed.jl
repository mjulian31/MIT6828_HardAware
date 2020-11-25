CodeInfo(
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:90 within `coalesced_matmul_kernel!'
     ┌ @ essentials.jl:414 within `reinterpret'
1 ───│ %1   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_out)::Core.LLVMPtr{Float64,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:91 within `coalesced_matmul_kernel!'
│    ┌ @ essentials.jl:414 within `reinterpret'
│    │ %2   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_in1)::Core.LLVMPtr{Float64,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:92 within `coalesced_matmul_kernel!'
│    ┌ @ essentials.jl:414 within `reinterpret'
│    │ %3   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_in2)::Core.LLVMPtr{Float64,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:93 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
│    │┌ @ broadcast.jl:837 within `materialize'
│    ││┌ @ broadcast.jl:1046 within `copy'
│    │││┌ @ ntuple.jl:42 within `ntuple'
│    ││││┌ @ broadcast.jl:1046 within `#19'
│    │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %4   = Core.sext_int(Core.Int64, N)::Int64
│    ││││││└└└
│    ││││││ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %5   = Core.sext_int(Core.Int64, N)::Int64
│    ││││└└└└└
│    ││││ %6   = Core.tuple(%4, %5)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %7   = %new(CuDeviceArray{Float64,2,1}, %6, %1)::CuDeviceArray{Float64,2,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:94 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
│    │┌ @ broadcast.jl:837 within `materialize'
│    ││┌ @ broadcast.jl:1046 within `copy'
│    │││┌ @ ntuple.jl:42 within `ntuple'
│    ││││┌ @ broadcast.jl:1046 within `#19'
│    │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %8   = Core.sext_int(Core.Int64, N)::Int64
│    ││││││└└└
│    ││││││ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %9   = Core.sext_int(Core.Int64, N)::Int64
│    ││││└└└└└
│    ││││ %10  = Core.tuple(%8, %9)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %11  = %new(CuDeviceArray{Float64,2,1}, %10, %2)::CuDeviceArray{Float64,2,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:95 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
│    │┌ @ broadcast.jl:837 within `materialize'
│    ││┌ @ broadcast.jl:1046 within `copy'
│    │││┌ @ ntuple.jl:42 within `ntuple'
│    ││││┌ @ broadcast.jl:1046 within `#19'
│    │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %12  = Core.sext_int(Core.Int64, N)::Int64
│    ││││││└└└
│    ││││││ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %13  = Core.sext_int(Core.Int64, N)::Int64
│    ││││└└└└└
│    ││││ %14  = Core.tuple(%12, %13)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %15  = %new(CuDeviceArray{Float64,2,1}, %14, %3)::CuDeviceArray{Float64,2,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %16  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %17  = (%16)($(QuoteNode(Ptr{Nothing} @0x0000000000e8d318)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %18  = Core.zext_int(Core.Int64, %17)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %19  = Base.add_int(%18, 1)::Int64
│    │└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %20  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%20)($(QuoteNode(Ptr{Nothing} @0x0000000001bc65f8)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %22  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%22)($(QuoteNode(Ptr{Nothing} @0x0000000003f77758)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:97 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %24  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%24)($(QuoteNode(Ptr{Nothing} @0x0000000000e8d318)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %26  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %27  = (%26)($(QuoteNode(Ptr{Nothing} @0x0000000001bc65f8)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %28  = Core.zext_int(Core.Int64, %27)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %29  = Base.add_int(%28, 1)::Int64
│    │└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %30  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%30)($(QuoteNode(Ptr{Nothing} @0x0000000003f77758)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %32  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %33  = (%32)($(QuoteNode(Ptr{Nothing} @0x0000000001fed6f8)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %34  = Core.zext_int(Core.Int64, %33)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %35  = Base.add_int(%34, 1)::Int64
│    │└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %36  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%36)($(QuoteNode(Ptr{Nothing} @0x0000000002b3db98)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %38  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%38)($(QuoteNode(Ptr{Nothing} @0x00000000020c1978)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %40  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%40)($(QuoteNode(Ptr{Nothing} @0x0000000001fed6f8)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %42  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %43  = (%42)($(QuoteNode(Ptr{Nothing} @0x0000000002b3db98)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %44  = Core.zext_int(Core.Int64, %43)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %45  = Base.add_int(%44, 1)::Int64
│    │└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %46  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%46)($(QuoteNode(Ptr{Nothing} @0x00000000020c1978)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:102 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    │││ %48  = Base.llvmcall::Core.IntrinsicFunction
│    │││ %49  = (%48)($(QuoteNode(Ptr{Nothing} @0x000000000406f0c8)), Core.LLVMPtr{Float64,3}, Tuple{})::Core.LLVMPtr{Float64,3}
│    │└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    ││ %50  = %new(CuDeviceArray{Float64,2,3}, (33, 32), %49)::CuDeviceArray{Float64,2,3}
│    └└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:103 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    │││ %51  = Base.llvmcall::Core.IntrinsicFunction
│    │││ %52  = (%51)($(QuoteNode(Ptr{Nothing} @0x000000000243f868)), Core.LLVMPtr{Float64,3}, Tuple{})::Core.LLVMPtr{Float64,3}
│    │└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    ││ %53  = %new(CuDeviceArray{Float64,2,3}, (33, 32), %52)::CuDeviceArray{Float64,2,3}
│    └└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:107 within `coalesced_matmul_kernel!'
│    ┌ @ operators.jl:538 within `max' @ promotion.jl:409
│    │┌ @ int.jl:82 within `<'
│    ││ %54  = Base.slt_int(R, N)::Bool
│    │└
│    │ %55  = Base.ifelse(%54, N, R)::Int32
│    │┌ @ int.jl:82 within `<'
│    ││ %56  = Base.slt_int(M, %55)::Bool
│    │└
│    │ %57  = Base.ifelse(%56, %55, M)::Int32
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:108 within `coalesced_matmul_kernel!'
│    ┌ @ promotion.jl:352 within `rem'
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %58  = Core.sext_int(Core.Int64, %57)::Int64
│    │└└└└└
│    │ @ promotion.jl:352 within `rem' @ int.jl:261
│    │ %59  = Base.checked_srem_int(%58, 32)::Int64
│    └
│    ┌ @ promotion.jl:398 within `=='
│    │ %60  = (%59 === 0)::Bool
│    └
└────        goto #3 if not %60
2 ───        goto #4
3 ─── %63  = Main.TILE_DIM::Core.Compiler.Const(32, false)
4 ┄── %64  = φ (#2 => 0, #3 => %63)::Int64
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:920 within `+'
│    │┌ @ int.jl:476 within `rem'
│    ││ %65  = Base.sext_int(Int64, %57)::Int64
│    │└
│    │ @ int.jl:922 within `+' @ int.jl:86
│    │ %66  = Base.add_int(%65, %64)::Int64
│    └
│     %67  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:260 within `div'
│    │ %68  = Base.checked_sdiv_int(%66, %67)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %69  = Base.sub_int(%68, 1)::Int64
│    └
│    ┌ @ range.jl:5 within `Colon'
│    │┌ @ range.jl:280 within `UnitRange'
│    ││┌ @ range.jl:285 within `unitrange_last'
│    │││┌ @ operators.jl:350 within `>='
│    ││││┌ @ int.jl:441 within `<='
│    │││││ %70  = Base.sle_int(0, %69)::Bool
│    │││└└
│    │││ %71  = Base.ifelse(%70, %69, -1)::Int64
│    └└└
│    ┌ @ range.jl:620 within `iterate'
│    │┌ @ range.jl:503 within `isempty'
│    ││┌ @ operators.jl:303 within `>'
│    │││┌ @ int.jl:82 within `<'
│    ││││ %72  = Base.slt_int(%71, 0)::Bool
│    │└└└
└────│        goto #6 if not %72
5 ───│        goto #7
6 ───│        goto #7
     └
7 ┄── %76  = φ (#5 => true, #6 => false)::Bool
│     %77  = φ (#6 => 0)::Int64
│     %78  = φ (#6 => 0)::Int64
│     %79  = Base.not_int(%76)::Bool
└────        goto #143 if not %79
8 ┄── %81  = φ (#7 => 0.0, #142 => %512)::Float64
│     %82  = φ (#7 => %77, #142 => %519)::Int64
│     %83  = φ (#7 => %78, #142 => %520)::Int64
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:114 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %84  = Base.sub_int(%19, 1)::Int64
│    └
│     %85  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %86  = Base.mul_int(%84, %85)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %87  = Base.add_int(%86, %35)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %88  = Base.sub_int(%29, 1)::Int64
│    └
│     %89  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %90  = Base.mul_int(%88, %89)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %91  = Base.add_int(%90, %45)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %92  = Core.sext_int(Core.Int64, N)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %93  = Base.sle_int(%87, %92)::Bool
│    └
└────        goto #10 if not %93
9 ─── %95  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %96  = Base.mul_int(%82, %95)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %97  = Base.add_int(%96, %45)::Int64
│    └
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %98  = Core.sext_int(Core.Int64, R)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %99  = Base.sle_int(%97, %98)::Bool
│    └
└────        goto #11
10 ──        nothing::Nothing
11 ┄─ %102 = φ (#9 => %99, #10 => false)::Bool
└────        goto #41 if not %102
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:119 within `coalesced_matmul_kernel!'
12 ── %104 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %105 = Base.mul_int(%82, %104)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %106 = Base.add_int(%105, %45)::Int64
│    └
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #17 if not false
13 ──││ %108 = Core.tuple(%87, %106)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %109 = Base.slt_int(%8, 0)::Bool
│    │││││││└
│    │││││││ %110 = Base.ifelse(%109, 0, %8)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %111 = Base.slt_int(%9, 0)::Bool
│    │││││││└
│    │││││││ %112 = Base.ifelse(%111, 0, %9)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %113 = Base.sle_int(1, %87)::Bool
│    ││││││ %114 = Base.sle_int(%87, %110)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %115 = Base.and_int(%113, %114)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %116 = Base.sle_int(1, %106)::Bool
│    ││││││ %117 = Base.sle_int(%106, %112)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %118 = Base.and_int(%116, %117)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %119 = Base.and_int(%118, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %120 = Base.and_int(%115, %119)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #15 if not %120
     │││ @ abstractarray.jl:507 within `checkbounds'
14 ──│││        goto #16
     │││ @ abstractarray.jl:506 within `checkbounds'
15 ──│││        invoke Base.throw_boundserror(%11::CuDeviceArray{Float64,2,1}, %108::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
16 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
17 ┄─│││││││││ %126 = Base.slt_int(%8, 0)::Bool
│    ││││││││└
│    ││││││││ %127 = Base.ifelse(%126, 0, %8)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %128 = Base.sub_int(%127, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %129 = Base.mul_int(1, %128)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %130 = Base.sub_int(%87, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %131 = Base.mul_int(%130, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %132 = Base.add_int(1, %131)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %133 = Base.sub_int(%106, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %134 = Base.mul_int(%133, %129)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %135 = Base.add_int(%132, %134)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #22 if not false
18 ──││││ %137 = Core.tuple(%135)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %138 = Base.mul_int(%8, %9)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %139 = Base.slt_int(%138, 0)::Bool
│    ││││││││└
│    ││││││││ %140 = Base.ifelse(%139, 0, %138)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %141 = Base.sle_int(1, %135)::Bool
│    │││││││ %142 = Base.sle_int(%135, %140)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %143 = Base.and_int(%141, %142)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #20 if not %143
     │││││ @ abstractarray.jl:507 within `checkbounds'
19 ──│││││        goto #21
     │││││ @ abstractarray.jl:506 within `checkbounds'
20 ──│││││        invoke Base.throw_boundserror(%11::CuDeviceArray{Float64,2,1}, %137::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
21 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
22 ┄─│││││││ %149 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %150 = Base.sub_int(%135, 1)::Int64
│    │││││││└
│    │││││││ %151 = (%149)($(QuoteNode(Ptr{Nothing} @0x0000000001c5e358)), Float64, Tuple{Core.LLVMPtr{Float64,1},Int64}, %2, %150)::Float64
│    ││││└└└
└────││││        goto #23
     │││└
23 ──│││        goto #24
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
24 ──││        goto #25
     │└
25 ──│        goto #26
     └
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
26 ──││        goto #31 if not false
27 ──││ %157 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %158 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %159 = Base.ifelse(%158, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %160 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %161 = Base.ifelse(%160, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %162 = Base.sle_int(1, %35)::Bool
│    ││││││ %163 = Base.sle_int(%35, %159)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %164 = Base.and_int(%162, %163)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %165 = Base.sle_int(1, %45)::Bool
│    ││││││ %166 = Base.sle_int(%45, %161)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %167 = Base.and_int(%165, %166)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %168 = Base.and_int(%167, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %169 = Base.and_int(%164, %168)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #29 if not %169
     │││ @ abstractarray.jl:507 within `checkbounds'
28 ──│││        goto #30
     │││ @ abstractarray.jl:506 within `checkbounds'
29 ──│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %157::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
30 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
31 ┄─│││││││ %175 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %176 = Base.mul_int(%175, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %177 = Base.add_int(1, %176)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %178 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %179 = Base.mul_int(%178, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %180 = Base.add_int(%177, %179)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #36 if not false
32 ──││││ %182 = Core.tuple(%180)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %183 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %184 = Base.slt_int(%183, 0)::Bool
│    ││││││││└
│    ││││││││ %185 = Base.ifelse(%184, 0, %183)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %186 = Base.sle_int(1, %180)::Bool
│    │││││││ %187 = Base.sle_int(%180, %185)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %188 = Base.and_int(%186, %187)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #34 if not %188
     │││││ @ abstractarray.jl:507 within `checkbounds'
33 ──│││││        goto #35
     │││││ @ abstractarray.jl:506 within `checkbounds'
34 ──│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %182::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
35 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
36 ┄─│││││││ %194 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %195 = Base.sub_int(%180, 1)::Int64
│    │││││││└
│    │││││││        (%194)($(QuoteNode(Ptr{Nothing} @0x0000000003fed708)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %49, %151, %195)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #37
     │││└
37 ──│││        goto #38
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
38 ──││        goto #39
     │└
39 ──│        goto #40
     └
40 ──        goto #56
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
41 ──││        goto #46 if not false
42 ──││ %203 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %204 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %205 = Base.ifelse(%204, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %206 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %207 = Base.ifelse(%206, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %208 = Base.sle_int(1, %35)::Bool
│    ││││││ %209 = Base.sle_int(%35, %205)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %210 = Base.and_int(%208, %209)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %211 = Base.sle_int(1, %45)::Bool
│    ││││││ %212 = Base.sle_int(%45, %207)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %213 = Base.and_int(%211, %212)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %214 = Base.and_int(%213, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %215 = Base.and_int(%210, %214)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #44 if not %215
     │││ @ abstractarray.jl:507 within `checkbounds'
43 ──│││        goto #45
     │││ @ abstractarray.jl:506 within `checkbounds'
44 ──│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %203::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
45 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
46 ┄─│││││││ %221 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %222 = Base.mul_int(%221, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %223 = Base.add_int(1, %222)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %224 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %225 = Base.mul_int(%224, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %226 = Base.add_int(%223, %225)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #51 if not false
47 ──││││ %228 = Core.tuple(%226)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %229 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %230 = Base.slt_int(%229, 0)::Bool
│    ││││││││└
│    ││││││││ %231 = Base.ifelse(%230, 0, %229)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %232 = Base.sle_int(1, %226)::Bool
│    │││││││ %233 = Base.sle_int(%226, %231)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %234 = Base.and_int(%232, %233)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #49 if not %234
     │││││ @ abstractarray.jl:507 within `checkbounds'
48 ──│││││        goto #50
     │││││ @ abstractarray.jl:506 within `checkbounds'
49 ──│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %228::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
50 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
51 ┄─│││││││ %240 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %241 = Base.sub_int(%226, 1)::Int64
│    │││││││└
│    │││││││        (%240)($(QuoteNode(Ptr{Nothing} @0x0000000003fed708)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %49, 0.0, %241)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #52
     │││└
52 ──│││        goto #53
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
53 ──││        goto #54
     │└
54 ──│        goto #55
55 ──│        nothing::Nothing
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
56 ┄─ %248 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %249 = Base.mul_int(%82, %248)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %250 = Base.add_int(%249, %35)::Int64
│    └
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %251 = Core.sext_int(Core.Int64, R)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %252 = Base.sle_int(%250, %251)::Bool
│    └
└────        goto #58 if not %252
     ┌ @ promotion.jl:350 within `<='
     │┌ @ promotion.jl:282 within `promote'
     ││┌ @ promotion.jl:259 within `_promote'
     │││┌ @ number.jl:7 within `convert'
     ││││┌ @ boot.jl:708 within `Int64'
     │││││┌ @ boot.jl:627 within `toInt64'
57 ──││││││ %254 = Core.sext_int(Core.Int64, M)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %255 = Base.sle_int(%91, %254)::Bool
│    └
└────        goto #59
58 ──        nothing::Nothing
59 ┄─ %258 = φ (#57 => %255, #58 => false)::Bool
└────        goto #89 if not %258
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:124 within `coalesced_matmul_kernel!'
60 ── %260 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %261 = Base.mul_int(%82, %260)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %262 = Base.add_int(%261, %35)::Int64
│    └
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #65 if not false
61 ──││ %264 = Core.tuple(%262, %91)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %265 = Base.slt_int(%12, 0)::Bool
│    │││││││└
│    │││││││ %266 = Base.ifelse(%265, 0, %12)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %267 = Base.slt_int(%13, 0)::Bool
│    │││││││└
│    │││││││ %268 = Base.ifelse(%267, 0, %13)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %269 = Base.sle_int(1, %262)::Bool
│    ││││││ %270 = Base.sle_int(%262, %266)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %271 = Base.and_int(%269, %270)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %272 = Base.sle_int(1, %91)::Bool
│    ││││││ %273 = Base.sle_int(%91, %268)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %274 = Base.and_int(%272, %273)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %275 = Base.and_int(%274, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %276 = Base.and_int(%271, %275)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #63 if not %276
     │││ @ abstractarray.jl:507 within `checkbounds'
62 ──│││        goto #64
     │││ @ abstractarray.jl:506 within `checkbounds'
63 ──│││        invoke Base.throw_boundserror(%15::CuDeviceArray{Float64,2,1}, %264::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
64 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
65 ┄─│││││││││ %282 = Base.slt_int(%12, 0)::Bool
│    ││││││││└
│    ││││││││ %283 = Base.ifelse(%282, 0, %12)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %284 = Base.sub_int(%283, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %285 = Base.mul_int(1, %284)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %286 = Base.sub_int(%262, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %287 = Base.mul_int(%286, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %288 = Base.add_int(1, %287)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %289 = Base.sub_int(%91, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %290 = Base.mul_int(%289, %285)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %291 = Base.add_int(%288, %290)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #70 if not false
66 ──││││ %293 = Core.tuple(%291)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %294 = Base.mul_int(%12, %13)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %295 = Base.slt_int(%294, 0)::Bool
│    ││││││││└
│    ││││││││ %296 = Base.ifelse(%295, 0, %294)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %297 = Base.sle_int(1, %291)::Bool
│    │││││││ %298 = Base.sle_int(%291, %296)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %299 = Base.and_int(%297, %298)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #68 if not %299
     │││││ @ abstractarray.jl:507 within `checkbounds'
67 ──│││││        goto #69
     │││││ @ abstractarray.jl:506 within `checkbounds'
68 ──│││││        invoke Base.throw_boundserror(%15::CuDeviceArray{Float64,2,1}, %293::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
69 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
70 ┄─│││││││ %305 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %306 = Base.sub_int(%291, 1)::Int64
│    │││││││└
│    │││││││ %307 = (%305)($(QuoteNode(Ptr{Nothing} @0x0000000001c5e358)), Float64, Tuple{Core.LLVMPtr{Float64,1},Int64}, %3, %306)::Float64
│    ││││└└└
└────││││        goto #71
     │││└
71 ──│││        goto #72
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
72 ──││        goto #73
     │└
73 ──│        goto #74
     └
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
74 ──││        goto #79 if not false
75 ──││ %313 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %314 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %315 = Base.ifelse(%314, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %316 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %317 = Base.ifelse(%316, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %318 = Base.sle_int(1, %35)::Bool
│    ││││││ %319 = Base.sle_int(%35, %315)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %320 = Base.and_int(%318, %319)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %321 = Base.sle_int(1, %45)::Bool
│    ││││││ %322 = Base.sle_int(%45, %317)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %323 = Base.and_int(%321, %322)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %324 = Base.and_int(%323, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %325 = Base.and_int(%320, %324)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #77 if not %325
     │││ @ abstractarray.jl:507 within `checkbounds'
76 ──│││        goto #78
     │││ @ abstractarray.jl:506 within `checkbounds'
77 ──│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %313::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
78 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
79 ┄─│││││││ %331 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %332 = Base.mul_int(%331, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %333 = Base.add_int(1, %332)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %334 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %335 = Base.mul_int(%334, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %336 = Base.add_int(%333, %335)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #84 if not false
80 ──││││ %338 = Core.tuple(%336)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %339 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %340 = Base.slt_int(%339, 0)::Bool
│    ││││││││└
│    ││││││││ %341 = Base.ifelse(%340, 0, %339)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %342 = Base.sle_int(1, %336)::Bool
│    │││││││ %343 = Base.sle_int(%336, %341)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %344 = Base.and_int(%342, %343)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #82 if not %344
     │││││ @ abstractarray.jl:507 within `checkbounds'
81 ──│││││        goto #83
     │││││ @ abstractarray.jl:506 within `checkbounds'
82 ──│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %338::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
83 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
84 ┄─│││││││ %350 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %351 = Base.sub_int(%336, 1)::Int64
│    │││││││└
│    │││││││        (%350)($(QuoteNode(Ptr{Nothing} @0x0000000003fed708)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %52, %307, %351)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #85
     │││└
85 ──│││        goto #86
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
86 ──││        goto #87
     │└
87 ──│        goto #88
     └
88 ──        goto #104
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
89 ──││        goto #94 if not false
90 ──││ %359 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %360 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %361 = Base.ifelse(%360, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %362 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %363 = Base.ifelse(%362, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %364 = Base.sle_int(1, %35)::Bool
│    ││││││ %365 = Base.sle_int(%35, %361)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %366 = Base.and_int(%364, %365)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %367 = Base.sle_int(1, %45)::Bool
│    ││││││ %368 = Base.sle_int(%45, %363)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %369 = Base.and_int(%367, %368)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %370 = Base.and_int(%369, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %371 = Base.and_int(%366, %370)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #92 if not %371
     │││ @ abstractarray.jl:507 within `checkbounds'
91 ──│││        goto #93
     │││ @ abstractarray.jl:506 within `checkbounds'
92 ──│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %359::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
93 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
94 ┄─│││││││ %377 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %378 = Base.mul_int(%377, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %379 = Base.add_int(1, %378)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %380 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %381 = Base.mul_int(%380, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %382 = Base.add_int(%379, %381)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #99 if not false
95 ──││││ %384 = Core.tuple(%382)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %385 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %386 = Base.slt_int(%385, 0)::Bool
│    ││││││││└
│    ││││││││ %387 = Base.ifelse(%386, 0, %385)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %388 = Base.sle_int(1, %382)::Bool
│    │││││││ %389 = Base.sle_int(%382, %387)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %390 = Base.and_int(%388, %389)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #97 if not %390
     │││││ @ abstractarray.jl:507 within `checkbounds'
96 ──│││││        goto #98
     │││││ @ abstractarray.jl:506 within `checkbounds'
97 ──│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %384::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
98 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
99 ┄─│││││││ %396 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %397 = Base.sub_int(%382, 1)::Int64
│    │││││││└
│    │││││││        (%396)($(QuoteNode(Ptr{Nothing} @0x0000000003fed708)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %52, 0.0, %397)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #100
     │││└
100 ─│││        goto #101
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
101 ─││        goto #102
     │└
102 ─│        goto #103
103 ─│        nothing::Nothing
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:130 within `coalesced_matmul_kernel!'
     ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
104 ┄│        $(Expr(:foreigncall, "llvm.nvvm.barrier0", Nothing, svec(), 0, :(:llvmcall)))::Nothing
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:137 within `coalesced_matmul_kernel!'
└────        goto #138 if not true
105 ┄ %406 = φ (#104 => %81, #137 => %500)::Float64
│     %407 = φ (#104 => 1, #137 => %506)::Int64
│     %408 = φ (#104 => 1, #137 => %507)::Int64
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #110 if not false
106 ─││ %410 = Core.tuple(%35, %407)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %411 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %412 = Base.ifelse(%411, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %413 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %414 = Base.ifelse(%413, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %415 = Base.sle_int(1, %35)::Bool
│    ││││││ %416 = Base.sle_int(%35, %412)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %417 = Base.and_int(%415, %416)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %418 = Base.sle_int(1, %407)::Bool
│    ││││││ %419 = Base.sle_int(%407, %414)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %420 = Base.and_int(%418, %419)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %421 = Base.and_int(%420, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %422 = Base.and_int(%417, %421)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #108 if not %422
     │││ @ abstractarray.jl:507 within `checkbounds'
107 ─│││        goto #109
     │││ @ abstractarray.jl:506 within `checkbounds'
108 ─│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %410::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
109 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
110 ┄│││││││ %428 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %429 = Base.mul_int(%428, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %430 = Base.add_int(1, %429)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %431 = Base.sub_int(%407, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %432 = Base.mul_int(%431, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %433 = Base.add_int(%430, %432)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #115 if not false
111 ─││││ %435 = Core.tuple(%433)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %436 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %437 = Base.slt_int(%436, 0)::Bool
│    ││││││││└
│    ││││││││ %438 = Base.ifelse(%437, 0, %436)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %439 = Base.sle_int(1, %433)::Bool
│    │││││││ %440 = Base.sle_int(%433, %438)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %441 = Base.and_int(%439, %440)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #113 if not %441
     │││││ @ abstractarray.jl:507 within `checkbounds'
112 ─│││││        goto #114
     │││││ @ abstractarray.jl:506 within `checkbounds'
113 ─│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %435::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
114 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
115 ┄│││││││ %447 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %448 = Base.sub_int(%433, 1)::Int64
│    │││││││└
│    │││││││ %449 = (%447)($(QuoteNode(Ptr{Nothing} @0x0000000000e3c888)), Float64, Tuple{Core.LLVMPtr{Float64,3},Int64}, %49, %448)::Float64
│    ││││└└└
└────││││        goto #116
     │││└
116 ─│││        goto #117
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
117 ─││        goto #118
     │└
118 ─│        goto #119
     │┌ @ abstractarray.jl:1082 within `_getindex'
119 ─││        goto #124 if not false
120 ─││ %455 = Core.tuple(%407, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %456 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %457 = Base.ifelse(%456, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %458 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %459 = Base.ifelse(%458, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %460 = Base.sle_int(1, %407)::Bool
│    ││││││ %461 = Base.sle_int(%407, %457)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %462 = Base.and_int(%460, %461)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %463 = Base.sle_int(1, %45)::Bool
│    ││││││ %464 = Base.sle_int(%45, %459)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %465 = Base.and_int(%463, %464)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %466 = Base.and_int(%465, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %467 = Base.and_int(%462, %466)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #122 if not %467
     │││ @ abstractarray.jl:507 within `checkbounds'
121 ─│││        goto #123
     │││ @ abstractarray.jl:506 within `checkbounds'
122 ─│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %455::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
123 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
124 ┄│││││││ %473 = Base.sub_int(%407, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %474 = Base.mul_int(%473, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %475 = Base.add_int(1, %474)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %476 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %477 = Base.mul_int(%476, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %478 = Base.add_int(%475, %477)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #129 if not false
125 ─││││ %480 = Core.tuple(%478)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %481 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %482 = Base.slt_int(%481, 0)::Bool
│    ││││││││└
│    ││││││││ %483 = Base.ifelse(%482, 0, %481)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %484 = Base.sle_int(1, %478)::Bool
│    │││││││ %485 = Base.sle_int(%478, %483)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %486 = Base.and_int(%484, %485)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #127 if not %486
     │││││ @ abstractarray.jl:507 within `checkbounds'
126 ─│││││        goto #128
     │││││ @ abstractarray.jl:506 within `checkbounds'
127 ─│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %480::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
128 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
129 ┄│││││││ %492 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %493 = Base.sub_int(%478, 1)::Int64
│    │││││││└
│    │││││││ %494 = (%492)($(QuoteNode(Ptr{Nothing} @0x0000000000e3c888)), Float64, Tuple{Core.LLVMPtr{Float64,3},Int64}, %52, %493)::Float64
│    ││││└└└
└────││││        goto #130
     │││└
130 ─│││        goto #131
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
131 ─││        goto #132
     │└
132 ─│        goto #133
     └
     ┌ @ float.jl:405 within `*'
133 ─│ %499 = Base.mul_float(%449, %494)::Float64
│    └
│    ┌ @ float.jl:401 within `+'
│    │ %500 = Base.add_float(%406, %499)::Float64
│    └
│    ┌ @ range.jl:624 within `iterate'
│    │┌ @ promotion.jl:398 within `=='
│    ││ %501 = (%408 === 32)::Bool
│    │└
└────│        goto #135 if not %501
134 ─│        goto #136
     │ @ range.jl:625 within `iterate'
     │┌ @ int.jl:86 within `+'
135 ─││ %504 = Base.add_int(%408, 1)::Int64
│    │└
│    │ @ range.jl:626 within `iterate'
└────│        goto #136
     └
136 ┄ %506 = φ (#135 => %504)::Int64
│     %507 = φ (#135 => %504)::Int64
│     %508 = φ (#134 => true, #135 => false)::Bool
│     %509 = Base.not_int(%508)::Bool
└────        goto #138 if not %509
137 ─        goto #105
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
138 ┄ %512 = φ (#136 => %500, #104 => %81)::Float64
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
│    │        $(Expr(:foreigncall, "llvm.nvvm.barrier0", Nothing, svec(), 0, :(:llvmcall)))::Nothing
│    └
│    ┌ @ range.jl:624 within `iterate'
│    │┌ @ promotion.jl:398 within `=='
│    ││ %514 = (%83 === %71)::Bool
│    │└
└────│        goto #140 if not %514
139 ─│        goto #141
     │ @ range.jl:625 within `iterate'
     │┌ @ int.jl:86 within `+'
140 ─││ %517 = Base.add_int(%83, 1)::Int64
│    │└
│    │ @ range.jl:626 within `iterate'
└────│        goto #141
     └
141 ┄ %519 = φ (#140 => %517)::Int64
│     %520 = φ (#140 => %517)::Int64
│     %521 = φ (#139 => true, #140 => false)::Bool
│     %522 = Base.not_int(%521)::Bool
└────        goto #143 if not %522
142 ─        goto #8
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
143 ┄ %525 = φ (#141 => %512, #7 => 0.0)::Float64
│    ┌ @ int.jl:85 within `-'
│    │ %526 = Base.sub_int(%19, 1)::Int64
│    └
│     %527 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %528 = Base.mul_int(%526, %527)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %529 = Base.add_int(%528, %35)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:145 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %530 = Base.sub_int(%29, 1)::Int64
│    └
│     %531 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %532 = Base.mul_int(%530, %531)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %533 = Base.add_int(%532, %45)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %534 = Core.sext_int(Core.Int64, N)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %535 = Base.sle_int(%529, %534)::Bool
│    └
└────        goto #145 if not %535
     ┌ @ promotion.jl:350 within `<='
     │┌ @ promotion.jl:282 within `promote'
     ││┌ @ promotion.jl:259 within `_promote'
     │││┌ @ number.jl:7 within `convert'
     ││││┌ @ boot.jl:708 within `Int64'
     │││││┌ @ boot.jl:627 within `toInt64'
144 ─││││││ %537 = Core.sext_int(Core.Int64, M)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %538 = Base.sle_int(%533, %537)::Bool
│    └
└────        goto #146
145 ─        nothing::Nothing
146 ┄ %541 = φ (#144 => %538, #145 => false)::Bool
└────        goto #162 if not %541
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:148 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
147 ─││        goto #152 if not false
148 ─││ %544 = Core.tuple(%529, %533)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %545 = Base.slt_int(%4, 0)::Bool
│    │││││││└
│    │││││││ %546 = Base.ifelse(%545, 0, %4)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %547 = Base.slt_int(%5, 0)::Bool
│    │││││││└
│    │││││││ %548 = Base.ifelse(%547, 0, %5)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %549 = Base.sle_int(1, %529)::Bool
│    ││││││ %550 = Base.sle_int(%529, %546)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %551 = Base.and_int(%549, %550)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %552 = Base.sle_int(1, %533)::Bool
│    ││││││ %553 = Base.sle_int(%533, %548)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %554 = Base.and_int(%552, %553)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %555 = Base.and_int(%554, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %556 = Base.and_int(%551, %555)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #150 if not %556
     │││ @ abstractarray.jl:507 within `checkbounds'
149 ─│││        goto #151
     │││ @ abstractarray.jl:506 within `checkbounds'
150 ─│││        invoke Base.throw_boundserror(%7::CuDeviceArray{Float64,2,1}, %544::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
151 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
152 ┄│││││││││ %562 = Base.slt_int(%4, 0)::Bool
│    ││││││││└
│    ││││││││ %563 = Base.ifelse(%562, 0, %4)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %564 = Base.sub_int(%563, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %565 = Base.mul_int(1, %564)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %566 = Base.sub_int(%529, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %567 = Base.mul_int(%566, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %568 = Base.add_int(1, %567)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %569 = Base.sub_int(%533, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %570 = Base.mul_int(%569, %565)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %571 = Base.add_int(%568, %570)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #157 if not false
153 ─││││ %573 = Core.tuple(%571)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %574 = Base.mul_int(%4, %5)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %575 = Base.slt_int(%574, 0)::Bool
│    ││││││││└
│    ││││││││ %576 = Base.ifelse(%575, 0, %574)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %577 = Base.sle_int(1, %571)::Bool
│    │││││││ %578 = Base.sle_int(%571, %576)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %579 = Base.and_int(%577, %578)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #155 if not %579
     │││││ @ abstractarray.jl:507 within `checkbounds'
154 ─│││││        goto #156
     │││││ @ abstractarray.jl:506 within `checkbounds'
155 ─│││││        invoke Base.throw_boundserror(%7::CuDeviceArray{Float64,2,1}, %573::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
156 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
157 ┄│││││││ %585 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %586 = Base.sub_int(%571, 1)::Int64
│    │││││││└
│    │││││││        (%585)($(QuoteNode(Ptr{Nothing} @0x0000000003c7c308)), Nothing, Tuple{Core.LLVMPtr{Float64,1},Float64,Int64}, %1, %525, %586)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #158
     │││└
158 ─│││        goto #159
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
159 ─││        goto #160
     │└
160 ─│        goto #161
161 ─│        nothing::Nothing
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:150 within `coalesced_matmul_kernel!'
162 ┄        return Main.nothing
) => Nothing
