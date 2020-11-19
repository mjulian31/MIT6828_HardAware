; ModuleID = 'julia'
source_filename = "julia"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@__static_shmem_285 = internal unnamed_addr addrspace(3) global [1056 x double] zeroinitializer, align 32
@__static_shmem_286 = internal unnamed_addr addrspace(3) global [1056 x double] zeroinitializer, align 32

;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:77 within `coalesced_matmul_kernel!'
define dso_local ptx_kernel void @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32(i64, i64, i64, i32) local_unnamed_addr !dbg !11 {
top:
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
           %4 = sext i32 %3 to i64, !dbg !13
; └└└└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:84 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !37, !range !50
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow = add nuw nsw i32 %5, 1, !dbg !51
     %6 = zext i32 %narrow to i64, !dbg !51
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:85 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !54, !range !61
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:86 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !62, !range !70
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow49 = add nuw nsw i32 %8, 1, !dbg !71
     %9 = zext i32 %narrow49 to i64, !dbg !71
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:87 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !72, !range !70
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow50 = add nuw nsw i32 %10, 1, !dbg !79
     %11 = zext i32 %narrow50 to i64, !dbg !79
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:260 within `div'
   %12 = sdiv i64 %4, 32, !dbg !80
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %13 = add nsw i64 %12, -1, !dbg !83
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:280 within `UnitRange'
; ││┌ @ range.jl:285 within `unitrange_last'
; │││┌ @ operators.jl:350 within `>='
; ││││┌ @ int.jl:441 within `<='
       %14 = icmp slt i32 %3, 32, !dbg !86
; │││└└
     %15 = select i1 %14, i64 -1, i64 %13, !dbg !91
; └└└
; ┌ @ range.jl:620 within `iterate'
   %16 = icmp slt i64 %15, 0, !dbg !98
; └
  %.pre = shl nuw nsw i64 %6, 5, !dbg !100
  %.pre53 = shl nuw nsw i32 %7, 5, !dbg !100
  %.pre55 = add nuw nsw i32 %narrow50, %.pre53, !dbg !100
  %.pre56 = zext i32 %.pre55 to i64, !dbg !100
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
  br i1 %16, label %top.L400_crit_edge, label %L74.preheader, !dbg !85

top.L400_crit_edge:                               ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %.pre58 = add nsw i64 %.pre56, -1, !dbg !101
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %.pre60 = add nsw i64 %9, -33, !dbg !117
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:86 within `+'
        %.pre62 = add nsw i64 %.pre60, %.pre, !dbg !119
; └└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
  br label %L400, !dbg !85

L74.preheader:                                    ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:105 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl within `max'
          %17 = icmp sgt i64 %4, 0, !dbg !120
          %18 = select i1 %17, i64 %4, i64 0, !dbg !120
; └└└└└└└└
; ┌ @ int.jl within `+'
   %19 = add nsw i64 %11, -1, !dbg !138
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:101 within `coalesced_matmul_kernel!'
; ┌ @ int.jl within `+'
   %20 = add nsw i64 %9, -33, !dbg !139
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:105 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %21 = add nsw i64 %20, %.pre, !dbg !141
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %22 = inttoptr i64 %1 to double addrspace(1)*, !dbg !145
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `*'
        %23 = mul nuw nsw i64 %11, 33, !dbg !157
; │││││└
; │││││┌ @ int.jl within `+'
        %24 = add nsw i64 %9, -34, !dbg !166
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl within `-'
          %25 = add nsw i64 %24, %23, !dbg !167
; │││││││└
; │││││││ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %26 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %25, !dbg !178
         %27 = bitcast double addrspace(3)* %26 to i64 addrspace(3)*, !dbg !178
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl within `-'
         %28 = add nsw i64 %.pre56, -1, !dbg !179
