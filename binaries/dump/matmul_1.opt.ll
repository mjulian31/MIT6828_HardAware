; ModuleID = 'julia'
source_filename = "julia"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@__static_shmem_285 = internal unnamed_addr addrspace(3) global [1056 x float] zeroinitializer, align 32
@__static_shmem_286 = internal unnamed_addr addrspace(3) global [1056 x float] zeroinitializer, align 32

;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:88 within `coalesced_matmul_kernel!'
define dso_local ptx_kernel void @_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1_(i64, i64, i64, i32, i32, i32) local_unnamed_addr !dbg !11 {
top:
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
           %6 = sext i32 %3 to i64, !dbg !13
; └└└└└└└└└
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
           %7 = sext i32 %4 to i64, !dbg !37
; └└└└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:95 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !48, !range !61
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow = add nuw nsw i32 %8, 1, !dbg !62
     %9 = zext i32 %narrow to i64, !dbg !62
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !65, !range !72
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:97 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !73, !range !81
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow56 = add nuw nsw i32 %11, 1, !dbg !82
     %12 = zext i32 %narrow56 to i64, !dbg !82
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !83, !range !81
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow57 = add nuw nsw i32 %13, 1, !dbg !90
     %14 = zext i32 %narrow57 to i64, !dbg !90
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %15 = add nsw i64 %7, 31, !dbg !91
; └
; ┌ @ int.jl:260 within `div'
   %16 = sdiv i64 %15, 32, !dbg !94
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %17 = add nsw i64 %16, -1, !dbg !96
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:280 within `UnitRange'
; ││┌ @ range.jl:285 within `unitrange_last'
; │││┌ @ operators.jl:350 within `>='
; ││││┌ @ int.jl:441 within `<='
       %18 = icmp slt i32 %4, 1, !dbg !98
; │││└└
     %19 = select i1 %18, i64 -1, i64 %17, !dbg !103
; └└└
; ┌ @ range.jl:620 within `iterate'
   %20 = icmp slt i64 %19, 0, !dbg !110
; └
  %.pre60 = shl nuw nsw i64 %9, 5, !dbg !112
  %.pre62 = add nsw i64 %12, -32, !dbg !112
  %.pre64 = add nsw i64 %.pre62, %.pre60, !dbg !112
  %.pre66 = shl nuw nsw i32 %10, 5, !dbg !112
  %.pre68 = add nuw nsw i32 %narrow57, %.pre66, !dbg !112
  %.pre69 = zext i32 %.pre68 to i64, !dbg !112
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
  br i1 %20, label %top.L516_crit_edge, label %L72.preheader, !dbg !97

top.L516_crit_edge:                               ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
  %.pre71 = sext i32 %5 to i64, !dbg !113
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
  br label %L516, !dbg !97

L72.preheader:                                    ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:350 within `<=' @ int.jl:0
   %21 = icmp sgt i64 %.pre64, %6, !dbg !114
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:116 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl within `max'
          %22 = icmp sgt i64 %6, 0, !dbg !119
          %23 = select i1 %22, i64 %6, i64 0, !dbg !119
; └└└└└└└└
; ┌ @ int.jl within `+'
   %24 = add nsw i64 %14, -1, !dbg !138
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %25 = add nsw i64 %.pre64, -1, !dbg !139
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %26 = inttoptr i64 %1 to float addrspace(1)*, !dbg !144
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `*'
        %27 = mul nuw nsw i64 %14, 33, !dbg !156
; │││││└
; │││││┌ @ int.jl within `+'
        %28 = add nsw i64 %12, -34, !dbg !167
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl within `-'
          %29 = add nsw i64 %28, %27, !dbg !168
; │││││││└
; │││││││ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %30 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_285, i64 0, i64 %29, !dbg !179
         %31 = bitcast float addrspace(3)* %30 to i32 addrspace(3)*, !dbg !179
; └└└└└└└
  %32 = sext i32 %5 to i64, !dbg !112
  %33 = icmp sle i64 %.pre69, %32, !dbg !112
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %34 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_286, i64 0, i64 %29, !dbg !180
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl within `max'
          %35 = icmp sgt i64 %7, 0, !dbg !189
          %36 = select i1 %35, i64 %7, i64 0, !dbg !189
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl within `-'
         %37 = add nsw i64 %.pre69, -1, !dbg !199
; │││││└└
; │││││┌ @ int.jl within `*'
        %38 = mul nsw i64 %37, %36, !dbg !205
