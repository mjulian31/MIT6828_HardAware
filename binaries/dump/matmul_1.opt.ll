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
     %narrow58 = add nuw nsw i32 %11, 1, !dbg !82
     %12 = zext i32 %narrow58 to i64, !dbg !82
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !83, !range !81
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow59 = add nuw nsw i32 %13, 1, !dbg !90
     %14 = zext i32 %narrow59 to i64, !dbg !90
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:106 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:922 within `+' @ int.jl:86
   %15 = add nsw i64 %7, 32, !dbg !91
; └
; ┌ @ promotion.jl:352 within `rem' @ int.jl:261
   %16 = srem i64 %7, 32, !dbg !94
; └
; ┌ @ int.jl:85 within `-'
   %17 = sub nsw i64 %15, %16, !dbg !99
; └
; ┌ @ int.jl:260 within `div'
   %18 = sdiv i64 %17, 32, !dbg !101
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %19 = add nsw i64 %18, -1, !dbg !103
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:280 within `UnitRange'
; ││┌ @ range.jl:285 within `unitrange_last'
; │││┌ @ operators.jl:350 within `>='
; ││││┌ @ int.jl:441 within `<='
       %20 = icmp slt i64 %17, 32, !dbg !105
; │││└└
     %21 = select i1 %20, i64 -1, i64 %19, !dbg !110
; └└└
; ┌ @ range.jl:620 within `iterate'
   %22 = icmp slt i64 %21, 0, !dbg !117
; └
  %.pre62 = shl nuw nsw i64 %9, 5, !dbg !119
  %.pre64 = add nsw i64 %12, -32, !dbg !119
  %.pre66 = add nsw i64 %.pre64, %.pre62, !dbg !119
  %.pre68 = shl nuw nsw i32 %10, 5, !dbg !119
  %.pre70 = add nuw nsw i32 %narrow59, %.pre68, !dbg !119
  %.pre71 = zext i32 %.pre70 to i64, !dbg !119
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
  br i1 %22, label %top.L518_crit_edge, label %L74.preheader, !dbg !104

top.L518_crit_edge:                               ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
  %.pre73 = sext i32 %5 to i64, !dbg !120
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
  br label %L518, !dbg !104

L74.preheader:                                    ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:350 within `<=' @ int.jl:0
   %23 = icmp sgt i64 %.pre66, %6, !dbg !121
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
          %24 = icmp sgt i64 %6, 0, !dbg !125
          %25 = select i1 %24, i64 %6, i64 0, !dbg !125
; └└└└└└└└
; ┌ @ int.jl within `+'
   %26 = add nsw i64 %14, -1, !dbg !144
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %27 = add nsw i64 %.pre66, -1, !dbg !145
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %28 = inttoptr i64 %1 to float addrspace(1)*, !dbg !150
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `*'
        %29 = mul nuw nsw i64 %14, 33, !dbg !162
; │││││└
; │││││┌ @ int.jl within `+'
        %30 = add nsw i64 %12, -34, !dbg !173
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl within `-'
          %31 = add nsw i64 %30, %29, !dbg !174
; │││││││└
; │││││││ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %32 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_285, i64 0, i64 %31, !dbg !185
         %33 = bitcast float addrspace(3)* %32 to i32 addrspace(3)*, !dbg !185
; └└└└└└└
  %34 = sext i32 %5 to i64, !dbg !119
  %35 = icmp sle i64 %.pre71, %34, !dbg !119
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %36 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_286, i64 0, i64 %31, !dbg !186
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
          %37 = icmp sgt i64 %7, 0, !dbg !195
          %38 = select i1 %37, i64 %7, i64 0, !dbg !195
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl within `-'
         %39 = add nsw i64 %.pre71, -1, !dbg !205
; │││││└└
; │││││┌ @ int.jl within `*'
        %40 = mul nsw i64 %39, %38, !dbg !211
