; ModuleID = 'julia'
source_filename = "julia"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@__static_shmem_285 = internal unnamed_addr addrspace(3) global [1056 x double] zeroinitializer, align 32
@__static_shmem_286 = internal unnamed_addr addrspace(3) global [1056 x double] zeroinitializer, align 32

;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:89 within `coalesced_matmul_kernel!'
define dso_local ptx_kernel void @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_(i64, i64, i64, i32, i32, i32) local_unnamed_addr !dbg !11 {
top:
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
           %6 = sext i32 %3 to i64, !dbg !13
; └└└└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !37, !range !50
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow = add nuw nsw i32 %7, 1, !dbg !51
     %8 = zext i32 %narrow to i64, !dbg !51
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:97 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !54, !range !61
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !62, !range !70
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow59 = add nuw nsw i32 %10, 1, !dbg !71
     %11 = zext i32 %narrow59 to i64, !dbg !71
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !72, !range !70
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow60 = add nuw nsw i32 %12, 1, !dbg !79
     %13 = zext i32 %narrow60 to i64, !dbg !79
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:107 within `coalesced_matmul_kernel!'
; ┌ @ operators.jl:538 within `max' @ promotion.jl:409
; │┌ @ int.jl:82 within `<'
    %14 = icmp slt i32 %4, %3, !dbg !80
; │└
   %15 = select i1 %14, i32 %3, i32 %4, !dbg !82
; │┌ @ int.jl:82 within `<'
    %16 = icmp sgt i32 %15, %5, !dbg !80
; │└
   %17 = select i1 %16, i32 %15, i32 %5, !dbg !82
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:108 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:398 within `=='
   %18 = and i32 %17, 31, !dbg !89
   %19 = icmp eq i32 %18, 0, !dbg !89
; └
  %value_phi = select i1 %19, i64 0, i64 32, !dbg !91
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:920 within `+'
; │┌ @ int.jl:476 within `rem'
    %20 = sext i32 %17 to i64, !dbg !92
; │└
; │ @ int.jl:922 within `+' @ int.jl:86
   %21 = add nsw i64 %value_phi, %20, !dbg !96
; └
; ┌ @ int.jl:260 within `div'
   %22 = sdiv i64 %21, 32, !dbg !98
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %23 = add nsw i64 %22, -1, !dbg !100
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:280 within `UnitRange'
; ││┌ @ range.jl:285 within `unitrange_last'
; │││┌ @ operators.jl:350 within `>='
; ││││┌ @ int.jl:441 within `<='
       %24 = icmp slt i64 %21, 32, !dbg !103
; │││└└
     %25 = select i1 %24, i64 -1, i64 %23, !dbg !107
; └└└
; ┌ @ range.jl:620 within `iterate'
   %26 = icmp slt i64 %25, 0, !dbg !114
; └
  %.pre63 = shl nuw nsw i64 %8, 5, !dbg !116
  %.pre65 = add nsw i64 %11, -32, !dbg !116
  %.pre67 = add nsw i64 %.pre65, %.pre63, !dbg !116
  %.pre69 = shl nuw nsw i32 %9, 5, !dbg !116
  %.pre71 = add nuw nsw i32 %narrow60, %.pre69, !dbg !116
  %.pre72 = zext i32 %.pre71 to i64, !dbg !116
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
  br i1 %26, label %top.L525_crit_edge, label %L81.preheader, !dbg !102

top.L525_crit_edge:                               ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
  %.pre74 = sext i32 %5 to i64, !dbg !117
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
  br label %L525, !dbg !102

L81.preheader:                                    ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:350 within `<=' @ int.jl:0
   %27 = icmp sgt i64 %.pre67, %6, !dbg !118
; │ @ promotion.jl:350 within `<='
; │┌ @ promotion.jl:282 within `promote'
; ││┌ @ promotion.jl:259 within `_promote'
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:708 within `Int64'
; │││││┌ @ boot.jl within `toInt64'
        %28 = sext i32 %4 to i64, !dbg !122
; └└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:119 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl within `max'
          %29 = icmp sgt i64 %6, 0, !dbg !131
          %30 = select i1 %29, i64 %6, i64 0, !dbg !131