; └└└└└└
; ┌ @ int.jl within `+'
   %39 = add nsw i64 %12, -1, !dbg !206
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %40 = add nsw i64 %39, %38, !dbg !207
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %41 = inttoptr i64 %2 to float addrspace(1)*, !dbg !208
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %42 = bitcast float addrspace(3)* %34 to i32 addrspace(3)*, !dbg !214
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:135 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %43 = add nsw i64 %27, -34, !dbg !222
; └└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
  br label %L72, !dbg !118

L72:                                              ; preds = %L503, %L72.preheader
  %value_phi3 = phi float [ %76, %L503 ], [ 0.000000e+00, %L72.preheader ]
  %value_phi4 = phi i64 [ %80, %L503 ], [ 0, %L72.preheader ]
  %.pre73 = shl i64 %value_phi4, 5, !dbg !112
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %44 = add i64 %.pre73, %14, !dbg !231
; └
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %45 = icmp sgt i64 %44, %7, !dbg !232
; └
  %or.cond = or i1 %21, %45, !dbg !118
  br i1 %or.cond, label %L212, label %L95, !dbg !118

L95:                                              ; preds = %L72
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:116 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %46 = add i64 %24, %.pre73, !dbg !233
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %47 = mul i64 %46, %23, !dbg !235
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %48 = add i64 %25, %47, !dbg !236
; │││││││└
         %49 = getelementptr inbounds float, float addrspace(1)* %26, i64 %48, !dbg !237
         %50 = bitcast float addrspace(1)* %49 to i32 addrspace(1)*, !dbg !237
         %51 = load i32, i32 addrspace(1)* %50, align 4, !dbg !237, !tbaa !238
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i32 %51, i32 addrspace(3)* %31, align 4, !dbg !169, !tbaa !241
; └└└└└└└
  br label %L239, !dbg !137

L212:                                             ; preds = %L72
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store float 0.000000e+00, float addrspace(3)* %30, align 4, !dbg !243, !tbaa !241
; │└└└└└└
   br label %L239, !dbg !250

L239:                                             ; preds = %L212, %L95
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %52 = add i64 %.pre73, %12, !dbg !252
; └
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %53 = icmp sle i64 %52, %7, !dbg !254
; └
  %value_phi7.off0 = and i1 %33, %53, !dbg !253
  br i1 %value_phi7.off0, label %L251, label %L368, !dbg !253

L251:                                             ; preds = %L239
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %54 = add i64 %40, %.pre73, !dbg !256
; │││││││└
         %55 = getelementptr inbounds float, float addrspace(1)* %41, i64 %54, !dbg !257
         %56 = bitcast float addrspace(1)* %55 to i32 addrspace(1)*, !dbg !257
         %57 = load i32, i32 addrspace(1)* %56, align 4, !dbg !257, !tbaa !238
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i32 %57, i32 addrspace(3)* %42, align 4, !dbg !258, !tbaa !241
; └└└└└└└
  br label %L395, !dbg !198

L368:                                             ; preds = %L239
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store float 0.000000e+00, float addrspace(3)* %34, align 4, !dbg !259, !tbaa !241
; │└└└└└└
   br label %L395, !dbg !187

L395:                                             ; preds = %L368, %L251
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:127 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !260
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L397, !dbg !110

L397:                                             ; preds = %L397, %L395
   %value_phi8 = phi float [ %value_phi3, %L395 ], [ %76, %L397 ]
   %value_phi9 = phi i64 [ 1, %L395 ], [ %78, %L397 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:135 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %58 = mul nuw nsw i64 %value_phi9, 33, !dbg !264
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %59 = add i64 %28, %58, !dbg !265
; │││││││└
         %60 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_285, i64 0, i64 %59, !dbg !266
         %61 = load float, float addrspace(3)* %60, align 4, !dbg !266, !tbaa !241
; │││││││┌ @ int.jl:85 within `-'
          %62 = add i64 %43, %value_phi9, !dbg !265
