; ModuleID = 'julia'
source_filename = "julia"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%jl_value_t = type opaque
%printf_args = type { i64 }

@__static_shmem_285 = internal addrspace(3) global [1056 x double] zeroinitializer, align 32
@__static_shmem_286 = internal addrspace(3) global [1056 x double] zeroinitializer, align 32
@exception4 = private unnamed_addr constant [10 x i8] c"exception\00", align 1
@0 = internal unnamed_addr constant [108 x i8] c"ERROR: a %s was thrown during kernel execution.\0A       Run Julia on debug level 2 for device stack traces.\0A\00", align 1
@1 = internal unnamed_addr constant [110 x i8] c"WARNING: could not signal exception status to the host, execution will continue.\0A         Please file a bug.\0A\00", align 1

;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:77 within `coalesced_matmul_kernel!'
define dso_local ptx_kernel void @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32(i64, i64, i64, i32) local_unnamed_addr !dbg !43 {
top:
  %4 = alloca [2 x i64]
  %5 = alloca { [2 x i64], i8 addrspace(1)* }
  %6 = alloca [2 x i64]
  %7 = alloca { [2 x i64], i8 addrspace(1)* }
  %8 = alloca [2 x i64]
  %9 = alloca { [2 x i64], i8 addrspace(1)* }
  %10 = alloca { [2 x i64], i8 addrspace(3)* }
  %11 = alloca { [2 x i64], i8 addrspace(3)* }
  %12 = alloca [2 x i64]
  %13 = alloca [1 x i64]
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
  %26 = call %jl_value_t*** @julia.ptls_states()
  %27 = bitcast %jl_value_t*** %26 to %jl_value_t addrspace(10)**
  %28 = getelementptr inbounds %jl_value_t addrspace(10)*, %jl_value_t addrspace(10)** %27, i64 4
  %29 = bitcast %jl_value_t addrspace(10)** %28 to i64**
  %30 = load i64*, i64** %29, !tbaa !45, !invariant.load !4
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:78 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %31 = inttoptr i64 %0 to i8 addrspace(1)*, !dbg !49
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:79 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %32 = inttoptr i64 %1 to i8 addrspace(1)*, !dbg !53
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:80 within `coalesced_matmul_kernel!'
; ┌ @ essentials.jl:414 within `reinterpret'
   %33 = inttoptr i64 %2 to i8 addrspace(1)*, !dbg !55
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:81 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
; │┌ @ broadcast.jl:837 within `materialize'
; ││┌ @ broadcast.jl:1046 within `copy'
; │││┌ @ ntuple.jl:42 within `ntuple'
; ││││┌ @ broadcast.jl:1046 within `#19'
; │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
; ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
; │││││││┌ @ boot.jl:708 within `Int64'
; ││││││││┌ @ boot.jl:627 within `toInt64'
           %34 = sext i32 %3 to i64, !dbg !57
           %35 = sext i32 %3 to i64, !dbg !57
; ││││└└└└└
      %36 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i32 0, i32 0, !dbg !69
      store i64 %34, i64* %36, align 8, !dbg !69, !tbaa !81
      %37 = getelementptr inbounds [2 x i64], [2 x i64]* %4, i32 0, i32 1, !dbg !69
      store i64 %35, i64* %37, align 8, !dbg !69, !tbaa !81
; │└└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
   %38 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %5, i32 0, i32 0, !dbg !83
   %39 = bitcast [2 x i64]* %38 to i8*, !dbg !83
   %40 = bitcast [2 x i64]* %4 to i8*, !dbg !83
   call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %39, i8* %40, i64 16, i1 false), !dbg !83, !tbaa !81
   %41 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %5, i32 0, i32 1, !dbg !83
   store i8 addrspace(1)* %31, i8 addrspace(1)** %41, align 8, !dbg !83, !tbaa !81
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:82 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
; │┌ @ broadcast.jl:837 within `materialize'
; ││┌ @ broadcast.jl:1046 within `copy'
; │││┌ @ ntuple.jl:42 within `ntuple'
; ││││┌ @ broadcast.jl:1046 within `#19'
; │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
; ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
; │││││││┌ @ boot.jl:708 within `Int64'
; ││││││││┌ @ boot.jl:627 within `toInt64'
           %42 = sext i32 %3 to i64, !dbg !84
           %43 = sext i32 %3 to i64, !dbg !84
; ││││└└└└└
      %44 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i32 0, i32 0, !dbg !89
      store i64 %42, i64* %44, align 8, !dbg !89, !tbaa !81
      %45 = getelementptr inbounds [2 x i64], [2 x i64]* %6, i32 0, i32 1, !dbg !89
      store i64 %43, i64* %45, align 8, !dbg !89, !tbaa !81
; │└└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
   %46 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %7, i32 0, i32 0, !dbg !95
   %47 = bitcast [2 x i64]* %46 to i8*, !dbg !95
   %48 = bitcast [2 x i64]* %6 to i8*, !dbg !95
   call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %47, i8* %48, i64 16, i1 false), !dbg !95, !tbaa !81
   %49 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %7, i32 0, i32 1, !dbg !95
   store i8 addrspace(1)* %32, i8 addrspace(1)** %49, align 8, !dbg !95, !tbaa !81
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:83 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48
; │┌ @ broadcast.jl:837 within `materialize'
; ││┌ @ broadcast.jl:1046 within `copy'
; │││┌ @ ntuple.jl:42 within `ntuple'
; ││││┌ @ broadcast.jl:1046 within `#19'
; │││││┌ @ broadcast.jl:621 within `_broadcast_getindex'
; ││││││┌ @ broadcast.jl:648 within `_broadcast_getindex_evalf'
; │││││││┌ @ boot.jl:708 within `Int64'
; ││││││││┌ @ boot.jl:627 within `toInt64'
           %50 = sext i32 %3 to i64, !dbg !96
           %51 = sext i32 %3 to i64, !dbg !96
; ││││└└└└└
      %52 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i32 0, i32 0, !dbg !101
      store i64 %50, i64* %52, align 8, !dbg !101, !tbaa !81
      %53 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i32 0, i32 1, !dbg !101
      store i64 %51, i64* %53, align 8, !dbg !101, !tbaa !81
; │└└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:48 @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
   %54 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %9, i32 0, i32 0, !dbg !107
   %55 = bitcast [2 x i64]* %54 to i8*, !dbg !107
   %56 = bitcast [2 x i64]* %8 to i8*, !dbg !107
   call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %55, i8* %56, i64 16, i1 false), !dbg !107, !tbaa !81
   %57 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %9, i32 0, i32 1, !dbg !107
   store i8 addrspace(1)* %33, i8 addrspace(1)** %57, align 8, !dbg !107, !tbaa !81
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:84 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %58 = call fastcc i32 @jl_llvmcall0(), !dbg !108
; ││└└
; ││┌ @ boot.jl:708 within `Int64'
; │││┌ @ boot.jl:632 within `toInt64'
      %59 = zext i32 %58 to i64, !dbg !121
; ││└└
; ││┌ @ int.jl:86 within `+'
     %60 = add i64 %59, 1, !dbg !123
; │└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %61 = call fastcc i32 @jl_llvmcall1(), !dbg !126
; │└└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %62 = call fastcc i32 @jl_llvmcall2(), !dbg !131
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:85 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %63 = call fastcc i32 @jl_llvmcall3(), !dbg !136
; │└└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %64 = call fastcc i32 @jl_llvmcall4(), !dbg !142
; ││└└
; ││┌ @ boot.jl:708 within `Int64'
; │││┌ @ boot.jl:632 within `toInt64'
      %65 = zext i32 %64 to i64, !dbg !146
