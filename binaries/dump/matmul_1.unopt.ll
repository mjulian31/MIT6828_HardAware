; ModuleID = 'julia'
source_filename = "julia"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%jl_value_t = type opaque
%printf_args = type { i64 }

@__static_shmem_285 = internal addrspace(3) global [1056 x double] zeroinitializer, align 32
@__static_shmem_286 = internal addrspace(3) global [1056 x double] zeroinitializer, align 32
@exception5 = private unnamed_addr constant [10 x i8] c"exception\00", align 1
@0 = internal unnamed_addr constant [108 x i8] c"ERROR: a %s was thrown during kernel execution.\0A       Run Julia on debug level 2 for device stack traces.\0A\00", align 1
@1 = internal unnamed_addr constant [110 x i8] c"WARNING: could not signal exception status to the host, execution will continue.\0A         Please file a bug.\0A\00", align 1

;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:89 within `coalesced_matmul_kernel!'
define dso_local ptx_kernel void @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_(i64, i64, i64, i32, i32, i32) local_unnamed_addr !dbg !43 {
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:90 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %37 = inttoptr i64 %0 to i8 addrspace(1)*, !dbg !49
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:91 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %38 = inttoptr i64 %1 to i8 addrspace(1)*, !dbg !53
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:92 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %39 = inttoptr i64 %2 to i8 addrspace(1)*, !dbg !55
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
           %40 = sext i32 %3 to i64, !dbg !57
           %41 = sext i32 %3 to i64, !dbg !57
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
           %48 = sext i32 %3 to i64, !dbg !84
           %49 = sext i32 %3 to i64, !dbg !84
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:95 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
; │┌ @ broadcast.jl:837 within `materialize'
; ││┌ @ broadcast.jl:1046 within `copy'
; │││┌ @ ntuple.jl:42 within `ntuple'
; ││││┌ @ broadcast.jl:1046 within `#19'
; │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
; ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
; │││││││┌ @ boot.jl:708 within `Int64'
; ││││││││┌ @ boot.jl:627 within `toInt64'
           %56 = sext i32 %3 to i64, !dbg !96
           %57 = sext i32 %3 to i64, !dbg !96
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:97 within `coalesced_matmul_kernel!'
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:102 within `coalesced_matmul_kernel!'
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:103 within `coalesced_matmul_kernel!'
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:107 within `coalesced_matmul_kernel!'
; ┌ @ operators.jl:538 within `max' @ promotion.jl:409
; │┌ @ int.jl:82 within `<'
    %90 = icmp slt i32 %4, %3, !dbg !210
; │└
   %91 = zext i1 %90 to i8, !dbg !212
   %92 = trunc i8 %91 to i1, !dbg !212
   %93 = xor i1 %92, true, !dbg !212
   %94 = select i1 %93, i32 %4, i32 %3, !dbg !212
; │┌ @ int.jl:82 within `<'
    %95 = icmp slt i32 %5, %94, !dbg !210
; │└
   %96 = zext i1 %95 to i8, !dbg !212
   %97 = trunc i8 %96 to i1, !dbg !212
   %98 = xor i1 %97, true, !dbg !212
   %99 = select i1 %98, i32 %5, i32 %94, !dbg !212
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:108 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:352 within `rem'
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %100 = sext i32 %99 to i64, !dbg !219
; │└└└└└
; │ @ promotion.jl:352 within `rem' @ int.jl:261
   br label %pass, !dbg !231

L62:                                              ; preds = %after_srem
; └
  br label %L64, !dbg !230

L63:                                              ; preds = %after_srem
  br label %L64, !dbg !230

L64:                                              ; preds = %L63, %L62
  %value_phi = phi i64 [ 0, %L62 ], [ 32, %L63 ]
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:920 within `+'
; │┌ @ int.jl:476 within `rem'
    %101 = sext i32 %99 to i64, !dbg !233
; │└
; │ @ int.jl:922 within `+' @ int.jl:86
   %102 = add i64 %101, %value_phi, !dbg !236
; └
; ┌ @ int.jl:260 within `div'
   %103 = icmp ne i64 %102, -9223372036854775808, !dbg !238
   %104 = or i1 true, %103, !dbg !238
   %105 = and i1 true, %104, !dbg !238
   br i1 %105, label %pass2, label %fail1, !dbg !238

L74:                                              ; preds = %pass2
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L76, !dbg !240

L75:                                              ; preds = %pass2
   br label %L76, !dbg !240

L76:                                              ; preds = %L75, %L74
   %value_phi3 = phi i8 [ 1, %L74 ], [ 0, %L75 ]
   %value_phi4 = phi i64 [ 0, %L75 ], [ undef, %L74 ]
   %value_phi5 = phi i64 [ 0, %L75 ], [ undef, %L74 ]
; └
  %106 = xor i8 %value_phi3, 1, !dbg !243
  %107 = trunc i8 %106 to i1, !dbg !243
  %108 = xor i1 %107, true, !dbg !243
  br i1 %108, label %L76.L525_crit_edge, label %L76.L81_crit_edge, !dbg !243

L76.L525_crit_edge:                               ; preds = %L76
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:624 within `iterate'
   br label %L525, !dbg !244

L76.L81_crit_edge:                                ; preds = %L76
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L81, !dbg !240

L81:                                              ; preds = %L76.L81_crit_edge, %L524
   %value_phi6 = phi double [ 0.000000e+00, %L76.L81_crit_edge ], [ %218, %L524 ]
   %value_phi7 = phi i64 [ %value_phi4, %L76.L81_crit_edge ], [ %value_phi18, %L524 ]
   %value_phi8 = phi i64 [ %value_phi5, %L76.L81_crit_edge ], [ %value_phi19, %L524 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:114 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %109 = sub i64 %66, 1, !dbg !246
; └
; ┌ @ int.jl:87 within `*'
   %110 = mul i64 %109, 32, !dbg !249
; └
; ┌ @ int.jl:86 within `+'
   %111 = add i64 %110, %76, !dbg !251
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %112 = sub i64 %72, 1, !dbg !252
; └
; ┌ @ int.jl:87 within `*'
   %113 = mul i64 %112, 32, !dbg !254
; └
; ┌ @ int.jl:86 within `+'
   %114 = add i64 %113, %82, !dbg !255
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %115 = sext i32 %3 to i64, !dbg !256
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %116 = icmp sle i64 %111, %115, !dbg !264
; └
  %117 = zext i1 %116 to i8, !dbg !263
  %118 = trunc i8 %117 to i1, !dbg !263
  %119 = xor i1 %118, true, !dbg !263
  br i1 %119, label %L101, label %L95, !dbg !263

L95:                                              ; preds = %L81
; ┌ @ int.jl:87 within `*'
   %120 = mul i64 %value_phi7, 32, !dbg !266
; └
; ┌ @ int.jl:86 within `+'
   %121 = add i64 %120, %82, !dbg !267
; └
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %122 = sext i32 %4 to i64, !dbg !256
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %123 = icmp sle i64 %121, %122, !dbg !264
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   %124 = zext i1 %123 to i8, !dbg !240
   br label %L102, !dbg !240

L101:                                             ; preds = %L81
   br label %L102, !dbg !240

L102:                                             ; preds = %L101, %L95
   %value_phi9 = phi i8 [ %124, %L95 ], [ 0, %L101 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
  %125 = trunc i8 %value_phi9 to i1, !dbg !263
  %126 = xor i1 %125, true, !dbg !263
  br i1 %126, label %L202, label %L104, !dbg !263

L104:                                             ; preds = %L102
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:119 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %127 = mul i64 %value_phi7, 32, !dbg !268
; └
; ┌ @ int.jl:86 within `+'
   %128 = add i64 %127, %82, !dbg !270
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L126, !dbg !271

L126:                                             ; preds = %L104
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %129 = icmp slt i64 %48, 0, !dbg !275
; ││││││││└
          %130 = zext i1 %129 to i8, !dbg !276
          %131 = trunc i8 %130 to i1, !dbg !276
          %132 = xor i1 %131, true, !dbg !276
          %133 = select i1 %132, i64 %48, i64 0, !dbg !276
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %134 = sub i64 %133, 0, !dbg !290
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %135 = mul i64 1, %134, !dbg !298
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %136 = sub i64 %111, 1, !dbg !299
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %137 = mul i64 %136, 1, !dbg !302
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %138 = add i64 1, %137, !dbg !303
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %139 = sub i64 %128, 1, !dbg !304
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %140 = mul i64 %139, %135, !dbg !307
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %141 = add i64 %138, %140, !dbg !308
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L149, !dbg !309