; │││││││└
         %63 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_286, i64 0, i64 %62, !dbg !266
         %64 = load float, float addrspace(3)* %63, align 4, !dbg !266, !tbaa !241
; └└└└└└└
; ┌ @ float.jl:404 within `*'
   %65 = fmul float %61, %64, !dbg !272
; └
; ┌ @ float.jl:400 within `+'
   %66 = fadd float %value_phi8, %65, !dbg !275
; └
; ┌ @ range.jl:624 within `iterate'
   %67 = add nuw nsw i64 %value_phi9, 1, !dbg !277
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %68 = mul nuw nsw i64 %67, 33, !dbg !264
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %69 = add i64 %28, %68, !dbg !265
; │││││││└
         %70 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_285, i64 0, i64 %69, !dbg !266
         %71 = load float, float addrspace(3)* %70, align 4, !dbg !266, !tbaa !241
; │││││││┌ @ int.jl:85 within `-'
          %72 = add i64 %43, %67, !dbg !265
; │││││││└
         %73 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_286, i64 0, i64 %72, !dbg !266
         %74 = load float, float addrspace(3)* %73, align 4, !dbg !266, !tbaa !241
; └└└└└└└
; ┌ @ float.jl:404 within `*'
   %75 = fmul float %71, %74, !dbg !272
; └
; ┌ @ float.jl:400 within `+'
   %76 = fadd float %66, %75, !dbg !275
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %77 = icmp eq i64 %67, 32, !dbg !278
; │└
   %78 = add nuw nsw i64 %value_phi9, 2, !dbg !277
; └
  br i1 %77, label %L503, label %L397, !dbg !230

L503:                                             ; preds = %L397
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !280
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %79 = icmp eq i64 %value_phi4, %19, !dbg !282
; │└
   %80 = add i64 %value_phi4, 1, !dbg !283
; └
  br i1 %79, label %L516, label %L72, !dbg !281

L516:                                             ; preds = %L503, %top.L516_crit_edge
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
  %.pre-phi72 = phi i64 [ %.pre71, %top.L516_crit_edge ], [ %32, %L503 ], !dbg !113
  %value_phi18 = phi float [ 0.000000e+00, %top.L516_crit_edge ], [ %76, %L503 ]
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %81 = icmp sgt i64 %.pre64, %6, !dbg !284
; └
  %82 = icmp slt i64 %.pre-phi72, %.pre69, !dbg !113
  %value_phi19.off0 = or i1 %81, %82, !dbg !113
  br i1 %value_phi19.off0, label %L584, label %L553, !dbg !113

L553:                                             ; preds = %L516
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:145 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
          %83 = icmp sgt i64 %6, 0, !dbg !286
          %84 = select i1 %83, i64 %6, i64 0, !dbg !286
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %85 = add nsw i64 %.pre69, -1, !dbg !296
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %86 = mul nsw i64 %85, %84, !dbg !301
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %87 = add nsw i64 %.pre64, -1, !dbg !302
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %88 = add nsw i64 %87, %86, !dbg !303
; │││││││└
         %89 = inttoptr i64 %0 to float addrspace(1)*, !dbg !304
         %90 = getelementptr inbounds float, float addrspace(1)* %89, i64 %88, !dbg !304
         store float %value_phi18, float addrspace(1)* %90, align 4, !dbg !304, !tbaa !238
; │└└└└└└
   br label %L584, !dbg !294