; └└└└└└
; ┌ @ int.jl within `+'
   %41 = add nsw i64 %12, -1, !dbg !212
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %42 = add nsw i64 %41, %40, !dbg !213
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %43 = inttoptr i64 %2 to float addrspace(1)*, !dbg !214
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %44 = bitcast float addrspace(3)* %36 to i32 addrspace(3)*, !dbg !220
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:135 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %45 = add nsw i64 %29, -34, !dbg !228
; └└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
  br label %L74, !dbg !124

L74:                                              ; preds = %L505, %L74.preheader
  %value_phi5 = phi float [ %78, %L505 ], [ 0.000000e+00, %L74.preheader ]
  %value_phi6 = phi i64 [ %82, %L505 ], [ 0, %L74.preheader ]
  %.pre75 = shl i64 %value_phi6, 5, !dbg !119
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:115 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %46 = add i64 %.pre75, %14, !dbg !237
; └
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %47 = icmp sgt i64 %46, %7, !dbg !238
; └
  %or.cond = or i1 %23, %47, !dbg !124
  br i1 %or.cond, label %L214, label %L97, !dbg !124

L97:                                              ; preds = %L74
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:116 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %48 = add i64 %26, %.pre75, !dbg !239
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %49 = mul i64 %48, %25, !dbg !241
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %50 = add i64 %27, %49, !dbg !242
; │││││││└
         %51 = getelementptr inbounds float, float addrspace(1)* %28, i64 %50, !dbg !243
         %52 = bitcast float addrspace(1)* %51 to i32 addrspace(1)*, !dbg !243
         %53 = load i32, i32 addrspace(1)* %52, align 4, !dbg !243, !tbaa !244
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i32 %53, i32 addrspace(3)* %33, align 4, !dbg !175, !tbaa !247
; └└└└└└└
  br label %L241, !dbg !143

L214:                                             ; preds = %L74
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store float 0.000000e+00, float addrspace(3)* %32, align 4, !dbg !249, !tbaa !247
; │└└└└└└
   br label %L241, !dbg !256

L241:                                             ; preds = %L214, %L97
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:120 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %54 = add i64 %.pre75, %12, !dbg !258
; └
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %55 = icmp sle i64 %54, %7, !dbg !260
; └
  %value_phi9.off0 = and i1 %35, %55, !dbg !259
  br i1 %value_phi9.off0, label %L253, label %L370, !dbg !259

L253:                                             ; preds = %L241
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %56 = add i64 %42, %.pre75, !dbg !262
; │││││││└
         %57 = getelementptr inbounds float, float addrspace(1)* %43, i64 %56, !dbg !263
         %58 = bitcast float addrspace(1)* %57 to i32 addrspace(1)*, !dbg !263
         %59 = load i32, i32 addrspace(1)* %58, align 4, !dbg !263, !tbaa !244
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i32 %59, i32 addrspace(3)* %44, align 4, !dbg !264, !tbaa !247
; └└└└└└└
  br label %L397, !dbg !204

L370:                                             ; preds = %L241
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store float 0.000000e+00, float addrspace(3)* %36, align 4, !dbg !265, !tbaa !247
; │└└└└└└
   br label %L397, !dbg !193

L397:                                             ; preds = %L370, %L253
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:127 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !266
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L399, !dbg !117

L399:                                             ; preds = %L399, %L397
   %value_phi10 = phi float [ %value_phi5, %L397 ], [ %78, %L399 ]
   %value_phi11 = phi i64 [ 1, %L397 ], [ %80, %L399 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:135 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %60 = mul nuw nsw i64 %value_phi11, 33, !dbg !270
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %61 = add i64 %30, %60, !dbg !271
; │││││││└
         %62 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_285, i64 0, i64 %61, !dbg !272
         %63 = load float, float addrspace(3)* %62, align 4, !dbg !272, !tbaa !247
; │││││││┌ @ int.jl:85 within `-'
          %64 = add i64 %45, %value_phi11, !dbg !271
; │││││││└
         %65 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_286, i64 0, i64 %64, !dbg !272
         %66 = load float, float addrspace(3)* %65, align 4, !dbg !272, !tbaa !247
