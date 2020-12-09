; ModuleID = 'julia'
source_filename = "julia"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%jl_value_t = type opaque
%printf_args = type { i64 }

@__static_shmem_285 = internal addrspace(3) global [1056 x float] zeroinitializer, align 32
@__static_shmem_286 = internal addrspace(3) global [1056 x float] zeroinitializer, align 32
@exception4 = private unnamed_addr constant [10 x i8] c"exception\00", align 1
@0 = internal unnamed_addr constant [108 x i8] c"ERROR: a %s was thrown during kernel execution.\0A       Run Julia on debug level 2 for device stack traces.\0A\00", align 1
@1 = internal unnamed_addr constant [110 x i8] c"WARNING: could not signal exception status to the host, execution will continue.\0A         Please file a bug.\0A\00", align 1

;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:88 within `coalesced_matmul_kernel!'
define dso_local ptx_kernel void @_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1_(i64, i64, i64, i32, i32, i32) local_unnamed_addr !dbg !43 {
top:
  %6 = alloca [2 x i64]
  %7 = alloca { [2 x i64], i8 addrspace(1)* }
  %8 = alloca [2 x i64]
  %9 = alloca { [2 x i64], i8 addrspace(1)* }
  %10 = alloca [2 x i64]
  %11 = alloca { [2 x i64], i8 addrspace(1)* }
  %12 = alloca { [2 x i64], i8 addrspace(3)* }
  %13 = alloca { [2 x i64], i8 addrspace(3)* }
  %14 = alloca [2 x i64]
  %15 = alloca [1 x i64]
  %16 = alloca [2 x i64]
  %17 = alloca [1 x i64]
  %18 = alloca [2 x i64]
  %19 = alloca [1 x i64]
  %20 = alloca [2 x i64]
  %21 = alloca [1 x i64]
  %22 = alloca [2 x i64]
  %23 = alloca [1 x i64]
  %24 = alloca [2 x i64]
  %25 = alloca [1 x i64]
  %26 = alloca [2 x i64]
  %27 = alloca [1 x i64]
  %28 = alloca [2 x i64]
  %29 = alloca [1 x i64]
  %30 = alloca [2 x i64]
  %31 = alloca [1 x i64]
  %32 = call %jl_value_t*** @julia.ptls_states()
  %33 = bitcast %jl_value_t*** %32 to %jl_value_t addrspace(10)**
  %34 = getelementptr inbounds %jl_value_t addrspace(10)*, %jl_value_t addrspace(10)** %33, i64 4
  %35 = bitcast %jl_value_t addrspace(10)** %34 to i64**
  %36 = load i64*, i64** %35, !tbaa !45, !invariant.load !4
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:89 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %37 = inttoptr i64 %0 to i8 addrspace(1)*, !dbg !49
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:90 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %38 = inttoptr i64 %1 to i8 addrspace(1)*, !dbg !53
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:91 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %39 = inttoptr i64 %2 to i8 addrspace(1)*, !dbg !55
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:92 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
; │┌ @ broadcast.jl:837 within `materialize'
; ││┌ @ broadcast.jl:1046 within `copy'
; │││┌ @ ntuple.jl:42 within `ntuple'
; ││││┌ @ broadcast.jl:1046 within `#19'
; │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
; ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
; │││││││┌ @ boot.jl:708 within `Int64'
; ││││││││┌ @ boot.jl:627 within `toInt64'
           %40 = sext i32 %3 to i64, !dbg !57
           %41 = sext i32 %5 to i64, !dbg !57
; ││││└└└└└
      %42 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i32 0, i32 0, !dbg !69
      store i64 %40, i64* %42, align 8, !dbg !69, !tbaa !81
      %43 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i32 0, i32 1, !dbg !69
      store i64 %41, i64* %43, align 8, !dbg !69, !tbaa !81
; │└└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
   %44 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %7, i32 0, i32 0, !dbg !83
   %45 = bitcast [2 x i64]* %44 to i8*, !dbg !83
   %46 = bitcast [2 x i64]* %6 to i8*, !dbg !83
   call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %45, i8* %46, i64 16, i1 false), !dbg !83, !tbaa !81
   %47 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %7, i32 0, i32 1, !dbg !83
   store i8 addrspace(1)* %37, i8 addrspace(1)** %47, align 8, !dbg !83, !tbaa !81
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:93 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
; │┌ @ broadcast.jl:837 within `materialize'
; ││┌ @ broadcast.jl:1046 within `copy'
; │││┌ @ ntuple.jl:42 within `ntuple'
; ││││┌ @ broadcast.jl:1046 within `#19'
; │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
; ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
; │││││││┌ @ boot.jl:708 within `Int64'
; ││││││││┌ @ boot.jl:627 within `toInt64'
           %48 = sext i32 %3 to i64, !dbg !84
           %49 = sext i32 %4 to i64, !dbg !84
; ││││└└└└└
      %50 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i32 0, i32 0, !dbg !89
      store i64 %48, i64* %50, align 8, !dbg !89, !tbaa !81
      %51 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i32 0, i32 1, !dbg !89
      store i64 %49, i64* %51, align 8, !dbg !89, !tbaa !81
; │└└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
   %52 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %9, i32 0, i32 0, !dbg !95
   %53 = bitcast [2 x i64]* %52 to i8*, !dbg !95
   %54 = bitcast [2 x i64]* %8 to i8*, !dbg !95
   call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %53, i8* %54, i64 16, i1 false), !dbg !95, !tbaa !81
   %55 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %9, i32 0, i32 1, !dbg !95
   store i8 addrspace(1)* %38, i8 addrspace(1)** %55, align 8, !dbg !95, !tbaa !81
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:94 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
; │┌ @ broadcast.jl:837 within `materialize'
; ││┌ @ broadcast.jl:1046 within `copy'
; │││┌ @ ntuple.jl:42 within `ntuple'
; ││││┌ @ broadcast.jl:1046 within `#19'
; │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
; ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
; │││││││┌ @ boot.jl:708 within `Int64'
; ││││││││┌ @ boot.jl:627 within `toInt64'
           %56 = sext i32 %4 to i64, !dbg !96
           %57 = sext i32 %5 to i64, !dbg !96
; ││││└└└└└
      %58 = getelementptr inbounds [2 x i64], [2 x i64]* %10, i32 0, i32 0, !dbg !101
      store i64 %56, i64* %58, align 8, !dbg !101, !tbaa !81
      %59 = getelementptr inbounds [2 x i64], [2 x i64]* %10, i32 0, i32 1, !dbg !101
      store i64 %57, i64* %59, align 8, !dbg !101, !tbaa !81
; │└└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
   %60 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %11, i32 0, i32 0, !dbg !107
   %61 = bitcast [2 x i64]* %60 to i8*, !dbg !107
   %62 = bitcast [2 x i64]* %10 to i8*, !dbg !107
   call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %61, i8* %62, i64 16, i1 false), !dbg !107, !tbaa !81
   %63 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %11, i32 0, i32 1, !dbg !107
   store i8 addrspace(1)* %39, i8 addrspace(1)** %63, align 8, !dbg !107, !tbaa !81
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:95 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %64 = call fastcc i32 @jl_llvmcall0(), !dbg !108
; ││└└
; ││┌ @ boot.jl:708 within `Int64'
; │││┌ @ boot.jl:632 within `toInt64'
      %65 = zext i32 %64 to i64, !dbg !121
; ││└└
; ││┌ @ int.jl:86 within `+'
     %66 = add i64 %65, 1, !dbg !123
; │└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %67 = call fastcc i32 @jl_llvmcall1(), !dbg !126
; │└└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %68 = call fastcc i32 @jl_llvmcall2(), !dbg !131
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %69 = call fastcc i32 @jl_llvmcall3(), !dbg !136
; │└└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %70 = call fastcc i32 @jl_llvmcall4(), !dbg !142
; ││└└
; ││┌ @ boot.jl:708 within `Int64'
; │││┌ @ boot.jl:632 within `toInt64'
      %71 = zext i32 %70 to i64, !dbg !146
; ││└└
; ││┌ @ int.jl:86 within `+'
     %72 = add i64 %71, 1, !dbg !148
; │└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %73 = call fastcc i32 @jl_llvmcall5(), !dbg !149
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:97 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %74 = call fastcc i32 @jl_llvmcall6(), !dbg !153
; ││└└
; ││┌ @ boot.jl:708 within `Int64'
; │││┌ @ boot.jl:632 within `toInt64'
      %75 = zext i32 %74 to i64, !dbg !161
; ││└└
; ││┌ @ int.jl:86 within `+'
     %76 = add i64 %75, 1, !dbg !163
; │└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %77 = call fastcc i32 @jl_llvmcall7(), !dbg !164
; │└└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %78 = call fastcc i32 @jl_llvmcall8(), !dbg !169
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %79 = call fastcc i32 @jl_llvmcall9(), !dbg !174
; │└└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %80 = call fastcc i32 @jl_llvmcall10(), !dbg !180
; ││└└
; ││┌ @ boot.jl:708 within `Int64'
; │││┌ @ boot.jl:632 within `toInt64'
      %81 = zext i32 %80 to i64, !dbg !184
; ││└└
; ││┌ @ int.jl:86 within `+'
     %82 = add i64 %81, 1, !dbg !186
; │└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %83 = call fastcc i32 @jl_llvmcall11(), !dbg !187
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:101 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
     %84 = call fastcc i8 addrspace(3)* @jl_llvmcall12(), !dbg !191
; │└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
    %85 = getelementptr inbounds { [2 x i64], i8 addrspace(3)* }, { [2 x i64], i8 addrspace(3)* }* %12, i32 0, i32 0, !dbg !199
    store [2 x i64] [i64 33, i64 32], [2 x i64]* %85, align 8, !dbg !199, !tbaa !81
    %86 = getelementptr inbounds { [2 x i64], i8 addrspace(3)* }, { [2 x i64], i8 addrspace(3)* }* %12, i32 0, i32 1, !dbg !199
    store i8 addrspace(3)* %84, i8 addrspace(3)** %86, align 8, !dbg !199, !tbaa !81
; └└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:102 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
     %87 = call fastcc i8 addrspace(3)* @jl_llvmcall13(), !dbg !202
; │└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
    %88 = getelementptr inbounds { [2 x i64], i8 addrspace(3)* }, { [2 x i64], i8 addrspace(3)* }* %13, i32 0, i32 0, !dbg !207
    store [2 x i64] [i64 33, i64 32], [2 x i64]* %88, align 8, !dbg !207, !tbaa !81
    %89 = getelementptr inbounds { [2 x i64], i8 addrspace(3)* }, { [2 x i64], i8 addrspace(3)* }* %13, i32 0, i32 1, !dbg !207
    store i8 addrspace(3)* %87, i8 addrspace(3)** %89, align 8, !dbg !207, !tbaa !81
; └└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:920 within `+'
; │┌ @ int.jl:476 within `rem'
    %90 = sext i32 %4 to i64, !dbg !210
; │└
; │ @ int.jl:922 within `+' @ int.jl:86
   %91 = add i64 %90, 32, !dbg !214