; └└└└└└└└
; ┌ @ int.jl within `+'
   %31 = add nsw i64 %13, -1, !dbg !149
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %32 = add nsw i64 %.pre67, -1, !dbg !150
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %33 = inttoptr i64 %1 to double addrspace(1)*, !dbg !155
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `*'
        %34 = mul nuw nsw i64 %13, 33, !dbg !167
; │││││└
; │││││┌ @ int.jl within `+'
        %35 = add nsw i64 %11, -34, !dbg !178
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl within `-'
          %36 = add nsw i64 %35, %34, !dbg !179
; │││││││└
; │││││││ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %37 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %36, !dbg !190
         %38 = bitcast double addrspace(3)* %37 to i64 addrspace(3)*, !dbg !190
; └└└└└└└
  %39 = sext i32 %5 to i64, !dbg !116
  %40 = icmp sle i64 %.pre72, %39, !dbg !116
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %41 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %36, !dbg !191
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:124 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl within `-'
         %42 = add nsw i64 %.pre72, -1, !dbg !200
; │││││└└
; │││││┌ @ int.jl within `*'
        %43 = mul nsw i64 %42, %30, !dbg !211
; └└└└└└
; ┌ @ int.jl within `+'
   %44 = add nsw i64 %11, -1, !dbg !212
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %45 = add nsw i64 %44, %43, !dbg !213
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %46 = inttoptr i64 %2 to double addrspace(1)*, !dbg !214
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %47 = bitcast double addrspace(3)* %41 to i64 addrspace(3)*, !dbg !220
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %48 = add nsw i64 %34, -34, !dbg !228
; └└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
  br label %L81, !dbg !121

L81:                                              ; preds = %L512, %L81.preheader
  %value_phi6 = phi double [ %81, %L512 ], [ 0.000000e+00, %L81.preheader ]
  %value_phi7 = phi i64 [ %85, %L512 ], [ 0, %L81.preheader ]
  %.pre76 = shl i64 %value_phi7, 5, !dbg !116
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %49 = add i64 %.pre76, %13, !dbg !237
; └
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %50 = icmp sgt i64 %49, %28, !dbg !238
; └
  %or.cond = or i1 %27, %50, !dbg !121
  br i1 %or.cond, label %L221, label %L104, !dbg !121

L104:                                             ; preds = %L81
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:119 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %51 = add i64 %31, %.pre76, !dbg !239
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %52 = mul i64 %51, %30, !dbg !241
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %53 = add i64 %32, %52, !dbg !242
; │││││││└
         %54 = getelementptr inbounds double, double addrspace(1)* %33, i64 %53, !dbg !243
         %55 = bitcast double addrspace(1)* %54 to i64 addrspace(1)*, !dbg !243
         %56 = load i64, i64 addrspace(1)* %55, align 8, !dbg !243, !tbaa !244
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i64 %56, i64 addrspace(3)* %38, align 8, !dbg !180, !tbaa !247
; └└└└└└└
  br label %L248, !dbg !148

L221:                                             ; preds = %L81
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store double 0.000000e+00, double addrspace(3)* %37, align 8, !dbg !249, !tbaa !247
; │└└└└└└
   br label %L248, !dbg !256

L248:                                             ; preds = %L221, %L104
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %57 = add i64 %.pre76, %11, !dbg !258
; └
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %58 = icmp sle i64 %57, %28, !dbg !260
; └
  %value_phi10.off0 = and i1 %40, %58, !dbg !259
  br i1 %value_phi10.off0, label %L260, label %L377, !dbg !259

L260:                                             ; preds = %L248
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:124 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %59 = add i64 %45, %.pre76, !dbg !262
; │││││││└
         %60 = getelementptr inbounds double, double addrspace(1)* %46, i64 %59, !dbg !263
         %61 = bitcast double addrspace(1)* %60 to i64 addrspace(1)*, !dbg !263
         %62 = load i64, i64 addrspace(1)* %61, align 8, !dbg !263, !tbaa !244
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i64 %62, i64 addrspace(3)* %47, align 8, !dbg !264, !tbaa !247
; └└└└└└└
  br label %L404, !dbg !210

L377:                                             ; preds = %L248
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store double 0.000000e+00, double addrspace(3)* %41, align 8, !dbg !265, !tbaa !247
; │└└└└└└
   br label %L404, !dbg !198

L404:                                             ; preds = %L377, %L260
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:130 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !266
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L406, !dbg !114

L406:                                             ; preds = %L406, %L404
   %value_phi11 = phi double [ %value_phi6, %L404 ], [ %81, %L406 ]
   %value_phi12 = phi i64 [ 1, %L404 ], [ %83, %L406 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %63 = mul nuw nsw i64 %value_phi12, 33, !dbg !270
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %64 = add i64 %35, %63, !dbg !271
; │││││││└
         %65 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %64, !dbg !272
         %66 = load double, double addrspace(3)* %65, align 8, !dbg !272, !tbaa !247
; │││││││┌ @ int.jl:85 within `-'
          %67 = add i64 %48, %value_phi12, !dbg !271