; │││││└└
; │││││┌ @ int.jl within `*'
        %29 = mul nsw i64 %28, %18, !dbg !189
; └└└└└└
; ┌ @ int.jl within `+'
   %30 = add nsw i64 %9, -1, !dbg !190
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %31 = add nsw i64 %30, %29, !dbg !191
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %32 = inttoptr i64 %2 to double addrspace(1)*, !dbg !192
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %33 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %25, !dbg !198
         %34 = bitcast double addrspace(3)* %33 to i64 addrspace(3)*, !dbg !198
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:117 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %35 = add nsw i64 %23, -34, !dbg !206
; └└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L74, !dbg !98

L74:                                              ; preds = %L387, %L74.preheader
   %value_phi3 = phi double [ %65, %L387 ], [ 0.000000e+00, %L74.preheader ]
   %value_phi4 = phi i64 [ %69, %L387 ], [ 0, %L74.preheader ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:105 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:87 within `*'
   %36 = shl i64 %value_phi4, 5, !dbg !215
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %37 = add i64 %19, %36, !dbg !216
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %38 = mul i64 %37, %18, !dbg !218
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %39 = add i64 %21, %38, !dbg !219
; │││││││└
         %40 = getelementptr inbounds double, double addrspace(1)* %22, i64 %39, !dbg !220
         %41 = bitcast double addrspace(1)* %40 to i64 addrspace(1)*, !dbg !220
         %42 = load i64, i64 addrspace(1)* %41, align 8, !dbg !220, !tbaa !221
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i64 %42, i64 addrspace(3)* %27, align 8, !dbg !168, !tbaa !224
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %43 = add i64 %31, %36, !dbg !226
; │││││││└
         %44 = getelementptr inbounds double, double addrspace(1)* %32, i64 %43, !dbg !227
         %45 = bitcast double addrspace(1)* %44 to i64 addrspace(1)*, !dbg !227
         %46 = load i64, i64 addrspace(1)* %45, align 8, !dbg !227, !tbaa !221
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i64 %46, i64 addrspace(3)* %34, align 8, !dbg !228, !tbaa !224
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !229
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L281, !dbg !98

L281:                                             ; preds = %L281, %L74
   %value_phi6 = phi double [ %value_phi3, %L74 ], [ %65, %L281 ]
   %value_phi7 = phi i64 [ 1, %L74 ], [ %67, %L281 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:117 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %47 = mul nuw nsw i64 %value_phi7, 33, !dbg !233
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %48 = add i64 %24, %47, !dbg !234
; │││││││└
         %49 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %48, !dbg !235
         %50 = load double, double addrspace(3)* %49, align 8, !dbg !235, !tbaa !224
; │││││││┌ @ int.jl:85 within `-'
          %51 = add i64 %35, %value_phi7, !dbg !234
; │││││││└
         %52 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %51, !dbg !235
         %53 = load double, double addrspace(3)* %52, align 8, !dbg !235, !tbaa !224
; └└└└└└└
; ┌ @ float.jl:405 within `*'
   %54 = fmul double %50, %53, !dbg !241
; └
; ┌ @ float.jl:401 within `+'
   %55 = fadd double %value_phi6, %54, !dbg !244
; └
; ┌ @ range.jl:624 within `iterate'
   %56 = add nuw nsw i64 %value_phi7, 1, !dbg !246
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %57 = mul nuw nsw i64 %56, 33, !dbg !233
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %58 = add i64 %24, %57, !dbg !234
; │││││││└
         %59 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %58, !dbg !235
         %60 = load double, double addrspace(3)* %59, align 8, !dbg !235, !tbaa !224
; │││││││┌ @ int.jl:85 within `-'
          %61 = add i64 %35, %56, !dbg !234
; │││││││└
         %62 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %61, !dbg !235
         %63 = load double, double addrspace(3)* %62, align 8, !dbg !235, !tbaa !224
; └└└└└└└
; ┌ @ float.jl:405 within `*'
   %64 = fmul double %60, %63, !dbg !241
; └
; ┌ @ float.jl:401 within `+'
   %65 = fadd double %55, %64, !dbg !244
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %66 = icmp eq i64 %56, 32, !dbg !247
; │└
   %67 = add nuw nsw i64 %value_phi7, 2, !dbg !246
; └
  br i1 %66, label %L387, label %L281, !dbg !214

L387:                                             ; preds = %L281
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !249
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %68 = icmp eq i64 %value_phi4, %15, !dbg !251
; │└
   %69 = add i64 %value_phi4, 1, !dbg !252
; └
  br i1 %68, label %L400, label %L74, !dbg !250

L400:                                             ; preds = %L387, %top.L400_crit_edge
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:86 within `+'
        %.pre-phi63 = phi i64 [ %.pre62, %top.L400_crit_edge ], [ %21, %L387 ], !dbg !119
; │││││└
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %.pre-phi59 = phi i64 [ %.pre58, %top.L400_crit_edge ], [ %28, %L387 ], !dbg !101
         %value_phi16 = phi double [ 0.000000e+00, %top.L400_crit_edge ], [ %65, %L387 ]
; ││││└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
          %70 = icmp sgt i64 %4, 0, !dbg !253
          %71 = select i1 %70, i64 %4, i64 0, !dbg !253
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %72 = mul nsw i64 %.pre-phi59, %71, !dbg !258
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %73 = add i64 %.pre-phi63, %72, !dbg !259
; │││││││└
         %74 = inttoptr i64 %0 to double addrspace(1)*, !dbg !260
         %75 = getelementptr inbounds double, double addrspace(1)* %74, i64 %73, !dbg !260
         store double %value_phi16, double addrspace(1)* %75, align 8, !dbg !260, !tbaa !221
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:127 within `coalesced_matmul_kernel!'
  ret void, !dbg !266
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #1

attributes #0 = { nounwind readnone }
attributes #1 = { convergent nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2, !5, !7, !8, !9}
!nvvm.annotations = !{!10}

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
!10 = !{void (i64, i64, i64, i32)* @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32, !"kernel", i32 1}
!11 = distinct !DISubprogram(name: "coalesced_matmul_kernel!", linkageName: "julia_coalesced_matmul_kernel!_3850", scope: null, file: !3, line: 77, type: !12, scopeLine: 77, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!12 = !DISubroutineType(types: !4)
!13 = !DILocation(line: 627, scope: !14, inlinedAt: !16)
!14 = distinct !DISubprogram(name: "toInt64;", linkageName: "toInt64", scope: !15, file: !15, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!15 = !DIFile(filename: "boot.jl", directory: ".")
!16 = !DILocation(line: 708, scope: !17, inlinedAt: !18)
!17 = distinct !DISubprogram(name: "Int64;", linkageName: "Int64", scope: !15, file: !15, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!18 = !DILocation(line: 648, scope: !19, inlinedAt: !21)
!19 = distinct !DISubprogram(name: "_broadcast_getindex_evalf;", linkageName: "_broadcast_getindex_evalf", scope: !20, file: !20, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!20 = !DIFile(filename: "broadcast.jl", directory: ".")
!21 = !DILocation(line: 621, scope: !22, inlinedAt: !23)
!22 = distinct !DISubprogram(name: "_broadcast_getindex;", linkageName: "_broadcast_getindex", scope: !20, file: !20, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!23 = !DILocation(line: 1046, scope: !24, inlinedAt: !25)
!24 = distinct !DISubprogram(name: "#19;", linkageName: "#19", scope: !20, file: !20, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!25 = !DILocation(line: 42, scope: !26, inlinedAt: !28)
!26 = distinct !DISubprogram(name: "ntuple;", linkageName: "ntuple", scope: !27, file: !27, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!27 = !DIFile(filename: "ntuple.jl", directory: ".")
!28 = !DILocation(line: 1046, scope: !29, inlinedAt: !30)
!29 = distinct !DISubprogram(name: "copy;", linkageName: "copy", scope: !20, file: !20, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!30 = !DILocation(line: 837, scope: !31, inlinedAt: !32)
!31 = distinct !DISubprogram(name: "materialize;", linkageName: "materialize", scope: !20, file: !20, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!32 = !DILocation(line: 48, scope: !33, inlinedAt: !35)
!33 = distinct !DISubprogram(name: "CuDeviceArray;", linkageName: "CuDeviceArray", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!34 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl", directory: ".")
!35 = !DILocation(line: 38, scope: !33, inlinedAt: !36)
!36 = !DILocation(line: 81, scope: !11)
!37 = !DILocation(line: 80, scope: !38, inlinedAt: !40)
!38 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !39, file: !39, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!39 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl", directory: ".")
!40 = !DILocation(line: 7, scope: !41, inlinedAt: !43)
!41 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!42 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl", directory: ".")
!43 = !DILocation(line: 7, scope: !44, inlinedAt: !45)
!44 = distinct !DISubprogram(name: "_index;", linkageName: "_index", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 57, scope: !46, inlinedAt: !47)
!46 = distinct !DISubprogram(name: "blockIdx_x;", linkageName: "blockIdx_x", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!47 = !DILocation(line: 77, scope: !48, inlinedAt: !49)
!48 = distinct !DISubprogram(name: "blockIdx;", linkageName: "blockIdx", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 84, scope: !11)
!50 = !{i32 0, i32 2147483646}
!51 = !DILocation(line: 86, scope: !52, inlinedAt: !45)
!52 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!53 = !DIFile(filename: "int.jl", directory: ".")
!54 = !DILocation(line: 80, scope: !38, inlinedAt: !55)
!55 = !DILocation(line: 7, scope: !41, inlinedAt: !56)
!56 = !DILocation(line: 7, scope: !44, inlinedAt: !57)
!57 = !DILocation(line: 57, scope: !58, inlinedAt: !59)
!58 = distinct !DISubprogram(name: "blockIdx_y;", linkageName: "blockIdx_y", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 77, scope: !48, inlinedAt: !60)
!60 = !DILocation(line: 85, scope: !11)
!61 = !{i32 0, i32 65534}
!62 = !DILocation(line: 80, scope: !38, inlinedAt: !63)
!63 = !DILocation(line: 7, scope: !41, inlinedAt: !64)
!64 = !DILocation(line: 7, scope: !44, inlinedAt: !65)
!65 = !DILocation(line: 47, scope: !66, inlinedAt: !67)
!66 = distinct !DISubprogram(name: "threadIdx_x;", linkageName: "threadIdx_x", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 91, scope: !68, inlinedAt: !69)
!68 = distinct !DISubprogram(name: "threadIdx;", linkageName: "threadIdx", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 86, scope: !11)
!70 = !{i32 0, i32 1023}
!71 = !DILocation(line: 86, scope: !52, inlinedAt: !65)
!72 = !DILocation(line: 80, scope: !38, inlinedAt: !73)
!73 = !DILocation(line: 7, scope: !41, inlinedAt: !74)
!74 = !DILocation(line: 7, scope: !44, inlinedAt: !75)
!75 = !DILocation(line: 47, scope: !76, inlinedAt: !77)
!76 = distinct !DISubprogram(name: "threadIdx_y;", linkageName: "threadIdx_y", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 91, scope: !68, inlinedAt: !78)
!78 = !DILocation(line: 87, scope: !11)
!79 = !DILocation(line: 86, scope: !52, inlinedAt: !75)
!80 = !DILocation(line: 260, scope: !81, inlinedAt: !82)
!81 = distinct !DISubprogram(name: "div;", linkageName: "div", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 96, scope: !11)
!83 = !DILocation(line: 85, scope: !84, inlinedAt: !85)
!84 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 99, scope: !11)
!86 = !DILocation(line: 441, scope: !87, inlinedAt: !88)
!87 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 350, scope: !89, inlinedAt: !91)
!89 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !90, file: !90, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!90 = !DIFile(filename: "operators.jl", directory: ".")
!91 = !DILocation(line: 285, scope: !92, inlinedAt: !94)
!92 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !93, file: !93, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!93 = !DIFile(filename: "range.jl", directory: ".")
!94 = !DILocation(line: 280, scope: !95, inlinedAt: !96)
!95 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !93, file: !93, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 5, scope: !97, inlinedAt: !85)
!97 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !93, file: !93, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!98 = !DILocation(line: 620, scope: !99, inlinedAt: !85)
!99 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !93, file: !93, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!100 = !DILocation(line: 0, scope: !11)
!101 = !DILocation(line: 85, scope: !84, inlinedAt: !102)
!102 = !DILocation(line: 1918, scope: !103, inlinedAt: !104)
!103 = distinct !DISubprogram(name: "offsetin;", linkageName: "offsetin", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!104 = !DILocation(line: 1911, scope: !105, inlinedAt: !106)
!105 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!106 = !DILocation(line: 1911, scope: !105, inlinedAt: !107)
!107 = !DILocation(line: 1895, scope: !108, inlinedAt: !109)
!108 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!109 = !DILocation(line: 1879, scope: !108, inlinedAt: !110)
!110 = !DILocation(line: 1089, scope: !111, inlinedAt: !112)
!111 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!112 = !DILocation(line: 1176, scope: !113, inlinedAt: !114)
!113 = distinct !DISubprogram(name: "_setindex!;", linkageName: "_setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!114 = !DILocation(line: 1153, scope: !115, inlinedAt: !116)
!115 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!116 = !DILocation(line: 126, scope: !11)
!117 = !DILocation(line: 86, scope: !52, inlinedAt: !118)
!118 = !DILocation(line: 123, scope: !11)
!119 = !DILocation(line: 86, scope: !52, inlinedAt: !104)
!120 = !DILocation(line: 0, scope: !121, inlinedAt: !123)
!121 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !122, file: !122, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!122 = !DIFile(filename: "promotion.jl", directory: ".")
!123 = !DILocation(line: 317, scope: !124, inlinedAt: !125)
!124 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !93, file: !93, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!125 = !DILocation(line: 326, scope: !124, inlinedAt: !126)
!126 = !DILocation(line: 158, scope: !127, inlinedAt: !129)
!127 = distinct !DISubprogram(name: "map;", linkageName: "map", scope: !128, file: !128, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!128 = !DIFile(filename: "tuple.jl", directory: ".")
!129 = !DILocation(line: 75, scope: !130, inlinedAt: !131)
!130 = distinct !DISubprogram(name: "axes;", linkageName: "axes", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!131 = !DILocation(line: 1879, scope: !108, inlinedAt: !132)
!132 = !DILocation(line: 1089, scope: !111, inlinedAt: !133)
!133 = !DILocation(line: 1083, scope: !134, inlinedAt: !135)
!134 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!135 = !DILocation(line: 1060, scope: !136, inlinedAt: !137)
!136 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!137 = !DILocation(line: 105, scope: !11)
!138 = !DILocation(line: 0, scope: !52, inlinedAt: !137)
!139 = !DILocation(line: 0, scope: !52, inlinedAt: !140)
!140 = !DILocation(line: 101, scope: !11)
!141 = !DILocation(line: 0, scope: !52, inlinedAt: !142)
!142 = !DILocation(line: 1911, scope: !105, inlinedAt: !143)
!143 = !DILocation(line: 1911, scope: !105, inlinedAt: !144)
!144 = !DILocation(line: 1895, scope: !108, inlinedAt: !131)
!145 = !DILocation(line: 0, scope: !38, inlinedAt: !146)
!146 = !DILocation(line: 7, scope: !147, inlinedAt: !149)
!147 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !148, file: !148, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!148 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl", directory: ".")
!149 = !DILocation(line: 7, scope: !150, inlinedAt: !151)
!150 = distinct !DISubprogram(name: "pointerref;", linkageName: "pointerref", scope: !148, file: !148, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!151 = !DILocation(line: 79, scope: !152, inlinedAt: !153)
!152 = distinct !DISubprogram(name: "unsafe_load;", linkageName: "unsafe_load", scope: !148, file: !148, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!153 = !DILocation(line: 80, scope: !154, inlinedAt: !155)
!154 = distinct !DISubprogram(name: "arrayref;", linkageName: "arrayref", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!155 = !DILocation(line: 99, scope: !156, inlinedAt: !133)
!156 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!157 = !DILocation(line: 0, scope: !158, inlinedAt: !159)
!158 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!159 = !DILocation(line: 1911, scope: !105, inlinedAt: !160)
!160 = !DILocation(line: 1911, scope: !105, inlinedAt: !161)
!161 = !DILocation(line: 1895, scope: !108, inlinedAt: !162)
!162 = !DILocation(line: 1879, scope: !108, inlinedAt: !163)
!163 = !DILocation(line: 1089, scope: !111, inlinedAt: !164)
!164 = !DILocation(line: 1176, scope: !113, inlinedAt: !165)
!165 = !DILocation(line: 1153, scope: !115, inlinedAt: !137)
!166 = !DILocation(line: 0, scope: !52, inlinedAt: !159)
!167 = !DILocation(line: 0, scope: !84, inlinedAt: !168)
!168 = !DILocation(line: 80, scope: !38, inlinedAt: !169)
!169 = !DILocation(line: 42, scope: !147, inlinedAt: !170)
!170 = !DILocation(line: 42, scope: !171, inlinedAt: !172)
!171 = distinct !DISubprogram(name: "pointerset;", linkageName: "pointerset", scope: !148, file: !148, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!172 = !DILocation(line: 82, scope: !173, inlinedAt: !174)
!173 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !148, file: !148, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!174 = !DILocation(line: 86, scope: !175, inlinedAt: !176)
!175 = distinct !DISubprogram(name: "arrayset;", linkageName: "arrayset", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!176 = !DILocation(line: 101, scope: !177, inlinedAt: !164)
!177 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!178 = !DILocation(line: 0, scope: !38, inlinedAt: !169)
!179 = !DILocation(line: 0, scope: !84, inlinedAt: !180)
!180 = !DILocation(line: 1918, scope: !103, inlinedAt: !181)
!181 = !DILocation(line: 1911, scope: !105, inlinedAt: !182)
!182 = !DILocation(line: 1911, scope: !105, inlinedAt: !183)
!183 = !DILocation(line: 1895, scope: !108, inlinedAt: !184)
!184 = !DILocation(line: 1879, scope: !108, inlinedAt: !185)
!185 = !DILocation(line: 1089, scope: !111, inlinedAt: !186)
!186 = !DILocation(line: 1083, scope: !134, inlinedAt: !187)
!187 = !DILocation(line: 1060, scope: !136, inlinedAt: !188)
!188 = !DILocation(line: 106, scope: !11)
!189 = !DILocation(line: 0, scope: !158, inlinedAt: !181)
!190 = !DILocation(line: 0, scope: !52, inlinedAt: !188)
!191 = !DILocation(line: 0, scope: !52, inlinedAt: !181)
!192 = !DILocation(line: 0, scope: !38, inlinedAt: !193)
!193 = !DILocation(line: 7, scope: !147, inlinedAt: !194)
!194 = !DILocation(line: 7, scope: !150, inlinedAt: !195)
!195 = !DILocation(line: 79, scope: !152, inlinedAt: !196)
!196 = !DILocation(line: 80, scope: !154, inlinedAt: !197)
!197 = !DILocation(line: 99, scope: !156, inlinedAt: !186)
!198 = !DILocation(line: 0, scope: !38, inlinedAt: !199)
!199 = !DILocation(line: 42, scope: !147, inlinedAt: !200)
!200 = !DILocation(line: 42, scope: !171, inlinedAt: !201)
!201 = !DILocation(line: 82, scope: !173, inlinedAt: !202)
!202 = !DILocation(line: 86, scope: !175, inlinedAt: !203)
!203 = !DILocation(line: 101, scope: !177, inlinedAt: !204)
!204 = !DILocation(line: 1176, scope: !113, inlinedAt: !205)
!205 = !DILocation(line: 1153, scope: !115, inlinedAt: !188)
!206 = !DILocation(line: 0, scope: !52, inlinedAt: !207)
!207 = !DILocation(line: 1911, scope: !105, inlinedAt: !208)
!208 = !DILocation(line: 1911, scope: !105, inlinedAt: !209)
!209 = !DILocation(line: 1895, scope: !108, inlinedAt: !210)
!210 = !DILocation(line: 1879, scope: !108, inlinedAt: !211)
!211 = !DILocation(line: 1089, scope: !111, inlinedAt: !212)
!212 = !DILocation(line: 1083, scope: !134, inlinedAt: !213)
!213 = !DILocation(line: 1060, scope: !136, inlinedAt: !214)
!214 = !DILocation(line: 117, scope: !11)
!215 = !DILocation(line: 87, scope: !158, inlinedAt: !137)
!216 = !DILocation(line: 85, scope: !84, inlinedAt: !217)
!217 = !DILocation(line: 1918, scope: !103, inlinedAt: !142)
!218 = !DILocation(line: 87, scope: !158, inlinedAt: !142)
!219 = !DILocation(line: 85, scope: !84, inlinedAt: !220)
!220 = !DILocation(line: 80, scope: !38, inlinedAt: !146)
!221 = !{!222, !222, i64 0, i64 0}
!222 = !{!"custom_tbaa_addrspace(1)", !223, i64 0}
!223 = !{!"custom_tbaa"}
!224 = !{!225, !225, i64 0, i64 0}
!225 = !{!"custom_tbaa_addrspace(3)", !223, i64 0}
!226 = !DILocation(line: 85, scope: !84, inlinedAt: !227)
!227 = !DILocation(line: 80, scope: !38, inlinedAt: !193)
!228 = !DILocation(line: 80, scope: !38, inlinedAt: !199)
!229 = !DILocation(line: 14, scope: !230, inlinedAt: !232)
!230 = distinct !DISubprogram(name: "sync_threads;", linkageName: "sync_threads", scope: !231, file: !231, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!231 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl", directory: ".")
!232 = !DILocation(line: 109, scope: !11)
!233 = !DILocation(line: 87, scope: !158, inlinedAt: !207)
!234 = !DILocation(line: 85, scope: !84, inlinedAt: !235)
!235 = !DILocation(line: 80, scope: !38, inlinedAt: !236)
!236 = !DILocation(line: 7, scope: !147, inlinedAt: !237)
!237 = !DILocation(line: 7, scope: !150, inlinedAt: !238)
!238 = !DILocation(line: 79, scope: !152, inlinedAt: !239)
!239 = !DILocation(line: 80, scope: !154, inlinedAt: !240)
!240 = !DILocation(line: 99, scope: !156, inlinedAt: !212)
!241 = !DILocation(line: 405, scope: !242, inlinedAt: !214)
!242 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !243, file: !243, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!243 = !DIFile(filename: "float.jl", directory: ".")
!244 = !DILocation(line: 401, scope: !245, inlinedAt: !214)
!245 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !243, file: !243, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!246 = !DILocation(line: 624, scope: !99, inlinedAt: !214)
!247 = !DILocation(line: 398, scope: !248, inlinedAt: !246)
!248 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !122, file: !122, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!249 = !DILocation(line: 14, scope: !230, inlinedAt: !250)
!250 = !DILocation(line: 120, scope: !11)
!251 = !DILocation(line: 398, scope: !248, inlinedAt: !252)
!252 = !DILocation(line: 624, scope: !99, inlinedAt: !250)
!253 = !DILocation(line: 409, scope: !121, inlinedAt: !254)
!254 = !DILocation(line: 317, scope: !124, inlinedAt: !255)
!255 = !DILocation(line: 326, scope: !124, inlinedAt: !256)
!256 = !DILocation(line: 158, scope: !127, inlinedAt: !257)
!257 = !DILocation(line: 75, scope: !130, inlinedAt: !109)
!258 = !DILocation(line: 87, scope: !158, inlinedAt: !104)
!259 = !DILocation(line: 85, scope: !84, inlinedAt: !260)
!260 = !DILocation(line: 80, scope: !38, inlinedAt: !261)
!261 = !DILocation(line: 42, scope: !147, inlinedAt: !262)
!262 = !DILocation(line: 42, scope: !171, inlinedAt: !263)
!263 = !DILocation(line: 82, scope: !173, inlinedAt: !264)
!264 = !DILocation(line: 86, scope: !175, inlinedAt: !265)
!265 = !DILocation(line: 101, scope: !177, inlinedAt: !112)
!266 = !DILocation(line: 127, scope: !11)