; └
; ┌ @ int.jl:85 within `-'
   %92 = sub i64 %91, 1, !dbg !216
; └
; ┌ @ int.jl:260 within `div'
   %93 = icmp ne i64 %92, -9223372036854775808, !dbg !218
   %94 = or i1 true, %93, !dbg !218
   %95 = and i1 true, %94, !dbg !218
   br i1 %95, label %pass, label %fail, !dbg !218

L65:                                              ; preds = %pass
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L67, !dbg !220

L66:                                              ; preds = %pass
   br label %L67, !dbg !220

L67:                                              ; preds = %L66, %L65
   %value_phi = phi i8 [ 1, %L65 ], [ 0, %L66 ]
   %value_phi1 = phi i64 [ 0, %L66 ], [ undef, %L65 ]
   %value_phi2 = phi i64 [ 0, %L66 ], [ undef, %L65 ]
; └
  %96 = xor i8 %value_phi, 1, !dbg !223
  %97 = trunc i8 %96 to i1, !dbg !223
  %98 = xor i1 %97, true, !dbg !223
  br i1 %98, label %L67.L516_crit_edge, label %L67.L72_crit_edge, !dbg !223

L67.L516_crit_edge:                               ; preds = %L67
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:624 within `iterate'
   br label %L516, !dbg !224

L67.L72_crit_edge:                                ; preds = %L67
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L72, !dbg !220

L72:                                              ; preds = %L67.L72_crit_edge, %L515
   %value_phi3 = phi float [ 0.000000e+00, %L67.L72_crit_edge ], [ %208, %L515 ]
   %value_phi4 = phi i64 [ %value_phi1, %L67.L72_crit_edge ], [ %value_phi15, %L515 ]
   %value_phi5 = phi i64 [ %value_phi2, %L67.L72_crit_edge ], [ %value_phi16, %L515 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:111 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %99 = sub i64 %66, 1, !dbg !226
; └
; ┌ @ int.jl:87 within `*'
   %100 = mul i64 %99, 32, !dbg !228
; └
; ┌ @ int.jl:86 within `+'
   %101 = add i64 %100, %76, !dbg !230
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %102 = sub i64 %72, 1, !dbg !231
; └
; ┌ @ int.jl:87 within `*'
   %103 = mul i64 %102, 32, !dbg !233
; └
; ┌ @ int.jl:86 within `+'
   %104 = add i64 %103, %82, !dbg !234
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %105 = sext i32 %3 to i64, !dbg !235
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %106 = icmp sle i64 %101, %105, !dbg !248
; └
  %107 = zext i1 %106 to i8, !dbg !247
  %108 = trunc i8 %107 to i1, !dbg !247
  %109 = xor i1 %108, true, !dbg !247
  br i1 %109, label %L92, label %L86, !dbg !247

L86:                                              ; preds = %L72
; ┌ @ int.jl:87 within `*'
   %110 = mul i64 %value_phi4, 32, !dbg !250
; └
; ┌ @ int.jl:86 within `+'
   %111 = add i64 %110, %82, !dbg !251
; └
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %112 = sext i32 %4 to i64, !dbg !235
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %113 = icmp sle i64 %111, %112, !dbg !248
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   %114 = zext i1 %113 to i8, !dbg !220
   br label %L93, !dbg !220

L92:                                              ; preds = %L72
   br label %L93, !dbg !220

L93:                                              ; preds = %L92, %L86
   %value_phi6 = phi i8 [ %114, %L86 ], [ 0, %L92 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
  %115 = trunc i8 %value_phi6 to i1, !dbg !247
  %116 = xor i1 %115, true, !dbg !247
  br i1 %116, label %L193, label %L95, !dbg !247

L95:                                              ; preds = %L93
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:116 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %117 = mul i64 %value_phi4, 32, !dbg !252
; └
; ┌ @ int.jl:86 within `+'
   %118 = add i64 %117, %82, !dbg !254
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L117, !dbg !255

L117:                                             ; preds = %L95
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %119 = icmp slt i64 %48, 0, !dbg !259
; ││││││││└
          %120 = zext i1 %119 to i8, !dbg !261
          %121 = trunc i8 %120 to i1, !dbg !261
          %122 = xor i1 %121, true, !dbg !261
          %123 = select i1 %122, i64 %48, i64 0, !dbg !261
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %124 = sub i64 %123, 0, !dbg !276
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %125 = mul i64 1, %124, !dbg !284
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %126 = sub i64 %101, 1, !dbg !285
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %127 = mul i64 %126, 1, !dbg !288
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %128 = add i64 1, %127, !dbg !289
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %129 = sub i64 %118, 1, !dbg !290
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %130 = mul i64 %129, %125, !dbg !293
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %131 = add i64 %128, %130, !dbg !294
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L140, !dbg !295

L140:                                             ; preds = %L117
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %132 = sub i64 %131, 1, !dbg !299
; │││││││└
         %133 = call fastcc float @jl_llvmcall14(i8 addrspace(1)* %38, i64 %132), !dbg !300
; ││││└└└
      br label %L144, !dbg !308

L144:                                             ; preds = %L140
; │││└
     br label %L145, !dbg !297

L145:                                             ; preds = %L144
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L146, !dbg !309

L146:                                             ; preds = %L145
; │└
   br label %L147, !dbg !257

L147:                                             ; preds = %L146
; └
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L166, !dbg !310

L166:                                             ; preds = %L147
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %134 = sub i64 %76, 1, !dbg !314
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %135 = mul i64 %134, 1, !dbg !321
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %136 = add i64 1, %135, !dbg !322
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %137 = sub i64 %82, 1, !dbg !323
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %138 = mul i64 %137, 33, !dbg !326
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %139 = add i64 %136, %138, !dbg !327
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L185, !dbg !328

L185:                                             ; preds = %L166
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %140 = sub i64 %139, 1, !dbg !332
; │││││││└
         call fastcc void @jl_llvmcall15(i8 addrspace(3)* %84, float %133, i64 %140), !dbg !333
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L189, !dbg !340

L189:                                             ; preds = %L185
; │││└
     br label %L190, !dbg !330

L190:                                             ; preds = %L189
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L191, !dbg !341

L191:                                             ; preds = %L190
; │└
   br label %L192, !dbg !312

L192:                                             ; preds = %L191
; └
  br label %L239, !dbg !253

L193:                                             ; preds = %L93
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L212, !dbg !342

L212:                                             ; preds = %L193
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %141 = sub i64 %76, 1, !dbg !345
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %142 = mul i64 %141, 1, !dbg !352
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %143 = add i64 1, %142, !dbg !353
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %144 = sub i64 %82, 1, !dbg !354
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %145 = mul i64 %144, 33, !dbg !357
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %146 = add i64 %143, %145, !dbg !358
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L231, !dbg !359

L231:                                             ; preds = %L212
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %147 = sub i64 %146, 1, !dbg !361
; │││││││└
         call fastcc void @jl_llvmcall22(i8 addrspace(3)* %84, float 0.000000e+00, i64 %147), !dbg !362
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L235, !dbg !367

L235:                                             ; preds = %L231
; │││└
     br label %L236, !dbg !360

L236:                                             ; preds = %L235
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L237, !dbg !368

L237:                                             ; preds = %L236
; │└
   br label %L238, !dbg !343

L238:                                             ; preds = %L237
   br label %L239, !dbg !343

L239:                                             ; preds = %L238, %L192
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %148 = mul i64 %value_phi4, 32, !dbg !369
; └
; ┌ @ int.jl:86 within `+'
   %149 = add i64 %148, %76, !dbg !371
; └
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %150 = sext i32 %4 to i64, !dbg !372
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %151 = icmp sle i64 %149, %150, !dbg !378
; └
  %152 = zext i1 %151 to i8, !dbg !370
  %153 = trunc i8 %152 to i1, !dbg !370
  %154 = xor i1 %153, true, !dbg !370
  br i1 %154, label %L248, label %L245, !dbg !370

L245:                                             ; preds = %L239
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %155 = sext i32 %5 to i64, !dbg !372
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %156 = icmp sle i64 %104, %155, !dbg !378
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   %157 = zext i1 %156 to i8, !dbg !220
   br label %L249, !dbg !220

L248:                                             ; preds = %L239
   br label %L249, !dbg !220

L249:                                             ; preds = %L248, %L245
   %value_phi7 = phi i8 [ %157, %L245 ], [ 0, %L248 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
  %158 = trunc i8 %value_phi7 to i1, !dbg !370
  %159 = xor i1 %158, true, !dbg !370
  br i1 %159, label %L349, label %L251, !dbg !370

L251:                                             ; preds = %L249
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %160 = mul i64 %value_phi4, 32, !dbg !379
; └
; ┌ @ int.jl:86 within `+'
   %161 = add i64 %160, %76, !dbg !381
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L273, !dbg !382

L273:                                             ; preds = %L251
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %162 = icmp slt i64 %56, 0, !dbg !384
; ││││││││└
          %163 = zext i1 %162 to i8, !dbg !385
          %164 = trunc i8 %163 to i1, !dbg !385
          %165 = xor i1 %164, true, !dbg !385
          %166 = select i1 %165, i64 %56, i64 0, !dbg !385
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %167 = sub i64 %166, 0, !dbg !393
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %168 = mul i64 1, %167, !dbg !398
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %169 = sub i64 %161, 1, !dbg !399
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %170 = mul i64 %169, 1, !dbg !401
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %171 = add i64 1, %170, !dbg !402
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %172 = sub i64 %104, 1, !dbg !403
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %173 = mul i64 %172, %168, !dbg !406
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %174 = add i64 %171, %173, !dbg !407
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L296, !dbg !408

L296:                                             ; preds = %L273
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %175 = sub i64 %174, 1, !dbg !410
; │││││││└
         %176 = call fastcc float @jl_llvmcall16(i8 addrspace(1)* %39, i64 %175), !dbg !411
; ││││└└└
      br label %L300, !dbg !415

L300:                                             ; preds = %L296
; │││└
     br label %L301, !dbg !409

L301:                                             ; preds = %L300
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L302, !dbg !416

L302:                                             ; preds = %L301
; │└
   br label %L303, !dbg !383

