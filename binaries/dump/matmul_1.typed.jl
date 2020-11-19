CodeInfo(
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:78 within `coalesced_matmul_kernel!'
     ┌ @ essentials.jl:414 within `reinterpret'
1 ───│ %1   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_out)::Core.LLVMPtr{Float64,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:79 within `coalesced_matmul_kernel!'
│    ┌ @ essentials.jl:414 within `reinterpret'
│    │ %2   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_in1)::Core.LLVMPtr{Float64,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:80 within `coalesced_matmul_kernel!'
│    ┌ @ essentials.jl:414 within `reinterpret'
│    │ %3   = Base.bitcast(Core.LLVMPtr{Float64,1}, ptr_in2)::Core.LLVMPtr{Float64,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:81 within `coalesced_matmul_kernel!'
│     %4   = π (N@_5, Int32)
│     %5   = π (N@_5, Int32)
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
│    │┌ @ broadcast.jl:837 within `materialize'
│    ││┌ @ broadcast.jl:1046 within `copy'
│    │││┌ @ ntuple.jl:42 within `ntuple'
│    ││││┌ @ broadcast.jl:1046 within `#19'
│    │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %6   = Core.sext_int(Core.Int64, %4)::Int64
│    ││││││└└└
│    ││││││ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %7   = Core.sext_int(Core.Int64, %5)::Int64
│    ││││└└└└└
│    ││││ %8   = Core.tuple(%6, %7)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %9   = %new(CuDeviceArray{Float64,2,1}, %8, %1)::CuDeviceArray{Float64,2,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:82 within `coalesced_matmul_kernel!'
│     %10  = π (N@_5, Int32)
│     %11  = π (N@_5, Int32)
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
│    │┌ @ broadcast.jl:837 within `materialize'
│    ││┌ @ broadcast.jl:1046 within `copy'
│    │││┌ @ ntuple.jl:42 within `ntuple'
│    ││││┌ @ broadcast.jl:1046 within `#19'
│    │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %12  = Core.sext_int(Core.Int64, %10)::Int64
│    ││││││└└└
│    ││││││ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %13  = Core.sext_int(Core.Int64, %11)::Int64
│    ││││└└└└└
│    ││││ %14  = Core.tuple(%12, %13)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %15  = %new(CuDeviceArray{Float64,2,1}, %14, %2)::CuDeviceArray{Float64,2,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:83 within `coalesced_matmul_kernel!'
│     %16  = π (N@_5, Int32)
│     %17  = π (N@_5, Int32)
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
│    │┌ @ broadcast.jl:837 within `materialize'
│    ││┌ @ broadcast.jl:1046 within `copy'
│    │││┌ @ ntuple.jl:42 within `ntuple'
│    ││││┌ @ broadcast.jl:1046 within `#19'
│    │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %18  = Core.sext_int(Core.Int64, %16)::Int64
│    ││││││└└└
│    ││││││ @ broadcast.jl:621 within `_broadcast_getindex'
│    ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
│    │││││││┌ @ boot.jl:708 within `Int64'
│    ││││││││┌ @ boot.jl:627 within `toInt64'
│    │││││││││ %19  = Core.sext_int(Core.Int64, %17)::Int64
│    ││││└└└└└
│    ││││ %20  = Core.tuple(%18, %19)::Tuple{Int64,Int64}
│    │└└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    │ %21  = %new(CuDeviceArray{Float64,2,1}, %20, %3)::CuDeviceArray{Float64,2,1}
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:84 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %22  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %23  = (%22)($(QuoteNode(Ptr{Nothing} @0x0000000005ae6868)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %24  = Core.zext_int(Core.Int64, %23)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %25  = Base.add_int(%24, 1)::Int64
│    │└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %26  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%26)($(QuoteNode(Ptr{Nothing} @0x00000000059769f8)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %28  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%28)($(QuoteNode(Ptr{Nothing} @0x0000000005b322b8)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:85 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %30  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%30)($(QuoteNode(Ptr{Nothing} @0x0000000005ae6868)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %32  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %33  = (%32)($(QuoteNode(Ptr{Nothing} @0x00000000059769f8)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %34  = Core.zext_int(Core.Int64, %33)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %35  = Base.add_int(%34, 1)::Int64
│    │└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %36  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%36)($(QuoteNode(Ptr{Nothing} @0x0000000005b322b8)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:86 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %38  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %39  = (%38)($(QuoteNode(Ptr{Nothing} @0x0000000005c39898)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %40  = Core.zext_int(Core.Int64, %39)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %41  = Base.add_int(%40, 1)::Int64
│    │└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %42  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%42)($(QuoteNode(Ptr{Nothing} @0x00000000040784d8)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %44  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%44)($(QuoteNode(Ptr{Nothing} @0x0000000005905b88)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:87 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %46  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%46)($(QuoteNode(Ptr{Nothing} @0x0000000005c39898)), UInt32, Tuple{})::UInt32
│    │└└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %48  = Base.llvmcall::Core.IntrinsicFunction
│    ││││ %49  = (%48)($(QuoteNode(Ptr{Nothing} @0x00000000040784d8)), UInt32, Tuple{})::UInt32
│    ││└└
│    ││┌ @ boot.jl:708 within `Int64'
│    │││┌ @ boot.jl:632 within `toInt64'
│    ││││ %50  = Core.zext_int(Core.Int64, %49)::Int64
│    ││└└
│    ││┌ @ int.jl:86 within `+'
│    │││ %51  = Base.add_int(%50, 1)::Int64
│    │└└
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    ││││ %52  = Base.llvmcall::Core.IntrinsicFunction
│    ││││        (%52)($(QuoteNode(Ptr{Nothing} @0x0000000005905b88)), UInt32, Tuple{})::UInt32
│    └└└└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:90 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    │││ %54  = Base.llvmcall::Core.IntrinsicFunction
│    │││ %55  = (%54)($(QuoteNode(Ptr{Nothing} @0x0000000005c2fc78)), Core.LLVMPtr{Float64,3}, Tuple{})::Core.LLVMPtr{Float64,3}
│    │└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    ││ %56  = %new(CuDeviceArray{Float64,2,3}, (33, 32), %55)::CuDeviceArray{Float64,2,3}
│    └└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:91 within `coalesced_matmul_kernel!'
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
│    │││ %57  = Base.llvmcall::Core.IntrinsicFunction
│    │││ %58  = (%57)($(QuoteNode(Ptr{Nothing} @0x0000000003a4da18)), Core.LLVMPtr{Float64,3}, Tuple{})::Core.LLVMPtr{Float64,3}
│    │└└
│    │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
│    │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
│    ││ %59  = %new(CuDeviceArray{Float64,2,3}, (33, 32), %58)::CuDeviceArray{Float64,2,3}
│    └└
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
│     %60  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:260 within `div'
│    │ %61  = Base.checked_sdiv_int(%6, %60)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
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
└────        goto #100 if not %72
5 ┄── %74  = φ (#4 => 0.0, #99 => %387)::Float64
│     %75  = φ (#4 => %70, #99 => %394)::Int64
│     %76  = φ (#4 => %71, #99 => %395)::Int64
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:101 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %77  = Base.sub_int(%25, 1)::Int64
│    └
│     %78  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %79  = Base.mul_int(%77, %78)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %80  = Base.add_int(%79, %41)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:102 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %81  = Base.sub_int(%35, 1)::Int64
│    └
│     %82  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %83  = Base.mul_int(%81, %82)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %84  = Base.add_int(%83, %51)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:105 within `coalesced_matmul_kernel!'
│     %85  = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %86  = Base.mul_int(%75, %85)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %87  = Base.add_int(%86, %51)::Int64
│    └
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #10 if not false
6 ───││ %89  = Core.tuple(%80, %87)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %90  = Base.slt_int(%12, 0)::Bool
│    │││││││└
│    │││││││ %91  = Base.ifelse(%90, 0, %12)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %92  = Base.slt_int(%13, 0)::Bool
│    │││││││└
│    │││││││ %93  = Base.ifelse(%92, 0, %13)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %94  = Base.sle_int(1, %80)::Bool
│    ││││││ %95  = Base.sle_int(%80, %91)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %96  = Base.and_int(%94, %95)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %97  = Base.sle_int(1, %87)::Bool
│    ││││││ %98  = Base.sle_int(%87, %93)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %99  = Base.and_int(%97, %98)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %100 = Base.and_int(%99, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %101 = Base.and_int(%96, %100)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #8 if not %101
     │││ @ abstractarray.jl:507 within `checkbounds'
7 ───│││        goto #9
     │││ @ abstractarray.jl:506 within `checkbounds'
8 ───│││        invoke Base.throw_boundserror(%15::CuDeviceArray{Float64,2,1}, %89::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
9 ┄──│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
10 ┄─│││││││││ %107 = Base.slt_int(%12, 0)::Bool
│    ││││││││└
│    ││││││││ %108 = Base.ifelse(%107, 0, %12)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %109 = Base.sub_int(%108, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %110 = Base.mul_int(1, %109)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %111 = Base.sub_int(%80, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %112 = Base.mul_int(%111, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %113 = Base.add_int(1, %112)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %114 = Base.sub_int(%87, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %115 = Base.mul_int(%114, %110)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %116 = Base.add_int(%113, %115)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #15 if not false
11 ──││││ %118 = Core.tuple(%116)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %119 = Base.mul_int(%12, %13)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %120 = Base.slt_int(%119, 0)::Bool
│    ││││││││└
│    ││││││││ %121 = Base.ifelse(%120, 0, %119)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %122 = Base.sle_int(1, %116)::Bool
│    │││││││ %123 = Base.sle_int(%116, %121)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %124 = Base.and_int(%122, %123)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #13 if not %124
     │││││ @ abstractarray.jl:507 within `checkbounds'
12 ──│││││        goto #14
     │││││ @ abstractarray.jl:506 within `checkbounds'
13 ──│││││        invoke Base.throw_boundserror(%15::CuDeviceArray{Float64,2,1}, %118::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
14 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
15 ┄─│││││││ %130 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %131 = Base.sub_int(%116, 1)::Int64
│    │││││││└
│    │││││││ %132 = (%130)($(QuoteNode(Ptr{Nothing} @0x00000000032824e8)), Float64, Tuple{Core.LLVMPtr{Float64,1},Int64}, %2, %131)::Float64
│    ││││└└└
└────││││        goto #16
     │││└
16 ──│││        goto #17
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
17 ──││        goto #18
     │└
18 ──│        goto #19
     └
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
19 ──││        goto #24 if not false
20 ──││ %138 = Core.tuple(%41, %51)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %139 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %140 = Base.ifelse(%139, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %141 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %142 = Base.ifelse(%141, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %143 = Base.sle_int(1, %41)::Bool
│    ││││││ %144 = Base.sle_int(%41, %140)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %145 = Base.and_int(%143, %144)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %146 = Base.sle_int(1, %51)::Bool
│    ││││││ %147 = Base.sle_int(%51, %142)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %148 = Base.and_int(%146, %147)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %149 = Base.and_int(%148, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %150 = Base.and_int(%145, %149)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #22 if not %150
     │││ @ abstractarray.jl:507 within `checkbounds'
21 ──│││        goto #23
     │││ @ abstractarray.jl:506 within `checkbounds'
22 ──│││        invoke Base.throw_boundserror(%56::CuDeviceArray{Float64,2,3}, %138::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
23 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
24 ┄─│││││││ %156 = Base.sub_int(%41, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %157 = Base.mul_int(%156, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %158 = Base.add_int(1, %157)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %159 = Base.sub_int(%51, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %160 = Base.mul_int(%159, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %161 = Base.add_int(%158, %160)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #29 if not false
25 ──││││ %163 = Core.tuple(%161)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %164 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %165 = Base.slt_int(%164, 0)::Bool
│    ││││││││└
│    ││││││││ %166 = Base.ifelse(%165, 0, %164)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %167 = Base.sle_int(1, %161)::Bool
│    │││││││ %168 = Base.sle_int(%161, %166)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %169 = Base.and_int(%167, %168)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #27 if not %169
     │││││ @ abstractarray.jl:507 within `checkbounds'
26 ──│││││        goto #28
     │││││ @ abstractarray.jl:506 within `checkbounds'
27 ──│││││        invoke Base.throw_boundserror(%56::CuDeviceArray{Float64,2,3}, %163::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
28 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
29 ┄─│││││││ %175 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %176 = Base.sub_int(%161, 1)::Int64
│    │││││││└
│    │││││││        (%175)($(QuoteNode(Ptr{Nothing} @0x00000000030bcd88)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %55, %132, %176)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #30
     │││└
30 ──│││        goto #31
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
31 ──││        goto #32
     │└
32 ──│        goto #33
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
33 ── %182 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %183 = Base.mul_int(%75, %182)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %184 = Base.add_int(%183, %41)::Int64
│    └
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #38 if not false
34 ──││ %186 = Core.tuple(%184, %84)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %187 = Base.slt_int(%18, 0)::Bool
│    │││││││└
│    │││││││ %188 = Base.ifelse(%187, 0, %18)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %189 = Base.slt_int(%19, 0)::Bool
│    │││││││└
│    │││││││ %190 = Base.ifelse(%189, 0, %19)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %191 = Base.sle_int(1, %184)::Bool
│    ││││││ %192 = Base.sle_int(%184, %188)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %193 = Base.and_int(%191, %192)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %194 = Base.sle_int(1, %84)::Bool
│    ││││││ %195 = Base.sle_int(%84, %190)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %196 = Base.and_int(%194, %195)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %197 = Base.and_int(%196, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %198 = Base.and_int(%193, %197)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #36 if not %198
     │││ @ abstractarray.jl:507 within `checkbounds'
35 ──│││        goto #37
     │││ @ abstractarray.jl:506 within `checkbounds'
36 ──│││        invoke Base.throw_boundserror(%21::CuDeviceArray{Float64,2,1}, %186::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
37 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
38 ┄─│││││││││ %204 = Base.slt_int(%18, 0)::Bool
│    ││││││││└
│    ││││││││ %205 = Base.ifelse(%204, 0, %18)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %206 = Base.sub_int(%205, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %207 = Base.mul_int(1, %206)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %208 = Base.sub_int(%184, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %209 = Base.mul_int(%208, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %210 = Base.add_int(1, %209)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %211 = Base.sub_int(%84, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %212 = Base.mul_int(%211, %207)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %213 = Base.add_int(%210, %212)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #43 if not false
39 ──││││ %215 = Core.tuple(%213)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %216 = Base.mul_int(%18, %19)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %217 = Base.slt_int(%216, 0)::Bool
│    ││││││││└
│    ││││││││ %218 = Base.ifelse(%217, 0, %216)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %219 = Base.sle_int(1, %213)::Bool
│    │││││││ %220 = Base.sle_int(%213, %218)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %221 = Base.and_int(%219, %220)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #41 if not %221
     │││││ @ abstractarray.jl:507 within `checkbounds'
40 ──│││││        goto #42
     │││││ @ abstractarray.jl:506 within `checkbounds'
41 ──│││││        invoke Base.throw_boundserror(%21::CuDeviceArray{Float64,2,1}, %215::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
42 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
43 ┄─│││││││ %227 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %228 = Base.sub_int(%213, 1)::Int64
│    │││││││└
│    │││││││ %229 = (%227)($(QuoteNode(Ptr{Nothing} @0x00000000032824e8)), Float64, Tuple{Core.LLVMPtr{Float64,1},Int64}, %3, %228)::Float64
│    ││││└└└
└────││││        goto #44
     │││└
44 ──│││        goto #45
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
45 ──││        goto #46
     │└
46 ──│        goto #47
     └
     ┌ @ abstractarray.jl:1153 within `setindex!'
     │┌ @ abstractarray.jl:1175 within `_setindex!'
47 ──││        goto #52 if not false
48 ──││ %235 = Core.tuple(%41, %51)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %236 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %237 = Base.ifelse(%236, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %238 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %239 = Base.ifelse(%238, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %240 = Base.sle_int(1, %41)::Bool
│    ││││││ %241 = Base.sle_int(%41, %237)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %242 = Base.and_int(%240, %241)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %243 = Base.sle_int(1, %51)::Bool
│    ││││││ %244 = Base.sle_int(%51, %239)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %245 = Base.and_int(%243, %244)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %246 = Base.and_int(%245, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %247 = Base.and_int(%242, %246)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #50 if not %247
     │││ @ abstractarray.jl:507 within `checkbounds'
49 ──│││        goto #51
     │││ @ abstractarray.jl:506 within `checkbounds'
50 ──│││        invoke Base.throw_boundserror(%59::CuDeviceArray{Float64,2,3}, %235::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
51 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
52 ┄─│││││││ %253 = Base.sub_int(%41, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %254 = Base.mul_int(%253, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %255 = Base.add_int(1, %254)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %256 = Base.sub_int(%51, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %257 = Base.mul_int(%256, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %258 = Base.add_int(%255, %257)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #57 if not false
53 ──││││ %260 = Core.tuple(%258)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %261 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %262 = Base.slt_int(%261, 0)::Bool
│    ││││││││└
│    ││││││││ %263 = Base.ifelse(%262, 0, %261)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %264 = Base.sle_int(1, %258)::Bool
│    │││││││ %265 = Base.sle_int(%258, %263)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %266 = Base.and_int(%264, %265)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #55 if not %266
     │││││ @ abstractarray.jl:507 within `checkbounds'
54 ──│││││        goto #56
     │││││ @ abstractarray.jl:506 within `checkbounds'
55 ──│││││        invoke Base.throw_boundserror(%59::CuDeviceArray{Float64,2,3}, %260::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
56 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
57 ┄─│││││││ %272 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %273 = Base.sub_int(%258, 1)::Int64
│    │││││││└
│    │││││││        (%272)($(QuoteNode(Ptr{Nothing} @0x00000000030bcd88)), Nothing, Tuple{Core.LLVMPtr{Float64,3},Float64,Int64}, %58, %229, %273)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #58
     │││└
58 ──│││        goto #59
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
59 ──││        goto #60
     │└
60 ──│        goto #61
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
     ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
61 ──│        $(Expr(:foreigncall, "llvm.nvvm.barrier0", Nothing, svec(), 0, :(:llvmcall)))::Nothing
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:116 within `coalesced_matmul_kernel!'
└────        goto #95 if not true
62 ┄─ %281 = φ (#61 => %74, #94 => %375)::Float64
│     %282 = φ (#61 => 1, #94 => %381)::Int64
│     %283 = φ (#61 => 1, #94 => %382)::Int64
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:117 within `coalesced_matmul_kernel!'
│    ┌ @ abstractarray.jl:1060 within `getindex'
│    │┌ @ abstractarray.jl:1082 within `_getindex'
└────││        goto #67 if not false
63 ──││ %285 = Core.tuple(%41, %282)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %286 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %287 = Base.ifelse(%286, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %288 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %289 = Base.ifelse(%288, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %290 = Base.sle_int(1, %41)::Bool
│    ││││││ %291 = Base.sle_int(%41, %287)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %292 = Base.and_int(%290, %291)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %293 = Base.sle_int(1, %282)::Bool
│    ││││││ %294 = Base.sle_int(%282, %289)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %295 = Base.and_int(%293, %294)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %296 = Base.and_int(%295, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %297 = Base.and_int(%292, %296)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #65 if not %297
     │││ @ abstractarray.jl:507 within `checkbounds'
64 ──│││        goto #66
     │││ @ abstractarray.jl:506 within `checkbounds'
65 ──│││        invoke Base.throw_boundserror(%56::CuDeviceArray{Float64,2,3}, %285::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
66 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
67 ┄─│││││││ %303 = Base.sub_int(%41, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %304 = Base.mul_int(%303, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %305 = Base.add_int(1, %304)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %306 = Base.sub_int(%282, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %307 = Base.mul_int(%306, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %308 = Base.add_int(%305, %307)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #72 if not false
68 ──││││ %310 = Core.tuple(%308)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %311 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %312 = Base.slt_int(%311, 0)::Bool
│    ││││││││└
│    ││││││││ %313 = Base.ifelse(%312, 0, %311)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %314 = Base.sle_int(1, %308)::Bool
│    │││││││ %315 = Base.sle_int(%308, %313)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %316 = Base.and_int(%314, %315)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #70 if not %316
     │││││ @ abstractarray.jl:507 within `checkbounds'
69 ──│││││        goto #71
     │││││ @ abstractarray.jl:506 within `checkbounds'
70 ──│││││        invoke Base.throw_boundserror(%56::CuDeviceArray{Float64,2,3}, %310::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
71 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
72 ┄─│││││││ %322 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %323 = Base.sub_int(%308, 1)::Int64
│    │││││││└
│    │││││││ %324 = (%322)($(QuoteNode(Ptr{Nothing} @0x000000000476c918)), Float64, Tuple{Core.LLVMPtr{Float64,3},Int64}, %55, %323)::Float64
│    ││││└└└
└────││││        goto #73
     │││└
73 ──│││        goto #74
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
74 ──││        goto #75
     │└
75 ──│        goto #76
     │┌ @ abstractarray.jl:1082 within `_getindex'
76 ──││        goto #81 if not false
77 ──││ %330 = Core.tuple(%282, %51)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %331 = Base.slt_int(33, 0)::Bool
│    │││││││└
│    │││││││ %332 = Base.ifelse(%331, 0, 33)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %333 = Base.slt_int(32, 0)::Bool
│    │││││││└
│    │││││││ %334 = Base.ifelse(%333, 0, 32)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %335 = Base.sle_int(1, %282)::Bool
│    ││││││ %336 = Base.sle_int(%282, %332)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %337 = Base.and_int(%335, %336)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %338 = Base.sle_int(1, %51)::Bool
│    ││││││ %339 = Base.sle_int(%51, %334)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %340 = Base.and_int(%338, %339)::Bool
│    ││││└└
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %341 = Base.and_int(%340, true)::Bool
│    ││││└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ bool.jl:40 within `&'
│    │││││ %342 = Base.and_int(%337, %341)::Bool
│    │││└└
│    │││ @ abstractarray.jl:506 within `checkbounds'
└────│││        goto #79 if not %342
     │││ @ abstractarray.jl:507 within `checkbounds'
78 ──│││        goto #80
     │││ @ abstractarray.jl:506 within `checkbounds'
79 ──│││        invoke Base.throw_boundserror(%59::CuDeviceArray{Float64,2,3}, %330::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
80 ┄─│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1083 within `_getindex'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
     ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
     │││││┌ @ abstractarray.jl:1918 within `offsetin'
     ││││││┌ @ int.jl:85 within `-'
81 ┄─│││││││ %348 = Base.sub_int(%282, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %349 = Base.mul_int(%348, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %350 = Base.add_int(1, %349)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %351 = Base.sub_int(%51, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %352 = Base.mul_int(%351, 33)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %353 = Base.add_int(%350, %352)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
└────││││        goto #86 if not false
82 ──││││ %355 = Core.tuple(%353)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %356 = Base.mul_int(33, 32)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %357 = Base.slt_int(%356, 0)::Bool
│    ││││││││└
│    ││││││││ %358 = Base.ifelse(%357, 0, %356)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %359 = Base.sle_int(1, %353)::Bool
│    │││││││ %360 = Base.sle_int(%353, %358)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %361 = Base.and_int(%359, %360)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #84 if not %361
     │││││ @ abstractarray.jl:507 within `checkbounds'
83 ──│││││        goto #85
     │││││ @ abstractarray.jl:506 within `checkbounds'
84 ──│││││        invoke Base.throw_boundserror(%59::CuDeviceArray{Float64,2,3}, %355::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
85 ┄─│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
86 ┄─│││││││ %367 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %368 = Base.sub_int(%353, 1)::Int64
│    │││││││└
│    │││││││ %369 = (%367)($(QuoteNode(Ptr{Nothing} @0x000000000476c918)), Float64, Tuple{Core.LLVMPtr{Float64,3},Int64}, %58, %368)::Float64
│    ││││└└└
└────││││        goto #87
     │││└
87 ──│││        goto #88
     ││└
     ││ @ abstractarray.jl:1084 within `_getindex'
88 ──││        goto #89
     │└
89 ──│        goto #90
     └
     ┌ @ float.jl:405 within `*'
90 ──│ %374 = Base.mul_float(%324, %369)::Float64
│    └
│    ┌ @ float.jl:401 within `+'
│    │ %375 = Base.add_float(%281, %374)::Float64
│    └
│    ┌ @ range.jl:624 within `iterate'
│    │┌ @ promotion.jl:398 within `=='
│    ││ %376 = (%283 === 32)::Bool
│    │└
└────│        goto #92 if not %376
91 ──│        goto #93
     │ @ range.jl:625 within `iterate'
     │┌ @ int.jl:86 within `+'
92 ──││ %379 = Base.add_int(%283, 1)::Int64
│    │└
│    │ @ range.jl:626 within `iterate'
└────│        goto #93
     └
93 ┄─ %381 = φ (#92 => %379)::Int64
│     %382 = φ (#92 => %379)::Int64
│     %383 = φ (#91 => true, #92 => false)::Bool
│     %384 = Base.not_int(%383)::Bool
└────        goto #95 if not %384
94 ──        goto #62
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
95 ┄─ %387 = φ (#93 => %375, #61 => %74)::Float64
│    ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
│    │        $(Expr(:foreigncall, "llvm.nvvm.barrier0", Nothing, svec(), 0, :(:llvmcall)))::Nothing
│    └
│    ┌ @ range.jl:624 within `iterate'
│    │┌ @ promotion.jl:398 within `=='
│    ││ %389 = (%76 === %64)::Bool
│    │└
└────│        goto #97 if not %389
96 ──│        goto #98
     │ @ range.jl:625 within `iterate'
     │┌ @ int.jl:86 within `+'
97 ──││ %392 = Base.add_int(%76, 1)::Int64
│    │└
│    │ @ range.jl:626 within `iterate'
└────│        goto #98
     └
98 ┄─ %394 = φ (#97 => %392)::Int64
│     %395 = φ (#97 => %392)::Int64
│     %396 = φ (#96 => true, #97 => false)::Bool
│     %397 = Base.not_int(%396)::Bool
└────        goto #100 if not %397
99 ──        goto #5
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
100 ┄ %400 = φ (#98 => %387, #4 => 0.0)::Float64
│    ┌ @ int.jl:85 within `-'
│    │ %401 = Base.sub_int(%25, 1)::Int64
│    └
│     %402 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %403 = Base.mul_int(%401, %402)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %404 = Base.add_int(%403, %41)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:124 within `coalesced_matmul_kernel!'
│    ┌ @ int.jl:85 within `-'
│    │ %405 = Base.sub_int(%35, 1)::Int64
│    └
│     %406 = Main.TILE_DIM::Core.Compiler.Const(32, false)
│    ┌ @ int.jl:87 within `*'
│    │ %407 = Base.mul_int(%405, %406)::Int64
│    └
│    ┌ @ int.jl:86 within `+'
│    │ %408 = Base.add_int(%407, %51)::Int64
│    └
│     @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
│    ┌ @ abstractarray.jl:1153 within `setindex!'
│    │┌ @ abstractarray.jl:1175 within `_setindex!'
└────││        goto #105 if not false
101 ─││ %410 = Core.tuple(%404, %408)::Tuple{Int64,Int64}
│    ││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:485
│    │││┌ @ abstractarray.jl:75 within `axes'
│    ││││┌ @ tuple.jl:158 within `map'
│    │││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %411 = Base.slt_int(%6, 0)::Bool
│    │││││││└
│    │││││││ %412 = Base.ifelse(%411, 0, %6)::Int64
│    ││││││└
│    ││││││ @ range.jl:326 within `OneTo' @ range.jl:317
│    ││││││┌ @ promotion.jl:409 within `max'
│    │││││││┌ @ int.jl:82 within `<'
│    ││││││││ %413 = Base.slt_int(%7, 0)::Bool
│    │││││││└
│    │││││││ %414 = Base.ifelse(%413, 0, %7)::Int64
│    │││└└└└
│    │││┌ @ abstractarray.jl:532 within `checkbounds_indices'
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %415 = Base.sle_int(1, %404)::Bool
│    ││││││ %416 = Base.sle_int(%404, %412)::Bool
│    │││││└
│    │││││┌ @ bool.jl:40 within `&'
│    ││││││ %417 = Base.and_int(%415, %416)::Bool
│    ││││└└
│    ││││ @ abstractarray.jl:532 within `checkbounds_indices' @ abstractarray.jl:532
│    ││││┌ @ abstractarray.jl:563 within `checkindex'
│    │││││┌ @ int.jl:441 within `<='
│    ││││││ %418 = Base.sle_int(1, %408)::Bool
│    ││││││ %419 = Base.sle_int(%408, %414)::Bool
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
└────│││        goto #103 if not %422
     │││ @ abstractarray.jl:507 within `checkbounds'
102 ─│││        goto #104
     │││ @ abstractarray.jl:506 within `checkbounds'
103 ─│││        invoke Base.throw_boundserror(%9::CuDeviceArray{Float64,2,1}, %410::Tuple{Int64,Int64})::Union{}
└────│││        $(Expr(:unreachable))::Union{}
104 ┄│││        nothing::Nothing
     ││└
     ││ @ abstractarray.jl:1176 within `_setindex!'
     ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
     │││┌ @ abstractarray.jl:1879 within `_sub2ind'
     ││││┌ @ abstractarray.jl:75 within `axes'
     │││││┌ @ tuple.jl:158 within `map'
     ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
     │││││││┌ @ promotion.jl:409 within `max'
     ││││││││┌ @ int.jl:82 within `<'
105 ┄│││││││││ %428 = Base.slt_int(%6, 0)::Bool
│    ││││││││└
│    ││││││││ %429 = Base.ifelse(%428, 0, %6)::Int64
│    ││││└└└└
│    ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
│    ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
│    │││││┌ @ abstractarray.jl:1915 within `nextL'
│    ││││││┌ @ range.jl:544 within `unsafe_length'
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %430 = Base.sub_int(%429, 0)::Int64
│    ││││││└└
│    ││││││┌ @ int.jl:87 within `*'
│    │││││││ %431 = Base.mul_int(1, %430)::Int64
│    │││││└└
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %432 = Base.sub_int(%404, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %433 = Base.mul_int(%432, 1)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %434 = Base.add_int(1, %433)::Int64
│    │││││└
│    │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
│    │││││┌ @ abstractarray.jl:1918 within `offsetin'
│    ││││││┌ @ int.jl:85 within `-'
│    │││││││ %435 = Base.sub_int(%408, 1)::Int64
│    │││││└└
│    │││││┌ @ int.jl:87 within `*'
│    ││││││ %436 = Base.mul_int(%435, %431)::Int64
│    │││││└
│    │││││┌ @ int.jl:86 within `+'
│    ││││││ %437 = Base.add_int(%434, %436)::Int64
│    ││└└└└
│    ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
│    │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
└────││││        goto #110 if not false
106 ─││││ %439 = Core.tuple(%437)::Tuple{Int64}
│    ││││┌ @ abstractarray.jl:506 within `checkbounds' @ abstractarray.jl:491
│    │││││┌ @ abstractarray.jl:266 within `eachindex'
│    ││││││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:60 within `length'
│    │││││││┌ @ tuple.jl:402 within `prod'
│    ││││││││┌ @ int.jl:87 within `*'
│    │││││││││ %440 = Base.mul_int(%6, %7)::Int64
│    ││││││└└└
│    ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
│    │││││││┌ @ promotion.jl:409 within `max'
│    ││││││││┌ @ int.jl:82 within `<'
│    │││││││││ %441 = Base.slt_int(%440, 0)::Bool
│    ││││││││└
│    ││││││││ %442 = Base.ifelse(%441, 0, %440)::Int64
│    │││││└└└
│    │││││┌ @ abstractarray.jl:563 within `checkindex'
│    ││││││┌ @ int.jl:441 within `<='
│    │││││││ %443 = Base.sle_int(1, %437)::Bool
│    │││││││ %444 = Base.sle_int(%437, %442)::Bool
│    ││││││└
│    ││││││┌ @ bool.jl:40 within `&'
│    │││││││ %445 = Base.and_int(%443, %444)::Bool
│    │││││└└
│    │││││ @ abstractarray.jl:506 within `checkbounds'
└────│││││        goto #108 if not %445
     │││││ @ abstractarray.jl:507 within `checkbounds'
107 ─│││││        goto #109
     │││││ @ abstractarray.jl:506 within `checkbounds'
108 ─│││││        invoke Base.throw_boundserror(%9::CuDeviceArray{Float64,2,1}, %439::Tuple{Int64})::Union{}
└────│││││        $(Expr(:unreachable))::Union{}
109 ┄│││││        nothing::Nothing
     ││││└
     ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
     ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
     │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
     ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
110 ┄│││││││ %451 = Base.llvmcall::Core.IntrinsicFunction
│    │││││││┌ @ int.jl:85 within `-'
│    ││││││││ %452 = Base.sub_int(%437, 1)::Int64
│    │││││││└
│    │││││││        (%451)($(QuoteNode(Ptr{Nothing} @0x00000000031fdfc8)), Nothing, Tuple{Core.LLVMPtr{Float64,1},Float64,Int64}, %1, %400, %452)::Nothing
│    ││││└└└
│    ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
└────││││        goto #111
     │││└
111 ─│││        goto #112
     ││└
     ││ @ abstractarray.jl:1177 within `_setindex!'
112 ─││        goto #113
     │└
113 ─│        goto #114
     └
      @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:127 within `coalesced_matmul_kernel!'
114 ─        return Main.nothing
) => Nothing