; └└└└└└└
; ┌ @ float.jl:404 within `*'
   %67 = fmul float %63, %66, !dbg !278
; └
; ┌ @ float.jl:400 within `+'
   %68 = fadd float %value_phi10, %67, !dbg !281
; └
; ┌ @ range.jl:624 within `iterate'
   %69 = add nuw nsw i64 %value_phi11, 1, !dbg !283
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %70 = mul nuw nsw i64 %69, 33, !dbg !270
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %71 = add i64 %30, %70, !dbg !271
; │││││││└
         %72 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_285, i64 0, i64 %71, !dbg !272
         %73 = load float, float addrspace(3)* %72, align 4, !dbg !272, !tbaa !247
; │││││││┌ @ int.jl:85 within `-'
          %74 = add i64 %45, %69, !dbg !271
; │││││││└
         %75 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_286, i64 0, i64 %74, !dbg !272
         %76 = load float, float addrspace(3)* %75, align 4, !dbg !272, !tbaa !247
; └└└└└└└
; ┌ @ float.jl:404 within `*'
   %77 = fmul float %73, %76, !dbg !278
; └
; ┌ @ float.jl:400 within `+'
   %78 = fadd float %68, %77, !dbg !281
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %79 = icmp eq i64 %69, 32, !dbg !284
; │└
   %80 = add nuw nsw i64 %value_phi11, 2, !dbg !283
; └
  br i1 %79, label %L505, label %L399, !dbg !236

L505:                                             ; preds = %L399
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !286
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %81 = icmp eq i64 %value_phi6, %21, !dbg !288
; │└
   %82 = add i64 %value_phi6, 1, !dbg !289
; └
  br i1 %81, label %L518, label %L74, !dbg !287