; ││└└
; ││┌ @ int.jl:86 within `+'
     %66 = add i64 %65, 1, !dbg !148
; │└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_z'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %67 = call fastcc i32 @jl_llvmcall5(), !dbg !149
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:86 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %68 = call fastcc i32 @jl_llvmcall6(), !dbg !153
; ││└└
; ││┌ @ boot.jl:708 within `Int64'
; │││┌ @ boot.jl:632 within `toInt64'
      %69 = zext i32 %68 to i64, !dbg !161
; ││└└
; ││┌ @ int.jl:86 within `+'
     %70 = add i64 %69, 1, !dbg !163
; │└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %71 = call fastcc i32 @jl_llvmcall7(), !dbg !164
; │└└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %72 = call fastcc i32 @jl_llvmcall8(), !dbg !169
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:87 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %73 = call fastcc i32 @jl_llvmcall9(), !dbg !174
; │└└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %74 = call fastcc i32 @jl_llvmcall10(), !dbg !180
; ││└└
; ││┌ @ boot.jl:708 within `Int64'
; │││┌ @ boot.jl:632 within `toInt64'
      %75 = zext i32 %74 to i64, !dbg !184
; ││└└
; ││┌ @ int.jl:86 within `+'
     %76 = add i64 %75, 1, !dbg !186
; │└└
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_z'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %77 = call fastcc i32 @jl_llvmcall11(), !dbg !187
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:90 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
     %78 = call fastcc i8 addrspace(3)* @jl_llvmcall12(), !dbg !191
; │└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
    %79 = getelementptr inbounds { [2 x i64], i8 addrspace(3)* }, { [2 x i64], i8 addrspace(3)* }* %10, i32 0, i32 0, !dbg !199
    store [2 x i64] [i64 33, i64 32], [2 x i64]* %79, align 8, !dbg !199, !tbaa !81
    %80 = getelementptr inbounds { [2 x i64], i8 addrspace(3)* }, { [2 x i64], i8 addrspace(3)* }* %10, i32 0, i32 1, !dbg !199
    store i8 addrspace(3)* %78, i8 addrspace(3)** %80, align 8, !dbg !199, !tbaa !81
; └└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:91 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:24 within `macro expansion'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `emit_shmem'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:55 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
     %81 = call fastcc i8 addrspace(3)* @jl_llvmcall13(), !dbg !202
; │└└
; │ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/memory_shared.jl:25 within `macro expansion'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:38 within `CuDeviceArray' @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:31
    %82 = getelementptr inbounds { [2 x i64], i8 addrspace(3)* }, { [2 x i64], i8 addrspace(3)* }* %11, i32 0, i32 0, !dbg !207
    store [2 x i64] [i64 33, i64 32], [2 x i64]* %82, align 8, !dbg !207, !tbaa !81
    %83 = getelementptr inbounds { [2 x i64], i8 addrspace(3)* }, { [2 x i64], i8 addrspace(3)* }* %11, i32 0, i32 1, !dbg !207
    store i8 addrspace(3)* %81, i8 addrspace(3)** %83, align 8, !dbg !207, !tbaa !81
; └└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:260 within `div'
   %84 = icmp ne i64 %34, -9223372036854775808, !dbg !210
   %85 = or i1 true, %84, !dbg !210
   %86 = and i1 true, %85, !dbg !210
   br i1 %86, label %pass, label %fail, !dbg !210

L67:                                              ; preds = %pass
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L69, !dbg !213

L68:                                              ; preds = %pass
   br label %L69, !dbg !213

L69:                                              ; preds = %L68, %L67
   %value_phi = phi i8 [ 1, %L67 ], [ 0, %L68 ]
   %value_phi1 = phi i64 [ 0, %L68 ], [ undef, %L67 ]
   %value_phi2 = phi i64 [ 0, %L68 ], [ undef, %L67 ]
; └
  %87 = xor i8 %value_phi, 1, !dbg !216
  %88 = trunc i8 %87 to i1, !dbg !216
  %89 = xor i1 %88, true, !dbg !216
  br i1 %89, label %L69.L400_crit_edge, label %L69.L74_crit_edge, !dbg !216

L69.L400_crit_edge:                               ; preds = %L69
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:624 within `iterate'
   br label %L400, !dbg !217

L69.L74_crit_edge:                                ; preds = %L69
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L74, !dbg !213