L303:                                             ; preds = %L302
; └
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L322, !dbg !417

L322:                                             ; preds = %L303
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %177 = sub i64 %76, 1, !dbg !419
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %178 = mul i64 %177, 1, !dbg !426
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %179 = add i64 1, %178, !dbg !427
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %180 = sub i64 %82, 1, !dbg !428
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %181 = mul i64 %180, 33, !dbg !431
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %182 = add i64 %179, %181, !dbg !432
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L341, !dbg !433

L341:                                             ; preds = %L322
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %183 = sub i64 %182, 1, !dbg !435
; │││││││└
         call fastcc void @jl_llvmcall17(i8 addrspace(3)* %87, float %176, i64 %183), !dbg !436
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L345, !dbg !441

L345:                                             ; preds = %L341
; │││└
     br label %L346, !dbg !434

L346:                                             ; preds = %L345
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L347, !dbg !442

L347:                                             ; preds = %L346
; │└
   br label %L348, !dbg !418

L348:                                             ; preds = %L347
; └
  br label %L395, !dbg !380

L349:                                             ; preds = %L249
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L368, !dbg !443

L368:                                             ; preds = %L349
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %184 = sub i64 %76, 1, !dbg !446
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %185 = mul i64 %184, 1, !dbg !453
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %186 = add i64 1, %185, !dbg !454
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %187 = sub i64 %82, 1, !dbg !455
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %188 = mul i64 %187, 33, !dbg !458
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %189 = add i64 %186, %188, !dbg !459
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L387, !dbg !460

L387:                                             ; preds = %L368
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %190 = sub i64 %189, 1, !dbg !462
; │││││││└
         call fastcc void @jl_llvmcall21(i8 addrspace(3)* %87, float 0.000000e+00, i64 %190), !dbg !463
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L391, !dbg !468

L391:                                             ; preds = %L387
; │││└
     br label %L392, !dbg !461

L392:                                             ; preds = %L391
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L393, !dbg !469

L393:                                             ; preds = %L392
; │└
   br label %L394, !dbg !444

L394:                                             ; preds = %L393
   br label %L395, !dbg !444

L395:                                             ; preds = %L394, %L348
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:127 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !470
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:134 within `coalesced_matmul_kernel!'
  br label %L395.L397_crit_edge, !dbg !474

L395.L397_crit_edge:                              ; preds = %L395
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L397, !dbg !220

L397:                                             ; preds = %L395.L397_crit_edge, %L502
   %value_phi8 = phi float [ %value_phi3, %L395.L397_crit_edge ], [ %208, %L502 ]
   %value_phi9 = phi i64 [ 1, %L395.L397_crit_edge ], [ %value_phi11, %L502 ]
   %value_phi10 = phi i64 [ 1, %L395.L397_crit_edge ], [ %value_phi12, %L502 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:135 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L419, !dbg !475

L419:                                             ; preds = %L397
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %191 = sub i64 %76, 1, !dbg !478
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %192 = mul i64 %191, 1, !dbg !485
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %193 = add i64 1, %192, !dbg !486
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %194 = sub i64 %value_phi9, 1, !dbg !487
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %195 = mul i64 %194, 33, !dbg !490
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %196 = add i64 %193, %195, !dbg !491
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L438, !dbg !492

L438:                                             ; preds = %L419
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %197 = sub i64 %196, 1, !dbg !494
; │││││││└
         %198 = call fastcc float @jl_llvmcall18(i8 addrspace(3)* %84, i64 %197), !dbg !495
; ││││└└└
      br label %L442, !dbg !499

L442:                                             ; preds = %L438
; │││└
     br label %L443, !dbg !493

L443:                                             ; preds = %L442
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L444, !dbg !500

L444:                                             ; preds = %L443
; │└
   br label %L445, !dbg !476

L445:                                             ; preds = %L444
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L464, !dbg !475

L464:                                             ; preds = %L445
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %199 = sub i64 %value_phi9, 1, !dbg !478
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %200 = mul i64 %199, 1, !dbg !485
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %201 = add i64 1, %200, !dbg !486
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %202 = sub i64 %82, 1, !dbg !487
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %203 = mul i64 %202, 33, !dbg !490
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %204 = add i64 %201, %203, !dbg !491
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L483, !dbg !492

L483:                                             ; preds = %L464
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %205 = sub i64 %204, 1, !dbg !494
; │││││││└
         %206 = call fastcc float @jl_llvmcall19(i8 addrspace(3)* %87, i64 %205), !dbg !495
; ││││└└└
      br label %L487, !dbg !499

L487:                                             ; preds = %L483
; │││└
     br label %L488, !dbg !493

L488:                                             ; preds = %L487
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L489, !dbg !500

L489:                                             ; preds = %L488
; │└
   br label %L490, !dbg !476

L490:                                             ; preds = %L489
; └
; ┌ @ float.jl:404 within `*'
   %207 = fmul float %198, %206, !dbg !501
; └
; ┌ @ float.jl:400 within `+'
   %208 = fadd float %value_phi8, %207, !dbg !504
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %209 = icmp eq i64 %value_phi10, 32, !dbg !506
    %210 = zext i1 %209 to i8, !dbg !506
; │└
   %211 = trunc i8 %210 to i1, !dbg !508
   %212 = xor i1 %211, true, !dbg !508
   br i1 %212, label %L495, label %L494, !dbg !508

L494:                                             ; preds = %L490
   br label %L497, !dbg !508

L495:                                             ; preds = %L490
; │ @ range.jl:625 within `iterate'
; │┌ @ int.jl:86 within `+'
    %213 = add i64 %value_phi10, 1, !dbg !509
; │└
; │ @ range.jl:624 within `iterate'
   br label %L497, !dbg !508

L497:                                             ; preds = %L495, %L494
   %value_phi11 = phi i64 [ %213, %L495 ], [ undef, %L494 ]
   %value_phi12 = phi i64 [ %213, %L495 ], [ undef, %L494 ]
   %value_phi13 = phi i8 [ 1, %L494 ], [ 0, %L495 ]
; └
  %214 = xor i8 %value_phi13, 1, !dbg !477
  %215 = trunc i8 %214 to i1, !dbg !477
  %216 = xor i1 %215, true, !dbg !477
  br i1 %216, label %L497.L503_crit_edge, label %L502, !dbg !477

L497.L503_crit_edge:                              ; preds = %L497
; ┌ @ range.jl:624 within `iterate'
   br label %L503, !dbg !508

L502:                                             ; preds = %L497
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L397, !dbg !220

L503:                                             ; preds = %L497.L503_crit_edge
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !511
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %217 = icmp eq i64 %value_phi5, %261, !dbg !512
    %218 = zext i1 %217 to i8, !dbg !512
; │└
   %219 = trunc i8 %218 to i1, !dbg !224
   %220 = xor i1 %219, true, !dbg !224
   br i1 %220, label %L508, label %L507, !dbg !224

L507:                                             ; preds = %L503
   br label %L510, !dbg !224

L508:                                             ; preds = %L503
; │ @ range.jl:625 within `iterate'
; │┌ @ int.jl:86 within `+'
    %221 = add i64 %value_phi5, 1, !dbg !513
; │└
; │ @ range.jl:624 within `iterate'
   br label %L510, !dbg !224

L510:                                             ; preds = %L508, %L507
   %value_phi15 = phi i64 [ %221, %L508 ], [ undef, %L507 ]
   %value_phi16 = phi i64 [ %221, %L508 ], [ undef, %L507 ]
   %value_phi17 = phi i8 [ 1, %L507 ], [ 0, %L508 ]
; └
  %222 = xor i8 %value_phi17, 1, !dbg !225
  %223 = trunc i8 %222 to i1, !dbg !225
  %224 = xor i1 %223, true, !dbg !225
  br i1 %224, label %L510.L516_crit_edge, label %L515, !dbg !225

L510.L516_crit_edge:                              ; preds = %L510
; ┌ @ range.jl:624 within `iterate'
   br label %L516, !dbg !224

L515:                                             ; preds = %L510
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L72, !dbg !220

L516:                                             ; preds = %L67.L516_crit_edge, %L510.L516_crit_edge
   %value_phi18 = phi float [ %208, %L510.L516_crit_edge ], [ 0.000000e+00, %L67.L516_crit_edge ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %225 = sub i64 %66, 1, !dbg !515
; └
; ┌ @ int.jl:87 within `*'
   %226 = mul i64 %225, 32, !dbg !517
; └
; ┌ @ int.jl:86 within `+'
   %227 = add i64 %226, %76, !dbg !518
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:142 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %228 = sub i64 %72, 1, !dbg !519
; └
; ┌ @ int.jl:87 within `*'
   %229 = mul i64 %228, 32, !dbg !521
; └
; ┌ @ int.jl:86 within `+'
   %230 = add i64 %229, %82, !dbg !522
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %231 = sext i32 %3 to i64, !dbg !523
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %232 = icmp sle i64 %227, %231, !dbg !530
; └
  %233 = zext i1 %232 to i8, !dbg !529
  %234 = trunc i8 %233 to i1, !dbg !529
  %235 = xor i1 %234, true, !dbg !529
  br i1 %235, label %L531, label %L528, !dbg !529

L528:                                             ; preds = %L516
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %236 = sext i32 %5 to i64, !dbg !523
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %237 = icmp sle i64 %230, %236, !dbg !530
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:624 within `iterate'
   %238 = zext i1 %237 to i8, !dbg !224
   br label %L532, !dbg !224

L531:                                             ; preds = %L516
   br label %L532, !dbg !224