L584:                                             ; preds = %L553, %L516
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
  ret void, !dbg !310
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
!10 = !{void (i64, i64, i64, i32, i32, i32)* @_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1_, !"kernel", i32 1}
!11 = distinct !DISubprogram(name: "coalesced_matmul_kernel!", linkageName: "julia_coalesced_matmul_kernel!_3546", scope: null, file: !3, line: 88, type: !12, scopeLine: 88, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
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
!36 = !DILocation(line: 92, scope: !11)
!37 = !DILocation(line: 627, scope: !14, inlinedAt: !38)
!38 = !DILocation(line: 708, scope: !17, inlinedAt: !39)
!39 = !DILocation(line: 648, scope: !19, inlinedAt: !40)
!40 = !DILocation(line: 621, scope: !22, inlinedAt: !41)
!41 = !DILocation(line: 1046, scope: !24, inlinedAt: !42)
!42 = !DILocation(line: 42, scope: !26, inlinedAt: !43)
!43 = !DILocation(line: 1046, scope: !29, inlinedAt: !44)
!44 = !DILocation(line: 837, scope: !31, inlinedAt: !45)
!45 = !DILocation(line: 48, scope: !33, inlinedAt: !46)
!46 = !DILocation(line: 38, scope: !33, inlinedAt: !47)
!47 = !DILocation(line: 94, scope: !11)
!48 = !DILocation(line: 80, scope: !49, inlinedAt: !51)
!49 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !50, file: !50, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!50 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl", directory: ".")
!51 = !DILocation(line: 7, scope: !52, inlinedAt: !54)
!52 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!53 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl", directory: ".")
!54 = !DILocation(line: 7, scope: !55, inlinedAt: !56)
!55 = distinct !DISubprogram(name: "_index;", linkageName: "_index", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 57, scope: !57, inlinedAt: !58)
!57 = distinct !DISubprogram(name: "blockIdx_x;", linkageName: "blockIdx_x", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 77, scope: !59, inlinedAt: !60)
!59 = distinct !DISubprogram(name: "blockIdx;", linkageName: "blockIdx", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 95, scope: !11)
!61 = !{i32 0, i32 2147483646}
!62 = !DILocation(line: 86, scope: !63, inlinedAt: !56)
!63 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!64 = !DIFile(filename: "int.jl", directory: ".")
!65 = !DILocation(line: 80, scope: !49, inlinedAt: !66)
!66 = !DILocation(line: 7, scope: !52, inlinedAt: !67)
!67 = !DILocation(line: 7, scope: !55, inlinedAt: !68)
!68 = !DILocation(line: 57, scope: !69, inlinedAt: !70)
!69 = distinct !DISubprogram(name: "blockIdx_y;", linkageName: "blockIdx_y", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!70 = !DILocation(line: 77, scope: !59, inlinedAt: !71)
!71 = !DILocation(line: 96, scope: !11)
!72 = !{i32 0, i32 65534}
!73 = !DILocation(line: 80, scope: !49, inlinedAt: !74)
!74 = !DILocation(line: 7, scope: !52, inlinedAt: !75)
!75 = !DILocation(line: 7, scope: !55, inlinedAt: !76)
!76 = !DILocation(line: 47, scope: !77, inlinedAt: !78)
!77 = distinct !DISubprogram(name: "threadIdx_x;", linkageName: "threadIdx_x", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 91, scope: !79, inlinedAt: !80)
!79 = distinct !DISubprogram(name: "threadIdx;", linkageName: "threadIdx", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 97, scope: !11)
!81 = !{i32 0, i32 1023}
!82 = !DILocation(line: 86, scope: !63, inlinedAt: !76)
!83 = !DILocation(line: 80, scope: !49, inlinedAt: !84)
!84 = !DILocation(line: 7, scope: !52, inlinedAt: !85)
!85 = !DILocation(line: 7, scope: !55, inlinedAt: !86)
!86 = !DILocation(line: 47, scope: !87, inlinedAt: !88)
!87 = distinct !DISubprogram(name: "threadIdx_y;", linkageName: "threadIdx_y", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 91, scope: !79, inlinedAt: !89)
!89 = !DILocation(line: 98, scope: !11)
!90 = !DILocation(line: 86, scope: !63, inlinedAt: !86)
!91 = !DILocation(line: 85, scope: !92, inlinedAt: !93)
!92 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 106, scope: !11)
!94 = !DILocation(line: 260, scope: !95, inlinedAt: !93)
!95 = distinct !DISubprogram(name: "div;", linkageName: "div", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 85, scope: !92, inlinedAt: !97)
!97 = !DILocation(line: 109, scope: !11)
!98 = !DILocation(line: 441, scope: !99, inlinedAt: !100)
!99 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!100 = !DILocation(line: 350, scope: !101, inlinedAt: !103)
!101 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !102, file: !102, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!102 = !DIFile(filename: "operators.jl", directory: ".")
!103 = !DILocation(line: 285, scope: !104, inlinedAt: !106)
!104 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !105, file: !105, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!105 = !DIFile(filename: "range.jl", directory: ".")
!106 = !DILocation(line: 280, scope: !107, inlinedAt: !108)
!107 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !105, file: !105, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!108 = !DILocation(line: 5, scope: !109, inlinedAt: !97)
!109 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !105, file: !105, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!110 = !DILocation(line: 620, scope: !111, inlinedAt: !97)
!111 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !105, file: !105, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!112 = !DILocation(line: 0, scope: !11)
!113 = !DILocation(line: 144, scope: !11)
!114 = !DILocation(line: 0, scope: !99, inlinedAt: !115)
!115 = !DILocation(line: 350, scope: !116, inlinedAt: !118)
!116 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !117, file: !117, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!117 = !DIFile(filename: "promotion.jl", directory: ".")
!118 = !DILocation(line: 115, scope: !11)
!119 = !DILocation(line: 0, scope: !120, inlinedAt: !121)
!120 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !117, file: !117, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!121 = !DILocation(line: 317, scope: !122, inlinedAt: !123)
!122 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !105, file: !105, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!123 = !DILocation(line: 326, scope: !122, inlinedAt: !124)
!124 = !DILocation(line: 158, scope: !125, inlinedAt: !127)
!125 = distinct !DISubprogram(name: "map;", linkageName: "map", scope: !126, file: !126, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!126 = !DIFile(filename: "tuple.jl", directory: ".")
!127 = !DILocation(line: 75, scope: !128, inlinedAt: !129)
!128 = distinct !DISubprogram(name: "axes;", linkageName: "axes", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!129 = !DILocation(line: 1879, scope: !130, inlinedAt: !131)
!130 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!131 = !DILocation(line: 1089, scope: !132, inlinedAt: !133)
!132 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!133 = !DILocation(line: 1083, scope: !134, inlinedAt: !135)
!134 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!135 = !DILocation(line: 1060, scope: !136, inlinedAt: !137)
!136 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!137 = !DILocation(line: 116, scope: !11)
!138 = !DILocation(line: 0, scope: !63, inlinedAt: !137)
!139 = !DILocation(line: 0, scope: !63, inlinedAt: !140)
!140 = !DILocation(line: 1911, scope: !141, inlinedAt: !142)
!141 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!142 = !DILocation(line: 1911, scope: !141, inlinedAt: !143)
!143 = !DILocation(line: 1895, scope: !130, inlinedAt: !129)
!144 = !DILocation(line: 0, scope: !49, inlinedAt: !145)
!145 = !DILocation(line: 7, scope: !146, inlinedAt: !148)
!146 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !147, file: !147, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!147 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl", directory: ".")
!148 = !DILocation(line: 7, scope: !149, inlinedAt: !150)
!149 = distinct !DISubprogram(name: "pointerref;", linkageName: "pointerref", scope: !147, file: !147, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!150 = !DILocation(line: 79, scope: !151, inlinedAt: !152)
!151 = distinct !DISubprogram(name: "unsafe_load;", linkageName: "unsafe_load", scope: !147, file: !147, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!152 = !DILocation(line: 80, scope: !153, inlinedAt: !154)
!153 = distinct !DISubprogram(name: "arrayref;", linkageName: "arrayref", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!154 = !DILocation(line: 99, scope: !155, inlinedAt: !133)
!155 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!156 = !DILocation(line: 0, scope: !157, inlinedAt: !158)
!157 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!158 = !DILocation(line: 1911, scope: !141, inlinedAt: !159)
!159 = !DILocation(line: 1911, scope: !141, inlinedAt: !160)
!160 = !DILocation(line: 1895, scope: !130, inlinedAt: !161)
!161 = !DILocation(line: 1879, scope: !130, inlinedAt: !162)
!162 = !DILocation(line: 1089, scope: !132, inlinedAt: !163)
!163 = !DILocation(line: 1176, scope: !164, inlinedAt: !165)
!164 = distinct !DISubprogram(name: "_setindex!;", linkageName: "_setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!165 = !DILocation(line: 1153, scope: !166, inlinedAt: !137)
!166 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!167 = !DILocation(line: 0, scope: !63, inlinedAt: !158)
!168 = !DILocation(line: 0, scope: !92, inlinedAt: !169)
!169 = !DILocation(line: 80, scope: !49, inlinedAt: !170)
!170 = !DILocation(line: 42, scope: !146, inlinedAt: !171)
!171 = !DILocation(line: 42, scope: !172, inlinedAt: !173)
!172 = distinct !DISubprogram(name: "pointerset;", linkageName: "pointerset", scope: !147, file: !147, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!173 = !DILocation(line: 82, scope: !174, inlinedAt: !175)
!174 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !147, file: !147, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!175 = !DILocation(line: 86, scope: !176, inlinedAt: !177)
!176 = distinct !DISubprogram(name: "arrayset;", linkageName: "arrayset", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!177 = !DILocation(line: 101, scope: !178, inlinedAt: !163)
!178 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!179 = !DILocation(line: 0, scope: !49, inlinedAt: !170)
!180 = !DILocation(line: 0, scope: !49, inlinedAt: !181)
!181 = !DILocation(line: 42, scope: !146, inlinedAt: !182)
!182 = !DILocation(line: 42, scope: !172, inlinedAt: !183)
!183 = !DILocation(line: 82, scope: !174, inlinedAt: !184)
!184 = !DILocation(line: 86, scope: !176, inlinedAt: !185)
!185 = !DILocation(line: 101, scope: !178, inlinedAt: !186)
!186 = !DILocation(line: 1176, scope: !164, inlinedAt: !187)
!187 = !DILocation(line: 1153, scope: !166, inlinedAt: !188)
!188 = !DILocation(line: 123, scope: !11)
!189 = !DILocation(line: 0, scope: !120, inlinedAt: !190)
!190 = !DILocation(line: 317, scope: !122, inlinedAt: !191)
!191 = !DILocation(line: 326, scope: !122, inlinedAt: !192)
!192 = !DILocation(line: 158, scope: !125, inlinedAt: !193)
!193 = !DILocation(line: 75, scope: !128, inlinedAt: !194)
!194 = !DILocation(line: 1879, scope: !130, inlinedAt: !195)
!195 = !DILocation(line: 1089, scope: !132, inlinedAt: !196)
!196 = !DILocation(line: 1083, scope: !134, inlinedAt: !197)
!197 = !DILocation(line: 1060, scope: !136, inlinedAt: !198)
!198 = !DILocation(line: 121, scope: !11)
!199 = !DILocation(line: 0, scope: !92, inlinedAt: !200)
!200 = !DILocation(line: 1918, scope: !201, inlinedAt: !202)
!201 = distinct !DISubprogram(name: "offsetin;", linkageName: "offsetin", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!202 = !DILocation(line: 1911, scope: !141, inlinedAt: !203)
!203 = !DILocation(line: 1911, scope: !141, inlinedAt: !204)
!204 = !DILocation(line: 1895, scope: !130, inlinedAt: !194)
!205 = !DILocation(line: 0, scope: !157, inlinedAt: !202)
!206 = !DILocation(line: 0, scope: !63, inlinedAt: !198)
!207 = !DILocation(line: 0, scope: !63, inlinedAt: !202)
!208 = !DILocation(line: 0, scope: !49, inlinedAt: !209)
!209 = !DILocation(line: 7, scope: !146, inlinedAt: !210)
!210 = !DILocation(line: 7, scope: !149, inlinedAt: !211)
!211 = !DILocation(line: 79, scope: !151, inlinedAt: !212)
!212 = !DILocation(line: 80, scope: !153, inlinedAt: !213)
!213 = !DILocation(line: 99, scope: !155, inlinedAt: !196)
!214 = !DILocation(line: 0, scope: !49, inlinedAt: !215)
!215 = !DILocation(line: 42, scope: !146, inlinedAt: !216)
!216 = !DILocation(line: 42, scope: !172, inlinedAt: !217)
!217 = !DILocation(line: 82, scope: !174, inlinedAt: !218)
!218 = !DILocation(line: 86, scope: !176, inlinedAt: !219)
!219 = !DILocation(line: 101, scope: !178, inlinedAt: !220)
!220 = !DILocation(line: 1176, scope: !164, inlinedAt: !221)
!221 = !DILocation(line: 1153, scope: !166, inlinedAt: !198)
!222 = !DILocation(line: 0, scope: !63, inlinedAt: !223)
!223 = !DILocation(line: 1911, scope: !141, inlinedAt: !224)
!224 = !DILocation(line: 1911, scope: !141, inlinedAt: !225)
!225 = !DILocation(line: 1895, scope: !130, inlinedAt: !226)
!226 = !DILocation(line: 1879, scope: !130, inlinedAt: !227)
!227 = !DILocation(line: 1089, scope: !132, inlinedAt: !228)
!228 = !DILocation(line: 1083, scope: !134, inlinedAt: !229)
!229 = !DILocation(line: 1060, scope: !136, inlinedAt: !230)
!230 = !DILocation(line: 135, scope: !11)
!231 = !DILocation(line: 86, scope: !63, inlinedAt: !118)
!232 = !DILocation(line: 441, scope: !99, inlinedAt: !115)
!233 = !DILocation(line: 85, scope: !92, inlinedAt: !234)
!234 = !DILocation(line: 1918, scope: !201, inlinedAt: !140)
!235 = !DILocation(line: 87, scope: !157, inlinedAt: !140)
!236 = !DILocation(line: 85, scope: !92, inlinedAt: !237)
!237 = !DILocation(line: 80, scope: !49, inlinedAt: !145)
!238 = !{!239, !239, i64 0, i64 0}
!239 = !{!"custom_tbaa_addrspace(1)", !240, i64 0}
!240 = !{!"custom_tbaa"}
!241 = !{!242, !242, i64 0, i64 0}
!242 = !{!"custom_tbaa_addrspace(3)", !240, i64 0}
!243 = !DILocation(line: 80, scope: !49, inlinedAt: !244)
!244 = !DILocation(line: 42, scope: !146, inlinedAt: !245)
!245 = !DILocation(line: 42, scope: !172, inlinedAt: !246)
!246 = !DILocation(line: 82, scope: !174, inlinedAt: !247)
!247 = !DILocation(line: 86, scope: !176, inlinedAt: !248)
!248 = !DILocation(line: 101, scope: !178, inlinedAt: !249)
!249 = !DILocation(line: 1176, scope: !164, inlinedAt: !250)
!250 = !DILocation(line: 1153, scope: !166, inlinedAt: !251)
!251 = !DILocation(line: 118, scope: !11)
!252 = !DILocation(line: 86, scope: !63, inlinedAt: !253)
!253 = !DILocation(line: 120, scope: !11)
!254 = !DILocation(line: 441, scope: !99, inlinedAt: !255)
!255 = !DILocation(line: 350, scope: !116, inlinedAt: !253)
!256 = !DILocation(line: 85, scope: !92, inlinedAt: !257)
!257 = !DILocation(line: 80, scope: !49, inlinedAt: !209)
!258 = !DILocation(line: 80, scope: !49, inlinedAt: !215)
!259 = !DILocation(line: 80, scope: !49, inlinedAt: !181)
!260 = !DILocation(line: 14, scope: !261, inlinedAt: !263)
!261 = distinct !DISubprogram(name: "sync_threads;", linkageName: "sync_threads", scope: !262, file: !262, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!262 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl", directory: ".")
!263 = !DILocation(line: 127, scope: !11)
!264 = !DILocation(line: 87, scope: !157, inlinedAt: !223)
!265 = !DILocation(line: 85, scope: !92, inlinedAt: !266)
!266 = !DILocation(line: 80, scope: !49, inlinedAt: !267)
!267 = !DILocation(line: 7, scope: !146, inlinedAt: !268)
!268 = !DILocation(line: 7, scope: !149, inlinedAt: !269)
!269 = !DILocation(line: 79, scope: !151, inlinedAt: !270)
!270 = !DILocation(line: 80, scope: !153, inlinedAt: !271)
!271 = !DILocation(line: 99, scope: !155, inlinedAt: !228)
!272 = !DILocation(line: 404, scope: !273, inlinedAt: !230)
!273 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !274, file: !274, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!274 = !DIFile(filename: "float.jl", directory: ".")
!275 = !DILocation(line: 400, scope: !276, inlinedAt: !230)
!276 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !274, file: !274, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!277 = !DILocation(line: 624, scope: !111, inlinedAt: !230)
!278 = !DILocation(line: 398, scope: !279, inlinedAt: !277)
!279 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !117, file: !117, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!280 = !DILocation(line: 14, scope: !261, inlinedAt: !281)
!281 = !DILocation(line: 138, scope: !11)
!282 = !DILocation(line: 398, scope: !279, inlinedAt: !283)
!283 = !DILocation(line: 624, scope: !111, inlinedAt: !281)
!284 = !DILocation(line: 441, scope: !99, inlinedAt: !285)
!285 = !DILocation(line: 350, scope: !116, inlinedAt: !113)
!286 = !DILocation(line: 409, scope: !120, inlinedAt: !287)
!287 = !DILocation(line: 317, scope: !122, inlinedAt: !288)
!288 = !DILocation(line: 326, scope: !122, inlinedAt: !289)
!289 = !DILocation(line: 158, scope: !125, inlinedAt: !290)
!290 = !DILocation(line: 75, scope: !128, inlinedAt: !291)
!291 = !DILocation(line: 1879, scope: !130, inlinedAt: !292)
!292 = !DILocation(line: 1089, scope: !132, inlinedAt: !293)
!293 = !DILocation(line: 1176, scope: !164, inlinedAt: !294)
!294 = !DILocation(line: 1153, scope: !166, inlinedAt: !295)
!295 = !DILocation(line: 145, scope: !11)
!296 = !DILocation(line: 85, scope: !92, inlinedAt: !297)
!297 = !DILocation(line: 1918, scope: !201, inlinedAt: !298)
!298 = !DILocation(line: 1911, scope: !141, inlinedAt: !299)
!299 = !DILocation(line: 1911, scope: !141, inlinedAt: !300)
!300 = !DILocation(line: 1895, scope: !130, inlinedAt: !291)
!301 = !DILocation(line: 87, scope: !157, inlinedAt: !298)
!302 = !DILocation(line: 86, scope: !63, inlinedAt: !298)
!303 = !DILocation(line: 85, scope: !92, inlinedAt: !304)
!304 = !DILocation(line: 80, scope: !49, inlinedAt: !305)
!305 = !DILocation(line: 42, scope: !146, inlinedAt: !306)
!306 = !DILocation(line: 42, scope: !172, inlinedAt: !307)
!307 = !DILocation(line: 82, scope: !174, inlinedAt: !308)
!308 = !DILocation(line: 86, scope: !176, inlinedAt: !309)
!309 = !DILocation(line: 101, scope: !178, inlinedAt: !293)
!310 = !DILocation(line: 147, scope: !11)