L149:                                             ; preds = %L126
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %142 = sub i64 %141, 1, !dbg !313
; │││││││└
         %143 = call fastcc double @jl_llvmcall14(i8 addrspace(1)* %38, i64 %142), !dbg !314
; ││││└└└
      br label %L153, !dbg !322

L153:                                             ; preds = %L149
; │││└
     br label %L154, !dbg !311

L154:                                             ; preds = %L153
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L155, !dbg !323

L155:                                             ; preds = %L154
; │└
   br label %L156, !dbg !273

L156:                                             ; preds = %L155
; └
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L175, !dbg !324

L175:                                             ; preds = %L156
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %144 = sub i64 %76, 1, !dbg !328
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %145 = mul i64 %144, 1, !dbg !335
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %146 = add i64 1, %145, !dbg !336
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %147 = sub i64 %82, 1, !dbg !337
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %148 = mul i64 %147, 33, !dbg !340
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %149 = add i64 %146, %148, !dbg !341
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L194, !dbg !342

L194:                                             ; preds = %L175
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %150 = sub i64 %149, 1, !dbg !346
; │││││││└
         call fastcc void @jl_llvmcall15(i8 addrspace(3)* %84, double %143, i64 %150), !dbg !347
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L198, !dbg !354

L198:                                             ; preds = %L194
; │││└
     br label %L199, !dbg !344

L199:                                             ; preds = %L198
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L200, !dbg !355

L200:                                             ; preds = %L199
; │└
   br label %L201, !dbg !326

L201:                                             ; preds = %L200
; └
  br label %L248, !dbg !269

L202:                                             ; preds = %L102
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L221, !dbg !356

L221:                                             ; preds = %L202
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %151 = sub i64 %76, 1, !dbg !359
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %152 = mul i64 %151, 1, !dbg !366
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %153 = add i64 1, %152, !dbg !367
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %154 = sub i64 %82, 1, !dbg !368
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %155 = mul i64 %154, 33, !dbg !371
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %156 = add i64 %153, %155, !dbg !372
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L240, !dbg !373

L240:                                             ; preds = %L221
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %157 = sub i64 %156, 1, !dbg !375
; │││││││└
         call fastcc void @jl_llvmcall22(i8 addrspace(3)* %84, double 0.000000e+00, i64 %157), !dbg !376
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L244, !dbg !381

L244:                                             ; preds = %L240
; │││└
     br label %L245, !dbg !374

L245:                                             ; preds = %L244
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L246, !dbg !382

L246:                                             ; preds = %L245
; │└
   br label %L247, !dbg !357

L247:                                             ; preds = %L246
   br label %L248, !dbg !357

L248:                                             ; preds = %L247, %L201
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %158 = mul i64 %value_phi7, 32, !dbg !383
; └
; ┌ @ int.jl:86 within `+'
   %159 = add i64 %158, %76, !dbg !385
; └
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %160 = sext i32 %4 to i64, !dbg !386
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %161 = icmp sle i64 %159, %160, !dbg !392
; └
  %162 = zext i1 %161 to i8, !dbg !384
  %163 = trunc i8 %162 to i1, !dbg !384
  %164 = xor i1 %163, true, !dbg !384
  br i1 %164, label %L257, label %L254, !dbg !384

L254:                                             ; preds = %L248
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %165 = sext i32 %5 to i64, !dbg !386
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %166 = icmp sle i64 %114, %165, !dbg !392
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   %167 = zext i1 %166 to i8, !dbg !240
   br label %L258, !dbg !240

L257:                                             ; preds = %L248
   br label %L258, !dbg !240

L258:                                             ; preds = %L257, %L254
   %value_phi10 = phi i8 [ %167, %L254 ], [ 0, %L257 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
  %168 = trunc i8 %value_phi10 to i1, !dbg !384
  %169 = xor i1 %168, true, !dbg !384
  br i1 %169, label %L358, label %L260, !dbg !384

L260:                                             ; preds = %L258
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:124 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %170 = mul i64 %value_phi7, 32, !dbg !393
; └
; ┌ @ int.jl:86 within `+'
   %171 = add i64 %170, %76, !dbg !395
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L282, !dbg !396

L282:                                             ; preds = %L260
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %172 = icmp slt i64 %56, 0, !dbg !398
; ││││││││└
          %173 = zext i1 %172 to i8, !dbg !399
          %174 = trunc i8 %173 to i1, !dbg !399
          %175 = xor i1 %174, true, !dbg !399
          %176 = select i1 %175, i64 %56, i64 0, !dbg !399
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %177 = sub i64 %176, 0, !dbg !407
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %178 = mul i64 1, %177, !dbg !412
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %179 = sub i64 %171, 1, !dbg !413
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %180 = mul i64 %179, 1, !dbg !415
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %181 = add i64 1, %180, !dbg !416
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %182 = sub i64 %114, 1, !dbg !417
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %183 = mul i64 %182, %178, !dbg !420
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %184 = add i64 %181, %183, !dbg !421
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L305, !dbg !422

L305:                                             ; preds = %L282
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %185 = sub i64 %184, 1, !dbg !424
; │││││││└
         %186 = call fastcc double @jl_llvmcall16(i8 addrspace(1)* %39, i64 %185), !dbg !425
; ││││└└└
      br label %L309, !dbg !429

L309:                                             ; preds = %L305
; │││└
     br label %L310, !dbg !423

L310:                                             ; preds = %L309
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L311, !dbg !430

L311:                                             ; preds = %L310
; │└
   br label %L312, !dbg !397

L312:                                             ; preds = %L311
; └
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L331, !dbg !431

L331:                                             ; preds = %L312
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %187 = sub i64 %76, 1, !dbg !433
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %188 = mul i64 %187, 1, !dbg !440
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %189 = add i64 1, %188, !dbg !441
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %190 = sub i64 %82, 1, !dbg !442
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %191 = mul i64 %190, 33, !dbg !445
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %192 = add i64 %189, %191, !dbg !446
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L350, !dbg !447

L350:                                             ; preds = %L331
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %193 = sub i64 %192, 1, !dbg !449
; │││││││└
         call fastcc void @jl_llvmcall17(i8 addrspace(3)* %87, double %186, i64 %193), !dbg !450
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L354, !dbg !455

L354:                                             ; preds = %L350
; │││└
     br label %L355, !dbg !448

L355:                                             ; preds = %L354
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L356, !dbg !456

L356:                                             ; preds = %L355
; │└
   br label %L357, !dbg !432

L357:                                             ; preds = %L356
; └
  br label %L404, !dbg !394

L358:                                             ; preds = %L258
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L377, !dbg !457

L377:                                             ; preds = %L358
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %194 = sub i64 %76, 1, !dbg !460
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %195 = mul i64 %194, 1, !dbg !467
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %196 = add i64 1, %195, !dbg !468
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %197 = sub i64 %82, 1, !dbg !469
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %198 = mul i64 %197, 33, !dbg !472
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %199 = add i64 %196, %198, !dbg !473
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L396, !dbg !474

L396:                                             ; preds = %L377
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %200 = sub i64 %199, 1, !dbg !476
; │││││││└
         call fastcc void @jl_llvmcall21(i8 addrspace(3)* %87, double 0.000000e+00, i64 %200), !dbg !477
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L400, !dbg !482

L400:                                             ; preds = %L396
; │││└
     br label %L401, !dbg !475

L401:                                             ; preds = %L400
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L402, !dbg !483

L402:                                             ; preds = %L401
; │└
   br label %L403, !dbg !458

L403:                                             ; preds = %L402
   br label %L404, !dbg !458