L74:                                              ; preds = %L69.L74_crit_edge, %L399
   %value_phi3 = phi double [ 0.000000e+00, %L69.L74_crit_edge ], [ %161, %L399 ]
   %value_phi4 = phi i64 [ %value_phi1, %L69.L74_crit_edge ], [ %value_phi13, %L399 ]
   %value_phi5 = phi i64 [ %value_phi2, %L69.L74_crit_edge ], [ %value_phi14, %L399 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:101 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %90 = sub i64 %60, 1, !dbg !219
; └
; ┌ @ int.jl:87 within `*'
   %91 = mul i64 %90, 32, !dbg !222
; └
; ┌ @ int.jl:86 within `+'
   %92 = add i64 %91, %70, !dbg !224
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:102 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %93 = sub i64 %66, 1, !dbg !225
; └
; ┌ @ int.jl:87 within `*'
   %94 = mul i64 %93, 32, !dbg !227
; └
; ┌ @ int.jl:86 within `+'
   %95 = add i64 %94, %76, !dbg !228
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:105 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %96 = mul i64 %value_phi4, 32, !dbg !229
; └
; ┌ @ int.jl:86 within `+'
   %97 = add i64 %96, %76, !dbg !231
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L107, !dbg !232

L107:                                             ; preds = %L74
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %98 = icmp slt i64 %42, 0, !dbg !236
; ││││││││└
          %99 = zext i1 %98 to i8, !dbg !238
          %100 = trunc i8 %99 to i1, !dbg !238
          %101 = xor i1 %100, true, !dbg !238
          %102 = select i1 %101, i64 %42, i64 0, !dbg !238
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %103 = sub i64 %102, 0, !dbg !254
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %104 = mul i64 1, %103, !dbg !262
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %105 = sub i64 %92, 1, !dbg !263
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %106 = mul i64 %105, 1, !dbg !266
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %107 = add i64 1, %106, !dbg !267
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %108 = sub i64 %97, 1, !dbg !268
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %109 = mul i64 %108, %104, !dbg !271
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %110 = add i64 %107, %109, !dbg !272
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L130, !dbg !273

L130:                                             ; preds = %L107
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %111 = sub i64 %110, 1, !dbg !277
; │││││││└
         %112 = call fastcc double @jl_llvmcall14(i8 addrspace(1)* %32, i64 %111), !dbg !278
; ││││└└└
      br label %L134, !dbg !286

L134:                                             ; preds = %L130
; │││└
     br label %L135, !dbg !275

L135:                                             ; preds = %L134
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L136, !dbg !287

L136:                                             ; preds = %L135
; │└
   br label %L137, !dbg !234

L137:                                             ; preds = %L136
; └
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L156, !dbg !288

L156:                                             ; preds = %L137
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %113 = sub i64 %70, 1, !dbg !292
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %114 = mul i64 %113, 1, !dbg !299
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %115 = add i64 1, %114, !dbg !300
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %116 = sub i64 %76, 1, !dbg !301
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %117 = mul i64 %116, 33, !dbg !304
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %118 = add i64 %115, %117, !dbg !305
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L175, !dbg !306

L175:                                             ; preds = %L156
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %119 = sub i64 %118, 1, !dbg !310
; │││││││└
         call fastcc void @jl_llvmcall15(i8 addrspace(3)* %78, double %112, i64 %119), !dbg !311
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L179, !dbg !318

L179:                                             ; preds = %L175
; │││└
     br label %L180, !dbg !308

L180:                                             ; preds = %L179
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L181, !dbg !319

L181:                                             ; preds = %L180
; │└
   br label %L182, !dbg !290

L182:                                             ; preds = %L181
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %120 = mul i64 %value_phi4, 32, !dbg !320
; └
; ┌ @ int.jl:86 within `+'
   %121 = add i64 %120, %70, !dbg !322
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L204, !dbg !323

L204:                                             ; preds = %L182
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %122 = icmp slt i64 %50, 0, !dbg !325
; ││││││││└
          %123 = zext i1 %122 to i8, !dbg !326
          %124 = trunc i8 %123 to i1, !dbg !326
          %125 = xor i1 %124, true, !dbg !326
          %126 = select i1 %125, i64 %50, i64 0, !dbg !326
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %127 = sub i64 %126, 0, !dbg !334
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %128 = mul i64 1, %127, !dbg !339
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %129 = sub i64 %121, 1, !dbg !340
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %130 = mul i64 %129, 1, !dbg !342
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %131 = add i64 1, %130, !dbg !343
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %132 = sub i64 %95, 1, !dbg !344
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %133 = mul i64 %132, %128, !dbg !347
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %134 = add i64 %131, %133, !dbg !348
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L227, !dbg !349

L227:                                             ; preds = %L204
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %135 = sub i64 %134, 1, !dbg !351
; │││││││└
         %136 = call fastcc double @jl_llvmcall16(i8 addrspace(1)* %33, i64 %135), !dbg !352
; ││││└└└
      br label %L231, !dbg !356

L231:                                             ; preds = %L227
; │││└
     br label %L232, !dbg !350

L232:                                             ; preds = %L231
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L233, !dbg !357

L233:                                             ; preds = %L232
; │└
   br label %L234, !dbg !324

L234:                                             ; preds = %L233
; └
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L253, !dbg !358

L253:                                             ; preds = %L234
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %137 = sub i64 %70, 1, !dbg !360
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %138 = mul i64 %137, 1, !dbg !367
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %139 = add i64 1, %138, !dbg !368
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %140 = sub i64 %76, 1, !dbg !369
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %141 = mul i64 %140, 33, !dbg !372
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %142 = add i64 %139, %141, !dbg !373
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L272, !dbg !374

L272:                                             ; preds = %L253
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %143 = sub i64 %142, 1, !dbg !376
; │││││││└
         call fastcc void @jl_llvmcall17(i8 addrspace(3)* %81, double %136, i64 %143), !dbg !377
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L276, !dbg !382

L276:                                             ; preds = %L272
; │││└
     br label %L277, !dbg !375

L277:                                             ; preds = %L276
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L278, !dbg !383

L278:                                             ; preds = %L277
; │└
   br label %L279, !dbg !359

L279:                                             ; preds = %L278
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !384
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:116 within `coalesced_matmul_kernel!'
  br label %L279.L281_crit_edge, !dbg !388

L279.L281_crit_edge:                              ; preds = %L279
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L281, !dbg !213

L281:                                             ; preds = %L279.L281_crit_edge, %L386
   %value_phi6 = phi double [ %value_phi3, %L279.L281_crit_edge ], [ %161, %L386 ]
   %value_phi7 = phi i64 [ 1, %L279.L281_crit_edge ], [ %value_phi9, %L386 ]
   %value_phi8 = phi i64 [ 1, %L279.L281_crit_edge ], [ %value_phi10, %L386 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:117 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L303, !dbg !389

L303:                                             ; preds = %L281
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %144 = sub i64 %70, 1, !dbg !392
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %145 = mul i64 %144, 1, !dbg !399
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %146 = add i64 1, %145, !dbg !400
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %147 = sub i64 %value_phi7, 1, !dbg !401
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %148 = mul i64 %147, 33, !dbg !404
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %149 = add i64 %146, %148, !dbg !405
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L322, !dbg !406

L322:                                             ; preds = %L303
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %150 = sub i64 %149, 1, !dbg !408
; │││││││└
         %151 = call fastcc double @jl_llvmcall18(i8 addrspace(3)* %78, i64 %150), !dbg !409
; ││││└└└
      br label %L326, !dbg !413

L326:                                             ; preds = %L322
; │││└
     br label %L327, !dbg !407

L327:                                             ; preds = %L326
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L328, !dbg !414

L328:                                             ; preds = %L327
; │└
   br label %L329, !dbg !390

L329:                                             ; preds = %L328
; │┌ @ abstractarray.jl:1082 within `_getindex'
    br label %L348, !dbg !389

L348:                                             ; preds = %L329
; ││ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %152 = sub i64 %value_phi7, 1, !dbg !392
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %153 = mul i64 %152, 1, !dbg !399
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %154 = add i64 1, %153, !dbg !400
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %155 = sub i64 %76, 1, !dbg !401
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %156 = mul i64 %155, 33, !dbg !404
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %157 = add i64 %154, %156, !dbg !405
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:78 within `arrayref'
      br label %L367, !dbg !406

L367:                                             ; preds = %L348
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %158 = sub i64 %157, 1, !dbg !408
; │││││││└
         %159 = call fastcc double @jl_llvmcall19(i8 addrspace(3)* %81, i64 %158), !dbg !409
; ││││└└└
      br label %L371, !dbg !413

L371:                                             ; preds = %L367
; │││└
     br label %L372, !dbg !407

L372:                                             ; preds = %L371
; ││└
; ││ @ abstractarray.jl:1084 within `_getindex'
    br label %L373, !dbg !414

L373:                                             ; preds = %L372
; │└
   br label %L374, !dbg !390

L374:                                             ; preds = %L373
; └
; ┌ @ float.jl:405 within `*'
   %160 = fmul double %151, %159, !dbg !415
; └
; ┌ @ float.jl:401 within `+'
   %161 = fadd double %value_phi6, %160, !dbg !418
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %162 = icmp eq i64 %value_phi8, 32, !dbg !420
    %163 = zext i1 %162 to i8, !dbg !420
; │└
   %164 = trunc i8 %163 to i1, !dbg !422
   %165 = xor i1 %164, true, !dbg !422
   br i1 %165, label %L379, label %L378, !dbg !422

L378:                                             ; preds = %L374
   br label %L381, !dbg !422

L379:                                             ; preds = %L374
; │ @ range.jl:625 within `iterate'
; │┌ @ int.jl:86 within `+'
    %166 = add i64 %value_phi8, 1, !dbg !423
; │└
; │ @ range.jl:624 within `iterate'
   br label %L381, !dbg !422

L381:                                             ; preds = %L379, %L378
   %value_phi9 = phi i64 [ %166, %L379 ], [ undef, %L378 ]
   %value_phi10 = phi i64 [ %166, %L379 ], [ undef, %L378 ]
   %value_phi11 = phi i8 [ 1, %L378 ], [ 0, %L379 ]
; └
  %167 = xor i8 %value_phi11, 1, !dbg !391
  %168 = trunc i8 %167 to i1, !dbg !391
  %169 = xor i1 %168, true, !dbg !391
  br i1 %169, label %L381.L387_crit_edge, label %L386, !dbg !391

L381.L387_crit_edge:                              ; preds = %L381
; ┌ @ range.jl:624 within `iterate'
   br label %L387, !dbg !422

L386:                                             ; preds = %L381
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L281, !dbg !213

L387:                                             ; preds = %L381.L387_crit_edge
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !425
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %170 = icmp eq i64 %value_phi5, %204, !dbg !426
    %171 = zext i1 %170 to i8, !dbg !426
; │└
   %172 = trunc i8 %171 to i1, !dbg !217
   %173 = xor i1 %172, true, !dbg !217
   br i1 %173, label %L392, label %L391, !dbg !217

L391:                                             ; preds = %L387
   br label %L394, !dbg !217

L392:                                             ; preds = %L387
; │ @ range.jl:625 within `iterate'
; │┌ @ int.jl:86 within `+'
    %174 = add i64 %value_phi5, 1, !dbg !427
; │└
; │ @ range.jl:624 within `iterate'
   br label %L394, !dbg !217

L394:                                             ; preds = %L392, %L391
   %value_phi13 = phi i64 [ %174, %L392 ], [ undef, %L391 ]
   %value_phi14 = phi i64 [ %174, %L392 ], [ undef, %L391 ]
   %value_phi15 = phi i8 [ 1, %L391 ], [ 0, %L392 ]
; └
  %175 = xor i8 %value_phi15, 1, !dbg !218
  %176 = trunc i8 %175 to i1, !dbg !218
  %177 = xor i1 %176, true, !dbg !218
  br i1 %177, label %L394.L400_crit_edge, label %L399, !dbg !218

L394.L400_crit_edge:                              ; preds = %L394
; ┌ @ range.jl:624 within `iterate'
   br label %L400, !dbg !217

L399:                                             ; preds = %L394
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L74, !dbg !213

L400:                                             ; preds = %L69.L400_crit_edge, %L394.L400_crit_edge
   %value_phi16 = phi double [ %161, %L394.L400_crit_edge ], [ 0.000000e+00, %L69.L400_crit_edge ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %178 = sub i64 %60, 1, !dbg !429
; └
; ┌ @ int.jl:87 within `*'
   %179 = mul i64 %178, 32, !dbg !431
; └
; ┌ @ int.jl:86 within `+'
   %180 = add i64 %179, %70, !dbg !432
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:124 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %181 = sub i64 %66, 1, !dbg !433
; └
; ┌ @ int.jl:87 within `*'
   %182 = mul i64 %181, 32, !dbg !435
; └
; ┌ @ int.jl:86 within `+'
   %183 = add i64 %182, %76, !dbg !436
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1175 within `_setindex!'
    br label %L428, !dbg !437

L428:                                             ; preds = %L400
; ││ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
; ││││││││┌ @ int.jl:82 within `<'
           %184 = icmp slt i64 %34, 0, !dbg !440
; ││││││││└
          %185 = zext i1 %184 to i8, !dbg !441
          %186 = trunc i8 %185 to i1, !dbg !441
          %187 = xor i1 %186, true, !dbg !441
          %188 = select i1 %187, i64 %34, i64 0, !dbg !441
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse'
; │││││┌ @ abstractarray.jl:1915 within `nextL'
; ││││││┌ @ range.jl:544 within `unsafe_length'
; │││││││┌ @ int.jl:85 within `-'
          %189 = sub i64 %188, 0, !dbg !449
; ││││││└└
; ││││││┌ @ int.jl:87 within `*'
         %190 = mul i64 1, %189, !dbg !454
; │││││└└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %191 = sub i64 %180, 1, !dbg !455
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %192 = mul i64 %191, 1, !dbg !457
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %193 = add i64 1, %192, !dbg !458
; │││││└
; │││││ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %194 = sub i64 %183, 1, !dbg !459
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %195 = mul i64 %194, %190, !dbg !462
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %196 = add i64 %193, %195, !dbg !463
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:84 within `arrayset'
      br label %L451, !dbg !464

L451:                                             ; preds = %L428
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %197 = sub i64 %196, 1, !dbg !466
; │││││││└
         call fastcc void @jl_llvmcall20(i8 addrspace(1)* %31, double %value_phi16, i64 %197), !dbg !467
; ││││└└└
; ││││ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:87 within `arrayset'
      br label %L455, !dbg !472

L455:                                             ; preds = %L451
; │││└
     br label %L456, !dbg !465

L456:                                             ; preds = %L455
; ││└
; ││ @ abstractarray.jl:1177 within `_setindex!'
    br label %L457, !dbg !473

L457:                                             ; preds = %L456
; │└
   br label %L458, !dbg !438

L458:                                             ; preds = %L457
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:127 within `coalesced_matmul_kernel!'
  ret void, !dbg !474

fail:                                             ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:260 within `div'
   call fastcc void @gpu_report_exception(i64 ptrtoint ([10 x i8]* @exception4 to i64)), !dbg !210
   call fastcc void @gpu_signal_exception(), !dbg !210
   call void asm sideeffect "trap;", ""(), !dbg !210
   br label %pass

pass:                                             ; preds = %fail, %top
   %198 = sdiv i64 %34, 32, !dbg !210
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %199 = sub i64 %198, 1, !dbg !475
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:280 within `UnitRange'
; ││┌ @ range.jl:285 within `unitrange_last'
; │││┌ @ operators.jl:350 within `>='
; ││││┌ @ int.jl:441 within `<='
       %200 = icmp sle i64 0, %199, !dbg !476
; │││└└
     %201 = zext i1 %200 to i8, !dbg !481
     %202 = trunc i8 %201 to i1, !dbg !481
     %203 = xor i1 %202, true, !dbg !481
     %204 = select i1 %203, i64 -1, i64 %199, !dbg !481
; └└└
; ┌ @ range.jl:620 within `iterate'
; │┌ @ range.jl:503 within `isempty'
; ││┌ @ operators.jl:303 within `>'
; │││┌ @ int.jl:82 within `<'
      %205 = icmp slt i64 %204, 0, !dbg !487
; │└└└
   %206 = zext i1 %205 to i8, !dbg !213
   %207 = trunc i8 %206 to i1, !dbg !213
   %208 = xor i1 %207, true, !dbg !213
   br i1 %208, label %L68, label %L67, !dbg !213
; └
}

declare %jl_value_t*** @julia.ptls_states() local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #0

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall0() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !492
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall1() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !493
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall2() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.z(), !range !493
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.z() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall3() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !492
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall4() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !493
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall5() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.z(), !range !493
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall6() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !494
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall7() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !494
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall8() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.z(), !range !494
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.z() #2

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall9() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !494
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall10() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !494
  ret i32 %0
}

; Function Attrs: alwaysinline
define internal fastcc i32 @jl_llvmcall11() unnamed_addr #1 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.z(), !range !494
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
  %4 = load double, double addrspace(1)* %3, align 8, !tbaa !495
  ret double %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall15(i8 addrspace(3)*, double, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %4 = getelementptr inbounds double, double addrspace(3)* %3, i64 %2
  store double %1, double addrspace(3)* %4, align 8, !tbaa !498
  ret void
}

; Function Attrs: alwaysinline
define internal fastcc double @jl_llvmcall16(i8 addrspace(1)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(1)* %0 to double addrspace(1)*
  %3 = getelementptr inbounds double, double addrspace(1)* %2, i64 %1
  %4 = load double, double addrspace(1)* %3, align 8, !tbaa !495
  ret double %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall17(i8 addrspace(3)*, double, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %4 = getelementptr inbounds double, double addrspace(3)* %3, i64 %2
  store double %1, double addrspace(3)* %4, align 8, !tbaa !498
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: alwaysinline
define internal fastcc double @jl_llvmcall18(i8 addrspace(3)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %3 = getelementptr inbounds double, double addrspace(3)* %2, i64 %1
  %4 = load double, double addrspace(3)* %3, align 8, !tbaa !498
  ret double %4
}

; Function Attrs: alwaysinline
define internal fastcc double @jl_llvmcall19(i8 addrspace(3)*, i64) unnamed_addr #1 {
entry:
  %2 = bitcast i8 addrspace(3)* %0 to double addrspace(3)*
  %3 = getelementptr inbounds double, double addrspace(3)* %2, i64 %1
  %4 = load double, double addrspace(3)* %3, align 8, !tbaa !498
  ret double %4
}

; Function Attrs: alwaysinline
define internal fastcc void @jl_llvmcall20(i8 addrspace(1)*, double, i64) unnamed_addr #1 {
entry:
  %3 = bitcast i8 addrspace(1)* %0 to double addrspace(1)*
  %4 = getelementptr inbounds double, double addrspace(1)* %3, i64 %2
  store double %1, double addrspace(1)* %4, align 8, !tbaa !495
  ret void
}

;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:39 within `report_exception'
define internal fastcc void @gpu_report_exception(i64) unnamed_addr !dbg !500 {
top:
  %1 = alloca %printf_args, align 8
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:40 within `report_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `_cuprintf'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
    %2 = bitcast %printf_args* %1 to i8*, !dbg !501
    call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2), !dbg !501
    %3 = getelementptr inbounds %printf_args, %printf_args* %1, i64 0, i32 0, !dbg !501
    store i64 %0, i64* %3, align 8, !dbg !501
    %4 = call i32 @vprintf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @0, i64 0, i64 0), i8* nonnull %2), !dbg !501
    call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2), !dbg !501