; │││││││└
         %68 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %67, !dbg !272
         %69 = load double, double addrspace(3)* %68, align 8, !dbg !272, !tbaa !247
; └└└└└└└
; ┌ @ float.jl:405 within `*'
   %70 = fmul double %66, %69, !dbg !278
; └
; ┌ @ float.jl:401 within `+'
   %71 = fadd double %value_phi11, %70, !dbg !281
; └
; ┌ @ range.jl:624 within `iterate'
   %72 = add nuw nsw i64 %value_phi12, 1, !dbg !283
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %73 = mul nuw nsw i64 %72, 33, !dbg !270
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %74 = add i64 %35, %73, !dbg !271
; │││││││└
         %75 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %74, !dbg !272
         %76 = load double, double addrspace(3)* %75, align 8, !dbg !272, !tbaa !247
; │││││││┌ @ int.jl:85 within `-'
          %77 = add i64 %48, %72, !dbg !271
; │││││││└
         %78 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %77, !dbg !272
         %79 = load double, double addrspace(3)* %78, align 8, !dbg !272, !tbaa !247
; └└└└└└└
; ┌ @ float.jl:405 within `*'
   %80 = fmul double %76, %79, !dbg !278
; └
; ┌ @ float.jl:401 within `+'
   %81 = fadd double %71, %80, !dbg !281
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %82 = icmp eq i64 %72, 32, !dbg !284
; │└
   %83 = add nuw nsw i64 %value_phi12, 2, !dbg !283
; └
  br i1 %82, label %L512, label %L406, !dbg !236

L512:                                             ; preds = %L406
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !285
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %84 = icmp eq i64 %value_phi7, %25, !dbg !287
; │└
   %85 = add i64 %value_phi7, 1, !dbg !288
; └
  br i1 %84, label %L525, label %L81, !dbg !286

L525:                                             ; preds = %L512, %top.L525_crit_edge
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
  %.pre-phi75 = phi i64 [ %.pre74, %top.L525_crit_edge ], [ %39, %L512 ], !dbg !117
  %value_phi21 = phi double [ 0.000000e+00, %top.L525_crit_edge ], [ %81, %L512 ]
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %86 = icmp sgt i64 %.pre67, %6, !dbg !289
; └
  %87 = icmp slt i64 %.pre-phi75, %.pre72, !dbg !117
  %value_phi22.off0 = or i1 %86, %87, !dbg !117
  br i1 %value_phi22.off0, label %L593, label %L562, !dbg !117