L404:                                             ; preds = %L403, %L357
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:130 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !484
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:137 within `coalesced_matmul_kernel!'
  br label %L404.L406_crit_edge, !dbg !488

L404.L406_crit_edge:                              ; preds = %L404
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L406, !dbg !240

L406:                                             ; preds = %L404.L406_crit_edge, %L511
   %value_phi11 = phi double [ %value_phi6, %L404.L406_crit_edge ], [ %218, %L511 ]
   %value_phi12 = phi i64 [ 1, %L404.L406_crit_edge ], [ %value_phi14, %L511 ]
   %value_phi13 = phi i64 [ 1, %L404.L406_crit_edge ], [ %value_phi15, %L511 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L428, !dbg !489

L428:                                             ; preds = %L406
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %201 = sub i64 %76, 1, !dbg !492
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %202 = mul i64 %201, 1, !dbg !499
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %203 = add i64 1, %202, !dbg !500
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %204 = sub i64 %value_phi12, 1, !dbg !501
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %205 = mul i64 %204, 33, !dbg !504
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %206 = add i64 %203, %205, !dbg !505
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L447, !dbg !506

L447:                                             ; preds = %L428
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %207 = sub i64 %206, 1, !dbg !508
; │││││││└
         %208 = call fastcc double @jl_llvmcall18(i8 addrspace(3)* %84, i64 %207), !dbg !509
; ││││└└└
      br label %L451, !dbg !513

L451:                                             ; preds = %L447
; │││└
     br label %L452, !dbg !507

L452:                                             ; preds = %L451
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L453, !dbg !514

L453:                                             ; preds = %L452
; │└
   br label %L454, !dbg !490

L454:                                             ; preds = %L453
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L473, !dbg !489

L473:                                             ; preds = %L454
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %209 = sub i64 %value_phi12, 1, !dbg !492
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %210 = mul i64 %209, 1, !dbg !499
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %211 = add i64 1, %210, !dbg !500
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %212 = sub i64 %82, 1, !dbg !501
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %213 = mul i64 %212, 33, !dbg !504
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %214 = add i64 %211, %213, !dbg !505
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L492, !dbg !506

L492:                                             ; preds = %L473
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %215 = sub i64 %214, 1, !dbg !508
; │││││││└
         %216 = call fastcc double @jl_llvmcall19(i8 addrspace(3)* %87, i64 %215), !dbg !509
; ││││└└└
      br label %L496, !dbg !513

L496:                                             ; preds = %L492
; │││└
     br label %L497, !dbg !507

L497:                                             ; preds = %L496
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L498, !dbg !514

L498:                                             ; preds = %L497
; │└
   br label %L499, !dbg !490

L499:                                             ; preds = %L498
; └
; ┌ @ float.jl:405 within `*'
   %217 = fmul double %208, %216, !dbg !515
; └
; ┌ @ float.jl:401 within `+'
   %218 = fadd double %value_phi11, %217, !dbg !518
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %219 = icmp eq i64 %value_phi13, 32, !dbg !520
    %220 = zext i1 %219 to i8, !dbg !520
; │└
   %221 = trunc i8 %220 to i1, !dbg !522
   %222 = xor i1 %221, true, !dbg !522
   br i1 %222, label %L504, label %L503, !dbg !522

L503:                                             ; preds = %L499
   br label %L506, !dbg !522

L504:                                             ; preds = %L499
; │ @ range.jl:625 within `iterate'
; │┌ @ int.jl:86 within `+'
    %223 = add i64 %value_phi13, 1, !dbg !523
; │└
; │ @ range.jl:624 within `iterate'
   br label %L506, !dbg !522

L506:                                             ; preds = %L504, %L503
   %value_phi14 = phi i64 [ %223, %L504 ], [ undef, %L503 ]
   %value_phi15 = phi i64 [ %223, %L504 ], [ undef, %L503 ]
   %value_phi16 = phi i8 [ 1, %L503 ], [ 0, %L504 ]
; └
  %224 = xor i8 %value_phi16, 1, !dbg !491
  %225 = trunc i8 %224 to i1, !dbg !491
  %226 = xor i1 %225, true, !dbg !491
  br i1 %226, label %L506.L512_crit_edge, label %L511, !dbg !491

L506.L512_crit_edge:                              ; preds = %L506
; ┌ @ range.jl:624 within `iterate'
   br label %L512, !dbg !522

L511:                                             ; preds = %L506
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L406, !dbg !240

L512:                                             ; preds = %L506.L512_crit_edge
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !525
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %227 = icmp eq i64 %value_phi8, %276, !dbg !526
    %228 = zext i1 %227 to i8, !dbg !526
; │└
   %229 = trunc i8 %228 to i1, !dbg !244
   %230 = xor i1 %229, true, !dbg !244
   br i1 %230, label %L517, label %L516, !dbg !244

L516:                                             ; preds = %L512
   br label %L519, !dbg !244

L517:                                             ; preds = %L512
; │ @ range.jl:625 within `iterate'
; │┌ @ int.jl:86 within `+'
    %231 = add i64 %value_phi8, 1, !dbg !527
; │└
; │ @ range.jl:624 within `iterate'
   br label %L519, !dbg !244

L519:                                             ; preds = %L517, %L516
   %value_phi18 = phi i64 [ %231, %L517 ], [ undef, %L516 ]
   %value_phi19 = phi i64 [ %231, %L517 ], [ undef, %L516 ]
   %value_phi20 = phi i8 [ 1, %L516 ], [ 0, %L517 ]
; └
  %232 = xor i8 %value_phi20, 1, !dbg !245
  %233 = trunc i8 %232 to i1, !dbg !245
  %234 = xor i1 %233, true, !dbg !245
  br i1 %234, label %L519.L525_crit_edge, label %L524, !dbg !245

L519.L525_crit_edge:                              ; preds = %L519
; ┌ @ range.jl:624 within `iterate'
   br label %L525, !dbg !244

L524:                                             ; preds = %L519
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L81, !dbg !240

L525:                                             ; preds = %L76.L525_crit_edge, %L519.L525_crit_edge
   %value_phi21 = phi double [ %218, %L519.L525_crit_edge ], [ 0.000000e+00, %L76.L525_crit_edge ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %235 = sub i64 %66, 1, !dbg !529
; └
; ┌ @ int.jl:87 within `*'
   %236 = mul i64 %235, 32, !dbg !531
; └
; ┌ @ int.jl:86 within `+'
   %237 = add i64 %236, %76, !dbg !532
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:145 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %238 = sub i64 %72, 1, !dbg !533
; └
; ┌ @ int.jl:87 within `*'
   %239 = mul i64 %238, 32, !dbg !535
; └
; ┌ @ int.jl:86 within `+'
   %240 = add i64 %239, %82, !dbg !536
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %241 = sext i32 %3 to i64, !dbg !537
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %242 = icmp sle i64 %237, %241, !dbg !544
; └
  %243 = zext i1 %242 to i8, !dbg !543
  %244 = trunc i8 %243 to i1, !dbg !543
  %245 = xor i1 %244, true, !dbg !543
  br i1 %245, label %L540, label %L537, !dbg !543

L537:                                             ; preds = %L525
; ┌ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl:627 within `toInt64'
        %246 = sext i32 %5 to i64, !dbg !537
; │└└└└└
; │ @ promotion.jl:350 within `<=' @ int.jl:441
   %247 = icmp sle i64 %240, %246, !dbg !544
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:624 within `iterate'
   %248 = zext i1 %247 to i8, !dbg !244
   br label %L541, !dbg !244

L540:                                             ; preds = %L525
   br label %L541, !dbg !244

