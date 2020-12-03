CodeInfo(
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:89 within `coalesced_matmul_kernel!'
     ┌ @ essentials.jl:414 within `reinterpret'
1 ───│ %1   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_out)::Core.LLVMPtr{Float64,1}
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:90 within `coalesced_matmul_kernel!'
│    ┌ @ essentials.jl:414 within `reinterpret'
│    │ %2   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_in1)::Core.LLVMPtr{Float64,1}
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:91 within `coalesced_matmul_kernel!'
│    ┌ @ essentials.jl:414 within `reinterpret'
│    │ %3   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_in2)::Core.LLVMPtr{Float64,1}
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:92 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:38 within `CuDeviceArray' @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:48
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
│    │ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:38 within `CuDeviceArray' @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:48 @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:31
│    │ %7   = %new(CuDeviceArray{Float64,2,1}, %6, %1)::CuDeviceArray{Float64,2,1}
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:93 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:38 within `CuDeviceArray' @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:48
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
│    │ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:38 within `CuDeviceArray' @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:48 @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:31
│    │ %11  = %new(CuDeviceArray{Float64,2,1}, %10, %2)::CuDeviceArray{Float64,2,1}
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:94 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:38 within `CuDeviceArray' @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:48
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
│    │ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:38 within `CuDeviceArray' @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:48 @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:31
│    │ %15  = %new(CuDeviceArray{Float64,2,1}, %14, %3)::CuDeviceArray{Float64,2,1}
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:95 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:77 within `blockIdx'
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %16  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %17  = (%16)($(QuoteNode(Ptr{Nothing} @0x00000bb83422a698)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %18  = Core.zext_int(Core.Int64, %17)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %19  = Base.add_int(%18, 1)::Int64
│    │└└
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %20  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%20)($(QuoteNode(Ptr{Nothing} @0x00000bb833b97898)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %22  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%22)($(QuoteNode(Ptr{Nothing} @0x00000bb833132e18)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:77 within `blockIdx'
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %24  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%24)($(QuoteNode(Ptr{Nothing} @0x00000bb83422a698)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %26  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %27  = (%26)($(QuoteNode(Ptr{Nothing} @0x00000bb833b97898)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %28  = Core.zext_int(Core.Int64, %27)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %29  = Base.add_int(%28, 1)::Int64
│    │└└
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %30  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%30)($(QuoteNode(Ptr{Nothing} @0x00000bb833132e18)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:97 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:91 within `threadIdx'
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %32  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %33  = (%32)($(QuoteNode(Ptr{Nothing} @0x00000bb83483cc98)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %34  = Core.zext_int(Core.Int64, %33)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %35  = Base.add_int(%34, 1)::Int64
│    │└└
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %36  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%36)($(QuoteNode(Ptr{Nothing} @0x00000bb834619e88)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %38  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%38)($(QuoteNode(Ptr{Nothing} @0x00000bb834339e48)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:91 within `threadIdx'
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %40  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%40)($(QuoteNode(Ptr{Nothing} @0x00000bb83483cc98)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %42  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %43  = (%42)($(QuoteNode(Ptr{Nothing} @0x00000bb834619e88)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %44  = Core.zext_int(Core.Int64, %43)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %45  = Base.add_int(%44, 1)::Int64
│    │└└
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    ││││ %46  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%46)($(QuoteNode(Ptr{Nothing} @0x00000bb834339e48)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:101 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    │││ %48  = Base.llvmcall::Core.IntrinsicFunction
│    │││ %49  = (%48)($(QuoteNode(Ptr{Nothing} @0x00000bb835d221c8)), Core.LLVMPtr{Float64,3}, Tuple{})::Core.LLVMPtr{Float64,3}
│    │└└
│    │ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:38 within `CuDeviceArray' @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:31
│    ││ %50  = %new(CuDeviceArray{Float64,2,3}, (33, 32), %49)::CuDeviceArray{Float64,2,3}
│    └└
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:102 within `coalesced_matmul_kernel!'
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
│    │││ %51  = Base.llvmcall::Core.IntrinsicFunction
│    │││ %52  = (%51)($(QuoteNode(Ptr{Nothing} @0x00000bb83328ad68)), Core.LLVMPtr{Float64,3}, Tuple{})::Core.LLVMPtr{Float64,3}
│    │└└
│    │ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
│    │┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:38 within `CuDeviceArray' @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:31
│    ││ %53  = %new(CuDeviceArray{Float64,2,3}, (33, 32), %52)::CuDeviceArray{Float64,2,3}
│    └└
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
│     %54  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:920 within `+'
│    │┌ @ int.jl:476 within `rem'
│    ││ %55  = Base.sext_int(Int64, R)::Int64
│    │└
│    │ @ int.jl:922 within `+' @ int.jl:86
│    │ %56  = Base.add_int(%55, %54)::Int64
│    └
│    ┌ @ promotion.jl:352 within `rem'
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %57  = Core.sext_int(Core.Int64, R)::Int64
│    │└└└└└
│    │ @ promotion.jl:352 within `rem' @ int.jl:261
│    │ %58  = Base.checked_srem_int(%57, 32)::Int64
│    └
│    ┌ @ int.jl:85 within `-'
│    │ %59  = Base.sub_int(%56, %58)::Int64
│    └
│     %60  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:260 within `div'
│    │ %61  = Base.checked_sdiv_int(%59, %60)::Int64
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %62  = Base.sub_int(%61, 1)::Int64
│    └
│    ┌ @ range.jl:5 within `Colon'
│    │┌ @ range.jl:280 within `UnitRange'
│    ││┌ @ range.jl:285 within `unitrange_last'
│    │││┌ @ operators.jl:350 within `>='
│    ││││┌ @ int.jl:441 within `<='
│    │││││ %63  = Base.sle_int(0, %62)::Bool
│    │││└└
│    │││ %64  = Base.ifelse(%63, %62, -1)::Int64
│    └└└
│    ┌ @ range.jl:620 within `iterate'
│    │┌ @ range.jl:503 within `isempty'
│    ││┌ @ operators.jl:303 within `>'
│    │││┌ @ int.jl:82 within `<'
│    ││││ %65  = Base.slt_int(%64, 0)::Bool
│    │└└└
└────│        goto #3 if not %65
2 ───│        goto #4
3 ───│        goto #4
     └
4 ┄── %69  = φ (#2 => true, #3 => false)::Bool
│     %70  = φ (#3 => 0)::Int64
│     %71  = φ (#3 => 0)::Int64
│     %72  = Base.not_int(%69)::Bool
└────        goto #140 if not %72
5 ┄── %74  = φ (#4 => 0.0, #139 => %505)::Float64
│     %75  = φ (#4 => %70, #139 => %512)::Int64
│     %76  = φ (#4 => %71, #139 => %513)::Int64
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:111 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %77  = Base.sub_int(%19, 1)::Int64
│    └
│     %78  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %79  = Base.mul_int(%77, %78)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %80  = Base.add_int(%79, %35)::Int64
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %81  = Base.sub_int(%29, 1)::Int64
│    └
│     %82  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %83  = Base.mul_int(%81, %82)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %84  = Base.add_int(%83, %45)::Int64
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %85  = Core.sext_int(Core.Int64, N)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %86  = Base.sle_int(%80, %85)::Bool
│    └
└────        goto #7 if not %86
6 ─── %88  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %89  = Base.mul_int(%75, %88)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %90  = Base.add_int(%89, %45)::Int64
│    └
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %91  = Core.sext_int(Core.Int64, R)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %92  = Base.sle_int(%90, %91)::Bool
│    └
└────        goto #8
7 ───        nothing::Nothing
8 ┄── %95  = φ (#6 => %92, #7 => false)::Bool
└────        goto #38 if not %95
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:116 within `coalesced_matmul_kernel!'
9 ─── %97  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %98  = Base.mul_int(%75, %97)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %99  = Base.add_int(%98, %45)::Int64
│    └
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #14 if not false
10 ──││ %101 = Core.tuple(%80, %99)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %102 = Base.slt_int(%8, 0)::Bool
│    │││││││└
│    │││││││ %103 = Base.ifelse(%102, 0, %8)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %104 = Base.slt_int(%9, 0)::Bool
│    │││││││└
│    │││││││ %105 = Base.ifelse(%104, 0, %9)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %106 = Base.sle_int(1, %80)::Bool
│    ││││││ %107 = Base.sle_int(%80, %103)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %108 = Base.and_int(%106, %107)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %109 = Base.sle_int(1, %99)::Bool
│    ││││││ %110 = Base.sle_int(%99, %105)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %111 = Base.and_int(%109, %110)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %112 = Base.and_int(%111, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %113 = Base.and_int(%108, %112)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #12 if not %113
     │││ @ abstractarray.jl:507 within `checkbounds'
11 ──│││        goto #13
     │││ @ abstractarray.jl:506 within `checkbounds'
12 ──│││        invoke Base.throw_boundserror(%11::CuDeviceArray{Float64,2,1}, %101::Tuple{Int64,Int64})::Union{}
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
14 ┄─│││││││││ %119 = Base.slt_int(%8, 0)::Bool
│    ││││││││└
│    ││││││││ %120 = Base.ifelse(%119, 0, %8)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %121 = Base.sub_int(%120, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %122 = Base.mul_int(1, %121)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %123 = Base.sub_int(%80, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %124 = Base.mul_int(%123, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %125 = Base.add_int(1, %124)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %126 = Base.sub_int(%99, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %127 = Base.mul_int(%126, %122)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %128 = Base.add_int(%125, %127)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:99 within `getindex'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:78 within `arrayref'
└────││││        goto #19 if not false
15 ──││││ %130 = Core.tuple(%128)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %131 = Base.mul_int(%8, %9)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %132 = Base.slt_int(%131, 0)::Bool
│    ││││││││└
│    ││││││││ %133 = Base.ifelse(%132, 0, %131)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %134 = Base.sle_int(1, %128)::Bool
│    │││││││ %135 = Base.sle_int(%128, %133)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %136 = Base.and_int(%134, %135)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #17 if not %136
     │││││ @ abstractarray.jl:507 within `checkbounds'
16 ──│││││        goto #18
     │││││ @ abstractarray.jl:506 within `checkbounds'
17 ──│││││        invoke Base.throw_boundserror(%11::CuDeviceArray{Float64,2,1}, %130::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
18 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
19 ┄─│││││││ %142 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %143 = Base.sub_int(%128, 1)::Int64
│    │││││││└
│    │││││││ %144 = (%142)($(QuoteNode(Ptr{Nothing} @0x00000bb835ee0a38)), Float64, Tuple{Core.LLVMPtr{Float64,1},Int64}, %2, %143)::Float64
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
24 ──││ %150 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %151 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %152 = Base.ifelse(%151, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %153 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %154 = Base.ifelse(%153, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %155 = Base.sle_int(1, %35)::Bool
│    ││││││ %156 = Base.sle_int(%35, %152)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %157 = Base.and_int(%155, %156)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %158 = Base.sle_int(1, %45)::Bool
│    ││││││ %159 = Base.sle_int(%45, %154)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %160 = Base.and_int(%158, %159)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %161 = Base.and_int(%160, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %162 = Base.and_int(%157, %161)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #26 if not %162
     │││ @ abstractarray.jl:507 within `checkbounds'
25 ──│││        goto #27
     │││ @ abstractarray.jl:506 within `checkbounds'
26 ──│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %150::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
27 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
28 ┄─│││││││ %168 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %169 = Base.mul_int(%168, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %170 = Base.add_int(1, %169)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %171 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %172 = Base.mul_int(%171, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %173 = Base.add_int(%170, %172)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:84 within `arrayset'
└────││││        goto #33 if not false
29 ──││││ %175 = Core.tuple(%173)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %176 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %177 = Base.slt_int(%176, 0)::Bool
│    ││││││││└
│    ││││││││ %178 = Base.ifelse(%177, 0, %176)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %179 = Base.sle_int(1, %173)::Bool
│    │││││││ %180 = Base.sle_int(%173, %178)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %181 = Base.and_int(%179, %180)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #31 if not %181
     │││││ @ abstractarray.jl:507 within `checkbounds'
30 ──│││││        goto #32
     │││││ @ abstractarray.jl:506 within `checkbounds'
31 ──│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %175::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
32 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
33 ┄─│││││││ %187 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %188 = Base.sub_int(%173, 1)::Int64
│    │││││││└
│    │││││││        (%187)($(QuoteNode(Ptr{Nothing} @0x00000bb833136088)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %49, %144, %188)::Nothing
│    ││││└└└
│    ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:87 within `arrayset'
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
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
38 ──││        goto #43 if not false
39 ──││ %196 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %197 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %198 = Base.ifelse(%197, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %199 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %200 = Base.ifelse(%199, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %201 = Base.sle_int(1, %35)::Bool
│    ││││││ %202 = Base.sle_int(%35, %198)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %203 = Base.and_int(%201, %202)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %204 = Base.sle_int(1, %45)::Bool
│    ││││││ %205 = Base.sle_int(%45, %200)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %206 = Base.and_int(%204, %205)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %207 = Base.and_int(%206, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %208 = Base.and_int(%203, %207)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #41 if not %208
     │││ @ abstractarray.jl:507 within `checkbounds'
40 ──│││        goto #42
     │││ @ abstractarray.jl:506 within `checkbounds'
41 ──│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %196::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
42 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
43 ┄─│││││││ %214 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %215 = Base.mul_int(%214, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %216 = Base.add_int(1, %215)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %217 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %218 = Base.mul_int(%217, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %219 = Base.add_int(%216, %218)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:84 within `arrayset'
└────││││        goto #48 if not false
44 ──││││ %221 = Core.tuple(%219)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %222 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %223 = Base.slt_int(%222, 0)::Bool
│    ││││││││└
│    ││││││││ %224 = Base.ifelse(%223, 0, %222)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %225 = Base.sle_int(1, %219)::Bool
│    │││││││ %226 = Base.sle_int(%219, %224)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %227 = Base.and_int(%225, %226)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #46 if not %227
     │││││ @ abstractarray.jl:507 within `checkbounds'
45 ──│││││        goto #47
     │││││ @ abstractarray.jl:506 within `checkbounds'
46 ──│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %221::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
47 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
48 ┄─│││││││ %233 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %234 = Base.sub_int(%219, 1)::Int64
│    │││││││└
│    │││││││        (%233)($(QuoteNode(Ptr{Nothing} @0x00000bb833136088)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %49, 0.0, %234)::Nothing
│    ││││└└└
│    ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:87 within `arrayset'
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
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
53 ┄─ %241 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %242 = Base.mul_int(%75, %241)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %243 = Base.add_int(%242, %35)::Int64
│    └
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %244 = Core.sext_int(Core.Int64, R)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %245 = Base.sle_int(%243, %244)::Bool
│    └
└────        goto #55 if not %245
     ┌ @ promotion.jl:350 within `<='
     │┌ @ promotion.jl:282 within `promote'
     ││┌ @ promotion.jl:259 within `_promote'
     │││┌ @ number.jl:7 within `convert'
     ││││┌ @ boot.jl:708 within `Int64'
     │││││┌ @ boot.jl:627 within `toInt64'
54 ──││││││ %247 = Core.sext_int(Core.Int64, M)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %248 = Base.sle_int(%84, %247)::Bool
│    └
└────        goto #56
55 ──        nothing::Nothing
56 ┄─ %251 = φ (#54 => %248, #55 => false)::Bool
└────        goto #86 if not %251
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
57 ── %253 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %254 = Base.mul_int(%75, %253)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %255 = Base.add_int(%254, %35)::Int64
│    └
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #62 if not false
58 ──││ %257 = Core.tuple(%255, %84)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %258 = Base.slt_int(%12, 0)::Bool
│    │││││││└
│    │││││││ %259 = Base.ifelse(%258, 0, %12)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %260 = Base.slt_int(%13, 0)::Bool
│    │││││││└
│    │││││││ %261 = Base.ifelse(%260, 0, %13)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %262 = Base.sle_int(1, %255)::Bool
│    ││││││ %263 = Base.sle_int(%255, %259)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %264 = Base.and_int(%262, %263)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %265 = Base.sle_int(1, %84)::Bool
│    ││││││ %266 = Base.sle_int(%84, %261)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %267 = Base.and_int(%265, %266)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %268 = Base.and_int(%267, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %269 = Base.and_int(%264, %268)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #60 if not %269
     │││ @ abstractarray.jl:507 within `checkbounds'
59 ──│││        goto #61
     │││ @ abstractarray.jl:506 within `checkbounds'
60 ──│││        invoke Base.throw_boundserror(%15::CuDeviceArray{Float64,2,1}, %257::Tuple{Int64,Int64})::Union{}
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
62 ┄─│││││││││ %275 = Base.slt_int(%12, 0)::Bool
│    ││││││││└
│    ││││││││ %276 = Base.ifelse(%275, 0, %12)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %277 = Base.sub_int(%276, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %278 = Base.mul_int(1, %277)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %279 = Base.sub_int(%255, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %280 = Base.mul_int(%279, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %281 = Base.add_int(1, %280)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %282 = Base.sub_int(%84, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %283 = Base.mul_int(%282, %278)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %284 = Base.add_int(%281, %283)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:99 within `getindex'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:78 within `arrayref'
└────││││        goto #67 if not false
63 ──││││ %286 = Core.tuple(%284)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %287 = Base.mul_int(%12, %13)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %288 = Base.slt_int(%287, 0)::Bool
│    ││││││││└
│    ││││││││ %289 = Base.ifelse(%288, 0, %287)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %290 = Base.sle_int(1, %284)::Bool
│    │││││││ %291 = Base.sle_int(%284, %289)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %292 = Base.and_int(%290, %291)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #65 if not %292
     │││││ @ abstractarray.jl:507 within `checkbounds'
64 ──│││││        goto #66
     │││││ @ abstractarray.jl:506 within `checkbounds'
65 ──│││││        invoke Base.throw_boundserror(%15::CuDeviceArray{Float64,2,1}, %286::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
66 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
67 ┄─│││││││ %298 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %299 = Base.sub_int(%284, 1)::Int64
│    │││││││└
│    │││││││ %300 = (%298)($(QuoteNode(Ptr{Nothing} @0x00000bb835ee0a38)), Float64, Tuple{Core.LLVMPtr{Float64,1},Int64}, %3, %299)::Float64
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
72 ──││ %306 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %307 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %308 = Base.ifelse(%307, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %309 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %310 = Base.ifelse(%309, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %311 = Base.sle_int(1, %35)::Bool
│    ││││││ %312 = Base.sle_int(%35, %308)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %313 = Base.and_int(%311, %312)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %314 = Base.sle_int(1, %45)::Bool
│    ││││││ %315 = Base.sle_int(%45, %310)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %316 = Base.and_int(%314, %315)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %317 = Base.and_int(%316, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %318 = Base.and_int(%313, %317)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #74 if not %318
     │││ @ abstractarray.jl:507 within `checkbounds'
73 ──│││        goto #75
     │││ @ abstractarray.jl:506 within `checkbounds'
74 ──│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %306::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
75 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
76 ┄─│││││││ %324 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %325 = Base.mul_int(%324, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %326 = Base.add_int(1, %325)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %327 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %328 = Base.mul_int(%327, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %329 = Base.add_int(%326, %328)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:84 within `arrayset'
└────││││        goto #81 if not false
77 ──││││ %331 = Core.tuple(%329)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %332 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %333 = Base.slt_int(%332, 0)::Bool
│    ││││││││└
│    ││││││││ %334 = Base.ifelse(%333, 0, %332)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %335 = Base.sle_int(1, %329)::Bool
│    │││││││ %336 = Base.sle_int(%329, %334)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %337 = Base.and_int(%335, %336)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #79 if not %337
     │││││ @ abstractarray.jl:507 within `checkbounds'
78 ──│││││        goto #80
     │││││ @ abstractarray.jl:506 within `checkbounds'
79 ──│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %331::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
80 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
81 ┄─│││││││ %343 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %344 = Base.sub_int(%329, 1)::Int64
│    │││││││└
│    │││││││        (%343)($(QuoteNode(Ptr{Nothing} @0x00000bb833136088)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %52, %300, %344)::Nothing
│    ││││└└└
│    ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:87 within `arrayset'
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
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
86 ──││        goto #91 if not false
87 ──││ %352 = Core.tuple(%35, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %353 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %354 = Base.ifelse(%353, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %355 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %356 = Base.ifelse(%355, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %357 = Base.sle_int(1, %35)::Bool
│    ││││││ %358 = Base.sle_int(%35, %354)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %359 = Base.and_int(%357, %358)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %360 = Base.sle_int(1, %45)::Bool
│    ││││││ %361 = Base.sle_int(%45, %356)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %362 = Base.and_int(%360, %361)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %363 = Base.and_int(%362, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %364 = Base.and_int(%359, %363)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #89 if not %364
     │││ @ abstractarray.jl:507 within `checkbounds'
88 ──│││        goto #90
     │││ @ abstractarray.jl:506 within `checkbounds'
89 ──│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %352::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
90 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
91 ┄─│││││││ %370 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %371 = Base.mul_int(%370, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %372 = Base.add_int(1, %371)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %373 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %374 = Base.mul_int(%373, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %375 = Base.add_int(%372, %374)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:84 within `arrayset'
└────││││        goto #96 if not false
92 ──││││ %377 = Core.tuple(%375)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %378 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %379 = Base.slt_int(%378, 0)::Bool
│    ││││││││└
│    ││││││││ %380 = Base.ifelse(%379, 0, %378)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %381 = Base.sle_int(1, %375)::Bool
│    │││││││ %382 = Base.sle_int(%375, %380)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %383 = Base.and_int(%381, %382)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #94 if not %383
     │││││ @ abstractarray.jl:507 within `checkbounds'
93 ──│││││        goto #95
     │││││ @ abstractarray.jl:506 within `checkbounds'
94 ──│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %377::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
95 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
96 ┄─│││││││ %389 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %390 = Base.sub_int(%375, 1)::Int64
│    │││││││└
│    │││││││        (%389)($(QuoteNode(Ptr{Nothing} @0x00000bb833136088)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %52, 0.0, %390)::Nothing
│    ││││└└└
│    ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:87 within `arrayset'
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
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:127 within `coalesced_matmul_kernel!'
     ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
101 ┄│        $(Expr(:foreigncall, "llvm.nvvm.barrier0", Nothing, svec(), 0, :(:llvmcall)))::Nothing
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:134 within `coalesced_matmul_kernel!'
└────        goto #135 if not true
102 ┄ %399 = φ (#101 => %74, #134 => %493)::Float64
│     %400 = φ (#101 => 1, #134 => %499)::Int64
│     %401 = φ (#101 => 1, #134 => %500)::Int64
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:135 within `coalesced_matmul_kernel!'
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #107 if not false
103 ─││ %403 = Core.tuple(%35, %400)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %404 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %405 = Base.ifelse(%404, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %406 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %407 = Base.ifelse(%406, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %408 = Base.sle_int(1, %35)::Bool
│    ││││││ %409 = Base.sle_int(%35, %405)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %410 = Base.and_int(%408, %409)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %411 = Base.sle_int(1, %400)::Bool
│    ││││││ %412 = Base.sle_int(%400, %407)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %413 = Base.and_int(%411, %412)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %414 = Base.and_int(%413, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %415 = Base.and_int(%410, %414)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #105 if not %415
     │││ @ abstractarray.jl:507 within `checkbounds'
104 ─│││        goto #106
     │││ @ abstractarray.jl:506 within `checkbounds'
105 ─│││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %403::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
106 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
107 ┄│││││││ %421 = Base.sub_int(%35, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %422 = Base.mul_int(%421, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %423 = Base.add_int(1, %422)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %424 = Base.sub_int(%400, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %425 = Base.mul_int(%424, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %426 = Base.add_int(%423, %425)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:99 within `getindex'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:78 within `arrayref'
└────││││        goto #112 if not false
108 ─││││ %428 = Core.tuple(%426)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %429 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %430 = Base.slt_int(%429, 0)::Bool
│    ││││││││└
│    ││││││││ %431 = Base.ifelse(%430, 0, %429)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %432 = Base.sle_int(1, %426)::Bool
│    │││││││ %433 = Base.sle_int(%426, %431)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %434 = Base.and_int(%432, %433)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #110 if not %434
     │││││ @ abstractarray.jl:507 within `checkbounds'
109 ─│││││        goto #111
     │││││ @ abstractarray.jl:506 within `checkbounds'
110 ─│││││        invoke Base.throw_boundserror(%50::CuDeviceArray{Float64,2,3}, %428::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
111 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
112 ┄│││││││ %440 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %441 = Base.sub_int(%426, 1)::Int64
│    │││││││└
│    │││││││ %442 = (%440)($(QuoteNode(Ptr{Nothing} @0x00000bb8342cc6e8)), Float64, Tuple{Core.LLVMPtr{Float64,3},Int64}, %49, %441)::Float64
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
117 ─││ %448 = Core.tuple(%400, %45)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %449 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %450 = Base.ifelse(%449, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %451 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %452 = Base.ifelse(%451, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %453 = Base.sle_int(1, %400)::Bool
│    ││││││ %454 = Base.sle_int(%400, %450)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %455 = Base.and_int(%453, %454)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %456 = Base.sle_int(1, %45)::Bool
│    ││││││ %457 = Base.sle_int(%45, %452)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %458 = Base.and_int(%456, %457)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %459 = Base.and_int(%458, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %460 = Base.and_int(%455, %459)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #119 if not %460
     │││ @ abstractarray.jl:507 within `checkbounds'
118 ─│││        goto #120
     │││ @ abstractarray.jl:506 within `checkbounds'
119 ─│││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %448::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
120 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
121 ┄│││││││ %466 = Base.sub_int(%400, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %467 = Base.mul_int(%466, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %468 = Base.add_int(1, %467)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %469 = Base.sub_int(%45, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %470 = Base.mul_int(%469, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %471 = Base.add_int(%468, %470)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:99 within `getindex'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:78 within `arrayref'
└────││││        goto #126 if not false
122 ─││││ %473 = Core.tuple(%471)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %474 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %475 = Base.slt_int(%474, 0)::Bool
│    ││││││││└
│    ││││││││ %476 = Base.ifelse(%475, 0, %474)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %477 = Base.sle_int(1, %471)::Bool
│    │││││││ %478 = Base.sle_int(%471, %476)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %479 = Base.and_int(%477, %478)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #124 if not %479
     │││││ @ abstractarray.jl:507 within `checkbounds'
123 ─│││││        goto #125
     │││││ @ abstractarray.jl:506 within `checkbounds'
124 ─│││││        invoke Base.throw_boundserror(%53::CuDeviceArray{Float64,2,3}, %473::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
125 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:7 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
126 ┄│││││││ %485 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %486 = Base.sub_int(%471, 1)::Int64
│    │││││││└
│    │││││││ %487 = (%485)($(QuoteNode(Ptr{Nothing} @0x00000bb8342cc6e8)), Float64, Tuple{Core.LLVMPtr{Float64,3},Int64}, %52, %486)::Float64
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
     ┌ @ float.jl:405 within `*'
130 ─│ %492 = Base.mul_float(%442, %487)::Float64
│    └
│    ┌ @ float.jl:401 within `+'
│    │ %493 = Base.add_float(%399, %492)::Float64
│    └
│    ┌ @ range.jl:624 within `iterate'
│    │┌ @ promotion.jl:398 within `=='
│    ││ %494 = (%401 === 32)::Bool
│    │└
└────│        goto #132 if not %494
131 ─│        goto #133
     │ @ range.jl:625 within `iterate'
     │┌ @ int.jl:86 within `+'
132 ─││ %497 = Base.add_int(%401, 1)::Int64
│    │└
│    │ @ range.jl:626 within `iterate'
└────│        goto #133
     └
133 ┄ %499 = φ (#132 => %497)::Int64
│     %500 = φ (#132 => %497)::Int64
│     %501 = φ (#131 => true, #132 => false)::Bool
│     %502 = Base.not_int(%501)::Bool
└────        goto #135 if not %502
134 ─        goto #102
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
135 ┄ %505 = φ (#133 => %493, #101 => %74)::Float64
│    ┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
│    │        $(Expr(:foreigncall, "llvm.nvvm.barrier0", Nothing, svec(), 0, :(:llvmcall)))::Nothing
│    └
│    ┌ @ range.jl:624 within `iterate'
│    │┌ @ promotion.jl:398 within `=='
│    ││ %507 = (%76 === %64)::Bool
│    │└
└────│        goto #137 if not %507
136 ─│        goto #138
     │ @ range.jl:625 within `iterate'
     │┌ @ int.jl:86 within `+'
137 ─││ %510 = Base.add_int(%76, 1)::Int64
│    │└
│    │ @ range.jl:626 within `iterate'
└────│        goto #138
     └
138 ┄ %512 = φ (#137 => %510)::Int64
│     %513 = φ (#137 => %510)::Int64
│     %514 = φ (#136 => true, #137 => false)::Bool
│     %515 = Base.not_int(%514)::Bool
└────        goto #140 if not %515
139 ─        goto #5
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
140 ┄ %518 = φ (#138 => %505, #4 => 0.0)::Float64
│    ┌ @ int.jl:85 within `-'
│    │ %519 = Base.sub_int(%19, 1)::Int64
│    └
│     %520 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %521 = Base.mul_int(%519, %520)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %522 = Base.add_int(%521, %35)::Int64
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:142 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %523 = Base.sub_int(%29, 1)::Int64
│    └
│     %524 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %525 = Base.mul_int(%523, %524)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %526 = Base.add_int(%525, %45)::Int64
│    └
│     @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
│    ┌ @ promotion.jl:350 within `<='
│    │┌ @ promotion.jl:282 within `promote'
│    ││┌ @ promotion.jl:259 within `_promote'
│    │││┌ @ number.jl:7 within `convert'
│    ││││┌ @ boot.jl:708 within `Int64'
│    │││││┌ @ boot.jl:627 within `toInt64'
│    ││││││ %527 = Core.sext_int(Core.Int64, N)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %528 = Base.sle_int(%522, %527)::Bool
│    └
└────        goto #142 if not %528
     ┌ @ promotion.jl:350 within `<='
     │┌ @ promotion.jl:282 within `promote'
     ││┌ @ promotion.jl:259 within `_promote'
     │││┌ @ number.jl:7 within `convert'
     ││││┌ @ boot.jl:708 within `Int64'
     │││││┌ @ boot.jl:627 within `toInt64'
141 ─││││││ %530 = Core.sext_int(Core.Int64, M)::Int64
│    │└└└└└
│    │ @ promotion.jl:350 within `<=' @ int.jl:441
│    │ %531 = Base.sle_int(%526, %530)::Bool
│    └
└────        goto #143
142 ─        nothing::Nothing
143 ┄ %534 = φ (#141 => %531, #142 => false)::Bool
└────        goto #159 if not %534
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:145 within `coalesced_matmul_kernel!'
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
144 ─││        goto #149 if not false
145 ─││ %537 = Core.tuple(%522, %526)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %538 = Base.slt_int(%4, 0)::Bool
│    │││││││└
│    │││││││ %539 = Base.ifelse(%538, 0, %4)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %540 = Base.slt_int(%5, 0)::Bool
│    │││││││└
│    │││││││ %541 = Base.ifelse(%540, 0, %5)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %542 = Base.sle_int(1, %522)::Bool
│    ││││││ %543 = Base.sle_int(%522, %539)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %544 = Base.and_int(%542, %543)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %545 = Base.sle_int(1, %526)::Bool
│    ││││││ %546 = Base.sle_int(%526, %541)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %547 = Base.and_int(%545, %546)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %548 = Base.and_int(%547, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %549 = Base.and_int(%544, %548)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #147 if not %549
     │││ @ abstractarray.jl:507 within `checkbounds'
146 ─│││        goto #148
     │││ @ abstractarray.jl:506 within `checkbounds'
147 ─│││        invoke Base.throw_boundserror(%7::CuDeviceArray{Float64,2,1}, %537::Tuple{Int64,Int64})::Union{}
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
149 ┄│││││││││ %555 = Base.slt_int(%4, 0)::Bool
│    ││││││││└
│    ││││││││ %556 = Base.ifelse(%555, 0, %4)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %557 = Base.sub_int(%556, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %558 = Base.mul_int(1, %557)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %559 = Base.sub_int(%522, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %560 = Base.mul_int(%559, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %561 = Base.add_int(1, %560)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %562 = Base.sub_int(%526, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %563 = Base.mul_int(%562, %558)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %564 = Base.add_int(%561, %563)::Int64
│    ││└└└└
│    ││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:84 within `arrayset'
└────││││        goto #154 if not false
150 ─││││ %566 = Core.tuple(%564)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %567 = Base.mul_int(%4, %5)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %568 = Base.slt_int(%567, 0)::Bool
│    ││││││││└
│    ││││││││ %569 = Base.ifelse(%568, 0, %567)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %570 = Base.sle_int(1, %564)::Bool
│    │││││││ %571 = Base.sle_int(%564, %569)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %572 = Base.and_int(%570, %571)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #152 if not %572
     │││││ @ abstractarray.jl:507 within `checkbounds'
151 ─│││││        goto #153
     │││││ @ abstractarray.jl:506 within `checkbounds'
152 ─│││││        invoke Base.throw_boundserror(%7::CuDeviceArray{Float64,2,1}, %566::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
153 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/pointer.jl:42 within `macro expansion' @ /opt/julia/usr/local/share/julia/packages/LLVM/dUfQc/src/interop/base.jl:80
154 ┄│││││││ %578 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %579 = Base.sub_int(%564, 1)::Int64
│    │││││││└
│    │││││││        (%578)($(QuoteNode(Ptr{Nothing} @0x00000bb833748c88)), Nothing, Tuple{Core.LLVMPtr{Float64,1},Float64,Int64}, %1, %518, %579)::Nothing
│    ││││└└└
│    ││││ @ /opt/julia/usr/local/share/julia/packages/CUDA/0p5fn/src/device/array.jl:87 within `arrayset'
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
      @ /users/tandrews/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
159 ┄        return Main.nothing
) => Nothing