; └└
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:44 within `report_exception'
  ret void, !dbg !509
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #0

declare i32 @vprintf(i8*, i8*) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #0

;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:25 within `signal_exception'
define internal fastcc void @gpu_signal_exception() unnamed_addr !dbg !510 {
top:
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:26 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:23 within `exception_flag'
   %0 = call i64 @julia_exception_flag(), !dbg !511
; └
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:27 within `signal_exception'
  %1 = icmp eq i64 %0, 0, !dbg !514
  br i1 %1, label %L9, label %L5, !dbg !514

L5:                                               ; preds = %top
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:28 within `signal_exception'
; ┌ @ pointer.jl:118 within `unsafe_store!' @ pointer.jl:118
   %2 = inttoptr i64 %0 to i64*, !dbg !515
   store i64 1, i64* %2, align 1, !dbg !515, !tbaa !520
; └
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:29 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:115 within `threadfence_system'
   call void @llvm.nvvm.membar.sys(), !dbg !522
; └
  br label %L11, !dbg !524

L9:                                               ; preds = %top
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:31 within `signal_exception'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `_cuprintf'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl:38 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
    %3 = call i32 @vprintf(i8* getelementptr inbounds ([110 x i8], [110 x i8]* @1, i64 0, i64 0), i8* null), !dbg !525
    br label %L11, !dbg !525

L11:                                              ; preds = %L9, %L5
; └└
;  @ /home/local/.julia/packages/CUDA/BIYoG/src/device/runtime.jl:36 within `signal_exception'
  ret void, !dbg !532
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
!42 = !{void (i64, i64, i64, i32)* @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32, !"kernel", i32 1}
!43 = distinct !DISubprogram(name: "coalesced_matmul_kernel!", linkageName: "julia_coalesced_matmul_kernel!_3140", scope: null, file: !3, line: 77, type: !44, scopeLine: 77, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !4)
!45 = !{!46, !46, i64 0, i64 1}
!46 = !{!"jtbaa_const", !47, i64 0}
!47 = !{!"jtbaa", !48, i64 0}
!48 = !{!"jtbaa"}
!49 = !DILocation(line: 414, scope: !50, inlinedAt: !52)
!50 = distinct !DISubprogram(name: "reinterpret;", linkageName: "reinterpret", scope: !51, file: !51, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!51 = !DIFile(filename: "essentials.jl", directory: ".")
!52 = !DILocation(line: 78, scope: !43)
!53 = !DILocation(line: 414, scope: !50, inlinedAt: !54)
!54 = !DILocation(line: 79, scope: !43)
!55 = !DILocation(line: 414, scope: !50, inlinedAt: !56)
!56 = !DILocation(line: 80, scope: !43)
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
!80 = !DILocation(line: 81, scope: !43)
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
!94 = !DILocation(line: 82, scope: !43)
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
!106 = !DILocation(line: 83, scope: !43)
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
!120 = !DILocation(line: 84, scope: !43)
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
!141 = !DILocation(line: 85, scope: !43)
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
!160 = !DILocation(line: 86, scope: !43)
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
!179 = !DILocation(line: 87, scope: !43)
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
!198 = !DILocation(line: 90, scope: !43)
!199 = !DILocation(line: 31, scope: !77, inlinedAt: !200)
!200 = !DILocation(line: 38, scope: !77, inlinedAt: !201)
!201 = !DILocation(line: 25, scope: !193, inlinedAt: !198)
!202 = !DILocation(line: 80, scope: !109, inlinedAt: !203)
!203 = !DILocation(line: 55, scope: !193, inlinedAt: !204)
!204 = !DILocation(line: 55, scope: !196, inlinedAt: !205)
!205 = !DILocation(line: 24, scope: !193, inlinedAt: !206)
!206 = !DILocation(line: 91, scope: !43)
!207 = !DILocation(line: 31, scope: !77, inlinedAt: !208)
!208 = !DILocation(line: 38, scope: !77, inlinedAt: !209)
!209 = !DILocation(line: 25, scope: !193, inlinedAt: !206)
!210 = !DILocation(line: 260, scope: !211, inlinedAt: !212)
!211 = distinct !DISubprogram(name: "div;", linkageName: "div", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!212 = !DILocation(line: 96, scope: !43)
!213 = !DILocation(line: 620, scope: !214, inlinedAt: !216)
!214 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !215, file: !215, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!215 = !DIFile(filename: "range.jl", directory: ".")
!216 = !DILocation(line: 99, scope: !43)
!217 = !DILocation(line: 624, scope: !214, inlinedAt: !218)
!218 = !DILocation(line: 120, scope: !43)
!219 = !DILocation(line: 85, scope: !220, inlinedAt: !221)
!220 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!221 = !DILocation(line: 101, scope: !43)
!222 = !DILocation(line: 87, scope: !223, inlinedAt: !221)
!223 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!224 = !DILocation(line: 86, scope: !124, inlinedAt: !221)
!225 = !DILocation(line: 85, scope: !220, inlinedAt: !226)
!226 = !DILocation(line: 102, scope: !43)
!227 = !DILocation(line: 87, scope: !223, inlinedAt: !226)
!228 = !DILocation(line: 86, scope: !124, inlinedAt: !226)
!229 = !DILocation(line: 87, scope: !223, inlinedAt: !230)
!230 = !DILocation(line: 105, scope: !43)
!231 = !DILocation(line: 86, scope: !124, inlinedAt: !230)
!232 = !DILocation(line: 1082, scope: !233, inlinedAt: !234)
!233 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!234 = !DILocation(line: 1060, scope: !235, inlinedAt: !230)
!235 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!236 = !DILocation(line: 82, scope: !237, inlinedAt: !238)
!237 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!238 = !DILocation(line: 409, scope: !239, inlinedAt: !241)
!239 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !240, file: !240, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!240 = !DIFile(filename: "promotion.jl", directory: ".")
!241 = !DILocation(line: 317, scope: !242, inlinedAt: !243)
!242 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !215, file: !215, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!243 = !DILocation(line: 326, scope: !242, inlinedAt: !244)
!244 = !DILocation(line: 158, scope: !245, inlinedAt: !247)
!245 = distinct !DISubprogram(name: "map;", linkageName: "map", scope: !246, file: !246, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!246 = !DIFile(filename: "tuple.jl", directory: ".")
!247 = !DILocation(line: 75, scope: !248, inlinedAt: !249)
!248 = distinct !DISubprogram(name: "axes;", linkageName: "axes", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!249 = !DILocation(line: 1879, scope: !250, inlinedAt: !251)
!250 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!251 = !DILocation(line: 1089, scope: !252, inlinedAt: !253)
!252 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!253 = !DILocation(line: 1083, scope: !233, inlinedAt: !234)
!254 = !DILocation(line: 85, scope: !220, inlinedAt: !255)
!255 = !DILocation(line: 544, scope: !256, inlinedAt: !257)
!256 = distinct !DISubprogram(name: "unsafe_length;", linkageName: "unsafe_length", scope: !215, file: !215, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!257 = !DILocation(line: 1915, scope: !258, inlinedAt: !259)
!258 = distinct !DISubprogram(name: "nextL;", linkageName: "nextL", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!259 = !DILocation(line: 1911, scope: !260, inlinedAt: !261)
!260 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!261 = !DILocation(line: 1895, scope: !250, inlinedAt: !249)
!262 = !DILocation(line: 87, scope: !223, inlinedAt: !257)
!263 = !DILocation(line: 85, scope: !220, inlinedAt: !264)
!264 = !DILocation(line: 1918, scope: !265, inlinedAt: !259)
!265 = distinct !DISubprogram(name: "offsetin;", linkageName: "offsetin", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!266 = !DILocation(line: 87, scope: !223, inlinedAt: !259)
!267 = !DILocation(line: 86, scope: !124, inlinedAt: !259)
!268 = !DILocation(line: 85, scope: !220, inlinedAt: !269)
!269 = !DILocation(line: 1918, scope: !265, inlinedAt: !270)
!270 = !DILocation(line: 1911, scope: !260, inlinedAt: !259)
!271 = !DILocation(line: 87, scope: !223, inlinedAt: !270)
!272 = !DILocation(line: 86, scope: !124, inlinedAt: !270)
!273 = !DILocation(line: 78, scope: !274, inlinedAt: !275)
!274 = distinct !DISubprogram(name: "arrayref;", linkageName: "arrayref", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!275 = !DILocation(line: 99, scope: !276, inlinedAt: !253)
!276 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!277 = !DILocation(line: 85, scope: !220, inlinedAt: !278)
!278 = !DILocation(line: 80, scope: !109, inlinedAt: !279)
!279 = !DILocation(line: 7, scope: !280, inlinedAt: !282)
!280 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !281, file: !281, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!281 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl", directory: ".")
!282 = !DILocation(line: 7, scope: !283, inlinedAt: !284)
!283 = distinct !DISubprogram(name: "pointerref;", linkageName: "pointerref", scope: !281, file: !281, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!284 = !DILocation(line: 79, scope: !285, inlinedAt: !286)
!285 = distinct !DISubprogram(name: "unsafe_load;", linkageName: "unsafe_load", scope: !281, file: !281, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!286 = !DILocation(line: 80, scope: !274, inlinedAt: !275)
!287 = !DILocation(line: 1084, scope: !233, inlinedAt: !234)
!288 = !DILocation(line: 1175, scope: !289, inlinedAt: !290)
!289 = distinct !DISubprogram(name: "_setindex!;", linkageName: "_setindex!", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!290 = !DILocation(line: 1153, scope: !291, inlinedAt: !230)
!291 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !6, file: !6, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!292 = !DILocation(line: 85, scope: !220, inlinedAt: !293)
!293 = !DILocation(line: 1918, scope: !265, inlinedAt: !294)
!294 = !DILocation(line: 1911, scope: !260, inlinedAt: !295)
!295 = !DILocation(line: 1895, scope: !250, inlinedAt: !296)
!296 = !DILocation(line: 1879, scope: !250, inlinedAt: !297)
!297 = !DILocation(line: 1089, scope: !252, inlinedAt: !298)
!298 = !DILocation(line: 1176, scope: !289, inlinedAt: !290)
!299 = !DILocation(line: 87, scope: !223, inlinedAt: !294)
!300 = !DILocation(line: 86, scope: !124, inlinedAt: !294)
!301 = !DILocation(line: 85, scope: !220, inlinedAt: !302)
!302 = !DILocation(line: 1918, scope: !265, inlinedAt: !303)
!303 = !DILocation(line: 1911, scope: !260, inlinedAt: !294)
!304 = !DILocation(line: 87, scope: !223, inlinedAt: !303)
!305 = !DILocation(line: 86, scope: !124, inlinedAt: !303)
!306 = !DILocation(line: 84, scope: !307, inlinedAt: !308)
!307 = distinct !DISubprogram(name: "arrayset;", linkageName: "arrayset", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!308 = !DILocation(line: 101, scope: !309, inlinedAt: !298)
!309 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !78, file: !78, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!310 = !DILocation(line: 85, scope: !220, inlinedAt: !311)
!311 = !DILocation(line: 80, scope: !109, inlinedAt: !312)
!312 = !DILocation(line: 42, scope: !280, inlinedAt: !313)
!313 = !DILocation(line: 42, scope: !314, inlinedAt: !315)
!314 = distinct !DISubprogram(name: "pointerset;", linkageName: "pointerset", scope: !281, file: !281, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!315 = !DILocation(line: 82, scope: !316, inlinedAt: !317)
!316 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !281, file: !281, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!317 = !DILocation(line: 86, scope: !307, inlinedAt: !308)
!318 = !DILocation(line: 87, scope: !307, inlinedAt: !308)
!319 = !DILocation(line: 1177, scope: !289, inlinedAt: !290)
!320 = !DILocation(line: 87, scope: !223, inlinedAt: !321)
!321 = !DILocation(line: 106, scope: !43)
!322 = !DILocation(line: 86, scope: !124, inlinedAt: !321)
!323 = !DILocation(line: 1082, scope: !233, inlinedAt: !324)
!324 = !DILocation(line: 1060, scope: !235, inlinedAt: !321)
!325 = !DILocation(line: 82, scope: !237, inlinedAt: !326)
!326 = !DILocation(line: 409, scope: !239, inlinedAt: !327)
!327 = !DILocation(line: 317, scope: !242, inlinedAt: !328)
!328 = !DILocation(line: 326, scope: !242, inlinedAt: !329)
!329 = !DILocation(line: 158, scope: !245, inlinedAt: !330)
!330 = !DILocation(line: 75, scope: !248, inlinedAt: !331)
!331 = !DILocation(line: 1879, scope: !250, inlinedAt: !332)
!332 = !DILocation(line: 1089, scope: !252, inlinedAt: !333)
!333 = !DILocation(line: 1083, scope: !233, inlinedAt: !324)
!334 = !DILocation(line: 85, scope: !220, inlinedAt: !335)
!335 = !DILocation(line: 544, scope: !256, inlinedAt: !336)
!336 = !DILocation(line: 1915, scope: !258, inlinedAt: !337)
!337 = !DILocation(line: 1911, scope: !260, inlinedAt: !338)
!338 = !DILocation(line: 1895, scope: !250, inlinedAt: !331)
!339 = !DILocation(line: 87, scope: !223, inlinedAt: !336)
!340 = !DILocation(line: 85, scope: !220, inlinedAt: !341)
!341 = !DILocation(line: 1918, scope: !265, inlinedAt: !337)
!342 = !DILocation(line: 87, scope: !223, inlinedAt: !337)
!343 = !DILocation(line: 86, scope: !124, inlinedAt: !337)
!344 = !DILocation(line: 85, scope: !220, inlinedAt: !345)
!345 = !DILocation(line: 1918, scope: !265, inlinedAt: !346)
!346 = !DILocation(line: 1911, scope: !260, inlinedAt: !337)
!347 = !DILocation(line: 87, scope: !223, inlinedAt: !346)
!348 = !DILocation(line: 86, scope: !124, inlinedAt: !346)
!349 = !DILocation(line: 78, scope: !274, inlinedAt: !350)
!350 = !DILocation(line: 99, scope: !276, inlinedAt: !333)
!351 = !DILocation(line: 85, scope: !220, inlinedAt: !352)
!352 = !DILocation(line: 80, scope: !109, inlinedAt: !353)
!353 = !DILocation(line: 7, scope: !280, inlinedAt: !354)
!354 = !DILocation(line: 7, scope: !283, inlinedAt: !355)
!355 = !DILocation(line: 79, scope: !285, inlinedAt: !356)
!356 = !DILocation(line: 80, scope: !274, inlinedAt: !350)
!357 = !DILocation(line: 1084, scope: !233, inlinedAt: !324)
!358 = !DILocation(line: 1175, scope: !289, inlinedAt: !359)
!359 = !DILocation(line: 1153, scope: !291, inlinedAt: !321)
!360 = !DILocation(line: 85, scope: !220, inlinedAt: !361)
!361 = !DILocation(line: 1918, scope: !265, inlinedAt: !362)
!362 = !DILocation(line: 1911, scope: !260, inlinedAt: !363)
!363 = !DILocation(line: 1895, scope: !250, inlinedAt: !364)
!364 = !DILocation(line: 1879, scope: !250, inlinedAt: !365)
!365 = !DILocation(line: 1089, scope: !252, inlinedAt: !366)
!366 = !DILocation(line: 1176, scope: !289, inlinedAt: !359)
!367 = !DILocation(line: 87, scope: !223, inlinedAt: !362)
!368 = !DILocation(line: 86, scope: !124, inlinedAt: !362)
!369 = !DILocation(line: 85, scope: !220, inlinedAt: !370)
!370 = !DILocation(line: 1918, scope: !265, inlinedAt: !371)
!371 = !DILocation(line: 1911, scope: !260, inlinedAt: !362)
!372 = !DILocation(line: 87, scope: !223, inlinedAt: !371)
!373 = !DILocation(line: 86, scope: !124, inlinedAt: !371)
!374 = !DILocation(line: 84, scope: !307, inlinedAt: !375)
!375 = !DILocation(line: 101, scope: !309, inlinedAt: !366)
!376 = !DILocation(line: 85, scope: !220, inlinedAt: !377)
!377 = !DILocation(line: 80, scope: !109, inlinedAt: !378)
!378 = !DILocation(line: 42, scope: !280, inlinedAt: !379)
!379 = !DILocation(line: 42, scope: !314, inlinedAt: !380)
!380 = !DILocation(line: 82, scope: !316, inlinedAt: !381)
!381 = !DILocation(line: 86, scope: !307, inlinedAt: !375)
!382 = !DILocation(line: 87, scope: !307, inlinedAt: !375)
!383 = !DILocation(line: 1177, scope: !289, inlinedAt: !359)
!384 = !DILocation(line: 14, scope: !385, inlinedAt: !387)
!385 = distinct !DISubprogram(name: "sync_threads;", linkageName: "sync_threads", scope: !386, file: !386, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!386 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl", directory: ".")
!387 = !DILocation(line: 109, scope: !43)
!388 = !DILocation(line: 116, scope: !43)
!389 = !DILocation(line: 1082, scope: !233, inlinedAt: !390)
!390 = !DILocation(line: 1060, scope: !235, inlinedAt: !391)
!391 = !DILocation(line: 117, scope: !43)
!392 = !DILocation(line: 85, scope: !220, inlinedAt: !393)
!393 = !DILocation(line: 1918, scope: !265, inlinedAt: !394)
!394 = !DILocation(line: 1911, scope: !260, inlinedAt: !395)
!395 = !DILocation(line: 1895, scope: !250, inlinedAt: !396)
!396 = !DILocation(line: 1879, scope: !250, inlinedAt: !397)
!397 = !DILocation(line: 1089, scope: !252, inlinedAt: !398)
!398 = !DILocation(line: 1083, scope: !233, inlinedAt: !390)
!399 = !DILocation(line: 87, scope: !223, inlinedAt: !394)
!400 = !DILocation(line: 86, scope: !124, inlinedAt: !394)
!401 = !DILocation(line: 85, scope: !220, inlinedAt: !402)
!402 = !DILocation(line: 1918, scope: !265, inlinedAt: !403)
!403 = !DILocation(line: 1911, scope: !260, inlinedAt: !394)
!404 = !DILocation(line: 87, scope: !223, inlinedAt: !403)
!405 = !DILocation(line: 86, scope: !124, inlinedAt: !403)
!406 = !DILocation(line: 78, scope: !274, inlinedAt: !407)
!407 = !DILocation(line: 99, scope: !276, inlinedAt: !398)
!408 = !DILocation(line: 85, scope: !220, inlinedAt: !409)
!409 = !DILocation(line: 80, scope: !109, inlinedAt: !410)
!410 = !DILocation(line: 7, scope: !280, inlinedAt: !411)
!411 = !DILocation(line: 7, scope: !283, inlinedAt: !412)
!412 = !DILocation(line: 79, scope: !285, inlinedAt: !413)
!413 = !DILocation(line: 80, scope: !274, inlinedAt: !407)
!414 = !DILocation(line: 1084, scope: !233, inlinedAt: !390)
!415 = !DILocation(line: 405, scope: !416, inlinedAt: !391)
!416 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !417, file: !417, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!417 = !DIFile(filename: "float.jl", directory: ".")
!418 = !DILocation(line: 401, scope: !419, inlinedAt: !391)
!419 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !417, file: !417, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!420 = !DILocation(line: 398, scope: !421, inlinedAt: !422)
!421 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !240, file: !240, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!422 = !DILocation(line: 624, scope: !214, inlinedAt: !391)
!423 = !DILocation(line: 86, scope: !124, inlinedAt: !424)
!424 = !DILocation(line: 625, scope: !214, inlinedAt: !391)
!425 = !DILocation(line: 14, scope: !385, inlinedAt: !218)
!426 = !DILocation(line: 398, scope: !421, inlinedAt: !217)
!427 = !DILocation(line: 86, scope: !124, inlinedAt: !428)
!428 = !DILocation(line: 625, scope: !214, inlinedAt: !218)
!429 = !DILocation(line: 85, scope: !220, inlinedAt: !430)
!430 = !DILocation(line: 123, scope: !43)
!431 = !DILocation(line: 87, scope: !223, inlinedAt: !430)
!432 = !DILocation(line: 86, scope: !124, inlinedAt: !430)
!433 = !DILocation(line: 85, scope: !220, inlinedAt: !434)
!434 = !DILocation(line: 124, scope: !43)
!435 = !DILocation(line: 87, scope: !223, inlinedAt: !434)
!436 = !DILocation(line: 86, scope: !124, inlinedAt: !434)
!437 = !DILocation(line: 1175, scope: !289, inlinedAt: !438)
!438 = !DILocation(line: 1153, scope: !291, inlinedAt: !439)
!439 = !DILocation(line: 126, scope: !43)
!440 = !DILocation(line: 82, scope: !237, inlinedAt: !441)
!441 = !DILocation(line: 409, scope: !239, inlinedAt: !442)
!442 = !DILocation(line: 317, scope: !242, inlinedAt: !443)
!443 = !DILocation(line: 326, scope: !242, inlinedAt: !444)
!444 = !DILocation(line: 158, scope: !245, inlinedAt: !445)
!445 = !DILocation(line: 75, scope: !248, inlinedAt: !446)
!446 = !DILocation(line: 1879, scope: !250, inlinedAt: !447)
!447 = !DILocation(line: 1089, scope: !252, inlinedAt: !448)
!448 = !DILocation(line: 1176, scope: !289, inlinedAt: !438)
!449 = !DILocation(line: 85, scope: !220, inlinedAt: !450)
!450 = !DILocation(line: 544, scope: !256, inlinedAt: !451)
!451 = !DILocation(line: 1915, scope: !258, inlinedAt: !452)
!452 = !DILocation(line: 1911, scope: !260, inlinedAt: !453)
!453 = !DILocation(line: 1895, scope: !250, inlinedAt: !446)
!454 = !DILocation(line: 87, scope: !223, inlinedAt: !451)
!455 = !DILocation(line: 85, scope: !220, inlinedAt: !456)
!456 = !DILocation(line: 1918, scope: !265, inlinedAt: !452)
!457 = !DILocation(line: 87, scope: !223, inlinedAt: !452)
!458 = !DILocation(line: 86, scope: !124, inlinedAt: !452)
!459 = !DILocation(line: 85, scope: !220, inlinedAt: !460)
!460 = !DILocation(line: 1918, scope: !265, inlinedAt: !461)
!461 = !DILocation(line: 1911, scope: !260, inlinedAt: !452)
!462 = !DILocation(line: 87, scope: !223, inlinedAt: !461)
!463 = !DILocation(line: 86, scope: !124, inlinedAt: !461)
!464 = !DILocation(line: 84, scope: !307, inlinedAt: !465)
!465 = !DILocation(line: 101, scope: !309, inlinedAt: !448)
!466 = !DILocation(line: 85, scope: !220, inlinedAt: !467)
!467 = !DILocation(line: 80, scope: !109, inlinedAt: !468)
!468 = !DILocation(line: 42, scope: !280, inlinedAt: !469)
!469 = !DILocation(line: 42, scope: !314, inlinedAt: !470)
!470 = !DILocation(line: 82, scope: !316, inlinedAt: !471)
!471 = !DILocation(line: 86, scope: !307, inlinedAt: !465)
!472 = !DILocation(line: 87, scope: !307, inlinedAt: !465)
!473 = !DILocation(line: 1177, scope: !289, inlinedAt: !438)
!474 = !DILocation(line: 127, scope: !43)
!475 = !DILocation(line: 85, scope: !220, inlinedAt: !216)
!476 = !DILocation(line: 441, scope: !477, inlinedAt: !478)
!477 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !125, file: !125, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!478 = !DILocation(line: 350, scope: !479, inlinedAt: !481)
!479 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !480, file: !480, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!480 = !DIFile(filename: "operators.jl", directory: ".")
!481 = !DILocation(line: 285, scope: !482, inlinedAt: !483)
!482 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !215, file: !215, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!483 = !DILocation(line: 280, scope: !484, inlinedAt: !485)
!484 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !215, file: !215, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!485 = !DILocation(line: 5, scope: !486, inlinedAt: !216)
!486 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !215, file: !215, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!487 = !DILocation(line: 82, scope: !237, inlinedAt: !488)
!488 = !DILocation(line: 303, scope: !489, inlinedAt: !490)
!489 = distinct !DISubprogram(name: ">;", linkageName: ">", scope: !480, file: !480, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!490 = !DILocation(line: 503, scope: !491, inlinedAt: !213)
!491 = distinct !DISubprogram(name: "isempty;", linkageName: "isempty", scope: !215, file: !215, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!492 = !{i32 0, i32 2147483646}
!493 = !{i32 0, i32 65534}
!494 = !{i32 0, i32 1023}
!495 = !{!496, !496, i64 0, i64 0}
!496 = !{!"custom_tbaa_addrspace(1)", !497, i64 0}
!497 = !{!"custom_tbaa"}
!498 = !{!499, !499, i64 0, i64 0}
!499 = !{!"custom_tbaa_addrspace(3)", !497, i64 0}
!500 = distinct !DISubprogram(name: "report_exception", linkageName: "julia_report_exception_3593", scope: null, file: !15, line: 39, type: !44, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!501 = !DILocation(line: 80, scope: !502, inlinedAt: !503)
!502 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !110, file: !110, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!503 = !DILocation(line: 38, scope: !504, inlinedAt: !506)
!504 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !505, file: !505, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!505 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/output.jl", directory: ".")
!506 = !DILocation(line: 38, scope: !507, inlinedAt: !508)
!507 = distinct !DISubprogram(name: "_cuprintf;", linkageName: "_cuprintf", scope: !505, file: !505, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14, retainedNodes: !4)
!508 = !DILocation(line: 40, scope: !500)
!509 = !DILocation(line: 44, scope: !500)
!510 = distinct !DISubprogram(name: "signal_exception", linkageName: "julia_signal_exception_3667", scope: null, file: !15, line: 25, type: !44, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!511 = !DILocation(line: 23, scope: !512, inlinedAt: !513)
!512 = distinct !DISubprogram(name: "exception_flag;", linkageName: "exception_flag", scope: !15, file: !15, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!513 = !DILocation(line: 26, scope: !510)
!514 = !DILocation(line: 27, scope: !510)
!515 = !DILocation(line: 118, scope: !516, inlinedAt: !518)
!516 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !517, file: !517, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!517 = !DIFile(filename: "pointer.jl", directory: ".")
!518 = !DILocation(line: 118, scope: !516, inlinedAt: !519)
!519 = !DILocation(line: 28, scope: !510)
!520 = !{!521, !521, i64 0}
!521 = !{!"jtbaa_data", !47, i64 0}
!522 = !DILocation(line: 115, scope: !523, inlinedAt: !524)
!523 = distinct !DISubprogram(name: "threadfence_system;", linkageName: "threadfence_system", scope: !386, file: !386, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!524 = !DILocation(line: 29, scope: !510)
!525 = !DILocation(line: 80, scope: !526, inlinedAt: !527)
!526 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !110, file: !110, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!527 = !DILocation(line: 38, scope: !528, inlinedAt: !529)
!528 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !505, file: !505, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!529 = !DILocation(line: 38, scope: !530, inlinedAt: !531)
!530 = distinct !DISubprogram(name: "_cuprintf;", linkageName: "_cuprintf", scope: !505, file: !505, type: !44, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !23, retainedNodes: !4)
!531 = !DILocation(line: 31, scope: !510)
!532 = !DILocation(line: 36, scope: !510)