L541:                                             ; preds = %L540, %L537
   %value_phi22 = phi i8 [ %248, %L537 ], [ 0, %L540 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
  %249 = trunc i8 %value_phi22 to i1, !dbg !543
  %250 = xor i1 %249, true, !dbg !543
  br i1 %250, label %L593, label %L543, !dbg !543

L543:                                             ; preds = %L541
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:148 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L562, !dbg !545

L562:                                             ; preds = %L543
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %251 = icmp slt i64 %40, 0, !dbg !548
; ││││││││└
          %252 = zext i1 %251 to i8, !dbg !549
          %253 = trunc i8 %252 to i1, !dbg !549
          %254 = xor i1 %253, true, !dbg !549
          %255 = select i1 %254, i64 %40, i64 0, !dbg !549
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %256 = sub i64 %255, 0, !dbg !557
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %257 = mul i64 1, %256, !dbg !562
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %258 = sub i64 %237, 1, !dbg !563
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %259 = mul i64 %258, 1, !dbg !565
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %260 = add i64 1, %259, !dbg !566
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %261 = sub i64 %240, 1, !dbg !567
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %262 = mul i64 %261, %257, !dbg !570
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %263 = add i64 %260, %262, !dbg !571
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L585, !dbg !572

L585:                                             ; preds = %L562
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %264 = sub i64 %263, 1, !dbg !574
; │││││││└
         call fastcc void @jl_llvmcall20(i8 addrspace(1)* %37, double %value_phi21, i64 %264), !dbg !575
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L589, !dbg !580

L589:                                             ; preds = %L585
; │││└
     br label %L590, !dbg !573

L590:                                             ; preds = %L589
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L591, !dbg !581

L591:                                             ; preds = %L590
; │└
   br label %L592, !dbg !546

L592:                                             ; preds = %L591
   br label %L593, !dbg !546

L593:                                             ; preds = %L592, %L541
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:150 within `coalesced_matmul_kernel!'
  ret void, !dbg !582

pass:                                             ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:108 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:352 within `rem' @ int.jl:261
   br label %oksrem, !dbg !231

oksrem:                                           ; preds = %pass
   %265 = srem i64 %100, 32, !dbg !231
   br label %after_srem, !dbg !231

after_srem:                                       ; preds = %oksrem
; └
; ┌ @ promotion.jl:398 within `=='
   %266 = icmp eq i64 %265, 0, !dbg !583
   %267 = zext i1 %266 to i8, !dbg !583
; └
  %268 = trunc i8 %267 to i1, !dbg !230
  %269 = xor i1 %268, true, !dbg !230
  br i1 %269, label %L63, label %L62, !dbg !230

fail1:                                            ; preds = %L64
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:260 within `div'
   call fastcc void @gpu_report_exception(i64 ptrtoint ([10 x i8]* @exception5 to i64)), !dbg !238
   call fastcc void @gpu_signal_exception(), !dbg !238
   call void asm sideeffect "trap;", ""(), !dbg !238
   br label %pass2

pass2:                                            ; preds = %fail1, %L64
   %270 = sdiv i64 %102, 32, !dbg !238
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %271 = sub i64 %270, 1, !dbg !584
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:280 within `UnitRange'
; ││┌ @ range.jl:285 within `unitrange_last'
; │││┌ @ operators.jl:350 within `>='
; ││││┌ @ int.jl:441 within `<='
       %272 = icmp sle i64 0, %271, !dbg !585
; │││└└
     %273 = zext i1 %272 to i8, !dbg !588
     %274 = trunc i8 %273 to i1, !dbg !588
     %275 = xor i1 %274, true, !dbg !588
     %276 = select i1 %275, i64 -1, i64 %271, !dbg !588
; └└└
; ┌ @ range.jl:620 within `iterate'
; │┌ @ range.jl:503 within `isempty'
; ││┌ @ operators.jl:303 within `>'
; │││┌ @ int.jl:82 within `<'
      %277 = icmp slt i64 %276, 0, !dbg !594
; │└└└
   %278 = zext i1 %277 to i8, !dbg !240
   %279 = trunc i8 %278 to i1, !dbg !240
   %280 = xor i1 %279, true, !dbg !240
   br i1 %280, label %L75, label %L74, !dbg !240
; └
}

declare %jl_value_t*** @julia.ptls_states() local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #0

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall0() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !599
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall1() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !600
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall2() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.z(), !range !600
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.z() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall3() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !599
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall4() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !600
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall5() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.z(), !range !600
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall6() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !601
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall7() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !601
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall8() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.z(), !range !601
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.z() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall9() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !601
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall10() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !601
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall11() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.z(), !range !601
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i8 addrspace(3)* @jl_llvmcall12() unnamed_addr #1 {
entry:
  ret i8 addrspace(3)* bitcast ([1056 x double] addrspace(3)* @__static_shmem_285 to i8 addrspace(3)*)
}

; Function Attrs: alwaysinline
define internal fastcc i8 addrspace(3)* @jl_llvmcall13() unnamed_addr #1 {
entry:
  ret i8 addrspace(3)* bitcast ([1056 x double] addrspace(3)* @__static_shmem_286 to i8 addrspace(3)*)
}

