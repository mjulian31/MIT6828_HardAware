CodeInfo(
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:89 within `coalesced_matmul_kernel!'
     ┌ @ essentials.jl:414 within `reinterpret'
1 ───│ %1   = Base.bitcast(Core.LLVMPtr{Float32,1}, ptr_out)::Core.LLVMPtr{Float32,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:90 within `coalesced_matmul_kernel!'
│    ┌ @ essentials.jl:414 within `reinterpret'
│    │ %2   = Base.bitcast(Core.LLVMPtr{Float32,1}, ptr_in1)::Core.LLVMPtr{Float32,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:91 within `coalesced_matmul_kernel!'
│    ┌ @ essentials.jl:414 within `reinterpret'
│    │ %3   = Base.bitcast(Core.LLVMPtr{Float32,1}, ptr_in2)::Core.LLVMPtr{Float32,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:92 within `coalesced_matmul_kernel!'
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
│    │││││││││ %5   = Core.sext_int(Core.Int64, M)::Int64
│    ││││└└└└└
│    ││││ %6   = Core.tuple(%4, %5)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %7   = %new(CuDeviceArray{Float32,2,1}, %6, %1)::CuDeviceArray{Float32,2,1}
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
│    │││││││││ %8   = Core.sext_int(Core.Int64, N)::Int64
│    ││││││└└└
│    ││││││ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %9   = Core.sext_int(Core.Int64, R)::Int64
│    ││││└└└└└
│    ││││ %10  = Core.tuple(%8, %9)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %11  = %new(CuDeviceArray{Float32,2,1}, %10, %2)::CuDeviceArray{Float32,2,1}
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
│    │││││││││ %12  = Core.sext_int(Core.Int64, R)::Int64
│    ││││││└└└
│    ││││││ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %13  = Core.sext_int(Core.Int64, M)::Int64
│    ││││└└└└└
│    ││││ %14  = Core.tuple(%12, %13)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %15  = %new(CuDeviceArray{Float32,2,1}, %14, %3)::CuDeviceArray{Float32,2,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:95 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %16  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %17  = (%16)($(QuoteNode(Ptr{Nothing} @0x000000000441eda8)), UInt32, Tuple{})::UInt32
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
│    ││││        (%20)($(QuoteNode(Ptr{Nothing} @0x0000000002c8b328)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %22  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%22)($(QuoteNode(Ptr{Nothing} @0x0000000004422798)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %24  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%24)($(QuoteNode(Ptr{Nothing} @0x000000000441eda8)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %26  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %27  = (%26)($(QuoteNode(Ptr{Nothing} @0x0000000002c8b328)), UInt32, Tuple{})::UInt32
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
│    ││││        (%30)($(QuoteNode(Ptr{Nothing} @0x0000000004422798)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:97 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %32  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %33  = (%32)($(QuoteNode(Ptr{Nothing} @0x0000000004a57e78)), UInt32, Tuple{})::UInt32
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
│    ││││        (%36)($(QuoteNode(Ptr{Nothing} @0x0000000004b93d98)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %38  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%38)($(QuoteNode(Ptr{Nothing} @0x000000000454bd88)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %40  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%40)($(QuoteNode(Ptr{Nothing} @0x0000000004a57e78)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %42  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %43  = (%42)($(QuoteNode(Ptr{Nothing} @0x0000000004b93d98)), UInt32, Tuple{})::UInt32
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
│    ││││        (%46)($(QuoteNode(Ptr{Nothing} @0x000000000454bd88)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:101 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    │││ %48  = Base.llvmcall::Core.IntrinsicFunction
│    │││ %49  = (%48)($(QuoteNode(Ptr{Nothing} @0x0000000004a0a4a8)), Core.LLVMPtr{Float32,3}, Tuple{})::Core.LLVMPtr{Float32,3}
│    │└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    ││ %50  = %new(CuDeviceArray{Float32,2,3}, (33, 32), %49)::CuDeviceArray{Float32,2,3}
│    └└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:102 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    │││ %51  = Base.llvmcall::Core.IntrinsicFunction
│    │││ %52  = (%51)($(QuoteNode(Ptr{Nothing} @0x0000000004a0ab78)), Core.LLVMPtr{Float32,3}, Tuple{})::Core.LLVMPtr{Float32,3}
│    │└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    ││ %53  = %new(CuDeviceArray{Float32,2,3}, (33, 32), %52)::CuDeviceArray{Float32,2,3}
│    └└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
│     %54  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:920 within `+'
│    │┌ @ int.jl:476 within `rem'
│    ││ %55  = Base.sext_int(Int64, R)::Int64
│    │└
│    │ @ int.jl:922 within `+' @ int.jl:86
│    │ %56  = Base.add_int(%55, %54)::Int64
│    └
│    ┌ @ int.jl:85 within `-'
│    │ %57  = Base.sub_int(%56, 1)::Int64
│    └
│     %58  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:260 within `div'
│    │ %59  = Base.checked_sdiv_int(%57, %58)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %60  = Base.sub_int(%59, 1)::Int64
│    └
│    ┌ @ range.jl:5 within `Colon'
│    │┌ @ range.jl:280 within `UnitRange'
│    ││┌ @ range.jl:285 within `unitrange_last'
│    │││┌ @ operators.jl:350 within `>='
│    ││││┌ @ int.jl:441 within `<='
│    │││││ %61  = Base.sle_int(0, %60)::Bool
│    │││└└
│    │││ %62  = Base.ifelse(%61, %60, -1)::Int64
│    └└└
│    ┌ @ range.jl:620 within `iterate'
│    │┌ @ range.jl:503 within `isempty'
│    ││┌ @ operators.jl:303 within `>'
│    │││┌ @ int.jl:82 within `<'
│    ││││ %63  = Base.slt_int(%62, 0)::Bool
│    │└└└
└────│        goto #3 if not %63
2 ───│        goto #4
3 ───│        goto #4
     └
4 ┄── %67  = φ (#2 => true, #3 => false)::Bool
│     %68  = φ (#3 => 0)::Int64
│     %69  = φ (#3 => 0)::Int64
│     %70  = Base.not_int(%67)::Bool
└────        goto #140 if not %70
5 ┄── %72  = φ (#4 => 0.0f0, #139 => %503)::Float32
│     %73  = φ (#4 => %68, #139 => %510)::Int64
│     %74  = φ (#4 => %69, #139 => %511)::Int64
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:111 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %75  = Base.sub_int(%19, 1)::Int64
│    └
│     %76  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %77  = Base.mul_int(%75, %76)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %78  = Base.add_int(%77, %35)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %79  = Base.sub_int(%29, 1)::Int64
│    └
│     %80  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %81  = Base.mul_int(%79, %80)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %82  = Base.add_int(%81, %45)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %83  = Core.sext_int(Core.Int64, N)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %84  = Base.sle_int(%78, %83)::Bool
│    └
└────        goto #7 if not %84
6 ─── %86  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %87  = Base.mul_int(%73, %86)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %88  = Base.add_int(%87, %45)::Int64
│    └
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %89  = Core.sext_int(Core.Int64, R)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %90  = Base.sle_int(%88, %89)::Bool
│    └
└────        goto #8
7 ───        nothing::Nothing
8 ┄── %93  = φ (#6 => %90, #7 => false)::Bool
└────        goto #38 if not %93
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:116 within `coalesced_matmul_kernel!'
9 ─── %95  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %96  = Base.mul_int(%73, %95)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %97  = Base.add_int(%96, %45)::Int64
│    └
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #14 if not false
10 ──││ %99  = Core.tuple(%78, %97)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %100 = Base.slt_int(%8, 0)::Bool
│    │││││││└
│    │││││││ %101 = Base.ifelse(%100, 0, %8)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %102 = Base.slt_int(%9, 0)::Bool
│    │││││││└
│    │││││││ %103 = Base.ifelse(%102, 0, %9)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %104 = Base.sle_int(1, %78)::Bool
│    ││││││ %105 = Base.sle_int(%78, %101)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %106 = Base.and_int(%104, %105)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %107 = Base.sle_int(1, %97)::Bool
│    ││││││ %108 = Base.sle_int(%97, %103)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %109 = Base.and_int(%107, %108)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %110 = Base.and_int(%109, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %111 = Base.and_int(%106, %110)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #12 if not %111
     │││ @ abstractarray.jl:507 within `checkbounds'
11 ──│││        goto #13
     │││ @ abstractarray.jl:506 within `checkbounds'
12 ──│││        invoke Base.throw_boundserror(%11::CuDeviceArray{Float32,2,1}, %99::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
13 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
14 ┄─│││││││││ %117 = Base.slt_int(%8, 0)::Bool
│    ││││││││└
│    ││││││││ %118 = Base.ifelse(%117, 0, %8)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %119 = Base.sub_int(%118, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %120 = Base.mul_int(1, %119)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %121 = Base.sub_int(%78, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %122 = Base.mul_int(%121, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %123 = Base.add_int(1, %122)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %124 = Base.sub_int(%97, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %125 = Base.mul_int(%124, %120)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %126 = Base.add_int(%123, %125)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #19 if not false
15 ──││││ %128 = Core.tuple(%126)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %129 = Base.mul_int(%8, %9)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %130 = Base.slt_int(%129, 0)::Bool
│    ││││││││└
│    ││││││││ %131 = Base.ifelse(%130, 0, %129)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %132 = Base.sle_int(1, %126)::Bool
│    │││││││ %133 = Base.sle_int(%126, %131)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %134 = Base.and_int(%132, %133)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #17 if not %134
     │││││ @ abstractarray.jl:507 within `checkbounds'
16 ──│││││        goto #18
     │││││ @ abstractarray.jl:506 within `checkbounds'
17 ──│││││        invoke Base.throw_boundserror(%11::CuDeviceArray{Float32,2,1}, %128::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
18 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
19 ┄─│││││││ %140 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %141 = Base.sub_int(%126, 1)::Int64
│    │││││││└
│    │││││││ %142 = (%140)($(QuoteNode(Ptr{Nothing} @0x00000000044cba18)), Float32, Tuple{Core.LLVMPtr{Float32,1},Int64}, %2, %141)::Float32
│    ││││└└└
└────││││        goto #20
     │││└
20 ──│││        goto #21
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
21 ──││        goto #22
     │└
22 ──│        goto #23
     └
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
23 ──││        goto #28 if not false
24 ──││ %148 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %149 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %150 = Base.ifelse(%149, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %151 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %152 = Base.ifelse(%151, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %153 = Base.sle_int(1, %35)::Bool
│    ││││││ %154 = Base.sle_int(%35, %150)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %155 = Base.and_int(%153, %154)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %156 = Base.sle_int(1, %45)::Bool
│    ││││││ %157 = Base.sle_int(%45, %152)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %158 = Base.and_int(%156, %157)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %159 = Base.and_int(%158, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %160 = Base.and_int(%155, %159)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #26 if not %160
     │││ @ abstractarray.jl:507 within `checkbounds'
25 ──│││        goto #27
     │││ @ abstractarray.jl:506 within `checkbounds'
26 ──│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float32,2,3}, %148::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
27 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
28 ┄─│││││││ %166 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %167 = Base.mul_int(%166, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %168 = Base.add_int(1, %167)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %169 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %170 = Base.mul_int(%169, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %171 = Base.add_int(%168, %170)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #33 if not false
29 ──││││ %173 = Core.tuple(%171)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %174 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %175 = Base.slt_int(%174, 0)::Bool
│    ││││││││└
│    ││││││││ %176 = Base.ifelse(%175, 0, %174)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %177 = Base.sle_int(1, %171)::Bool
│    │││││││ %178 = Base.sle_int(%171, %176)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %179 = Base.and_int(%177, %178)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #31 if not %179
     │││││ @ abstractarray.jl:507 within `checkbounds'
30 ──│││││        goto #32
     │││││ @ abstractarray.jl:506 within `checkbounds'
31 ──│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float32,2,3}, %173::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
32 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
33 ┄─│││││││ %185 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %186 = Base.sub_int(%171, 1)::Int64
│    │││││││└
│    │││││││        (%185)($(QuoteNode(Ptr{Nothing} @0x0000000004512aa8)), Nothing, Tuple{Core.LLVMPtr{Float32,3},Float32,Int64}, %49, %142, %186)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #34
     │││└
34 ──│││        goto #35
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
35 ──││        goto #36
     │└
36 ──│        goto #37
     └
37 ──        goto #53
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
38 ──││        goto #43 if not false
39 ──││ %194 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %195 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %196 = Base.ifelse(%195, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %197 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %198 = Base.ifelse(%197, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %199 = Base.sle_int(1, %35)::Bool
│    ││││││ %200 = Base.sle_int(%35, %196)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %201 = Base.and_int(%199, %200)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %202 = Base.sle_int(1, %45)::Bool
│    ││││││ %203 = Base.sle_int(%45, %198)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %204 = Base.and_int(%202, %203)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %205 = Base.and_int(%204, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %206 = Base.and_int(%201, %205)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #41 if not %206
     │││ @ abstractarray.jl:507 within `checkbounds'
40 ──│││        goto #42
     │││ @ abstractarray.jl:506 within `checkbounds'
41 ──│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float32,2,3}, %194::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
42 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
43 ┄─│││││││ %212 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %213 = Base.mul_int(%212, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %214 = Base.add_int(1, %213)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %215 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %216 = Base.mul_int(%215, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %217 = Base.add_int(%214, %216)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #48 if not false
44 ──││││ %219 = Core.tuple(%217)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %220 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %221 = Base.slt_int(%220, 0)::Bool
│    ││││││││└
│    ││││││││ %222 = Base.ifelse(%221, 0, %220)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %223 = Base.sle_int(1, %217)::Bool
│    │││││││ %224 = Base.sle_int(%217, %222)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %225 = Base.and_int(%223, %224)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #46 if not %225
     │││││ @ abstractarray.jl:507 within `checkbounds'
45 ──│││││        goto #47
     │││││ @ abstractarray.jl:506 within `checkbounds'
46 ──│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float32,2,3}, %219::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
47 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
48 ┄─│││││││ %231 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %232 = Base.sub_int(%217, 1)::Int64
│    │││││││└
│    │││││││        (%231)($(QuoteNode(Ptr{Nothing} @0x0000000004512aa8)), Nothing, Tuple{Core.LLVMPtr{Float32,3},Float32,Int64}, %49, 0.0f0, %232)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #49
     │││└
49 ──│││        goto #50
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
50 ──││        goto #51
     │└
51 ──│        goto #52
52 ──│        nothing::Nothing
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
53 ┄─ %239 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %240 = Base.mul_int(%73, %239)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %241 = Base.add_int(%240, %35)::Int64
│    └
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %242 = Core.sext_int(Core.Int64, R)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %243 = Base.sle_int(%241, %242)::Bool
│    └
└────        goto #55 if not %243
     ┌ @ promotion.jl:350 within `<='
     │┌ @ promotion.jl:282 within `promote'
     ││┌ @ promotion.jl:259 within `_promote'
     │││┌ @ number.jl:7 within `convert'
     ││││┌ @ boot.jl:708 within `Int64'
     │││││┌ @ boot.jl:627 within `toInt64'
54 ──││││││ %245 = Core.sext_int(Core.Int64, M)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %246 = Base.sle_int(%82, %245)::Bool
│    └
└────        goto #56
55 ──        nothing::Nothing
56 ┄─ %249 = φ (#54 => %246, #55 => false)::Bool
└────        goto #86 if not %249
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
57 ── %251 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %252 = Base.mul_int(%73, %251)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %253 = Base.add_int(%252, %35)::Int64
│    └
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #62 if not false
58 ──││ %255 = Core.tuple(%253, %82)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %256 = Base.slt_int(%12, 0)::Bool
│    │││││││└
│    │││││││ %257 = Base.ifelse(%256, 0, %12)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %258 = Base.slt_int(%13, 0)::Bool
│    │││││││└
│    │││││││ %259 = Base.ifelse(%258, 0, %13)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %260 = Base.sle_int(1, %253)::Bool
│    ││││││ %261 = Base.sle_int(%253, %257)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %262 = Base.and_int(%260, %261)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %263 = Base.sle_int(1, %82)::Bool
│    ││││││ %264 = Base.sle_int(%82, %259)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %265 = Base.and_int(%263, %264)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %266 = Base.and_int(%265, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %267 = Base.and_int(%262, %266)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #60 if not %267
     │││ @ abstractarray.jl:507 within `checkbounds'
59 ──│││        goto #61
     │││ @ abstractarray.jl:506 within `checkbounds'
60 ──│││        invoke Base.throw_boundserror(%15::CuDeviceArray{Float32,2,1}, %255::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
61 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
62 ┄─│││││││││ %273 = Base.slt_int(%12, 0)::Bool
│    ││││││││└
│    ││││││││ %274 = Base.ifelse(%273, 0, %12)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %275 = Base.sub_int(%274, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %276 = Base.mul_int(1, %275)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %277 = Base.sub_int(%253, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %278 = Base.mul_int(%277, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %279 = Base.add_int(1, %278)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %280 = Base.sub_int(%82, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %281 = Base.mul_int(%280, %276)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %282 = Base.add_int(%279, %281)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #67 if not false
63 ──││││ %284 = Core.tuple(%282)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %285 = Base.mul_int(%12, %13)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %286 = Base.slt_int(%285, 0)::Bool
│    ││││││││└
│    ││││││││ %287 = Base.ifelse(%286, 0, %285)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %288 = Base.sle_int(1, %282)::Bool
│    │││││││ %289 = Base.sle_int(%282, %287)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %290 = Base.and_int(%288, %289)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #65 if not %290
     │││││ @ abstractarray.jl:507 within `checkbounds'
64 ──│││││        goto #66
     │││││ @ abstractarray.jl:506 within `checkbounds'
65 ──│││││        invoke Base.throw_boundserror(%15::CuDeviceArray{Float32,2,1}, %284::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
66 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
67 ┄─│││││││ %296 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %297 = Base.sub_int(%282, 1)::Int64
│    │││││││└
│    │││││││ %298 = (%296)($(QuoteNode(Ptr{Nothing} @0x00000000044cba18)), Float32, Tuple{Core.LLVMPtr{Float32,1},Int64}, %3, %297)::Float32
│    ││││└└└
└────││││        goto #68
     │││└
68 ──│││        goto #69
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
69 ──││        goto #70
     │└
70 ──│        goto #71
     └
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
71 ──││        goto #76 if not false
72 ──││ %304 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %305 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %306 = Base.ifelse(%305, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %307 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %308 = Base.ifelse(%307, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %309 = Base.sle_int(1, %35)::Bool
│    ││││││ %310 = Base.sle_int(%35, %306)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %311 = Base.and_int(%309, %310)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %312 = Base.sle_int(1, %45)::Bool
│    ││││││ %313 = Base.sle_int(%45, %308)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %314 = Base.and_int(%312, %313)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %315 = Base.and_int(%314, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %316 = Base.and_int(%311, %315)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #74 if not %316
     │││ @ abstractarray.jl:507 within `checkbounds'
73 ──│││        goto #75
     │││ @ abstractarray.jl:506 within `checkbounds'
74 ──│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float32,2,3}, %304::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
75 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
76 ┄─│││││││ %322 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %323 = Base.mul_int(%322, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %324 = Base.add_int(1, %323)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %325 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %326 = Base.mul_int(%325, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %327 = Base.add_int(%324, %326)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #81 if not false
77 ──││││ %329 = Core.tuple(%327)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %330 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %331 = Base.slt_int(%330, 0)::Bool
│    ││││││││└
│    ││││││││ %332 = Base.ifelse(%331, 0, %330)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %333 = Base.sle_int(1, %327)::Bool
│    │││││││ %334 = Base.sle_int(%327, %332)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %335 = Base.and_int(%333, %334)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #79 if not %335
     │││││ @ abstractarray.jl:507 within `checkbounds'
78 ──│││││        goto #80
     │││││ @ abstractarray.jl:506 within `checkbounds'
79 ──│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float32,2,3}, %329::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
80 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
81 ┄─│││││││ %341 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %342 = Base.sub_int(%327, 1)::Int64
│    │││││││└
│    │││││││        (%341)($(QuoteNode(Ptr{Nothing} @0x0000000004512aa8)), Nothing, Tuple{Core.LLVMPtr{Float32,3},Float32,Int64}, %52, %298, %342)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #82
     │││└
82 ──│││        goto #83
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
83 ──││        goto #84
     │└
84 ──│        goto #85
     └
85 ──        goto #101
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
86 ──││        goto #91 if not false
87 ──││ %350 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %351 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %352 = Base.ifelse(%351, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %353 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %354 = Base.ifelse(%353, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %355 = Base.sle_int(1, %35)::Bool
│    ││││││ %356 = Base.sle_int(%35, %352)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %357 = Base.and_int(%355, %356)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %358 = Base.sle_int(1, %45)::Bool
│    ││││││ %359 = Base.sle_int(%45, %354)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %360 = Base.and_int(%358, %359)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %361 = Base.and_int(%360, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %362 = Base.and_int(%357, %361)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #89 if not %362
     │││ @ abstractarray.jl:507 within `checkbounds'
88 ──│││        goto #90
     │││ @ abstractarray.jl:506 within `checkbounds'
89 ──│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float32,2,3}, %350::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
90 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
91 ┄─│││││││ %368 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %369 = Base.mul_int(%368, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %370 = Base.add_int(1, %369)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %371 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %372 = Base.mul_int(%371, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %373 = Base.add_int(%370, %372)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #96 if not false
92 ──││││ %375 = Core.tuple(%373)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %376 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %377 = Base.slt_int(%376, 0)::Bool
│    ││││││││└
│    ││││││││ %378 = Base.ifelse(%377, 0, %376)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %379 = Base.sle_int(1, %373)::Bool
│    │││││││ %380 = Base.sle_int(%373, %378)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %381 = Base.and_int(%379, %380)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #94 if not %381
     │││││ @ abstractarray.jl:507 within `checkbounds'
93 ──│││││        goto #95
     │││││ @ abstractarray.jl:506 within `checkbounds'
94 ──│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float32,2,3}, %375::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
95 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
96 ┄─│││││││ %387 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %388 = Base.sub_int(%373, 1)::Int64
│    │││││││└
│    │││││││        (%387)($(QuoteNode(Ptr{Nothing} @0x0000000004512aa8)), Nothing, Tuple{Core.LLVMPtr{Float32,3},Float32,Int64}, %52, 0.0f0, %388)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #97
     │││└
97 ──│││        goto #98
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
98 ──││        goto #99
     │└
99 ──│        goto #100
100 ─│        nothing::Nothing
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:127 within `coalesced_matmul_kernel!'
     ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
101 ┄│        $(Expr(:foreigncall, "llvm.nvvm.barrier0", Nothing, svec(), 0, :(:llvmcall)))::Nothing
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:134 within `coalesced_matmul_kernel!'
└────        goto #135 if not true
102 ┄ %397 = φ (#101 => %72, #134 => %491)::Float32
│     %398 = φ (#101 => 1, #134 => %497)::Int64
│     %399 = φ (#101 => 1, #134 => %498)::Int64
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:135 within `coalesced_matmul_kernel!'
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #107 if not false
103 ─││ %401 = Core.tuple(%35, %398)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %402 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %403 = Base.ifelse(%402, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %404 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %405 = Base.ifelse(%404, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %406 = Base.sle_int(1, %35)::Bool
│    ││││││ %407 = Base.sle_int(%35, %403)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %408 = Base.and_int(%406, %407)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %409 = Base.sle_int(1, %398)::Bool
│    ││││││ %410 = Base.sle_int(%398, %405)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %411 = Base.and_int(%409, %410)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %412 = Base.and_int(%411, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %413 = Base.and_int(%408, %412)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #105 if not %413
     │││ @ abstractarray.jl:507 within `checkbounds'
104 ─│││        goto #106
     │││ @ abstractarray.jl:506 within `checkbounds'
105 ─│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float32,2,3}, %401::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
106 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
107 ┄│││││││ %419 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %420 = Base.mul_int(%419, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %421 = Base.add_int(1, %420)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %422 = Base.sub_int(%398, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %423 = Base.mul_int(%422, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %424 = Base.add_int(%421, %423)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #112 if not false
108 ─││││ %426 = Core.tuple(%424)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %427 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %428 = Base.slt_int(%427, 0)::Bool
│    ││││││││└
│    ││││││││ %429 = Base.ifelse(%428, 0, %427)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %430 = Base.sle_int(1, %424)::Bool
│    │││││││ %431 = Base.sle_int(%424, %429)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %432 = Base.and_int(%430, %431)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #110 if not %432
     │││││ @ abstractarray.jl:507 within `checkbounds'
109 ─│││││        goto #111
     │││││ @ abstractarray.jl:506 within `checkbounds'
110 ─│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float32,2,3}, %426::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
111 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
112 ┄│││││││ %438 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %439 = Base.sub_int(%424, 1)::Int64
│    │││││││└
│    │││││││ %440 = (%438)($(QuoteNode(Ptr{Nothing} @0x0000000004a363c8)), Float32, Tuple{Core.LLVMPtr{Float32,3},Int64}, %49, %439)::Float32
│    ││││└└└
└────││││        goto #113
     │││└
113 ─│││        goto #114
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
114 ─││        goto #115
     │└
115 ─│        goto #116
     │┌ @ abstractarray.jl:1082 within `_getindex'
116 ─││        goto #121 if not false
117 ─││ %446 = Core.tuple(%398, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %447 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %448 = Base.ifelse(%447, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %449 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %450 = Base.ifelse(%449, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %451 = Base.sle_int(1, %398)::Bool
│    ││││││ %452 = Base.sle_int(%398, %448)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %453 = Base.and_int(%451, %452)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %454 = Base.sle_int(1, %45)::Bool
│    ││││││ %455 = Base.sle_int(%45, %450)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %456 = Base.and_int(%454, %455)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %457 = Base.and_int(%456, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %458 = Base.and_int(%453, %457)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #119 if not %458
     │││ @ abstractarray.jl:507 within `checkbounds'
118 ─│││        goto #120
     │││ @ abstractarray.jl:506 within `checkbounds'
119 ─│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float32,2,3}, %446::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
120 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
121 ┄│││││││ %464 = Base.sub_int(%398, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %465 = Base.mul_int(%464, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %466 = Base.add_int(1, %465)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %467 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %468 = Base.mul_int(%467, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %469 = Base.add_int(%466, %468)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #126 if not false
122 ─││││ %471 = Core.tuple(%469)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %472 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %473 = Base.slt_int(%472, 0)::Bool
│    ││││││││└
│    ││││││││ %474 = Base.ifelse(%473, 0, %472)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %475 = Base.sle_int(1, %469)::Bool
│    │││││││ %476 = Base.sle_int(%469, %474)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %477 = Base.and_int(%475, %476)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #124 if not %477
     │││││ @ abstractarray.jl:507 within `checkbounds'
123 ─│││││        goto #125
     │││││ @ abstractarray.jl:506 within `checkbounds'
124 ─│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float32,2,3}, %471::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
125 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
126 ┄│││││││ %483 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %484 = Base.sub_int(%469, 1)::Int64
│    │││││││└
│    │││││││ %485 = (%483)($(QuoteNode(Ptr{Nothing} @0x0000000004a363c8)), Float32, Tuple{Core.LLVMPtr{Float32,3},Int64}, %52, %484)::Float32
│    ││││└└└
└────││││        goto #127
     │││└
127 ─│││        goto #128
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
128 ─││        goto #129
     │└
129 ─│        goto #130
     └
     ┌ @ float.jl:404 within `*'
130 ─│ %490 = Base.mul_float(%440, %485)::Float32
│    └
│    ┌ @ float.jl:400 within `+'
│    │ %491 = Base.add_float(%397, %490)::Float32
│    └
│    ┌ @ range.jl:624 within `iterate'
│    │┌ @ promotion.jl:398 within `=='
│    ││ %492 = (%399 === 32)::Bool
│    │└
└────│        goto #132 if not %492
131 ─│        goto #133
     │ @ range.jl:625 within `iterate'
     │┌ @ int.jl:86 within `+'
132 ─││ %495 = Base.add_int(%399, 1)::Int64
│    │└
│    │ @ range.jl:626 within `iterate'
└────│        goto #133
     └
133 ┄ %497 = φ (#132 => %495)::Int64
│     %498 = φ (#132 => %495)::Int64
│     %499 = φ (#131 => true, #132 => false)::Bool
│     %500 = Base.not_int(%499)::Bool
└────        goto #135 if not %500
134 ─        goto #102
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
135 ┄ %503 = φ (#133 => %491, #101 => %72)::Float32
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
│    │        $(Expr(:foreigncall, "llvm.nvvm.barrier0", Nothing, svec(), 0, :(:llvmcall)))::Nothing
│    └
│    ┌ @ range.jl:624 within `iterate'
│    │┌ @ promotion.jl:398 within `=='
│    ││ %505 = (%74 === %62)::Bool
│    │└
└────│        goto #137 if not %505
136 ─│        goto #138
     │ @ range.jl:625 within `iterate'
     │┌ @ int.jl:86 within `+'
137 ─││ %508 = Base.add_int(%74, 1)::Int64
│    │└
│    │ @ range.jl:626 within `iterate'
└────│        goto #138
     └
138 ┄ %510 = φ (#137 => %508)::Int64
│     %511 = φ (#137 => %508)::Int64
│     %512 = φ (#136 => true, #137 => false)::Bool
│     %513 = Base.not_int(%512)::Bool
└────        goto #140 if not %513
139 ─        goto #5
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
140 ┄ %516 = φ (#138 => %503, #4 => 0.0f0)::Float32
│    ┌ @ int.jl:85 within `-'
│    │ %517 = Base.sub_int(%19, 1)::Int64
│    └
│     %518 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %519 = Base.mul_int(%517, %518)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %520 = Base.add_int(%519, %35)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:142 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %521 = Base.sub_int(%29, 1)::Int64
│    └
│     %522 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %523 = Base.mul_int(%521, %522)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %524 = Base.add_int(%523, %45)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %525 = Core.sext_int(Core.Int64, N)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %526 = Base.sle_int(%520, %525)::Bool
│    └
└────        goto #142 if not %526
     ┌ @ promotion.jl:350 within `<='
     │┌ @ promotion.jl:282 within `promote'
     ││┌ @ promotion.jl:259 within `_promote'
     │││┌ @ number.jl:7 within `convert'
     ││││┌ @ boot.jl:708 within `Int64'
     │││││┌ @ boot.jl:627 within `toInt64'
141 ─││││││ %528 = Core.sext_int(Core.Int64, M)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %529 = Base.sle_int(%524, %528)::Bool
│    └
└────        goto #143
142 ─        nothing::Nothing
143 ┄ %532 = φ (#141 => %529, #142 => false)::Bool
└────        goto #159 if not %532
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:145 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
144 ─││        goto #149 if not false
145 ─││ %535 = Core.tuple(%520, %524)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %536 = Base.slt_int(%4, 0)::Bool
│    │││││││└
│    │││││││ %537 = Base.ifelse(%536, 0, %4)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %538 = Base.slt_int(%5, 0)::Bool
│    │││││││└
│    │││││││ %539 = Base.ifelse(%538, 0, %5)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %540 = Base.sle_int(1, %520)::Bool
│    ││││││ %541 = Base.sle_int(%520, %537)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %542 = Base.and_int(%540, %541)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %543 = Base.sle_int(1, %524)::Bool
│    ││││││ %544 = Base.sle_int(%524, %539)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %545 = Base.and_int(%543, %544)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %546 = Base.and_int(%545, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %547 = Base.and_int(%542, %546)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #147 if not %547
     │││ @ abstractarray.jl:507 within `checkbounds'
146 ─│││        goto #148
     │││ @ abstractarray.jl:506 within `checkbounds'
147 ─│││        invoke Base.throw_boundserror(%7::CuDeviceArray{Float32,2,1}, %535::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
148 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
149 ┄│││││││││ %553 = Base.slt_int(%4, 0)::Bool
│    ││││││││└
│    ││││││││ %554 = Base.ifelse(%553, 0, %4)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %555 = Base.sub_int(%554, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %556 = Base.mul_int(1, %555)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %557 = Base.sub_int(%520, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %558 = Base.mul_int(%557, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %559 = Base.add_int(1, %558)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %560 = Base.sub_int(%524, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %561 = Base.mul_int(%560, %556)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %562 = Base.add_int(%559, %561)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #154 if not false
150 ─││││ %564 = Core.tuple(%562)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %565 = Base.mul_int(%4, %5)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %566 = Base.slt_int(%565, 0)::Bool
│    ││││││││└
│    ││││││││ %567 = Base.ifelse(%566, 0, %565)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %568 = Base.sle_int(1, %562)::Bool
│    │││││││ %569 = Base.sle_int(%562, %567)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %570 = Base.and_int(%568, %569)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #152 if not %570
     │││││ @ abstractarray.jl:507 within `checkbounds'
151 ─│││││        goto #153
     │││││ @ abstractarray.jl:506 within `checkbounds'
152 ─│││││        invoke Base.throw_boundserror(%7::CuDeviceArray{Float32,2,1}, %564::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
153 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
154 ┄│││││││ %576 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %577 = Base.sub_int(%562, 1)::Int64
│    │││││││└
│    │││││││        (%576)($(QuoteNode(Ptr{Nothing} @0x0000000004b7ade8)), Nothing, Tuple{Core.LLVMPtr{Float32,1},Float32,Int64}, %1, %516, %577)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #155
     │││└
155 ─│││        goto #156
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
156 ─││        goto #157
     │└
157 ─│        goto #158
158 ─│        nothing::Nothing
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
159 ┄        return Main.nothing
) => Nothing