L518:                                             ; preds = %L505, %top.L518_crit_edge
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:144 within `coalesced_matmul_kernel!'
  %.pre-phi74 = phi i64 [ %.pre73, %top.L518_crit_edge ], [ %34, %L505 ], !dbg !120
  %value_phi20 = phi float [ 0.000000e+00, %top.L518_crit_edge ], [ %78, %L505 ]
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %83 = icmp sgt i64 %.pre66, %6, !dbg !290
; └
  %84 = icmp slt i64 %.pre-phi74, %.pre71, !dbg !120
  %value_phi21.off0 = or i1 %83, %84, !dbg !120
  br i1 %value_phi21.off0, label %L586, label %L555, !dbg !120

L555:                                             ; preds = %L518
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:145 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
          %85 = icmp sgt i64 %6, 0, !dbg !292
          %86 = select i1 %85, i64 %6, i64 0, !dbg !292
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %87 = add nsw i64 %.pre71, -1, !dbg !302
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %88 = mul nsw i64 %87, %86, !dbg !307
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %89 = add nsw i64 %.pre66, -1, !dbg !308
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %90 = add nsw i64 %89, %88, !dbg !309
; │││││││└
         %91 = inttoptr i64 %0 to float addrspace(1)*, !dbg !310
         %92 = getelementptr inbounds float, float addrspace(1)* %91, i64 %90, !dbg !310
         store float %value_phi20, float addrspace(1)* %92, align 4, !dbg !310, !tbaa !244
; │└└└└└└
   br label %L586, !dbg !300

L586:                                             ; preds = %L555, %L518
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
  ret void, !dbg !316
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
!11 = distinct !DISubprogram(name: "coalesced_matmul_kernel!", linkageName: "julia_coalesced_matmul_kernel!_3454", scope: null, file: !3, line: 88, type: !12, scopeLine: 88, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
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
!91 = !DILocation(line: 86, scope: !63, inlinedAt: !92)
!92 = !DILocation(line: 922, scope: !63, inlinedAt: !93)
!93 = !DILocation(line: 106, scope: !11)
!94 = !DILocation(line: 261, scope: !95, inlinedAt: !96)
!95 = distinct !DISubprogram(name: "rem;", linkageName: "rem", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 352, scope: !97, inlinedAt: !93)
!97 = distinct !DISubprogram(name: "rem;", linkageName: "rem", scope: !98, file: !98, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!98 = !DIFile(filename: "promotion.jl", directory: ".")
!99 = !DILocation(line: 85, scope: !100, inlinedAt: !93)
!100 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!101 = !DILocation(line: 260, scope: !102, inlinedAt: !93)
!102 = distinct !DISubprogram(name: "div;", linkageName: "div", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!103 = !DILocation(line: 85, scope: !100, inlinedAt: !104)
!104 = !DILocation(line: 109, scope: !11)
!105 = !DILocation(line: 441, scope: !106, inlinedAt: !107)
!106 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!107 = !DILocation(line: 350, scope: !108, inlinedAt: !110)
!108 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !109, file: !109, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!109 = !DIFile(filename: "operators.jl", directory: ".")
!110 = !DILocation(line: 285, scope: !111, inlinedAt: !113)
!111 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !112, file: !112, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!112 = !DIFile(filename: "range.jl", directory: ".")
!113 = !DILocation(line: 280, scope: !114, inlinedAt: !115)
!114 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !112, file: !112, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!115 = !DILocation(line: 5, scope: !116, inlinedAt: !104)
!116 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !112, file: !112, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!117 = !DILocation(line: 620, scope: !118, inlinedAt: !104)
!118 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !112, file: !112, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!119 = !DILocation(line: 0, scope: !11)
!120 = !DILocation(line: 144, scope: !11)
!121 = !DILocation(line: 0, scope: !106, inlinedAt: !122)
!122 = !DILocation(line: 350, scope: !123, inlinedAt: !124)
!123 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !98, file: !98, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!124 = !DILocation(line: 115, scope: !11)
!125 = !DILocation(line: 0, scope: !126, inlinedAt: !127)
!126 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !98, file: !98, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!127 = !DILocation(line: 317, scope: !128, inlinedAt: !129)
!128 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !112, file: !112, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!129 = !DILocation(line: 326, scope: !128, inlinedAt: !130)
!130 = !DILocation(line: 158, scope: !131, inlinedAt: !133)
!131 = distinct !DISubprogram(name: "map;", linkageName: "map", scope: !132, file: !132, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!132 = !DIFile(filename: "tuple.jl", directory: ".")
!133 = !DILocation(line: 75, scope: !134, inlinedAt: !135)
!134 = distinct !DISubprogram(name: "axes;", linkageName: "axes", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!135 = !DILocation(line: 1879, scope: !136, inlinedAt: !137)
!136 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!137 = !DILocation(line: 1089, scope: !138, inlinedAt: !139)
!138 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!139 = !DILocation(line: 1083, scope: !140, inlinedAt: !141)
!140 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!141 = !DILocation(line: 1060, scope: !142, inlinedAt: !143)
!142 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!143 = !DILocation(line: 116, scope: !11)
!144 = !DILocation(line: 0, scope: !63, inlinedAt: !143)
!145 = !DILocation(line: 0, scope: !63, inlinedAt: !146)
!146 = !DILocation(line: 1911, scope: !147, inlinedAt: !148)
!147 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!148 = !DILocation(line: 1911, scope: !147, inlinedAt: !149)
!149 = !DILocation(line: 1895, scope: !136, inlinedAt: !135)
!150 = !DILocation(line: 0, scope: !49, inlinedAt: !151)
!151 = !DILocation(line: 7, scope: !152, inlinedAt: !154)
!152 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !153, file: !153, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!153 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl", directory: ".")
!154 = !DILocation(line: 7, scope: !155, inlinedAt: !156)
!155 = distinct !DISubprogram(name: "pointerref;", linkageName: "pointerref", scope: !153, file: !153, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!156 = !DILocation(line: 79, scope: !157, inlinedAt: !158)
!157 = distinct !DISubprogram(name: "unsafe_load;", linkageName: "unsafe_load", scope: !153, file: !153, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!158 = !DILocation(line: 80, scope: !159, inlinedAt: !160)
!159 = distinct !DISubprogram(name: "arrayref;", linkageName: "arrayref", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!160 = !DILocation(line: 99, scope: !161, inlinedAt: !139)
!161 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!162 = !DILocation(line: 0, scope: !163, inlinedAt: !164)
!163 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!164 = !DILocation(line: 1911, scope: !147, inlinedAt: !165)
!165 = !DILocation(line: 1911, scope: !147, inlinedAt: !166)
!166 = !DILocation(line: 1895, scope: !136, inlinedAt: !167)
!167 = !DILocation(line: 1879, scope: !136, inlinedAt: !168)
!168 = !DILocation(line: 1089, scope: !138, inlinedAt: !169)
!169 = !DILocation(line: 1176, scope: !170, inlinedAt: !171)
!170 = distinct !DISubprogram(name: "_setindex!;", linkageName: "_setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!171 = !DILocation(line: 1153, scope: !172, inlinedAt: !143)
!172 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!173 = !DILocation(line: 0, scope: !63, inlinedAt: !164)
!174 = !DILocation(line: 0, scope: !100, inlinedAt: !175)
!175 = !DILocation(line: 80, scope: !49, inlinedAt: !176)
!176 = !DILocation(line: 42, scope: !152, inlinedAt: !177)
!177 = !DILocation(line: 42, scope: !178, inlinedAt: !179)
!178 = distinct !DISubprogram(name: "pointerset;", linkageName: "pointerset", scope: !153, file: !153, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!179 = !DILocation(line: 82, scope: !180, inlinedAt: !181)
!180 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !153, file: !153, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!181 = !DILocation(line: 86, scope: !182, inlinedAt: !183)
!182 = distinct !DISubprogram(name: "arrayset;", linkageName: "arrayset", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!183 = !DILocation(line: 101, scope: !184, inlinedAt: !169)
!184 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!185 = !DILocation(line: 0, scope: !49, inlinedAt: !176)
!186 = !DILocation(line: 0, scope: !49, inlinedAt: !187)
!187 = !DILocation(line: 42, scope: !152, inlinedAt: !188)
!188 = !DILocation(line: 42, scope: !178, inlinedAt: !189)
!189 = !DILocation(line: 82, scope: !180, inlinedAt: !190)
!190 = !DILocation(line: 86, scope: !182, inlinedAt: !191)
!191 = !DILocation(line: 101, scope: !184, inlinedAt: !192)
!192 = !DILocation(line: 1176, scope: !170, inlinedAt: !193)
!193 = !DILocation(line: 1153, scope: !172, inlinedAt: !194)
!194 = !DILocation(line: 123, scope: !11)
!195 = !DILocation(line: 0, scope: !126, inlinedAt: !196)
!196 = !DILocation(line: 317, scope: !128, inlinedAt: !197)
!197 = !DILocation(line: 326, scope: !128, inlinedAt: !198)
!198 = !DILocation(line: 158, scope: !131, inlinedAt: !199)
!199 = !DILocation(line: 75, scope: !134, inlinedAt: !200)
!200 = !DILocation(line: 1879, scope: !136, inlinedAt: !201)
!201 = !DILocation(line: 1089, scope: !138, inlinedAt: !202)
!202 = !DILocation(line: 1083, scope: !140, inlinedAt: !203)
!203 = !DILocation(line: 1060, scope: !142, inlinedAt: !204)
!204 = !DILocation(line: 121, scope: !11)
!205 = !DILocation(line: 0, scope: !100, inlinedAt: !206)
!206 = !DILocation(line: 1918, scope: !207, inlinedAt: !208)
!207 = distinct !DISubprogram(name: "offsetin;", linkageName: "offsetin", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!208 = !DILocation(line: 1911, scope: !147, inlinedAt: !209)
!209 = !DILocation(line: 1911, scope: !147, inlinedAt: !210)
!210 = !DILocation(line: 1895, scope: !136, inlinedAt: !200)
!211 = !DILocation(line: 0, scope: !163, inlinedAt: !208)
!212 = !DILocation(line: 0, scope: !63, inlinedAt: !204)
!213 = !DILocation(line: 0, scope: !63, inlinedAt: !208)
!214 = !DILocation(line: 0, scope: !49, inlinedAt: !215)
!215 = !DILocation(line: 7, scope: !152, inlinedAt: !216)
!216 = !DILocation(line: 7, scope: !155, inlinedAt: !217)
!217 = !DILocation(line: 79, scope: !157, inlinedAt: !218)
!218 = !DILocation(line: 80, scope: !159, inlinedAt: !219)
!219 = !DILocation(line: 99, scope: !161, inlinedAt: !202)
!220 = !DILocation(line: 0, scope: !49, inlinedAt: !221)
!221 = !DILocation(line: 42, scope: !152, inlinedAt: !222)
!222 = !DILocation(line: 42, scope: !178, inlinedAt: !223)
!223 = !DILocation(line: 82, scope: !180, inlinedAt: !224)
!224 = !DILocation(line: 86, scope: !182, inlinedAt: !225)
!225 = !DILocation(line: 101, scope: !184, inlinedAt: !226)
!226 = !DILocation(line: 1176, scope: !170, inlinedAt: !227)
!227 = !DILocation(line: 1153, scope: !172, inlinedAt: !204)
!228 = !DILocation(line: 0, scope: !63, inlinedAt: !229)
!229 = !DILocation(line: 1911, scope: !147, inlinedAt: !230)
!230 = !DILocation(line: 1911, scope: !147, inlinedAt: !231)
!231 = !DILocation(line: 1895, scope: !136, inlinedAt: !232)
!232 = !DILocation(line: 1879, scope: !136, inlinedAt: !233)
!233 = !DILocation(line: 1089, scope: !138, inlinedAt: !234)
!234 = !DILocation(line: 1083, scope: !140, inlinedAt: !235)
!235 = !DILocation(line: 1060, scope: !142, inlinedAt: !236)
!236 = !DILocation(line: 135, scope: !11)
!237 = !DILocation(line: 86, scope: !63, inlinedAt: !124)
!238 = !DILocation(line: 441, scope: !106, inlinedAt: !122)
!239 = !DILocation(line: 85, scope: !100, inlinedAt: !240)
!240 = !DILocation(line: 1918, scope: !207, inlinedAt: !146)
!241 = !DILocation(line: 87, scope: !163, inlinedAt: !146)
!242 = !DILocation(line: 85, scope: !100, inlinedAt: !243)
!243 = !DILocation(line: 80, scope: !49, inlinedAt: !151)
!244 = !{!245, !245, i64 0, i64 0}
!245 = !{!"custom_tbaa_addrspace(1)", !246, i64 0}
!246 = !{!"custom_tbaa"}
!247 = !{!248, !248, i64 0, i64 0}
!248 = !{!"custom_tbaa_addrspace(3)", !246, i64 0}
!249 = !DILocation(line: 80, scope: !49, inlinedAt: !250)
!250 = !DILocation(line: 42, scope: !152, inlinedAt: !251)
!251 = !DILocation(line: 42, scope: !178, inlinedAt: !252)
!252 = !DILocation(line: 82, scope: !180, inlinedAt: !253)
!253 = !DILocation(line: 86, scope: !182, inlinedAt: !254)
!254 = !DILocation(line: 101, scope: !184, inlinedAt: !255)
!255 = !DILocation(line: 1176, scope: !170, inlinedAt: !256)
!256 = !DILocation(line: 1153, scope: !172, inlinedAt: !257)
!257 = !DILocation(line: 118, scope: !11)
!258 = !DILocation(line: 86, scope: !63, inlinedAt: !259)
!259 = !DILocation(line: 120, scope: !11)
!260 = !DILocation(line: 441, scope: !106, inlinedAt: !261)
!261 = !DILocation(line: 350, scope: !123, inlinedAt: !259)
!262 = !DILocation(line: 85, scope: !100, inlinedAt: !263)
!263 = !DILocation(line: 80, scope: !49, inlinedAt: !215)
!264 = !DILocation(line: 80, scope: !49, inlinedAt: !221)
!265 = !DILocation(line: 80, scope: !49, inlinedAt: !187)
!266 = !DILocation(line: 14, scope: !267, inlinedAt: !269)
!267 = distinct !DISubprogram(name: "sync_threads;", linkageName: "sync_threads", scope: !268, file: !268, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!268 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl", directory: ".")
!269 = !DILocation(line: 127, scope: !11)
!270 = !DILocation(line: 87, scope: !163, inlinedAt: !229)
!271 = !DILocation(line: 85, scope: !100, inlinedAt: !272)
!272 = !DILocation(line: 80, scope: !49, inlinedAt: !273)
!273 = !DILocation(line: 7, scope: !152, inlinedAt: !274)
!274 = !DILocation(line: 7, scope: !155, inlinedAt: !275)
!275 = !DILocation(line: 79, scope: !157, inlinedAt: !276)
!276 = !DILocation(line: 80, scope: !159, inlinedAt: !277)
!277 = !DILocation(line: 99, scope: !161, inlinedAt: !234)
!278 = !DILocation(line: 404, scope: !279, inlinedAt: !236)
!279 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !280, file: !280, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!280 = !DIFile(filename: "float.jl", directory: ".")
!281 = !DILocation(line: 400, scope: !282, inlinedAt: !236)
!282 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !280, file: !280, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!283 = !DILocation(line: 624, scope: !118, inlinedAt: !236)
!284 = !DILocation(line: 398, scope: !285, inlinedAt: !283)
!285 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !98, file: !98, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!286 = !DILocation(line: 14, scope: !267, inlinedAt: !287)
!287 = !DILocation(line: 138, scope: !11)
!288 = !DILocation(line: 398, scope: !285, inlinedAt: !289)
!289 = !DILocation(line: 624, scope: !118, inlinedAt: !287)
!290 = !DILocation(line: 441, scope: !106, inlinedAt: !291)
!291 = !DILocation(line: 350, scope: !123, inlinedAt: !120)
!292 = !DILocation(line: 409, scope: !126, inlinedAt: !293)
!293 = !DILocation(line: 317, scope: !128, inlinedAt: !294)
!294 = !DILocation(line: 326, scope: !128, inlinedAt: !295)
!295 = !DILocation(line: 158, scope: !131, inlinedAt: !296)
!296 = !DILocation(line: 75, scope: !134, inlinedAt: !297)
!297 = !DILocation(line: 1879, scope: !136, inlinedAt: !298)
!298 = !DILocation(line: 1089, scope: !138, inlinedAt: !299)
!299 = !DILocation(line: 1176, scope: !170, inlinedAt: !300)
!300 = !DILocation(line: 1153, scope: !172, inlinedAt: !301)
!301 = !DILocation(line: 145, scope: !11)
!302 = !DILocation(line: 85, scope: !100, inlinedAt: !303)
!303 = !DILocation(line: 1918, scope: !207, inlinedAt: !304)
!304 = !DILocation(line: 1911, scope: !147, inlinedAt: !305)
!305 = !DILocation(line: 1911, scope: !147, inlinedAt: !306)
!306 = !DILocation(line: 1895, scope: !136, inlinedAt: !297)
!307 = !DILocation(line: 87, scope: !163, inlinedAt: !304)
!308 = !DILocation(line: 86, scope: !63, inlinedAt: !304)
!309 = !DILocation(line: 85, scope: !100, inlinedAt: !310)
!310 = !DILocation(line: 80, scope: !49, inlinedAt: !311)
!311 = !DILocation(line: 42, scope: !152, inlinedAt: !312)
!312 = !DILocation(line: 42, scope: !178, inlinedAt: !313)
!313 = !DILocation(line: 82, scope: !180, inlinedAt: !314)
!314 = !DILocation(line: 86, scope: !182, inlinedAt: !315)
!315 = !DILocation(line: 101, scope: !184, inlinedAt: !299)
!316 = !DILocation(line: 147, scope: !11)