; Function Attrs: alwaysinline
define internal fastcc double @jl_llvmcall14(i8 addrspace(1)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(1)* %0 to double addrspace(1)*
  %3 = getelementptr inbounds double, double addrspace(1)* %2, i64 %1
  %4 = load double, double addrspace(1)* %3, align 8, !tbaa !602
  ret double %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall15(i8 addrspace(3)*, double, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %4 = getelementptr inbounds double, double addrspace(3)* %3, i64 %2
  store double %1, double addrspace(3)* %4, align 8, !tbaa !605
  ret void
}

; Function Attrs: alwaysinline
define internal fastcc double @jl_llvmcall16(i8 addrspace(1)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(1)* %0 to double addrspace(1)*
  %3 = getelementptr inbounds double, double addrspace(1)* %2, i64 %1
  %4 = load double, double addrspace(1)* %3, align 8, !tbaa !602
  ret double %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall17(i8 addrspace(3)*, double, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %4 = getelementptr inbounds double, double addrspace(3)* %3, i64 %2
  store double %1, double addrspace(3)* %4, align 8, !tbaa !605
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: alwaysinline
define internal fastcc double @jl_llvmcall18(i8 addrspace(3)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %3 = getelementptr inbounds double, double addrspace(3)* %2, i64 %1
  %4 = load double, double addrspace(3)* %3, align 8, !tbaa !605
  ret double %4
}

; Function Attrs: alwaysinline
define internal fastcc double @jl_llvmcall19(i8 addrspace(3)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %3 = getelementptr inbounds double, double addrspace(3)* %2, i64 %1
  %4 = load double, double addrspace(3)* %3, align 8, !tbaa !605
  ret double %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall20(i8 addrspace(1)*, double, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(1)* %0 to double addrspace(1)*
  %4 = getelementptr inbounds double, double addrspace(1)* %3, i64 %2
  store double %1, double addrspace(1)* %4, align 8, !tbaa !602
  ret void
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall21(i8 addrspace(3)*, double, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %4 = getelementptr inbounds double, double addrspace(3)* %3, i64 %2
  store double %1, double addrspace(3)* %4, align 8, !tbaa !605
  ret void
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall22(i8 addrspace(3)*, double, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %4 = getelementptr inbounds double, double addrspace(3)* %3, i64 %2
  store double %1, double addrspace(3)* %4, align 8, !tbaa !605
  ret void
}

;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:39 within `report_exception'
define internal fastcc void @gpu_report_exception(i64) unnamed_addr !dbg !607 {
top:
  %1 = alloca %printf_args, align 8
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:40 within `report_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `_cuprintf'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
    %2 = bitcast %printf_args* %1 to i8*, !dbg !608
    call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2), !dbg !608
    %3 = getelementptr inbounds %printf_args, %printf_args* %1, i64 0, i32 0, !dbg !608
    store i64 %0, i64* %3, align 8, !dbg !608
    %4 = call i32 @vprintf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @0, i64 0, i64 0), i8* nonnull %2), !dbg !608
    call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2), !dbg !608
; └└
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:44 within `report_exception'
  ret void, !dbg !616
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #0

declare i32 @vprintf(i8*, i8*) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #0

;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:25 within `signal_exception'
define internal fastcc void @gpu_signal_exception() unnamed_addr !dbg !617 {
top:
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:26 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:23 within `exception_flag'
   %0 = call i64 @julia_exception_flag(), !dbg !618
; └
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:27 within `signal_exception'
  %1 = icmp eq i64 %0, 0, !dbg !621
  br i1 %1, label %L9, label %L5, !dbg !621

L5:                                               ; preds = %top
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:28 within `signal_exception'
; ┌ @ pointer.jl:118 within `unsafe_store!' @ pointer.jl:118
   %2 = inttoptr i64 %0 to i64*, !dbg !622
   store i64 1, i64* %2, align 1, !dbg !622, !tbaa !627
; └
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:29 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:115 within `threadfence_system'
   call void @llvm.nvvm.membar.sys(), !dbg !629
; └
  br label %L11, !dbg !631

L9:                                               ; preds = %top
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:31 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `_cuprintf'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
    %3 = call i32 @vprintf(i8* getelementptr inbounds ([110 x i8], [110 x i8]* @1, i64 0, i64 0), i8* null), !dbg !632
    br label %L11, !dbg !632

L11:                                              ; preds = %L9, %L5
; └└
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:36 within `signal_exception'
  ret void, !dbg !639
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
!42 = !{void (i64, i64, i64, i32, i32, i32)* @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_, !"kernel", i32 1}
!43 = distinct !DISubprogram(name: "coalesced_matmul_kernel!", linkageName: "julia_coalesced_matmul_kernel!_3147", scope: null, file: !3, line: 89, type: !44, scopeLine: 89, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !4)
!45 = !{!46, !46, i64 0, i64 1}
!46 = !{!"jtbaa_const", !47, i64 0}
!47 = !{!"jtbaa", !48, i64 0}
!48 = !{!"jtbaa"}
!49 = !DILocation(line: 414, scope: !50, inlinedAt: !52)
!50 = distinct !DISubprogram(name: "reinterpret;", linkageName: "reinterpret", scope: !51, file: !51, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!51 = !DIFile(filename: "essentials.jl", directory: ".")
!52 = !DILocation(line: 90, scope: !43)
!53 = !DILocation(line: 414, scope: !50, inlinedAt: !54)
!54 = !DILocation(line: 91, scope: !43)
!55 = !DILocation(line: 414, scope: !50, inlinedAt: !56)
!56 = !DILocation(line: 92, scope: !43)
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
!80 = !DILocation(line: 93, scope: !43)
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
!94 = !DILocation(line: 94, scope: !43)
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
!106 = !DILocation(line: 95, scope: !43)
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
!120 = !DILocation(line: 96, scope: !43)
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
!141 = !DILocation(line: 97, scope: !43)
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
!160 = !DILocation(line: 98, scope: !43)
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
!179 = !DILocation(line: 99, scope: !43)
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
!198 = !DILocation(line: 102, scope: !43)
!199 = !DILocation(line: 31, scope: !77, inlinedAt: !200)
!200 = !DILocation(line: 38, scope: !77, inlinedAt: !201)
!201 = !DILocation(line: 25, scope: !193, inlinedAt: !198)
!202 = !DILocation(line: 80, scope: !109, inlinedAt: !203)
!203 = !DILocation(line: 55, scope: !193, inlinedAt: !204)
!204 = !DILocation(line: 55, scope: !196, inlinedAt: !205)
!205 = !DILocation(line: 24, scope: !193, inlinedAt: !206)
!206 = !DILocation(line: 103, scope: !43)
!207 = !DILocation(line: 31, scope: !77, inlinedAt: !208)
!208 = !DILocation(line: 38, scope: !77, inlinedAt: !209)
!209 = !DILocation(line: 25, scope: !193, inlinedAt: !206)
!210 = !DILocation(line: 82, scope: !211, inlinedAt: !212)
!211 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!212 = !DILocation(line: 409, scope: !213, inlinedAt: !215)
!213 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !214, file: !214, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!214 = !DIFile(filename: "promotion.jl", directory: ".")
!215 = !DILocation(line: 538, scope: !216, inlinedAt: !218)
!216 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !217, file: !217, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!217 = !DIFile(filename: "operators.jl", directory: ".")
!218 = !DILocation(line: 107, scope: !43)
!219 = !DILocation(line: 627, scope: !58, inlinedAt: !220)
!220 = !DILocation(line: 708, scope: !61, inlinedAt: !221)
!221 = !DILocation(line: 7, scope: !222, inlinedAt: !224)
!222 = distinct !DISubprogram(name: "convert;", linkageName: "convert", scope: !223, file: !223, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!223 = !DIFile(filename: "number.jl", directory: ".")
!224 = !DILocation(line: 259, scope: !225, inlinedAt: !226)
!225 = distinct !DISubprogram(name: "_promote;", linkageName: "_promote", scope: !214, file: !214, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!226 = !DILocation(line: 282, scope: !227, inlinedAt: !228)
!227 = distinct !DISubprogram(name: "promote;", linkageName: "promote", scope: !214, file: !214, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!228 = !DILocation(line: 352, scope: !229, inlinedAt: !230)
!229 = distinct !DISubprogram(name: "rem;", linkageName: "rem", scope: !214, file: !214, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!230 = !DILocation(line: 108, scope: !43)
!231 = !DILocation(line: 261, scope: !232, inlinedAt: !228)
!232 = distinct !DISubprogram(name: "rem;", linkageName: "rem", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!233 = !DILocation(line: 476, scope: !232, inlinedAt: !234)
!234 = !DILocation(line: 920, scope: !124, inlinedAt: !235)
!235 = !DILocation(line: 109, scope: !43)
!236 = !DILocation(line: 86, scope: !124, inlinedAt: !237)
!237 = !DILocation(line: 922, scope: !124, inlinedAt: !235)
!238 = !DILocation(line: 260, scope: !239, inlinedAt: !235)
!239 = distinct !DISubprogram(name: "div;", linkageName: "div", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!240 = !DILocation(line: 620, scope: !241, inlinedAt: !243)
!241 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!242 = !DIFile(filename: "range.jl", directory: ".")
!243 = !DILocation(line: 112, scope: !43)
!244 = !DILocation(line: 624, scope: !241, inlinedAt: !245)
!245 = !DILocation(line: 141, scope: !43)
!246 = !DILocation(line: 85, scope: !247, inlinedAt: !248)
!247 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!248 = !DILocation(line: 114, scope: !43)
!249 = !DILocation(line: 87, scope: !250, inlinedAt: !248)
!250 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!251 = !DILocation(line: 86, scope: !124, inlinedAt: !248)
!252 = !DILocation(line: 85, scope: !247, inlinedAt: !253)
!253 = !DILocation(line: 115, scope: !43)
!254 = !DILocation(line: 87, scope: !250, inlinedAt: !253)
!255 = !DILocation(line: 86, scope: !124, inlinedAt: !253)
!256 = !DILocation(line: 627, scope: !58, inlinedAt: !257)
!257 = !DILocation(line: 708, scope: !61, inlinedAt: !258)
!258 = !DILocation(line: 7, scope: !222, inlinedAt: !259)
!259 = !DILocation(line: 259, scope: !225, inlinedAt: !260)
!260 = !DILocation(line: 282, scope: !227, inlinedAt: !261)
!261 = !DILocation(line: 350, scope: !262, inlinedAt: !263)
!262 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !214, file: !214, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!263 = !DILocation(line: 118, scope: !43)
!264 = !DILocation(line: 441, scope: !265, inlinedAt: !261)
!265 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!266 = !DILocation(line: 87, scope: !250, inlinedAt: !263)
!267 = !DILocation(line: 86, scope: !124, inlinedAt: !263)
!268 = !DILocation(line: 87, scope: !250, inlinedAt: !269)
!269 = !DILocation(line: 119, scope: !43)
!270 = !DILocation(line: 86, scope: !124, inlinedAt: !269)
!271 = !DILocation(line: 1082, scope: !272, inlinedAt: !273)
!272 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!273 = !DILocation(line: 1060, scope: !274, inlinedAt: !269)
!274 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!275 = !DILocation(line: 82, scope: !211, inlinedAt: !276)
!276 = !DILocation(line: 409, scope: !213, inlinedAt: !277)
!277 = !DILocation(line: 317, scope: !278, inlinedAt: !279)
!278 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!279 = !DILocation(line: 326, scope: !278, inlinedAt: !280)
!280 = !DILocation(line: 158, scope: !281, inlinedAt: !283)
!281 = distinct !DISubprogram(name: "map;", linkageName: "map", scope: !282, file: !282, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!282 = !DIFile(filename: "tuple.jl", directory: ".")
!283 = !DILocation(line: 75, scope: !284, inlinedAt: !285)
!284 = distinct !DISubprogram(name: "axes;", linkageName: "axes", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!285 = !DILocation(line: 1879, scope: !286, inlinedAt: !287)
!286 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!287 = !DILocation(line: 1089, scope: !288, inlinedAt: !289)
!288 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!289 = !DILocation(line: 1083, scope: !272, inlinedAt: !273)
!290 = !DILocation(line: 85, scope: !247, inlinedAt: !291)
!291 = !DILocation(line: 544, scope: !292, inlinedAt: !293)
!292 = distinct !DISubprogram(name: "unsafe_length;", linkageName: "unsafe_length", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!293 = !DILocation(line: 1915, scope: !294, inlinedAt: !295)
!294 = distinct !DISubprogram(name: "nextL;", linkageName: "nextL", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!295 = !DILocation(line: 1911, scope: !296, inlinedAt: !297)
!296 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!297 = !DILocation(line: 1895, scope: !286, inlinedAt: !285)
!298 = !DILocation(line: 87, scope: !250, inlinedAt: !293)
!299 = !DILocation(line: 85, scope: !247, inlinedAt: !300)
!300 = !DILocation(line: 1918, scope: !301, inlinedAt: !295)
!301 = distinct !DISubprogram(name: "offsetin;", linkageName: "offsetin", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!302 = !DILocation(line: 87, scope: !250, inlinedAt: !295)
!303 = !DILocation(line: 86, scope: !124, inlinedAt: !295)
!304 = !DILocation(line: 85, scope: !247, inlinedAt: !305)
!305 = !DILocation(line: 1918, scope: !301, inlinedAt: !306)
!306 = !DILocation(line: 1911, scope: !296, inlinedAt: !295)
!307 = !DILocation(line: 87, scope: !250, inlinedAt: !306)
!308 = !DILocation(line: 86, scope: !124, inlinedAt: !306)
!309 = !DILocation(line: 78, scope: !310, inlinedAt: !311)
!310 = distinct !DISubprogram(name: "arrayref;", linkageName: "arrayref", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!311 = !DILocation(line: 99, scope: !312, inlinedAt: !289)
!312 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!313 = !DILocation(line: 85, scope: !247, inlinedAt: !314)
!314 = !DILocation(line: 80, scope: !109, inlinedAt: !315)
!315 = !DILocation(line: 7, scope: !316, inlinedAt: !318)
!316 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !317, file: !317, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!317 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl", directory: ".")
!318 = !DILocation(line: 7, scope: !319, inlinedAt: !320)
!319 = distinct !DISubprogram(name: "pointerref;", linkageName: "pointerref", scope: !317, file: !317, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!320 = !DILocation(line: 79, scope: !321, inlinedAt: !322)
!321 = distinct !DISubprogram(name: "unsafe_load;", linkageName: "unsafe_load", scope: !317, file: !317, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!322 = !DILocation(line: 80, scope: !310, inlinedAt: !311)
!323 = !DILocation(line: 1084, scope: !272, inlinedAt: !273)
!324 = !DILocation(line: 1175, scope: !325, inlinedAt: !326)
!325 = distinct !DISubprogram(name: "_setindex!;", linkageName: "_setindex!", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!326 = !DILocation(line: 1153, scope: !327, inlinedAt: !269)
!327 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!328 = !DILocation(line: 85, scope: !247, inlinedAt: !329)
!329 = !DILocation(line: 1918, scope: !301, inlinedAt: !330)
!330 = !DILocation(line: 1911, scope: !296, inlinedAt: !331)
!331 = !DILocation(line: 1895, scope: !286, inlinedAt: !332)
!332 = !DILocation(line: 1879, scope: !286, inlinedAt: !333)
!333 = !DILocation(line: 1089, scope: !288, inlinedAt: !334)
!334 = !DILocation(line: 1176, scope: !325, inlinedAt: !326)
!335 = !DILocation(line: 87, scope: !250, inlinedAt: !330)
!336 = !DILocation(line: 86, scope: !124, inlinedAt: !330)
!337 = !DILocation(line: 85, scope: !247, inlinedAt: !338)
!338 = !DILocation(line: 1918, scope: !301, inlinedAt: !339)
!339 = !DILocation(line: 1911, scope: !296, inlinedAt: !330)
!340 = !DILocation(line: 87, scope: !250, inlinedAt: !339)
!341 = !DILocation(line: 86, scope: !124, inlinedAt: !339)
!342 = !DILocation(line: 84, scope: !343, inlinedAt: !344)
!343 = distinct !DISubprogram(name: "arrayset;", linkageName: "arrayset", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!344 = !DILocation(line: 101, scope: !345, inlinedAt: !334)
!345 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!346 = !DILocation(line: 85, scope: !247, inlinedAt: !347)
!347 = !DILocation(line: 80, scope: !109, inlinedAt: !348)
!348 = !DILocation(line: 42, scope: !316, inlinedAt: !349)
!349 = !DILocation(line: 42, scope: !350, inlinedAt: !351)
!350 = distinct !DISubprogram(name: "pointerset;", linkageName: "pointerset", scope: !317, file: !317, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!351 = !DILocation(line: 82, scope: !352, inlinedAt: !353)
!352 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !317, file: !317, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!353 = !DILocation(line: 86, scope: !343, inlinedAt: !344)
!354 = !DILocation(line: 87, scope: !343, inlinedAt: !344)
!355 = !DILocation(line: 1177, scope: !325, inlinedAt: !326)
!356 = !DILocation(line: 1175, scope: !325, inlinedAt: !357)
!357 = !DILocation(line: 1153, scope: !327, inlinedAt: !358)
!358 = !DILocation(line: 121, scope: !43)
!359 = !DILocation(line: 85, scope: !247, inlinedAt: !360)
!360 = !DILocation(line: 1918, scope: !301, inlinedAt: !361)
!361 = !DILocation(line: 1911, scope: !296, inlinedAt: !362)
!362 = !DILocation(line: 1895, scope: !286, inlinedAt: !363)
!363 = !DILocation(line: 1879, scope: !286, inlinedAt: !364)
!364 = !DILocation(line: 1089, scope: !288, inlinedAt: !365)
!365 = !DILocation(line: 1176, scope: !325, inlinedAt: !357)
!366 = !DILocation(line: 87, scope: !250, inlinedAt: !361)
!367 = !DILocation(line: 86, scope: !124, inlinedAt: !361)
!368 = !DILocation(line: 85, scope: !247, inlinedAt: !369)
!369 = !DILocation(line: 1918, scope: !301, inlinedAt: !370)
!370 = !DILocation(line: 1911, scope: !296, inlinedAt: !361)
!371 = !DILocation(line: 87, scope: !250, inlinedAt: !370)
!372 = !DILocation(line: 86, scope: !124, inlinedAt: !370)
!373 = !DILocation(line: 84, scope: !343, inlinedAt: !374)
!374 = !DILocation(line: 101, scope: !345, inlinedAt: !365)
!375 = !DILocation(line: 85, scope: !247, inlinedAt: !376)
!376 = !DILocation(line: 80, scope: !109, inlinedAt: !377)
!377 = !DILocation(line: 42, scope: !316, inlinedAt: !378)
!378 = !DILocation(line: 42, scope: !350, inlinedAt: !379)
!379 = !DILocation(line: 82, scope: !352, inlinedAt: !380)
!380 = !DILocation(line: 86, scope: !343, inlinedAt: !374)
!381 = !DILocation(line: 87, scope: !343, inlinedAt: !374)
!382 = !DILocation(line: 1177, scope: !325, inlinedAt: !357)
!383 = !DILocation(line: 87, scope: !250, inlinedAt: !384)
!384 = !DILocation(line: 123, scope: !43)
!385 = !DILocation(line: 86, scope: !124, inlinedAt: !384)
!386 = !DILocation(line: 627, scope: !58, inlinedAt: !387)
!387 = !DILocation(line: 708, scope: !61, inlinedAt: !388)
!388 = !DILocation(line: 7, scope: !222, inlinedAt: !389)
!389 = !DILocation(line: 259, scope: !225, inlinedAt: !390)
!390 = !DILocation(line: 282, scope: !227, inlinedAt: !391)
!391 = !DILocation(line: 350, scope: !262, inlinedAt: !384)
!392 = !DILocation(line: 441, scope: !265, inlinedAt: !391)
!393 = !DILocation(line: 87, scope: !250, inlinedAt: !394)
!394 = !DILocation(line: 124, scope: !43)
!395 = !DILocation(line: 86, scope: !124, inlinedAt: !394)
!396 = !DILocation(line: 1082, scope: !272, inlinedAt: !397)
!397 = !DILocation(line: 1060, scope: !274, inlinedAt: !394)
!398 = !DILocation(line: 82, scope: !211, inlinedAt: !399)
!399 = !DILocation(line: 409, scope: !213, inlinedAt: !400)
!400 = !DILocation(line: 317, scope: !278, inlinedAt: !401)
!401 = !DILocation(line: 326, scope: !278, inlinedAt: !402)
!402 = !DILocation(line: 158, scope: !281, inlinedAt: !403)
!403 = !DILocation(line: 75, scope: !284, inlinedAt: !404)
!404 = !DILocation(line: 1879, scope: !286, inlinedAt: !405)
!405 = !DILocation(line: 1089, scope: !288, inlinedAt: !406)
!406 = !DILocation(line: 1083, scope: !272, inlinedAt: !397)
!407 = !DILocation(line: 85, scope: !247, inlinedAt: !408)
!408 = !DILocation(line: 544, scope: !292, inlinedAt: !409)
!409 = !DILocation(line: 1915, scope: !294, inlinedAt: !410)
!410 = !DILocation(line: 1911, scope: !296, inlinedAt: !411)
!411 = !DILocation(line: 1895, scope: !286, inlinedAt: !404)
!412 = !DILocation(line: 87, scope: !250, inlinedAt: !409)
!413 = !DILocation(line: 85, scope: !247, inlinedAt: !414)
!414 = !DILocation(line: 1918, scope: !301, inlinedAt: !410)
!415 = !DILocation(line: 87, scope: !250, inlinedAt: !410)
!416 = !DILocation(line: 86, scope: !124, inlinedAt: !410)
!417 = !DILocation(line: 85, scope: !247, inlinedAt: !418)
!418 = !DILocation(line: 1918, scope: !301, inlinedAt: !419)
!419 = !DILocation(line: 1911, scope: !296, inlinedAt: !410)
!420 = !DILocation(line: 87, scope: !250, inlinedAt: !419)
!421 = !DILocation(line: 86, scope: !124, inlinedAt: !419)
!422 = !DILocation(line: 78, scope: !310, inlinedAt: !423)
!423 = !DILocation(line: 99, scope: !312, inlinedAt: !406)
!424 = !DILocation(line: 85, scope: !247, inlinedAt: !425)
!425 = !DILocation(line: 80, scope: !109, inlinedAt: !426)
!426 = !DILocation(line: 7, scope: !316, inlinedAt: !427)
!427 = !DILocation(line: 7, scope: !319, inlinedAt: !428)
!428 = !DILocation(line: 79, scope: !321, inlinedAt: !429)
!429 = !DILocation(line: 80, scope: !310, inlinedAt: !423)
!430 = !DILocation(line: 1084, scope: !272, inlinedAt: !397)
!431 = !DILocation(line: 1175, scope: !325, inlinedAt: !432)
!432 = !DILocation(line: 1153, scope: !327, inlinedAt: !394)
!433 = !DILocation(line: 85, scope: !247, inlinedAt: !434)
!434 = !DILocation(line: 1918, scope: !301, inlinedAt: !435)
!435 = !DILocation(line: 1911, scope: !296, inlinedAt: !436)
!436 = !DILocation(line: 1895, scope: !286, inlinedAt: !437)
!437 = !DILocation(line: 1879, scope: !286, inlinedAt: !438)
!438 = !DILocation(line: 1089, scope: !288, inlinedAt: !439)
!439 = !DILocation(line: 1176, scope: !325, inlinedAt: !432)
!440 = !DILocation(line: 87, scope: !250, inlinedAt: !435)
!441 = !DILocation(line: 86, scope: !124, inlinedAt: !435)
!442 = !DILocation(line: 85, scope: !247, inlinedAt: !443)
!443 = !DILocation(line: 1918, scope: !301, inlinedAt: !444)
!444 = !DILocation(line: 1911, scope: !296, inlinedAt: !435)
!445 = !DILocation(line: 87, scope: !250, inlinedAt: !444)
!446 = !DILocation(line: 86, scope: !124, inlinedAt: !444)
!447 = !DILocation(line: 84, scope: !343, inlinedAt: !448)
!448 = !DILocation(line: 101, scope: !345, inlinedAt: !439)
!449 = !DILocation(line: 85, scope: !247, inlinedAt: !450)
!450 = !DILocation(line: 80, scope: !109, inlinedAt: !451)
!451 = !DILocation(line: 42, scope: !316, inlinedAt: !452)
!452 = !DILocation(line: 42, scope: !350, inlinedAt: !453)
!453 = !DILocation(line: 82, scope: !352, inlinedAt: !454)
!454 = !DILocation(line: 86, scope: !343, inlinedAt: !448)
!455 = !DILocation(line: 87, scope: !343, inlinedAt: !448)
!456 = !DILocation(line: 1177, scope: !325, inlinedAt: !432)
!457 = !DILocation(line: 1175, scope: !325, inlinedAt: !458)
!458 = !DILocation(line: 1153, scope: !327, inlinedAt: !459)
!459 = !DILocation(line: 126, scope: !43)
!460 = !DILocation(line: 85, scope: !247, inlinedAt: !461)
!461 = !DILocation(line: 1918, scope: !301, inlinedAt: !462)
!462 = !DILocation(line: 1911, scope: !296, inlinedAt: !463)
!463 = !DILocation(line: 1895, scope: !286, inlinedAt: !464)
!464 = !DILocation(line: 1879, scope: !286, inlinedAt: !465)
!465 = !DILocation(line: 1089, scope: !288, inlinedAt: !466)
!466 = !DILocation(line: 1176, scope: !325, inlinedAt: !458)
!467 = !DILocation(line: 87, scope: !250, inlinedAt: !462)
!468 = !DILocation(line: 86, scope: !124, inlinedAt: !462)
!469 = !DILocation(line: 85, scope: !247, inlinedAt: !470)
!470 = !DILocation(line: 1918, scope: !301, inlinedAt: !471)
!471 = !DILocation(line: 1911, scope: !296, inlinedAt: !462)
!472 = !DILocation(line: 87, scope: !250, inlinedAt: !471)
!473 = !DILocation(line: 86, scope: !124, inlinedAt: !471)
!474 = !DILocation(line: 84, scope: !343, inlinedAt: !475)
!475 = !DILocation(line: 101, scope: !345, inlinedAt: !466)
!476 = !DILocation(line: 85, scope: !247, inlinedAt: !477)
!477 = !DILocation(line: 80, scope: !109, inlinedAt: !478)
!478 = !DILocation(line: 42, scope: !316, inlinedAt: !479)
!479 = !DILocation(line: 42, scope: !350, inlinedAt: !480)
!480 = !DILocation(line: 82, scope: !352, inlinedAt: !481)
!481 = !DILocation(line: 86, scope: !343, inlinedAt: !475)
!482 = !DILocation(line: 87, scope: !343, inlinedAt: !475)
!483 = !DILocation(line: 1177, scope: !325, inlinedAt: !458)
!484 = !DILocation(line: 14, scope: !485, inlinedAt: !487)
!485 = distinct !DISubprogram(name: "sync_threads;", linkageName: "sync_threads", scope: !486, file: !486, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!486 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl", directory: ".")
!487 = !DILocation(line: 130, scope: !43)
!488 = !DILocation(line: 137, scope: !43)
!489 = !DILocation(line: 1082, scope: !272, inlinedAt: !490)
!490 = !DILocation(line: 1060, scope: !274, inlinedAt: !491)
!491 = !DILocation(line: 138, scope: !43)
!492 = !DILocation(line: 85, scope: !247, inlinedAt: !493)
!493 = !DILocation(line: 1918, scope: !301, inlinedAt: !494)
!494 = !DILocation(line: 1911, scope: !296, inlinedAt: !495)
!495 = !DILocation(line: 1895, scope: !286, inlinedAt: !496)
!496 = !DILocation(line: 1879, scope: !286, inlinedAt: !497)
!497 = !DILocation(line: 1089, scope: !288, inlinedAt: !498)
!498 = !DILocation(line: 1083, scope: !272, inlinedAt: !490)
!499 = !DILocation(line: 87, scope: !250, inlinedAt: !494)
!500 = !DILocation(line: 86, scope: !124, inlinedAt: !494)
!501 = !DILocation(line: 85, scope: !247, inlinedAt: !502)
!502 = !DILocation(line: 1918, scope: !301, inlinedAt: !503)
!503 = !DILocation(line: 1911, scope: !296, inlinedAt: !494)
!504 = !DILocation(line: 87, scope: !250, inlinedAt: !503)
!505 = !DILocation(line: 86, scope: !124, inlinedAt: !503)
!506 = !DILocation(line: 78, scope: !310, inlinedAt: !507)
!507 = !DILocation(line: 99, scope: !312, inlinedAt: !498)
!508 = !DILocation(line: 85, scope: !247, inlinedAt: !509)
!509 = !DILocation(line: 80, scope: !109, inlinedAt: !510)
!510 = !DILocation(line: 7, scope: !316, inlinedAt: !511)
!511 = !DILocation(line: 7, scope: !319, inlinedAt: !512)
!512 = !DILocation(line: 79, scope: !321, inlinedAt: !513)
!513 = !DILocation(line: 80, scope: !310, inlinedAt: !507)
!514 = !DILocation(line: 1084, scope: !272, inlinedAt: !490)
!515 = !DILocation(line: 405, scope: !516, inlinedAt: !491)
!516 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !517, file: !517, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!517 = !DIFile(filename: "float.jl", directory: ".")
!518 = !DILocation(line: 401, scope: !519, inlinedAt: !491)
!519 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !517, file: !517, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!520 = !DILocation(line: 398, scope: !521, inlinedAt: !522)
!521 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !214, file: !214, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!522 = !DILocation(line: 624, scope: !241, inlinedAt: !491)
!523 = !DILocation(line: 86, scope: !124, inlinedAt: !524)
!524 = !DILocation(line: 625, scope: !241, inlinedAt: !491)
!525 = !DILocation(line: 14, scope: !485, inlinedAt: !245)
!526 = !DILocation(line: 398, scope: !521, inlinedAt: !244)
!527 = !DILocation(line: 86, scope: !124, inlinedAt: !528)
!528 = !DILocation(line: 625, scope: !241, inlinedAt: !245)
!529 = !DILocation(line: 85, scope: !247, inlinedAt: !530)
!530 = !DILocation(line: 144, scope: !43)
!531 = !DILocation(line: 87, scope: !250, inlinedAt: !530)
!532 = !DILocation(line: 86, scope: !124, inlinedAt: !530)
!533 = !DILocation(line: 85, scope: !247, inlinedAt: !534)
!534 = !DILocation(line: 145, scope: !43)
!535 = !DILocation(line: 87, scope: !250, inlinedAt: !534)
!536 = !DILocation(line: 86, scope: !124, inlinedAt: !534)
!537 = !DILocation(line: 627, scope: !58, inlinedAt: !538)
!538 = !DILocation(line: 708, scope: !61, inlinedAt: !539)
!539 = !DILocation(line: 7, scope: !222, inlinedAt: !540)
!540 = !DILocation(line: 259, scope: !225, inlinedAt: !541)
!541 = !DILocation(line: 282, scope: !227, inlinedAt: !542)
!542 = !DILocation(line: 350, scope: !262, inlinedAt: !543)
!543 = !DILocation(line: 147, scope: !43)
!544 = !DILocation(line: 441, scope: !265, inlinedAt: !542)
!545 = !DILocation(line: 1175, scope: !325, inlinedAt: !546)
!546 = !DILocation(line: 1153, scope: !327, inlinedAt: !547)
!547 = !DILocation(line: 148, scope: !43)
!548 = !DILocation(line: 82, scope: !211, inlinedAt: !549)
!549 = !DILocation(line: 409, scope: !213, inlinedAt: !550)
!550 = !DILocation(line: 317, scope: !278, inlinedAt: !551)
!551 = !DILocation(line: 326, scope: !278, inlinedAt: !552)
!552 = !DILocation(line: 158, scope: !281, inlinedAt: !553)
!553 = !DILocation(line: 75, scope: !284, inlinedAt: !554)
!554 = !DILocation(line: 1879, scope: !286, inlinedAt: !555)
!555 = !DILocation(line: 1089, scope: !288, inlinedAt: !556)
!556 = !DILocation(line: 1176, scope: !325, inlinedAt: !546)
!557 = !DILocation(line: 85, scope: !247, inlinedAt: !558)
!558 = !DILocation(line: 544, scope: !292, inlinedAt: !559)
!559 = !DILocation(line: 1915, scope: !294, inlinedAt: !560)
!560 = !DILocation(line: 1911, scope: !296, inlinedAt: !561)
!561 = !DILocation(line: 1895, scope: !286, inlinedAt: !554)
!562 = !DILocation(line: 87, scope: !250, inlinedAt: !559)
!563 = !DILocation(line: 85, scope: !247, inlinedAt: !564)
!564 = !DILocation(line: 1918, scope: !301, inlinedAt: !560)
!565 = !DILocation(line: 87, scope: !250, inlinedAt: !560)
!566 = !DILocation(line: 86, scope: !124, inlinedAt: !560)
!567 = !DILocation(line: 85, scope: !247, inlinedAt: !568)
!568 = !DILocation(line: 1918, scope: !301, inlinedAt: !569)
!569 = !DILocation(line: 1911, scope: !296, inlinedAt: !560)
!570 = !DILocation(line: 87, scope: !250, inlinedAt: !569)
!571 = !DILocation(line: 86, scope: !124, inlinedAt: !569)
!572 = !DILocation(line: 84, scope: !343, inlinedAt: !573)
!573 = !DILocation(line: 101, scope: !345, inlinedAt: !556)
!574 = !DILocation(line: 85, scope: !247, inlinedAt: !575)
!575 = !DILocation(line: 80, scope: !109, inlinedAt: !576)
!576 = !DILocation(line: 42, scope: !316, inlinedAt: !577)
!577 = !DILocation(line: 42, scope: !350, inlinedAt: !578)
!578 = !DILocation(line: 82, scope: !352, inlinedAt: !579)
!579 = !DILocation(line: 86, scope: !343, inlinedAt: !573)
!580 = !DILocation(line: 87, scope: !343, inlinedAt: !573)
!581 = !DILocation(line: 1177, scope: !325, inlinedAt: !546)
!582 = !DILocation(line: 150, scope: !43)
!583 = !DILocation(line: 398, scope: !521, inlinedAt: !230)
!584 = !DILocation(line: 85, scope: !247, inlinedAt: !243)
!585 = !DILocation(line: 441, scope: !265, inlinedAt: !586)
!586 = !DILocation(line: 350, scope: !587, inlinedAt: !588)
!587 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !217, file: !217, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!588 = !DILocation(line: 285, scope: !589, inlinedAt: !590)
!589 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!590 = !DILocation(line: 280, scope: !591, inlinedAt: !592)
!591 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!592 = !DILocation(line: 5, scope: !593, inlinedAt: !243)
!593 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!594 = !DILocation(line: 82, scope: !211, inlinedAt: !595)
!595 = !DILocation(line: 303, scope: !596, inlinedAt: !597)
!596 = distinct !DISubprogram(name: ">;", linkageName: ">", scope: !217, file: !217, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!597 = !DILocation(line: 503, scope: !598, inlinedAt: !240)
!598 = distinct !DISubprogram(name: "isempty;", linkageName: "isempty", scope: !242, file: !242, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!599 = !{i32 0, i32 2147483646}
!600 = !{i32 0, i32 65534}
!601 = !{i32 0, i32 1023}
!602 = !{!603, !603, i64 0, i64 0}
!603 = !{!"custom_tbaa_addrspace(1)", !604, i64 0}
!604 = !{!"custom_tbaa"}
!605 = !{!606, !606, i64 0, i64 0}
!606 = !{!"custom_tbaa_addrspace(3)", !604, i64 0}
!607 = distinct !DISubprogram(name: "report_exception", linkageName: "julia_report_exception_3593", scope: null, file: !15, line: 39, type: !44, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!608 = !DILocation(line: 80, scope: !609, inlinedAt: !610)
!609 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !110, file: !110, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!610 = !DILocation(line: 38, scope: !611, inlinedAt: !613)
!611 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !612, file: !612, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!612 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl", directory: ".")
!613 = !DILocation(line: 38, scope: !614, inlinedAt: !615)
!614 = distinct !DISubprogram(name: "_cuprintf;", linkageName: "_cuprintf", scope: !612, file: !612, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!615 = !DILocation(line: 40, scope: !607)
!616 = !DILocation(line: 44, scope: !607)
!617 = distinct !DISubprogram(name: "signal_exception", linkageName: "julia_signal_exception_3667", scope: null, file: !15, line: 25, type: !44, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!618 = !DILocation(line: 23, scope: !619, inlinedAt: !620)
!619 = distinct !DISubprogram(name: "exception_flag;", linkageName: "exception_flag", scope: !15, file: !15, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!620 = !DILocation(line: 26, scope: !617)
!621 = !DILocation(line: 27, scope: !617)
!622 = !DILocation(line: 118, scope: !623, inlinedAt: !625)
!623 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !624, file: !624, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!624 = !DIFile(filename: "pointer.jl", directory: ".")
!625 = !DILocation(line: 118, scope: !623, inlinedAt: !626)
!626 = !DILocation(line: 28, scope: !617)
!627 = !{!628, !628, i64 0}
!628 = !{!"jtbaa_data", !47, i64 0}
!629 = !DILocation(line: 115, scope: !630, inlinedAt: !631)
!630 = distinct !DISubprogram(name: "threadfence_system;", linkageName: "threadfence_system", scope: !486, file: !486, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!631 = !DILocation(line: 29, scope: !617)
!632 = !DILocation(line: 80, scope: !633, inlinedAt: !634)
!633 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !110, file: !110, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!634 = !DILocation(line: 38, scope: !635, inlinedAt: !636)
!635 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !612, file: !612, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!636 = !DILocation(line: 38, scope: !637, inlinedAt: !638)
!637 = distinct !DISubprogram(name: "_cuprintf;", linkageName: "_cuprintf", scope: !612, file: !612, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!638 = !DILocation(line: 31, scope: !617)
!639 = !DILocation(line: 36, scope: !617)