L532:                                             ; preds = %L531, %L528
   %value_phi19 = phi i8 [ %238, %L528 ], [ 0, %L531 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
  %239 = trunc i8 %value_phi19 to i1, !dbg !529
  %240 = xor i1 %239, true, !dbg !529
  br i1 %240, label %L584, label %L534, !dbg !529

L534:                                             ; preds = %L532
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:145 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L553, !dbg !531

L553:                                             ; preds = %L534
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %241 = icmp slt i64 %40, 0, !dbg !534
; ││││││││└
          %242 = zext i1 %241 to i8, !dbg !535
          %243 = trunc i8 %242 to i1, !dbg !535
          %244 = xor i1 %243, true, !dbg !535
          %245 = select i1 %244, i64 %40, i64 0, !dbg !535
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %246 = sub i64 %245, 0, !dbg !543
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %247 = mul i64 1, %246, !dbg !548
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %248 = sub i64 %227, 1, !dbg !549
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %249 = mul i64 %248, 1, !dbg !551
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %250 = add i64 1, %249, !dbg !552
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %251 = sub i64 %230, 1, !dbg !553
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %252 = mul i64 %251, %247, !dbg !556
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %253 = add i64 %250, %252, !dbg !557
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L576, !dbg !558

L576:                                             ; preds = %L553
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %254 = sub i64 %253, 1, !dbg !560
; │││││││└
         call fastcc void @jl_llvmcall20(i8 addrspace(1)* %37, float %value_phi18, i64 %254), !dbg !561
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L580, !dbg !566

L580:                                             ; preds = %L576
; │││└
     br label %L581, !dbg !559

L581:                                             ; preds = %L580
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L582, !dbg !567

L582:                                             ; preds = %L581
; │└
   br label %L583, !dbg !532

L583:                                             ; preds = %L582
   br label %L584, !dbg !532

L584:                                             ; preds = %L583, %L532
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
  ret void, !dbg !568

fail:                                             ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:260 within `div'
   call fastcc void @gpu_report_exception(i64 ptrtoint ([10 x i8]* @exception4 to i64)), !dbg !218
   call fastcc void @gpu_signal_exception(), !dbg !218
   call void asm sideeffect "trap;", ""(), !dbg !218
   br label %pass

pass:                                             ; preds = %fail, %top
   %255 = sdiv i64 %92, 32, !dbg !218
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %256 = sub i64 %255, 1, !dbg !569
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:280 within `UnitRange'
; ││┌ @ range.jl:285 within `unitrange_last'
; │││┌ @ operators.jl:350 within `>='
; ││││┌ @ int.jl:441 within `<='
       %257 = icmp sle i64 0, %256, !dbg !570
; │││└└
     %258 = zext i1 %257 to i8, !dbg !574
     %259 = trunc i8 %258 to i1, !dbg !574
     %260 = xor i1 %259, true, !dbg !574
     %261 = select i1 %260, i64 -1, i64 %256, !dbg !574
; └└└
; ┌ @ range.jl:620 within `iterate'
; │┌ @ range.jl:503 within `isempty'
; ││┌ @ operators.jl:303 within `>'
; │││┌ @ int.jl:82 within `<'
      %262 = icmp slt i64 %261, 0, !dbg !580
; │└└└
   %263 = zext i1 %262 to i8, !dbg !220
   %264 = trunc i8 %263 to i1, !dbg !220
   %265 = xor i1 %264, true, !dbg !220
   br i1 %265, label %L66, label %L65, !dbg !220
; └
}

declare %jl_value_t*** @julia.ptls_states() local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #0

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall0() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !585
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall1() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !586
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall2() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.z(), !range !586
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.z() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall3() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !585
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall4() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !586
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall5() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.z(), !range !586
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall6() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !587
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall7() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !587
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall8() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.z(), !range !587
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.z() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall9() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !587
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall10() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !587
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall11() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.z(), !range !587
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i8 addrspace(3)* @jl_llvmcall12() unnamed_addr #1 {
entry:
  ret i8 addrspace(3)* bitcast ([1056 x float] addrspace(3)* @__static_shmem_285 to i8 addrspace(3)*)
}

; Function Attrs: alwaysinline
define internal fastcc i8 addrspace(3)* @jl_llvmcall13() unnamed_addr #1 {
entry:
  ret i8 addrspace(3)* bitcast ([1056 x float] addrspace(3)* @__static_shmem_286 to i8 addrspace(3)*)
}

; Function Attrs: alwaysinline
define internal fastcc float @jl_llvmcall14(i8 addrspace(1)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(1)* %0 to float addrspace(1)*
  %3 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1
  %4 = load float, float addrspace(1)* %3, align 4, !tbaa !588
  ret float %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall15(i8 addrspace(3)*, float, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to float addrspace(3)*
  %4 = getelementptr inbounds float, float addrspace(3)* %3, i64 %2
  store float %1, float addrspace(3)* %4, align 4, !tbaa !591
  ret void
}

; Function Attrs: alwaysinline
define internal fastcc float @jl_llvmcall16(i8 addrspace(1)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(1)* %0 to float addrspace(1)*
  %3 = getelementptr inbounds float, float addrspace(1)* %2, i64 %1
  %4 = load float, float addrspace(1)* %3, align 4, !tbaa !588
  ret float %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall17(i8 addrspace(3)*, float, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to float addrspace(3)*
  %4 = getelementptr inbounds float, float addrspace(3)* %3, i64 %2
  store float %1, float addrspace(3)* %4, align 4, !tbaa !591
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: alwaysinline
define internal fastcc float @jl_llvmcall18(i8 addrspace(3)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(3)* %0 to float addrspace(3)*
  %3 = getelementptr inbounds float, float addrspace(3)* %2, i64 %1
  %4 = load float, float addrspace(3)* %3, align 4, !tbaa !591
  ret float %4
}

; Function Attrs: alwaysinline
define internal fastcc float @jl_llvmcall19(i8 addrspace(3)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(3)* %0 to float addrspace(3)*
  %3 = getelementptr inbounds float, float addrspace(3)* %2, i64 %1
  %4 = load float, float addrspace(3)* %3, align 4, !tbaa !591
  ret float %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall20(i8 addrspace(1)*, float, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(1)* %0 to float addrspace(1)*
  %4 = getelementptr inbounds float, float addrspace(1)* %3, i64 %2
  store float %1, float addrspace(1)* %4, align 4, !tbaa !588
  ret void
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall21(i8 addrspace(3)*, float, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to float addrspace(3)*
  %4 = getelementptr inbounds float, float addrspace(3)* %3, i64 %2
  store float %1, float addrspace(3)* %4, align 4, !tbaa !591
  ret void
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall22(i8 addrspace(3)*, float, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to float addrspace(3)*
  %4 = getelementptr inbounds float, float addrspace(3)* %3, i64 %2
  store float %1, float addrspace(3)* %4, align 4, !tbaa !591
  ret void
}

;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:39 within `report_exception'
define internal fastcc void @gpu_report_exception(i64) unnamed_addr !dbg !593 {
top:
  %1 = alloca %printf_args, align 8
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:40 within `report_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `_cuprintf'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
    %2 = bitcast %printf_args* %1 to i8*, !dbg !594
    call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2), !dbg !594
    %3 = getelementptr inbounds %printf_args, %printf_args* %1, i64 0, i32 0, !dbg !594
    store i64 %0, i64* %3, align 8, !dbg !594
    %4 = call i32 @vprintf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @0, i64 0, i64 0), i8* nonnull %2), !dbg !594
    call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2), !dbg !594