L562:                                             ; preds = %L525
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:148 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl:409 within `max'
          %88 = icmp sgt i64 %6, 0, !dbg !291
          %89 = select i1 %88, i64 %6, i64 0, !dbg !291
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %90 = add nsw i64 %.pre72, -1, !dbg !301
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %91 = mul nsw i64 %90, %89, !dbg !306
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %92 = add nsw i64 %.pre67, -1, !dbg !307
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %93 = add nsw i64 %92, %91, !dbg !308
; │││││││└
         %94 = inttoptr i64 %0 to double addrspace(1)*, !dbg !309
         %95 = getelementptr inbounds double, double addrspace(1)* %94, i64 %93, !dbg !309
         store double %value_phi21, double addrspace(1)* %95, align 8, !dbg !309, !tbaa !244
; │└└└└└└
   br label %L593, !dbg !299

L593:                                             ; preds = %L562, %L525
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:150 within `coalesced_matmul_kernel!'
  ret void, !dbg !315
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
!10 = !{void (i64, i64, i64, i32, i32, i32)* @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_, !"kernel", i32 1}
!11 = distinct !DISubprogram(name: "coalesced_matmul_kernel!", linkageName: "julia_coalesced_matmul_kernel!_3451", scope: null, file: !3, line: 89, type: !12, scopeLine: 89, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
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
!36 = !DILocation(line: 93, scope: !11)
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
!49 = !DILocation(line: 96, scope: !11)
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
!60 = !DILocation(line: 97, scope: !11)
!61 = !{i32 0, i32 65534}
!62 = !DILocation(line: 80, scope: !38, inlinedAt: !63)
!63 = !DILocation(line: 7, scope: !41, inlinedAt: !64)
!64 = !DILocation(line: 7, scope: !44, inlinedAt: !65)
!65 = !DILocation(line: 47, scope: !66, inlinedAt: !67)
!66 = distinct !DISubprogram(name: "threadIdx_x;", linkageName: "threadIdx_x", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 91, scope: !68, inlinedAt: !69)
!68 = distinct !DISubprogram(name: "threadIdx;", linkageName: "threadIdx", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 98, scope: !11)
!70 = !{i32 0, i32 1023}
!71 = !DILocation(line: 86, scope: !52, inlinedAt: !65)
!72 = !DILocation(line: 80, scope: !38, inlinedAt: !73)
!73 = !DILocation(line: 7, scope: !41, inlinedAt: !74)
!74 = !DILocation(line: 7, scope: !44, inlinedAt: !75)
!75 = !DILocation(line: 47, scope: !76, inlinedAt: !77)
!76 = distinct !DISubprogram(name: "threadIdx_y;", linkageName: "threadIdx_y", scope: !42, file: !42, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 91, scope: !68, inlinedAt: !78)
!78 = !DILocation(line: 99, scope: !11)
!79 = !DILocation(line: 86, scope: !52, inlinedAt: !75)
!80 = !DILocation(line: 82, scope: !81, inlinedAt: !82)
!81 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 409, scope: !83, inlinedAt: !85)
!83 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !84, file: !84, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!84 = !DIFile(filename: "promotion.jl", directory: ".")
!85 = !DILocation(line: 538, scope: !86, inlinedAt: !88)
!86 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !87, file: !87, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!87 = !DIFile(filename: "operators.jl", directory: ".")
!88 = !DILocation(line: 107, scope: !11)
!89 = !DILocation(line: 398, scope: !90, inlinedAt: !91)
!90 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !84, file: !84, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!91 = !DILocation(line: 108, scope: !11)
!92 = !DILocation(line: 476, scope: !93, inlinedAt: !94)
!93 = distinct !DISubprogram(name: "rem;", linkageName: "rem", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!94 = !DILocation(line: 920, scope: !52, inlinedAt: !95)
!95 = !DILocation(line: 109, scope: !11)
!96 = !DILocation(line: 86, scope: !52, inlinedAt: !97)
!97 = !DILocation(line: 922, scope: !52, inlinedAt: !95)
!98 = !DILocation(line: 260, scope: !99, inlinedAt: !95)
!99 = distinct !DISubprogram(name: "div;", linkageName: "div", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!100 = !DILocation(line: 85, scope: !101, inlinedAt: !102)
!101 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!102 = !DILocation(line: 112, scope: !11)
!103 = !DILocation(line: 441, scope: !104, inlinedAt: !105)
!104 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!105 = !DILocation(line: 350, scope: !106, inlinedAt: !107)
!106 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !87, file: !87, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!107 = !DILocation(line: 285, scope: !108, inlinedAt: !110)
!108 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !109, file: !109, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!109 = !DIFile(filename: "range.jl", directory: ".")
!110 = !DILocation(line: 280, scope: !111, inlinedAt: !112)
!111 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !109, file: !109, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!112 = !DILocation(line: 5, scope: !113, inlinedAt: !102)
!113 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !109, file: !109, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!114 = !DILocation(line: 620, scope: !115, inlinedAt: !102)
!115 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !109, file: !109, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!116 = !DILocation(line: 0, scope: !11)
!117 = !DILocation(line: 147, scope: !11)
!118 = !DILocation(line: 0, scope: !104, inlinedAt: !119)
!119 = !DILocation(line: 350, scope: !120, inlinedAt: !121)
!120 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !84, file: !84, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!121 = !DILocation(line: 118, scope: !11)
!122 = !DILocation(line: 0, scope: !14, inlinedAt: !123)
!123 = !DILocation(line: 708, scope: !17, inlinedAt: !124)
!124 = !DILocation(line: 7, scope: !125, inlinedAt: !127)
!125 = distinct !DISubprogram(name: "convert;", linkageName: "convert", scope: !126, file: !126, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!126 = !DIFile(filename: "number.jl", directory: ".")
!127 = !DILocation(line: 259, scope: !128, inlinedAt: !129)
!128 = distinct !DISubprogram(name: "_promote;", linkageName: "_promote", scope: !84, file: !84, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!129 = !DILocation(line: 282, scope: !130, inlinedAt: !119)
!130 = distinct !DISubprogram(name: "promote;", linkageName: "promote", scope: !84, file: !84, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!131 = !DILocation(line: 0, scope: !83, inlinedAt: !132)
!132 = !DILocation(line: 317, scope: !133, inlinedAt: !134)
!133 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !109, file: !109, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!134 = !DILocation(line: 326, scope: !133, inlinedAt: !135)
!135 = !DILocation(line: 158, scope: !136, inlinedAt: !138)
!136 = distinct !DISubprogram(name: "map;", linkageName: "map", scope: !137, file: !137, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!137 = !DIFile(filename: "tuple.jl", directory: ".")
!138 = !DILocation(line: 75, scope: !139, inlinedAt: !140)
!139 = distinct !DISubprogram(name: "axes;", linkageName: "axes", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!140 = !DILocation(line: 1879, scope: !141, inlinedAt: !142)
!141 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!142 = !DILocation(line: 1089, scope: !143, inlinedAt: !144)
!143 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!144 = !DILocation(line: 1083, scope: !145, inlinedAt: !146)
!145 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!146 = !DILocation(line: 1060, scope: !147, inlinedAt: !148)
!147 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!148 = !DILocation(line: 119, scope: !11)
!149 = !DILocation(line: 0, scope: !52, inlinedAt: !148)
!150 = !DILocation(line: 0, scope: !52, inlinedAt: !151)
!151 = !DILocation(line: 1911, scope: !152, inlinedAt: !153)
!152 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!153 = !DILocation(line: 1911, scope: !152, inlinedAt: !154)
!154 = !DILocation(line: 1895, scope: !141, inlinedAt: !140)
!155 = !DILocation(line: 0, scope: !38, inlinedAt: !156)
!156 = !DILocation(line: 7, scope: !157, inlinedAt: !159)
!157 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !158, file: !158, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!158 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl", directory: ".")
!159 = !DILocation(line: 7, scope: !160, inlinedAt: !161)
!160 = distinct !DISubprogram(name: "pointerref;", linkageName: "pointerref", scope: !158, file: !158, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!161 = !DILocation(line: 79, scope: !162, inlinedAt: !163)
!162 = distinct !DISubprogram(name: "unsafe_load;", linkageName: "unsafe_load", scope: !158, file: !158, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!163 = !DILocation(line: 80, scope: !164, inlinedAt: !165)
!164 = distinct !DISubprogram(name: "arrayref;", linkageName: "arrayref", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!165 = !DILocation(line: 99, scope: !166, inlinedAt: !144)
!166 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!167 = !DILocation(line: 0, scope: !168, inlinedAt: !169)
!168 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!169 = !DILocation(line: 1911, scope: !152, inlinedAt: !170)
!170 = !DILocation(line: 1911, scope: !152, inlinedAt: !171)
!171 = !DILocation(line: 1895, scope: !141, inlinedAt: !172)
!172 = !DILocation(line: 1879, scope: !141, inlinedAt: !173)
!173 = !DILocation(line: 1089, scope: !143, inlinedAt: !174)
!174 = !DILocation(line: 1176, scope: !175, inlinedAt: !176)
!175 = distinct !DISubprogram(name: "_setindex!;", linkageName: "_setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!176 = !DILocation(line: 1153, scope: !177, inlinedAt: !148)
!177 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!178 = !DILocation(line: 0, scope: !52, inlinedAt: !169)
!179 = !DILocation(line: 0, scope: !101, inlinedAt: !180)
!180 = !DILocation(line: 80, scope: !38, inlinedAt: !181)
!181 = !DILocation(line: 42, scope: !157, inlinedAt: !182)
!182 = !DILocation(line: 42, scope: !183, inlinedAt: !184)
!183 = distinct !DISubprogram(name: "pointerset;", linkageName: "pointerset", scope: !158, file: !158, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!184 = !DILocation(line: 82, scope: !185, inlinedAt: !186)
!185 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !158, file: !158, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!186 = !DILocation(line: 86, scope: !187, inlinedAt: !188)
!187 = distinct !DISubprogram(name: "arrayset;", linkageName: "arrayset", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!188 = !DILocation(line: 101, scope: !189, inlinedAt: !174)
!189 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!190 = !DILocation(line: 0, scope: !38, inlinedAt: !181)
!191 = !DILocation(line: 0, scope: !38, inlinedAt: !192)
!192 = !DILocation(line: 42, scope: !157, inlinedAt: !193)
!193 = !DILocation(line: 42, scope: !183, inlinedAt: !194)
!194 = !DILocation(line: 82, scope: !185, inlinedAt: !195)
!195 = !DILocation(line: 86, scope: !187, inlinedAt: !196)
!196 = !DILocation(line: 101, scope: !189, inlinedAt: !197)
!197 = !DILocation(line: 1176, scope: !175, inlinedAt: !198)
!198 = !DILocation(line: 1153, scope: !177, inlinedAt: !199)
!199 = !DILocation(line: 126, scope: !11)
!200 = !DILocation(line: 0, scope: !101, inlinedAt: !201)
!201 = !DILocation(line: 1918, scope: !202, inlinedAt: !203)
!202 = distinct !DISubprogram(name: "offsetin;", linkageName: "offsetin", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!203 = !DILocation(line: 1911, scope: !152, inlinedAt: !204)
!204 = !DILocation(line: 1911, scope: !152, inlinedAt: !205)
!205 = !DILocation(line: 1895, scope: !141, inlinedAt: !206)
!206 = !DILocation(line: 1879, scope: !141, inlinedAt: !207)
!207 = !DILocation(line: 1089, scope: !143, inlinedAt: !208)
!208 = !DILocation(line: 1083, scope: !145, inlinedAt: !209)
!209 = !DILocation(line: 1060, scope: !147, inlinedAt: !210)
!210 = !DILocation(line: 124, scope: !11)
!211 = !DILocation(line: 0, scope: !168, inlinedAt: !203)
!212 = !DILocation(line: 0, scope: !52, inlinedAt: !210)
!213 = !DILocation(line: 0, scope: !52, inlinedAt: !203)
!214 = !DILocation(line: 0, scope: !38, inlinedAt: !215)
!215 = !DILocation(line: 7, scope: !157, inlinedAt: !216)
!216 = !DILocation(line: 7, scope: !160, inlinedAt: !217)
!217 = !DILocation(line: 79, scope: !162, inlinedAt: !218)
!218 = !DILocation(line: 80, scope: !164, inlinedAt: !219)
!219 = !DILocation(line: 99, scope: !166, inlinedAt: !208)
!220 = !DILocation(line: 0, scope: !38, inlinedAt: !221)
!221 = !DILocation(line: 42, scope: !157, inlinedAt: !222)
!222 = !DILocation(line: 42, scope: !183, inlinedAt: !223)
!223 = !DILocation(line: 82, scope: !185, inlinedAt: !224)
!224 = !DILocation(line: 86, scope: !187, inlinedAt: !225)
!225 = !DILocation(line: 101, scope: !189, inlinedAt: !226)
!226 = !DILocation(line: 1176, scope: !175, inlinedAt: !227)
!227 = !DILocation(line: 1153, scope: !177, inlinedAt: !210)
!228 = !DILocation(line: 0, scope: !52, inlinedAt: !229)
!229 = !DILocation(line: 1911, scope: !152, inlinedAt: !230)
!230 = !DILocation(line: 1911, scope: !152, inlinedAt: !231)
!231 = !DILocation(line: 1895, scope: !141, inlinedAt: !232)
!232 = !DILocation(line: 1879, scope: !141, inlinedAt: !233)
!233 = !DILocation(line: 1089, scope: !143, inlinedAt: !234)
!234 = !DILocation(line: 1083, scope: !145, inlinedAt: !235)
!235 = !DILocation(line: 1060, scope: !147, inlinedAt: !236)
!236 = !DILocation(line: 138, scope: !11)
!237 = !DILocation(line: 86, scope: !52, inlinedAt: !121)
!238 = !DILocation(line: 441, scope: !104, inlinedAt: !119)
!239 = !DILocation(line: 85, scope: !101, inlinedAt: !240)
!240 = !DILocation(line: 1918, scope: !202, inlinedAt: !151)
!241 = !DILocation(line: 87, scope: !168, inlinedAt: !151)
!242 = !DILocation(line: 85, scope: !101, inlinedAt: !243)
!243 = !DILocation(line: 80, scope: !38, inlinedAt: !156)
!244 = !{!245, !245, i64 0, i64 0}
!245 = !{!"custom_tbaa_addrspace(1)", !246, i64 0}
!246 = !{!"custom_tbaa"}
!247 = !{!248, !248, i64 0, i64 0}
!248 = !{!"custom_tbaa_addrspace(3)", !246, i64 0}
!249 = !DILocation(line: 80, scope: !38, inlinedAt: !250)
!250 = !DILocation(line: 42, scope: !157, inlinedAt: !251)
!251 = !DILocation(line: 42, scope: !183, inlinedAt: !252)
!252 = !DILocation(line: 82, scope: !185, inlinedAt: !253)
!253 = !DILocation(line: 86, scope: !187, inlinedAt: !254)
!254 = !DILocation(line: 101, scope: !189, inlinedAt: !255)
!255 = !DILocation(line: 1176, scope: !175, inlinedAt: !256)
!256 = !DILocation(line: 1153, scope: !177, inlinedAt: !257)
!257 = !DILocation(line: 121, scope: !11)
!258 = !DILocation(line: 86, scope: !52, inlinedAt: !259)
!259 = !DILocation(line: 123, scope: !11)
!260 = !DILocation(line: 441, scope: !104, inlinedAt: !261)
!261 = !DILocation(line: 350, scope: !120, inlinedAt: !259)
!262 = !DILocation(line: 85, scope: !101, inlinedAt: !263)
!263 = !DILocation(line: 80, scope: !38, inlinedAt: !215)
!264 = !DILocation(line: 80, scope: !38, inlinedAt: !221)
!265 = !DILocation(line: 80, scope: !38, inlinedAt: !192)
!266 = !DILocation(line: 14, scope: !267, inlinedAt: !269)
!267 = distinct !DISubprogram(name: "sync_threads;", linkageName: "sync_threads", scope: !268, file: !268, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!268 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl", directory: ".")
!269 = !DILocation(line: 130, scope: !11)
!270 = !DILocation(line: 87, scope: !168, inlinedAt: !229)
!271 = !DILocation(line: 85, scope: !101, inlinedAt: !272)
!272 = !DILocation(line: 80, scope: !38, inlinedAt: !273)
!273 = !DILocation(line: 7, scope: !157, inlinedAt: !274)
!274 = !DILocation(line: 7, scope: !160, inlinedAt: !275)
!275 = !DILocation(line: 79, scope: !162, inlinedAt: !276)
!276 = !DILocation(line: 80, scope: !164, inlinedAt: !277)
!277 = !DILocation(line: 99, scope: !166, inlinedAt: !234)
!278 = !DILocation(line: 405, scope: !279, inlinedAt: !236)
!279 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !280, file: !280, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!280 = !DIFile(filename: "float.jl", directory: ".")
!281 = !DILocation(line: 401, scope: !282, inlinedAt: !236)
!282 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !280, file: !280, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!283 = !DILocation(line: 624, scope: !115, inlinedAt: !236)
!284 = !DILocation(line: 398, scope: !90, inlinedAt: !283)
!285 = !DILocation(line: 14, scope: !267, inlinedAt: !286)
!286 = !DILocation(line: 141, scope: !11)
!287 = !DILocation(line: 398, scope: !90, inlinedAt: !288)
!288 = !DILocation(line: 624, scope: !115, inlinedAt: !286)
!289 = !DILocation(line: 441, scope: !104, inlinedAt: !290)
!290 = !DILocation(line: 350, scope: !120, inlinedAt: !117)
!291 = !DILocation(line: 409, scope: !83, inlinedAt: !292)
!292 = !DILocation(line: 317, scope: !133, inlinedAt: !293)
!293 = !DILocation(line: 326, scope: !133, inlinedAt: !294)
!294 = !DILocation(line: 158, scope: !136, inlinedAt: !295)
!295 = !DILocation(line: 75, scope: !139, inlinedAt: !296)
!296 = !DILocation(line: 1879, scope: !141, inlinedAt: !297)
!297 = !DILocation(line: 1089, scope: !143, inlinedAt: !298)
!298 = !DILocation(line: 1176, scope: !175, inlinedAt: !299)
!299 = !DILocation(line: 1153, scope: !177, inlinedAt: !300)
!300 = !DILocation(line: 148, scope: !11)
!301 = !DILocation(line: 85, scope: !101, inlinedAt: !302)
!302 = !DILocation(line: 1918, scope: !202, inlinedAt: !303)
!303 = !DILocation(line: 1911, scope: !152, inlinedAt: !304)
!304 = !DILocation(line: 1911, scope: !152, inlinedAt: !305)
!305 = !DILocation(line: 1895, scope: !141, inlinedAt: !296)
!306 = !DILocation(line: 87, scope: !168, inlinedAt: !303)
!307 = !DILocation(line: 86, scope: !52, inlinedAt: !303)
!308 = !DILocation(line: 85, scope: !101, inlinedAt: !309)
!309 = !DILocation(line: 80, scope: !38, inlinedAt: !310)
!310 = !DILocation(line: 42, scope: !157, inlinedAt: !311)
!311 = !DILocation(line: 42, scope: !183, inlinedAt: !312)
!312 = !DILocation(line: 82, scope: !185, inlinedAt: !313)
!313 = !DILocation(line: 86, scope: !187, inlinedAt: !314)
!314 = !DILocation(line: 101, scope: !189, inlinedAt: !298)
!315 = !DILocation(line: 150, scope: !11)