; └└
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:44 within `report_exception'
  ret void, !dbg !602
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #0

declare i32 @vprintf(i8*, i8*) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #0

;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:25 within `signal_exception'
define internal fastcc void @gpu_signal_exception() unnamed_addr !dbg !603 {
top:
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:26 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:23 within `exception_flag'
   %0 = call i64 @julia_exception_flag(), !dbg !604
; └
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:27 within `signal_exception'
  %1 = icmp eq i64 %0, 0, !dbg !607
  br i1 %1, label %L9, label %L5, !dbg !607

L5:                                               ; preds = %top
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:28 within `signal_exception'
; ┌ @ pointer.jl:118 within `unsafe_store!' @ pointer.jl:118
   %2 = inttoptr i64 %0 to i64*, !dbg !608
   store i64 1, i64* %2, align 1, !dbg !608, !tbaa !613
; └
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:29 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:115 within `threadfence_system'
   call void @llvm.nvvm.membar.sys(), !dbg !615
; └
  br label %L11, !dbg !617

L9:                                               ; preds = %top
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:31 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `_cuprintf'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
    %3 = call i32 @vprintf(i8* getelementptr inbounds ([110 x i8], [110 x i8]* @1, i64 0, i64 0), i8* null), !dbg !618
    br label %L11, !dbg !618

L11:                                              ; preds = %L9, %L5
; └└
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:36 within `signal_exception'
  ret void, !dbg !625
}

declare i64 @julia_exception_flag() local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.nvvm.membar.sys() #4

attributes #0 = { argmemonly nounwind }
attributes #1 = { alwaysinline }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2, !5, !7, !8, !9, !10, !12, !13, !14, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !41}
!nvvm.annotations = !{!42}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 1, !"Debug Info Version", i32 3}
!2 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !3, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!3 = !DIFile(filename: "/home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl", directory: ".")
!4 = !{}
!5 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !6, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!6 = !DIFile(filename: "abstractarray.jl", directory: ".")
!7 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !6, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!8 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !6, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!9 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !6, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!10 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!11 = !DIFile(filename: "/home/local/.julia/packages/GPUCompiler/uTpNx/src/runtime.jl", directory: ".")
!12 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!13 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!14 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !15, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!15 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl", directory: ".")
!16 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!17 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!18 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !15, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!19 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!20 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!21 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !15, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!22 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!23 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !15, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!24 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!25 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!26 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!27 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!28 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!29 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!30 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!31 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!32 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!33 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!34 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!35 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!36 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!37 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!38 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !11, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!39 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !40, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!40 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_dynamic.jl", directory: ".")
!41 = distinct !DICompileUnit(language: DW_LANG_Julia, file: !15, producer: "julia", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !4, nameTableKind: None)
!42 = !{void (i64, i64, i64, i32, i32, i32)* @_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1_, !"kernel", i32 1}
!43 = distinct !DISubprogram(name: "coalesced_matmul_kernel!", linkageName: "julia_coalesced_matmul_kernel!_3242", scope: null, file: !3, line: 88, type: !44, scopeLine: 88, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !4)
!45 = !{!46, !46, i64 0, i64 1}
!46 = !{!"jtbaa_const", !47, i64 0}
!47 = !{!"jtbaa", !48, i64 0}
!48 = !{!"jtbaa"}
!49 = !DILocation(line: 414, scope: !50, inlinedAt: !52)
!50 = distinct !DISubprogram(name: "reinterpret;", linkageName: "reinterpret", scope: !51, file: !51, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!51 = !DIFile(filename: "essentials.jl", directory: ".")
!52 = !DILocation(line: 89, scope: !43)
!53 = !DILocation(line: 414, scope: !50, inlinedAt: !54)
!54 = !DILocation(line: 90, scope: !43)
!55 = !DILocation(line: 414, scope: !50, inlinedAt: !56)
!56 = !DILocation(line: 91, scope: !43)
!57 = !DILocation(line: 627, scope: !58, inlinedAt: !60)
!58 = distinct !DISubprogram(name: "toInt64;", linkageName: "toInt64", scope: !59, file: !59, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!59 = !DIFile(filename: "boot.jl", directory: ".")
!60 = !DILocation(line: 708, scope: !61, inlinedAt: !62)
!61 = distinct !DISubprogram(name: "Int64;", linkageName: "Int64", scope: !59, file: !59, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 648, scope: !63, inlinedAt: !65)
!63 = distinct !DISubprogram(name: "_broadcast_getindex_evalf;", linkageName: "_broadcast_getindex_evalf", scope: !64, file: !64, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!64 = !DIFile(filename: "broadcast.jl", directory: ".")
!65 = !DILocation(line: 621, scope: !66, inlinedAt: !67)
!66 = distinct !DISubprogram(name: "_broadcast_getindex;", linkageName: "_broadcast_getindex", scope: !64, file: !64, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 1046, scope: !68, inlinedAt: !69)
!68 = distinct !DISubprogram(name: "#19;", linkageName: "#19", scope: !64, file: !64, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 42, scope: !70, inlinedAt: !72)
!70 = distinct !DISubprogram(name: "ntuple;", linkageName: "ntuple", scope: !71, file: !71, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!71 = !DIFile(filename: "ntuple.jl", directory: ".")
!72 = !DILocation(line: 1046, scope: !73, inlinedAt: !74)
!73 = distinct !DISubprogram(name: "copy;", linkageName: "copy", scope: !64, file: !64, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 837, scope: !75, inlinedAt: !76)
!75 = distinct !DISubprogram(name: "materialize;", linkageName: "materialize", scope: !64, file: !64, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!76 = !DILocation(line: 48, scope: !77, inlinedAt: !79)
!77 = distinct !DISubprogram(name: "CuDeviceArray;", linkageName: "CuDeviceArray", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!78 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl", directory: ".")
!79 = !DILocation(line: 38, scope: !77, inlinedAt: !80)
!80 = !DILocation(line: 92, scope: !43)
!81 = !{!82, !82, i64 0}
!82 = !{!"jtbaa_stack", !47, i64 0}
!83 = !DILocation(line: 31, scope: !77, inlinedAt: !76)
!84 = !DILocation(line: 627, scope: !58, inlinedAt: !85)
!85 = !DILocation(line: 708, scope: !61, inlinedAt: !86)
!86 = !DILocation(line: 648, scope: !63, inlinedAt: !87)
!87 = !DILocation(line: 621, scope: !66, inlinedAt: !88)
!88 = !DILocation(line: 1046, scope: !68, inlinedAt: !89)
!89 = !DILocation(line: 42, scope: !70, inlinedAt: !90)
!90 = !DILocation(line: 1046, scope: !73, inlinedAt: !91)
!91 = !DILocation(line: 837, scope: !75, inlinedAt: !92)
!92 = !DILocation(line: 48, scope: !77, inlinedAt: !93)
!93 = !DILocation(line: 38, scope: !77, inlinedAt: !94)
!94 = !DILocation(line: 93, scope: !43)
!95 = !DILocation(line: 31, scope: !77, inlinedAt: !92)
!96 = !DILocation(line: 627, scope: !58, inlinedAt: !97)
!97 = !DILocation(line: 708, scope: !61, inlinedAt: !98)
!98 = !DILocation(line: 648, scope: !63, inlinedAt: !99)
!99 = !DILocation(line: 621, scope: !66, inlinedAt: !100)
!100 = !DILocation(line: 1046, scope: !68, inlinedAt: !101)
!101 = !DILocation(line: 42, scope: !70, inlinedAt: !102)
!102 = !DILocation(line: 1046, scope: !73, inlinedAt: !103)
!103 = !DILocation(line: 837, scope: !75, inlinedAt: !104)
!104 = !DILocation(line: 48, scope: !77, inlinedAt: !105)
!105 = !DILocation(line: 38, scope: !77, inlinedAt: !106)
!106 = !DILocation(line: 94, scope: !43)
!107 = !DILocation(line: 31, scope: !77, inlinedAt: !104)
!108 = !DILocation(line: 80, scope: !109, inlinedAt: !111)
!109 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !110, file: !110, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!110 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl", directory: ".")
!111 = !DILocation(line: 7, scope: !112, inlinedAt: !114)
!112 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!113 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl", directory: ".")
!114 = !DILocation(line: 7, scope: !115, inlinedAt: !116)
!115 = distinct !DISubprogram(name: "_index;", linkageName: "_index", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!116 = !DILocation(line: 57, scope: !117, inlinedAt: !118)
!117 = distinct !DISubprogram(name: "blockIdx_x;", linkageName: "blockIdx_x", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!118 = !DILocation(line: 77, scope: !119, inlinedAt: !120)
!119 = distinct !DISubprogram(name: "blockIdx;", linkageName: "blockIdx", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!120 = !DILocation(line: 95, scope: !43)
!121 = !DILocation(line: 632, scope: !58, inlinedAt: !122)
!122 = !DILocation(line: 708, scope: !61, inlinedAt: !116)
!123 = !DILocation(line: 86, scope: !124, inlinedAt: !116)
!124 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!125 = !DIFile(filename: "int.jl", directory: ".")
!126 = !DILocation(line: 80, scope: !109, inlinedAt: !127)
!127 = !DILocation(line: 7, scope: !112, inlinedAt: !128)
!128 = !DILocation(line: 7, scope: !115, inlinedAt: !129)
!129 = !DILocation(line: 57, scope: !130, inlinedAt: !118)
!130 = distinct !DISubprogram(name: "blockIdx_y;", linkageName: "blockIdx_y", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!131 = !DILocation(line: 80, scope: !109, inlinedAt: !132)
!132 = !DILocation(line: 7, scope: !112, inlinedAt: !133)
!133 = !DILocation(line: 7, scope: !115, inlinedAt: !134)
!134 = !DILocation(line: 57, scope: !135, inlinedAt: !118)
!135 = distinct !DISubprogram(name: "blockIdx_z;", linkageName: "blockIdx_z", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!136 = !DILocation(line: 80, scope: !109, inlinedAt: !137)
!137 = !DILocation(line: 7, scope: !112, inlinedAt: !138)
!138 = !DILocation(line: 7, scope: !115, inlinedAt: !139)
!139 = !DILocation(line: 57, scope: !117, inlinedAt: !140)
!140 = !DILocation(line: 77, scope: !119, inlinedAt: !141)
!141 = !DILocation(line: 96, scope: !43)
!142 = !DILocation(line: 80, scope: !109, inlinedAt: !143)
!143 = !DILocation(line: 7, scope: !112, inlinedAt: !144)
!144 = !DILocation(line: 7, scope: !115, inlinedAt: !145)
!145 = !DILocation(line: 57, scope: !130, inlinedAt: !140)
!146 = !DILocation(line: 632, scope: !58, inlinedAt: !147)
!147 = !DILocation(line: 708, scope: !61, inlinedAt: !145)
!148 = !DILocation(line: 86, scope: !124, inlinedAt: !145)
!149 = !DILocation(line: 80, scope: !109, inlinedAt: !150)
!150 = !DILocation(line: 7, scope: !112, inlinedAt: !151)
!151 = !DILocation(line: 7, scope: !115, inlinedAt: !152)
!152 = !DILocation(line: 57, scope: !135, inlinedAt: !140)
!153 = !DILocation(line: 80, scope: !109, inlinedAt: !154)
!154 = !DILocation(line: 7, scope: !112, inlinedAt: !155)
!155 = !DILocation(line: 7, scope: !115, inlinedAt: !156)
!156 = !DILocation(line: 47, scope: !157, inlinedAt: !158)
!157 = distinct !DISubprogram(name: "threadIdx_x;", linkageName: "threadIdx_x", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!158 = !DILocation(line: 91, scope: !159, inlinedAt: !160)
!159 = distinct !DISubprogram(name: "threadIdx;", linkageName: "threadIdx", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!160 = !DILocation(line: 97, scope: !43)
!161 = !DILocation(line: 632, scope: !58, inlinedAt: !162)
!162 = !DILocation(line: 708, scope: !61, inlinedAt: !156)
!163 = !DILocation(line: 86, scope: !124, inlinedAt: !156)
!164 = !DILocation(line: 80, scope: !109, inlinedAt: !165)
!165 = !DILocation(line: 7, scope: !112, inlinedAt: !166)
!166 = !DILocation(line: 7, scope: !115, inlinedAt: !167)
!167 = !DILocation(line: 47, scope: !168, inlinedAt: !158)
!168 = distinct !DISubprogram(name: "threadIdx_y;", linkageName: "threadIdx_y", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!169 = !DILocation(line: 80, scope: !109, inlinedAt: !170)
!170 = !DILocation(line: 7, scope: !112, inlinedAt: !171)
!171 = !DILocation(line: 7, scope: !115, inlinedAt: !172)
!172 = !DILocation(line: 47, scope: !173, inlinedAt: !158)
!173 = distinct !DISubprogram(name: "threadIdx_z;", linkageName: "threadIdx_z", scope: !113, file: !113, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!174 = !DILocation(line: 80, scope: !109, inlinedAt: !175)
!175 = !DILocation(line: 7, scope: !112, inlinedAt: !176)
!176 = !DILocation(line: 7, scope: !115, inlinedAt: !177)
!177 = !DILocation(line: 47, scope: !157, inlinedAt: !178)
!178 = !DILocation(line: 91, scope: !159, inlinedAt: !179)
!179 = !DILocation(line: 98, scope: !43)
!180 = !DILocation(line: 80, scope: !109, inlinedAt: !181)
!181 = !DILocation(line: 7, scope: !112, inlinedAt: !182)
!182 = !DILocation(line: 7, scope: !115, inlinedAt: !183)
!183 = !DILocation(line: 47, scope: !168, inlinedAt: !178)
!184 = !DILocation(line: 632, scope: !58, inlinedAt: !185)
!185 = !DILocation(line: 708, scope: !61, inlinedAt: !183)
!186 = !DILocation(line: 86, scope: !124, inlinedAt: !183)
!187 = !DILocation(line: 80, scope: !109, inlinedAt: !188)
!188 = !DILocation(line: 7, scope: !112, inlinedAt: !189)
!189 = !DILocation(line: 7, scope: !115, inlinedAt: !190)
!190 = !DILocation(line: 47, scope: !173, inlinedAt: !178)
!191 = !DILocation(line: 80, scope: !109, inlinedAt: !192)
!192 = !DILocation(line: 55, scope: !193, inlinedAt: !195)
!193 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !194, file: !194, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!194 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl", directory: ".")
!195 = !DILocation(line: 55, scope: !196, inlinedAt: !197)
!196 = distinct !DISubprogram(name: "emit_shmem;", linkageName: "emit_shmem", scope: !194, file: !194, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!197 = !DILocation(line: 24, scope: !193, inlinedAt: !198)
!198 = !DILocation(line: 101, scope: !43)
!199 = !DILocation(line: 31, scope: !77, inlinedAt: !200)
!200 = !DILocation(line: 38, scope: !77, inlinedAt: !201)
!201 = !DILocation(line: 25, scope: !193, inlinedAt: !198)
!202 = !DILocation(line: 80, scope: !109, inlinedAt: !203)
!203 = !DILocation(line: 55, scope: !193, inlinedAt: !204)
!204 = !DILocation(line: 55, scope: !196, inlinedAt: !205)
!205 = !DILocation(line: 24, scope: !193, inlinedAt: !206)
!206 = !DILocation(line: 102, scope: !43)
!207 = !DILocation(line: 31, scope: !77, inlinedAt: !208)
!208 = !DILocation(line: 38, scope: !77, inlinedAt: !209)
!209 = !DILocation(line: 25, scope: !193, inlinedAt: !206)
!210 = !DILocation(line: 476, scope: !211, inlinedAt: !212)
!211 = distinct !DISubprogram(name: "rem;", linkageName: "rem", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!212 = !DILocation(line: 920, scope: !124, inlinedAt: !213)
!213 = !DILocation(line: 106, scope: !43)
!214 = !DILocation(line: 86, scope: !124, inlinedAt: !215)
!215 = !DILocation(line: 922, scope: !124, inlinedAt: !213)
!216 = !DILocation(line: 85, scope: !217, inlinedAt: !213)
!217 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!218 = !DILocation(line: 260, scope: !219, inlinedAt: !213)
!219 = distinct !DISubprogram(name: "div;", linkageName: "div", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!220 = !DILocation(line: 620, scope: !221, inlinedAt: !223)
!221 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !222, file: !222, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!222 = !DIFile(filename: "range.jl", directory: ".")
!223 = !DILocation(line: 109, scope: !43)
!224 = !DILocation(line: 624, scope: !221, inlinedAt: !225)
!225 = !DILocation(line: 138, scope: !43)
!226 = !DILocation(line: 85, scope: !217, inlinedAt: !227)
!227 = !DILocation(line: 111, scope: !43)
!228 = !DILocation(line: 87, scope: !229, inlinedAt: !227)
!229 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!230 = !DILocation(line: 86, scope: !124, inlinedAt: !227)
!231 = !DILocation(line: 85, scope: !217, inlinedAt: !232)
!232 = !DILocation(line: 112, scope: !43)
!233 = !DILocation(line: 87, scope: !229, inlinedAt: !232)
!234 = !DILocation(line: 86, scope: !124, inlinedAt: !232)
!235 = !DILocation(line: 627, scope: !58, inlinedAt: !236)
!236 = !DILocation(line: 708, scope: !61, inlinedAt: !237)
!237 = !DILocation(line: 7, scope: !238, inlinedAt: !240)
!238 = distinct !DISubprogram(name: "convert;", linkageName: "convert", scope: !239, file: !239, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!239 = !DIFile(filename: "number.jl", directory: ".")
!240 = !DILocation(line: 259, scope: !241, inlinedAt: !243)
!241 = distinct !DISubprogram(name: "_promote;", linkageName: "_promote", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!242 = !DIFile(filename: "promotion.jl", directory: ".")
!243 = !DILocation(line: 282, scope: !244, inlinedAt: !245)
!244 = distinct !DISubprogram(name: "promote;", linkageName: "promote", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!245 = !DILocation(line: 350, scope: !246, inlinedAt: !247)
!246 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!247 = !DILocation(line: 115, scope: !43)
!248 = !DILocation(line: 441, scope: !249, inlinedAt: !245)
!249 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!250 = !DILocation(line: 87, scope: !229, inlinedAt: !247)
!251 = !DILocation(line: 86, scope: !124, inlinedAt: !247)
!252 = !DILocation(line: 87, scope: !229, inlinedAt: !253)
!253 = !DILocation(line: 116, scope: !43)
!254 = !DILocation(line: 86, scope: !124, inlinedAt: !253)
!255 = !DILocation(line: 1082, scope: !256, inlinedAt: !257)
!256 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!257 = !DILocation(line: 1060, scope: !258, inlinedAt: !253)
!258 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!259 = !DILocation(line: 82, scope: !260, inlinedAt: !261)
!260 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!261 = !DILocation(line: 409, scope: !262, inlinedAt: !263)
!262 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!263 = !DILocation(line: 317, scope: !264, inlinedAt: !265)
!264 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !222, file: !222, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!265 = !DILocation(line: 326, scope: !264, inlinedAt: !266)
!266 = !DILocation(line: 158, scope: !267, inlinedAt: !269)
!267 = distinct !DISubprogram(name: "map;", linkageName: "map", scope: !268, file: !268, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!268 = !DIFile(filename: "tuple.jl", directory: ".")
!269 = !DILocation(line: 75, scope: !270, inlinedAt: !271)
!270 = distinct !DISubprogram(name: "axes;", linkageName: "axes", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!271 = !DILocation(line: 1879, scope: !272, inlinedAt: !273)
!272 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!273 = !DILocation(line: 1089, scope: !274, inlinedAt: !275)
!274 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!275 = !DILocation(line: 1083, scope: !256, inlinedAt: !257)
!276 = !DILocation(line: 85, scope: !217, inlinedAt: !277)
!277 = !DILocation(line: 544, scope: !278, inlinedAt: !279)
!278 = distinct !DISubprogram(name: "unsafe_length;", linkageName: "unsafe_length", scope: !222, file: !222, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!279 = !DILocation(line: 1915, scope: !280, inlinedAt: !281)
!280 = distinct !DISubprogram(name: "nextL;", linkageName: "nextL", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!281 = !DILocation(line: 1911, scope: !282, inlinedAt: !283)
!282 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!283 = !DILocation(line: 1895, scope: !272, inlinedAt: !271)
!284 = !DILocation(line: 87, scope: !229, inlinedAt: !279)
!285 = !DILocation(line: 85, scope: !217, inlinedAt: !286)
!286 = !DILocation(line: 1918, scope: !287, inlinedAt: !281)
!287 = distinct !DISubprogram(name: "offsetin;", linkageName: "offsetin", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!288 = !DILocation(line: 87, scope: !229, inlinedAt: !281)
!289 = !DILocation(line: 86, scope: !124, inlinedAt: !281)
!290 = !DILocation(line: 85, scope: !217, inlinedAt: !291)
!291 = !DILocation(line: 1918, scope: !287, inlinedAt: !292)
!292 = !DILocation(line: 1911, scope: !282, inlinedAt: !281)
!293 = !DILocation(line: 87, scope: !229, inlinedAt: !292)
!294 = !DILocation(line: 86, scope: !124, inlinedAt: !292)
!295 = !DILocation(line: 78, scope: !296, inlinedAt: !297)
!296 = distinct !DISubprogram(name: "arrayref;", linkageName: "arrayref", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!297 = !DILocation(line: 99, scope: !298, inlinedAt: !275)
!298 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!299 = !DILocation(line: 85, scope: !217, inlinedAt: !300)
!300 = !DILocation(line: 80, scope: !109, inlinedAt: !301)
!301 = !DILocation(line: 7, scope: !302, inlinedAt: !304)
!302 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !303, file: !303, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!303 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl", directory: ".")
!304 = !DILocation(line: 7, scope: !305, inlinedAt: !306)
!305 = distinct !DISubprogram(name: "pointerref;", linkageName: "pointerref", scope: !303, file: !303, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!306 = !DILocation(line: 79, scope: !307, inlinedAt: !308)
!307 = distinct !DISubprogram(name: "unsafe_load;", linkageName: "unsafe_load", scope: !303, file: !303, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!308 = !DILocation(line: 80, scope: !296, inlinedAt: !297)
!309 = !DILocation(line: 1084, scope: !256, inlinedAt: !257)
!310 = !DILocation(line: 1175, scope: !311, inlinedAt: !312)
!311 = distinct !DISubprogram(name: "_setindex!;", linkageName: "_setindex!", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!312 = !DILocation(line: 1153, scope: !313, inlinedAt: !253)
!313 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!314 = !DILocation(line: 85, scope: !217, inlinedAt: !315)
!315 = !DILocation(line: 1918, scope: !287, inlinedAt: !316)
!316 = !DILocation(line: 1911, scope: !282, inlinedAt: !317)
!317 = !DILocation(line: 1895, scope: !272, inlinedAt: !318)
!318 = !DILocation(line: 1879, scope: !272, inlinedAt: !319)
!319 = !DILocation(line: 1089, scope: !274, inlinedAt: !320)
!320 = !DILocation(line: 1176, scope: !311, inlinedAt: !312)
!321 = !DILocation(line: 87, scope: !229, inlinedAt: !316)
!322 = !DILocation(line: 86, scope: !124, inlinedAt: !316)
!323 = !DILocation(line: 85, scope: !217, inlinedAt: !324)
!324 = !DILocation(line: 1918, scope: !287, inlinedAt: !325)
!325 = !DILocation(line: 1911, scope: !282, inlinedAt: !316)
!326 = !DILocation(line: 87, scope: !229, inlinedAt: !325)
!327 = !DILocation(line: 86, scope: !124, inlinedAt: !325)
!328 = !DILocation(line: 84, scope: !329, inlinedAt: !330)
!329 = distinct !DISubprogram(name: "arrayset;", linkageName: "arrayset", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!330 = !DILocation(line: 101, scope: !331, inlinedAt: !320)
!331 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!332 = !DILocation(line: 85, scope: !217, inlinedAt: !333)
!333 = !DILocation(line: 80, scope: !109, inlinedAt: !334)
!334 = !DILocation(line: 42, scope: !302, inlinedAt: !335)
!335 = !DILocation(line: 42, scope: !336, inlinedAt: !337)
!336 = distinct !DISubprogram(name: "pointerset;", linkageName: "pointerset", scope: !303, file: !303, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!337 = !DILocation(line: 82, scope: !338, inlinedAt: !339)
!338 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !303, file: !303, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!339 = !DILocation(line: 86, scope: !329, inlinedAt: !330)
!340 = !DILocation(line: 87, scope: !329, inlinedAt: !330)
!341 = !DILocation(line: 1177, scope: !311, inlinedAt: !312)
!342 = !DILocation(line: 1175, scope: !311, inlinedAt: !343)
!343 = !DILocation(line: 1153, scope: !313, inlinedAt: !344)
!344 = !DILocation(line: 118, scope: !43)
!345 = !DILocation(line: 85, scope: !217, inlinedAt: !346)
!346 = !DILocation(line: 1918, scope: !287, inlinedAt: !347)
!347 = !DILocation(line: 1911, scope: !282, inlinedAt: !348)
!348 = !DILocation(line: 1895, scope: !272, inlinedAt: !349)
!349 = !DILocation(line: 1879, scope: !272, inlinedAt: !350)
!350 = !DILocation(line: 1089, scope: !274, inlinedAt: !351)
!351 = !DILocation(line: 1176, scope: !311, inlinedAt: !343)
!352 = !DILocation(line: 87, scope: !229, inlinedAt: !347)
!353 = !DILocation(line: 86, scope: !124, inlinedAt: !347)
!354 = !DILocation(line: 85, scope: !217, inlinedAt: !355)
!355 = !DILocation(line: 1918, scope: !287, inlinedAt: !356)
!356 = !DILocation(line: 1911, scope: !282, inlinedAt: !347)
!357 = !DILocation(line: 87, scope: !229, inlinedAt: !356)
!358 = !DILocation(line: 86, scope: !124, inlinedAt: !356)
!359 = !DILocation(line: 84, scope: !329, inlinedAt: !360)
!360 = !DILocation(line: 101, scope: !331, inlinedAt: !351)
!361 = !DILocation(line: 85, scope: !217, inlinedAt: !362)
!362 = !DILocation(line: 80, scope: !109, inlinedAt: !363)
!363 = !DILocation(line: 42, scope: !302, inlinedAt: !364)
!364 = !DILocation(line: 42, scope: !336, inlinedAt: !365)
!365 = !DILocation(line: 82, scope: !338, inlinedAt: !366)
!366 = !DILocation(line: 86, scope: !329, inlinedAt: !360)
!367 = !DILocation(line: 87, scope: !329, inlinedAt: !360)
!368 = !DILocation(line: 1177, scope: !311, inlinedAt: !343)
!369 = !DILocation(line: 87, scope: !229, inlinedAt: !370)
!370 = !DILocation(line: 120, scope: !43)
!371 = !DILocation(line: 86, scope: !124, inlinedAt: !370)
!372 = !DILocation(line: 627, scope: !58, inlinedAt: !373)
!373 = !DILocation(line: 708, scope: !61, inlinedAt: !374)
!374 = !DILocation(line: 7, scope: !238, inlinedAt: !375)
!375 = !DILocation(line: 259, scope: !241, inlinedAt: !376)
!376 = !DILocation(line: 282, scope: !244, inlinedAt: !377)
!377 = !DILocation(line: 350, scope: !246, inlinedAt: !370)
!378 = !DILocation(line: 441, scope: !249, inlinedAt: !377)
!379 = !DILocation(line: 87, scope: !229, inlinedAt: !380)
!380 = !DILocation(line: 121, scope: !43)
!381 = !DILocation(line: 86, scope: !124, inlinedAt: !380)
!382 = !DILocation(line: 1082, scope: !256, inlinedAt: !383)
!383 = !DILocation(line: 1060, scope: !258, inlinedAt: !380)
!384 = !DILocation(line: 82, scope: !260, inlinedAt: !385)
!385 = !DILocation(line: 409, scope: !262, inlinedAt: !386)
!386 = !DILocation(line: 317, scope: !264, inlinedAt: !387)
!387 = !DILocation(line: 326, scope: !264, inlinedAt: !388)
!388 = !DILocation(line: 158, scope: !267, inlinedAt: !389)
!389 = !DILocation(line: 75, scope: !270, inlinedAt: !390)
!390 = !DILocation(line: 1879, scope: !272, inlinedAt: !391)
!391 = !DILocation(line: 1089, scope: !274, inlinedAt: !392)
!392 = !DILocation(line: 1083, scope: !256, inlinedAt: !383)
!393 = !DILocation(line: 85, scope: !217, inlinedAt: !394)
!394 = !DILocation(line: 544, scope: !278, inlinedAt: !395)
!395 = !DILocation(line: 1915, scope: !280, inlinedAt: !396)
!396 = !DILocation(line: 1911, scope: !282, inlinedAt: !397)
!397 = !DILocation(line: 1895, scope: !272, inlinedAt: !390)
!398 = !DILocation(line: 87, scope: !229, inlinedAt: !395)
!399 = !DILocation(line: 85, scope: !217, inlinedAt: !400)
!400 = !DILocation(line: 1918, scope: !287, inlinedAt: !396)
!401 = !DILocation(line: 87, scope: !229, inlinedAt: !396)
!402 = !DILocation(line: 86, scope: !124, inlinedAt: !396)
!403 = !DILocation(line: 85, scope: !217, inlinedAt: !404)
!404 = !DILocation(line: 1918, scope: !287, inlinedAt: !405)
!405 = !DILocation(line: 1911, scope: !282, inlinedAt: !396)
!406 = !DILocation(line: 87, scope: !229, inlinedAt: !405)
!407 = !DILocation(line: 86, scope: !124, inlinedAt: !405)
!408 = !DILocation(line: 78, scope: !296, inlinedAt: !409)
!409 = !DILocation(line: 99, scope: !298, inlinedAt: !392)
!410 = !DILocation(line: 85, scope: !217, inlinedAt: !411)
!411 = !DILocation(line: 80, scope: !109, inlinedAt: !412)
!412 = !DILocation(line: 7, scope: !302, inlinedAt: !413)
!413 = !DILocation(line: 7, scope: !305, inlinedAt: !414)
!414 = !DILocation(line: 79, scope: !307, inlinedAt: !415)
!415 = !DILocation(line: 80, scope: !296, inlinedAt: !409)
!416 = !DILocation(line: 1084, scope: !256, inlinedAt: !383)
!417 = !DILocation(line: 1175, scope: !311, inlinedAt: !418)
!418 = !DILocation(line: 1153, scope: !313, inlinedAt: !380)
!419 = !DILocation(line: 85, scope: !217, inlinedAt: !420)
!420 = !DILocation(line: 1918, scope: !287, inlinedAt: !421)
!421 = !DILocation(line: 1911, scope: !282, inlinedAt: !422)
!422 = !DILocation(line: 1895, scope: !272, inlinedAt: !423)
!423 = !DILocation(line: 1879, scope: !272, inlinedAt: !424)
!424 = !DILocation(line: 1089, scope: !274, inlinedAt: !425)
!425 = !DILocation(line: 1176, scope: !311, inlinedAt: !418)
!426 = !DILocation(line: 87, scope: !229, inlinedAt: !421)
!427 = !DILocation(line: 86, scope: !124, inlinedAt: !421)
!428 = !DILocation(line: 85, scope: !217, inlinedAt: !429)
!429 = !DILocation(line: 1918, scope: !287, inlinedAt: !430)
!430 = !DILocation(line: 1911, scope: !282, inlinedAt: !421)
!431 = !DILocation(line: 87, scope: !229, inlinedAt: !430)
!432 = !DILocation(line: 86, scope: !124, inlinedAt: !430)
!433 = !DILocation(line: 84, scope: !329, inlinedAt: !434)
!434 = !DILocation(line: 101, scope: !331, inlinedAt: !425)
!435 = !DILocation(line: 85, scope: !217, inlinedAt: !436)
!436 = !DILocation(line: 80, scope: !109, inlinedAt: !437)
!437 = !DILocation(line: 42, scope: !302, inlinedAt: !438)
!438 = !DILocation(line: 42, scope: !336, inlinedAt: !439)
!439 = !DILocation(line: 82, scope: !338, inlinedAt: !440)
!440 = !DILocation(line: 86, scope: !329, inlinedAt: !434)
!441 = !DILocation(line: 87, scope: !329, inlinedAt: !434)
!442 = !DILocation(line: 1177, scope: !311, inlinedAt: !418)
!443 = !DILocation(line: 1175, scope: !311, inlinedAt: !444)
!444 = !DILocation(line: 1153, scope: !313, inlinedAt: !445)
!445 = !DILocation(line: 123, scope: !43)
!446 = !DILocation(line: 85, scope: !217, inlinedAt: !447)
!447 = !DILocation(line: 1918, scope: !287, inlinedAt: !448)
!448 = !DILocation(line: 1911, scope: !282, inlinedAt: !449)
!449 = !DILocation(line: 1895, scope: !272, inlinedAt: !450)
!450 = !DILocation(line: 1879, scope: !272, inlinedAt: !451)
!451 = !DILocation(line: 1089, scope: !274, inlinedAt: !452)
!452 = !DILocation(line: 1176, scope: !311, inlinedAt: !444)
!453 = !DILocation(line: 87, scope: !229, inlinedAt: !448)
!454 = !DILocation(line: 86, scope: !124, inlinedAt: !448)
!455 = !DILocation(line: 85, scope: !217, inlinedAt: !456)
!456 = !DILocation(line: 1918, scope: !287, inlinedAt: !457)
!457 = !DILocation(line: 1911, scope: !282, inlinedAt: !448)
!458 = !DILocation(line: 87, scope: !229, inlinedAt: !457)
!459 = !DILocation(line: 86, scope: !124, inlinedAt: !457)
!460 = !DILocation(line: 84, scope: !329, inlinedAt: !461)
!461 = !DILocation(line: 101, scope: !331, inlinedAt: !452)
!462 = !DILocation(line: 85, scope: !217, inlinedAt: !463)
!463 = !DILocation(line: 80, scope: !109, inlinedAt: !464)
!464 = !DILocation(line: 42, scope: !302, inlinedAt: !465)
!465 = !DILocation(line: 42, scope: !336, inlinedAt: !466)
!466 = !DILocation(line: 82, scope: !338, inlinedAt: !467)
!467 = !DILocation(line: 86, scope: !329, inlinedAt: !461)
!468 = !DILocation(line: 87, scope: !329, inlinedAt: !461)
!469 = !DILocation(line: 1177, scope: !311, inlinedAt: !444)
!470 = !DILocation(line: 14, scope: !471, inlinedAt: !473)
!471 = distinct !DISubprogram(name: "sync_threads;", linkageName: "sync_threads", scope: !472, file: !472, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!472 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl", directory: ".")
!473 = !DILocation(line: 127, scope: !43)
!474 = !DILocation(line: 134, scope: !43)
!475 = !DILocation(line: 1082, scope: !256, inlinedAt: !476)
!476 = !DILocation(line: 1060, scope: !258, inlinedAt: !477)
!477 = !DILocation(line: 135, scope: !43)
!478 = !DILocation(line: 85, scope: !217, inlinedAt: !479)
!479 = !DILocation(line: 1918, scope: !287, inlinedAt: !480)
!480 = !DILocation(line: 1911, scope: !282, inlinedAt: !481)
!481 = !DILocation(line: 1895, scope: !272, inlinedAt: !482)
!482 = !DILocation(line: 1879, scope: !272, inlinedAt: !483)
!483 = !DILocation(line: 1089, scope: !274, inlinedAt: !484)
!484 = !DILocation(line: 1083, scope: !256, inlinedAt: !476)
!485 = !DILocation(line: 87, scope: !229, inlinedAt: !480)
!486 = !DILocation(line: 86, scope: !124, inlinedAt: !480)
!487 = !DILocation(line: 85, scope: !217, inlinedAt: !488)
!488 = !DILocation(line: 1918, scope: !287, inlinedAt: !489)
!489 = !DILocation(line: 1911, scope: !282, inlinedAt: !480)
!490 = !DILocation(line: 87, scope: !229, inlinedAt: !489)
!491 = !DILocation(line: 86, scope: !124, inlinedAt: !489)
!492 = !DILocation(line: 78, scope: !296, inlinedAt: !493)
!493 = !DILocation(line: 99, scope: !298, inlinedAt: !484)
!494 = !DILocation(line: 85, scope: !217, inlinedAt: !495)
!495 = !DILocation(line: 80, scope: !109, inlinedAt: !496)
!496 = !DILocation(line: 7, scope: !302, inlinedAt: !497)
!497 = !DILocation(line: 7, scope: !305, inlinedAt: !498)
!498 = !DILocation(line: 79, scope: !307, inlinedAt: !499)
!499 = !DILocation(line: 80, scope: !296, inlinedAt: !493)
!500 = !DILocation(line: 1084, scope: !256, inlinedAt: !476)
!501 = !DILocation(line: 404, scope: !502, inlinedAt: !477)
!502 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !503, file: !503, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!503 = !DIFile(filename: "float.jl", directory: ".")
!504 = !DILocation(line: 400, scope: !505, inlinedAt: !477)
!505 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !503, file: !503, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!506 = !DILocation(line: 398, scope: !507, inlinedAt: !508)
!507 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!508 = !DILocation(line: 624, scope: !221, inlinedAt: !477)
!509 = !DILocation(line: 86, scope: !124, inlinedAt: !510)
!510 = !DILocation(line: 625, scope: !221, inlinedAt: !477)
!511 = !DILocation(line: 14, scope: !471, inlinedAt: !225)
!512 = !DILocation(line: 398, scope: !507, inlinedAt: !224)
!513 = !DILocation(line: 86, scope: !124, inlinedAt: !514)
!514 = !DILocation(line: 625, scope: !221, inlinedAt: !225)
!515 = !DILocation(line: 85, scope: !217, inlinedAt: !516)
!516 = !DILocation(line: 141, scope: !43)
!517 = !DILocation(line: 87, scope: !229, inlinedAt: !516)
!518 = !DILocation(line: 86, scope: !124, inlinedAt: !516)
!519 = !DILocation(line: 85, scope: !217, inlinedAt: !520)
!520 = !DILocation(line: 142, scope: !43)
!521 = !DILocation(line: 87, scope: !229, inlinedAt: !520)
!522 = !DILocation(line: 86, scope: !124, inlinedAt: !520)
!523 = !DILocation(line: 627, scope: !58, inlinedAt: !524)
!524 = !DILocation(line: 708, scope: !61, inlinedAt: !525)
!525 = !DILocation(line: 7, scope: !238, inlinedAt: !526)
!526 = !DILocation(line: 259, scope: !241, inlinedAt: !527)
!527 = !DILocation(line: 282, scope: !244, inlinedAt: !528)
!528 = !DILocation(line: 350, scope: !246, inlinedAt: !529)
!529 = !DILocation(line: 144, scope: !43)
!530 = !DILocation(line: 441, scope: !249, inlinedAt: !528)
!531 = !DILocation(line: 1175, scope: !311, inlinedAt: !532)
!532 = !DILocation(line: 1153, scope: !313, inlinedAt: !533)
!533 = !DILocation(line: 145, scope: !43)
!534 = !DILocation(line: 82, scope: !260, inlinedAt: !535)
!535 = !DILocation(line: 409, scope: !262, inlinedAt: !536)
!536 = !DILocation(line: 317, scope: !264, inlinedAt: !537)
!537 = !DILocation(line: 326, scope: !264, inlinedAt: !538)
!538 = !DILocation(line: 158, scope: !267, inlinedAt: !539)
!539 = !DILocation(line: 75, scope: !270, inlinedAt: !540)
!540 = !DILocation(line: 1879, scope: !272, inlinedAt: !541)
!541 = !DILocation(line: 1089, scope: !274, inlinedAt: !542)
!542 = !DILocation(line: 1176, scope: !311, inlinedAt: !532)
!543 = !DILocation(line: 85, scope: !217, inlinedAt: !544)
!544 = !DILocation(line: 544, scope: !278, inlinedAt: !545)
!545 = !DILocation(line: 1915, scope: !280, inlinedAt: !546)
!546 = !DILocation(line: 1911, scope: !282, inlinedAt: !547)
!547 = !DILocation(line: 1895, scope: !272, inlinedAt: !540)
!548 = !DILocation(line: 87, scope: !229, inlinedAt: !545)
!549 = !DILocation(line: 85, scope: !217, inlinedAt: !550)
!550 = !DILocation(line: 1918, scope: !287, inlinedAt: !546)
!551 = !DILocation(line: 87, scope: !229, inlinedAt: !546)
!552 = !DILocation(line: 86, scope: !124, inlinedAt: !546)
!553 = !DILocation(line: 85, scope: !217, inlinedAt: !554)
!554 = !DILocation(line: 1918, scope: !287, inlinedAt: !555)
!555 = !DILocation(line: 1911, scope: !282, inlinedAt: !546)
!556 = !DILocation(line: 87, scope: !229, inlinedAt: !555)
!557 = !DILocation(line: 86, scope: !124, inlinedAt: !555)
!558 = !DILocation(line: 84, scope: !329, inlinedAt: !559)
!559 = !DILocation(line: 101, scope: !331, inlinedAt: !542)
!560 = !DILocation(line: 85, scope: !217, inlinedAt: !561)
!561 = !DILocation(line: 80, scope: !109, inlinedAt: !562)
!562 = !DILocation(line: 42, scope: !302, inlinedAt: !563)
!563 = !DILocation(line: 42, scope: !336, inlinedAt: !564)
!564 = !DILocation(line: 82, scope: !338, inlinedAt: !565)
!565 = !DILocation(line: 86, scope: !329, inlinedAt: !559)
!566 = !DILocation(line: 87, scope: !329, inlinedAt: !559)
!567 = !DILocation(line: 1177, scope: !311, inlinedAt: !532)
!568 = !DILocation(line: 147, scope: !43)
!569 = !DILocation(line: 85, scope: !217, inlinedAt: !223)
!570 = !DILocation(line: 441, scope: !249, inlinedAt: !571)
!571 = !DILocation(line: 350, scope: !572, inlinedAt: !574)
!572 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !573, file: !573, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!573 = !DIFile(filename: "operators.jl", directory: ".")
!574 = !DILocation(line: 285, scope: !575, inlinedAt: !576)
!575 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !222, file: !222, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!576 = !DILocation(line: 280, scope: !577, inlinedAt: !578)
!577 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !222, file: !222, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!578 = !DILocation(line: 5, scope: !579, inlinedAt: !223)
!579 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !222, file: !222, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!580 = !DILocation(line: 82, scope: !260, inlinedAt: !581)
!581 = !DILocation(line: 303, scope: !582, inlinedAt: !583)
!582 = distinct !DISubprogram(name: ">;", linkageName: ">", scope: !573, file: !573, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!583 = !DILocation(line: 503, scope: !584, inlinedAt: !220)
!584 = distinct !DISubprogram(name: "isempty;", linkageName: "isempty", scope: !222, file: !222, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!585 = !{i32 0, i32 2147483646}
!586 = !{i32 0, i32 65534}
!587 = !{i32 0, i32 1023}
!588 = !{!589, !589, i64 0, i64 0}
!589 = !{!"custom_tbaa_addrspace(1)", !590, i64 0}
!590 = !{!"custom_tbaa"}
!591 = !{!592, !592, i64 0, i64 0}
!592 = !{!"custom_tbaa_addrspace(3)", !590, i64 0}
!593 = distinct !DISubprogram(name: "report_exception", linkageName: "julia_report_exception_3607", scope: null, file: !15, line: 39, type: !44, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!594 = !DILocation(line: 80, scope: !595, inlinedAt: !596)
!595 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !110, file: !110, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!596 = !DILocation(line: 38, scope: !597, inlinedAt: !599)
!597 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !598, file: !598, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!598 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl", directory: ".")
!599 = !DILocation(line: 38, scope: !600, inlinedAt: !601)
!600 = distinct !DISubprogram(name: "_cuprintf;", linkageName: "_cuprintf", scope: !598, file: !598, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!601 = !DILocation(line: 40, scope: !593)
!602 = !DILocation(line: 44, scope: !593)
!603 = distinct !DISubprogram(name: "signal_exception", linkageName: "julia_signal_exception_3677", scope: null, file: !15, line: 25, type: !44, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!604 = !DILocation(line: 23, scope: !605, inlinedAt: !606)
!605 = distinct !DISubprogram(name: "exception_flag;", linkageName: "exception_flag", scope: !15, file: !15, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!606 = !DILocation(line: 26, scope: !603)
!607 = !DILocation(line: 27, scope: !603)
!608 = !DILocation(line: 118, scope: !609, inlinedAt: !611)
!609 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !610, file: !610, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!610 = !DIFile(filename: "pointer.jl", directory: ".")
!611 = !DILocation(line: 118, scope: !609, inlinedAt: !612)
!612 = !DILocation(line: 28, scope: !603)
!613 = !{!614, !614, i64 0}
!614 = !{!"jtbaa_data", !47, i64 0}
!615 = !DILocation(line: 115, scope: !616, inlinedAt: !617)
!616 = distinct !DISubprogram(name: "threadfence_system;", linkageName: "threadfence_system", scope: !472, file: !472, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!617 = !DILocation(line: 29, scope: !603)
!618 = !DILocation(line: 80, scope: !619, inlinedAt: !620)
!619 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !110, file: !110, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!620 = !DILocation(line: 38, scope: !621, inlinedAt: !622)
!621 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !598, file: !598, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!622 = !DILocation(line: 38, scope: !623, inlinedAt: !624)
!623 = distinct !DISubprogram(name: "_cuprintf;", linkageName: "_cuprintf", scope: !598, file: !598, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!624 = !DILocation(line: 31, scope: !603)
!625 = !DILocation(line: 36, scope: !603)
