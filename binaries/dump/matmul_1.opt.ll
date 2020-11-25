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
           %7 = sext i32 %4 to i64, !dbg !37
; └└└└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:96 within `coalesced_matmul_kernel!'
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
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:97 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:77 within `blockIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:57 within `blockIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !65, !range !72
; └└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:98 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_x'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !73, !range !81
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow59 = add nuw nsw i32 %11, 1, !dbg !82
     %12 = zext i32 %narrow59 to i64, !dbg !82
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:99 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:91 within `threadIdx'
; │┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:47 within `threadIdx_y'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `_index'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/indexing.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
      %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !83, !range !81
; ││└└
; ││┌ @ int.jl:86 within `+'
     %narrow60 = add nuw nsw i32 %13, 1, !dbg !90
     %14 = zext i32 %narrow60 to i64, !dbg !90
; └└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:107 within `coalesced_matmul_kernel!'
; ┌ @ operators.jl:538 within `max' @ promotion.jl:409
; │┌ @ int.jl:82 within `<'
    %15 = icmp slt i32 %4, %3, !dbg !91
; │└
   %16 = select i1 %15, i32 %3, i32 %4, !dbg !93
; │┌ @ int.jl:82 within `<'
    %17 = icmp sgt i32 %16, %5, !dbg !91
; │└
   %18 = select i1 %17, i32 %16, i32 %5, !dbg !93
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:108 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:398 within `=='
   %19 = and i32 %18, 31, !dbg !100
   %20 = icmp eq i32 %19, 0, !dbg !100
; └
  %value_phi = select i1 %20, i64 0, i64 32, !dbg !102
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:109 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:920 within `+'
; │┌ @ int.jl:476 within `rem'
    %21 = sext i32 %18 to i64, !dbg !103
; │└
; │ @ int.jl:922 within `+' @ int.jl:86
   %22 = add nsw i64 %value_phi, %21, !dbg !107
; └
; ┌ @ int.jl:260 within `div'
   %23 = sdiv i64 %22, 32, !dbg !109
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:85 within `-'
   %24 = add nsw i64 %23, -1, !dbg !111
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:280 within `UnitRange'
; ││┌ @ range.jl:285 within `unitrange_last'
; │││┌ @ operators.jl:350 within `>='
; ││││┌ @ int.jl:441 within `<='
       %25 = icmp slt i64 %22, 32, !dbg !114
; │││└└
     %26 = select i1 %25, i64 -1, i64 %24, !dbg !118
; └└└
; ┌ @ range.jl:620 within `iterate'
   %27 = icmp slt i64 %26, 0, !dbg !125
; └
  %.pre63 = shl nuw nsw i64 %9, 5, !dbg !127
  %.pre65 = add nsw i64 %12, -32, !dbg !127
  %.pre67 = add nsw i64 %.pre65, %.pre63, !dbg !127
  %.pre69 = shl nuw nsw i32 %10, 5, !dbg !127
  %.pre71 = add nuw nsw i32 %narrow60, %.pre69, !dbg !127
  %.pre72 = zext i32 %.pre71 to i64, !dbg !127
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
  br i1 %27, label %top.L525_crit_edge, label %L81.preheader, !dbg !113

top.L525_crit_edge:                               ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
  %.pre74 = sext i32 %5 to i64, !dbg !128
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
  br label %L525, !dbg !113

L81.preheader:                                    ; preds = %top
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
; ┌ @ promotion.jl:350 within `<=' @ int.jl:0
   %28 = icmp sgt i64 %.pre67, %6, !dbg !129
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:119 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl within `max'
          %29 = icmp sgt i64 %6, 0, !dbg !133
          %30 = select i1 %29, i64 %6, i64 0, !dbg !133
; └└└└└└└└
; ┌ @ int.jl within `+'
   %31 = add nsw i64 %14, -1, !dbg !151
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %32 = add nsw i64 %.pre67, -1, !dbg !152
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %33 = inttoptr i64 %1 to double addrspace(1)*, !dbg !157
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `*'
        %34 = mul nuw nsw i64 %14, 33, !dbg !169
; │││││└
; │││││┌ @ int.jl within `+'
        %35 = add nsw i64 %12, -34, !dbg !180
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl within `-'
          %36 = add nsw i64 %35, %34, !dbg !181
; │││││││└
; │││││││ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %37 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %36, !dbg !192
         %38 = bitcast double addrspace(3)* %37 to i64 addrspace(3)*, !dbg !192
; └└└└└└└
  %39 = sext i32 %5 to i64, !dbg !127
  %40 = icmp sle i64 %.pre72, %39, !dbg !127
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %41 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %36, !dbg !193
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:124 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind'
; ││││┌ @ abstractarray.jl:75 within `axes'
; │││││┌ @ tuple.jl:158 within `map'
; ││││││┌ @ range.jl:326 within `OneTo' @ range.jl:317
; │││││││┌ @ promotion.jl within `max'
          %42 = icmp sgt i64 %7, 0, !dbg !202
          %43 = select i1 %42, i64 %7, i64 0, !dbg !202
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl within `-'
         %44 = add nsw i64 %.pre72, -1, !dbg !212
; │││││└└
; │││││┌ @ int.jl within `*'
        %45 = mul nsw i64 %44, %43, !dbg !218
; └└└└└└
; ┌ @ int.jl within `+'
   %46 = add nsw i64 %12, -1, !dbg !219
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %47 = add nsw i64 %46, %45, !dbg !220
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %48 = inttoptr i64 %2 to double addrspace(1)*, !dbg !221
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:0
         %49 = bitcast double addrspace(3)* %41 to i64 addrspace(3)*, !dbg !227
; └└└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl within `+'
        %50 = add nsw i64 %34, -34, !dbg !235
; └└└└└└
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
  br label %L81, !dbg !132

L81:                                              ; preds = %L512, %L81.preheader
  %value_phi6 = phi double [ %83, %L512 ], [ 0.000000e+00, %L81.preheader ]
  %value_phi7 = phi i64 [ %87, %L512 ], [ 0, %L81.preheader ]
  %.pre76 = shl i64 %value_phi7, 5, !dbg !127
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:118 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %51 = add i64 %.pre76, %14, !dbg !244
; └
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %52 = icmp sgt i64 %51, %7, !dbg !245
; └
  %or.cond = or i1 %28, %52, !dbg !132
  br i1 %or.cond, label %L221, label %L104, !dbg !132

L104:                                             ; preds = %L81
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:119 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %53 = add i64 %31, %.pre76, !dbg !246
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %54 = mul i64 %53, %30, !dbg !248
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %55 = add i64 %32, %54, !dbg !249
; │││││││└
         %56 = getelementptr inbounds double, double addrspace(1)* %33, i64 %55, !dbg !250
         %57 = bitcast double addrspace(1)* %56 to i64 addrspace(1)*, !dbg !250
         %58 = load i64, i64 addrspace(1)* %57, align 8, !dbg !250, !tbaa !251
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i64 %58, i64 addrspace(3)* %38, align 8, !dbg !182, !tbaa !254
; └└└└└└└
  br label %L248, !dbg !150

L221:                                             ; preds = %L81
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:121 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store double 0.000000e+00, double addrspace(3)* %37, align 8, !dbg !256, !tbaa !254
; │└└└└└└
   br label %L248, !dbg !263

L248:                                             ; preds = %L221, %L104
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:123 within `coalesced_matmul_kernel!'
; ┌ @ int.jl:86 within `+'
   %59 = add i64 %.pre76, %12, !dbg !265
; └
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %60 = icmp sle i64 %59, %7, !dbg !267
; └
  %value_phi10.off0 = and i1 %40, %60, !dbg !266
  br i1 %value_phi10.off0, label %L260, label %L377, !dbg !266

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
          %61 = add i64 %47, %.pre76, !dbg !269
; │││││││└
         %62 = getelementptr inbounds double, double addrspace(1)* %48, i64 %61, !dbg !270
         %63 = bitcast double addrspace(1)* %62 to i64 addrspace(1)*, !dbg !270
         %64 = load i64, i64 addrspace(1)* %63, align 8, !dbg !270, !tbaa !251
; └└└└└└└
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store i64 %64, i64 addrspace(3)* %49, align 8, !dbg !271, !tbaa !254
; └└└└└└└
  br label %L404, !dbg !211

L377:                                             ; preds = %L248
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:126 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1153 within `setindex!'
; │┌ @ abstractarray.jl:1176 within `_setindex!'
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
         store double 0.000000e+00, double addrspace(3)* %41, align 8, !dbg !272, !tbaa !254
; │└└└└└└
   br label %L404, !dbg !200

L404:                                             ; preds = %L377, %L260
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:130 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !273
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:112 within `coalesced_matmul_kernel!'
; ┌ @ range.jl:620 within `iterate'
   br label %L406, !dbg !125

L406:                                             ; preds = %L406, %L404
   %value_phi11 = phi double [ %value_phi6, %L404 ], [ %83, %L406 ]
   %value_phi12 = phi i64 [ 1, %L404 ], [ %85, %L406 ]
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:138 within `coalesced_matmul_kernel!'
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %65 = mul nuw nsw i64 %value_phi12, 33, !dbg !277
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %66 = add i64 %35, %65, !dbg !278
; │││││││└
         %67 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %66, !dbg !279
         %68 = load double, double addrspace(3)* %67, align 8, !dbg !279, !tbaa !254
; │││││││┌ @ int.jl:85 within `-'
          %69 = add i64 %50, %value_phi12, !dbg !278
; │││││││└
         %70 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %69, !dbg !279
         %71 = load double, double addrspace(3)* %70, align 8, !dbg !279, !tbaa !254
; └└└└└└└
; ┌ @ float.jl:405 within `*'
   %72 = fmul double %68, %71, !dbg !285
; └
; ┌ @ float.jl:401 within `+'
   %73 = fadd double %value_phi11, %72, !dbg !288
; └
; ┌ @ range.jl:624 within `iterate'
   %74 = add nuw nsw i64 %value_phi12, 1, !dbg !290
; └
; ┌ @ abstractarray.jl:1060 within `getindex'
; │┌ @ abstractarray.jl:1083 within `_getindex'
; ││┌ @ abstractarray.jl:1089 within `_to_linear_index'
; │││┌ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ int.jl:87 within `*'
        %75 = mul nuw nsw i64 %74, 33, !dbg !277
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:99 within `getindex'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:80 within `arrayref'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:79 within `unsafe_load'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `pointerref'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:7 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %76 = add i64 %35, %75, !dbg !278
; │││││││└
         %77 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_285, i64 0, i64 %76, !dbg !279
         %78 = load double, double addrspace(3)* %77, align 8, !dbg !279, !tbaa !254
; │││││││┌ @ int.jl:85 within `-'
          %79 = add i64 %50, %74, !dbg !278
; │││││││└
         %80 = getelementptr inbounds [1056 x double], [1056 x double] addrspace(3)* @__static_shmem_286, i64 0, i64 %79, !dbg !279
         %81 = load double, double addrspace(3)* %80, align 8, !dbg !279, !tbaa !254
; └└└└└└└
; ┌ @ float.jl:405 within `*'
   %82 = fmul double %78, %81, !dbg !285
; └
; ┌ @ float.jl:401 within `+'
   %83 = fadd double %73, %82, !dbg !288
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %84 = icmp eq i64 %74, 32, !dbg !291
; │└
   %85 = add nuw nsw i64 %value_phi12, 2, !dbg !290
; └
  br i1 %84, label %L512, label %L406, !dbg !243

L512:                                             ; preds = %L406
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:141 within `coalesced_matmul_kernel!'
; ┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl:14 within `sync_threads'
   call void @llvm.nvvm.barrier0(), !dbg !292
; └
; ┌ @ range.jl:624 within `iterate'
; │┌ @ promotion.jl:398 within `=='
    %86 = icmp eq i64 %value_phi7, %26, !dbg !294
; │└
   %87 = add i64 %value_phi7, 1, !dbg !295
; └
  br i1 %86, label %L525, label %L81, !dbg !293

L525:                                             ; preds = %L512, %top.L525_crit_edge
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:147 within `coalesced_matmul_kernel!'
  %.pre-phi75 = phi i64 [ %.pre74, %top.L525_crit_edge ], [ %39, %L512 ], !dbg !128
  %value_phi21 = phi double [ 0.000000e+00, %top.L525_crit_edge ], [ %83, %L512 ]
; ┌ @ promotion.jl:350 within `<=' @ int.jl:441
   %88 = icmp sgt i64 %.pre67, %6, !dbg !296
; └
  %89 = icmp slt i64 %.pre-phi75, %.pre72, !dbg !128
  %value_phi22.off0 = or i1 %88, %89, !dbg !128
  br i1 %value_phi22.off0, label %L593, label %L562, !dbg !128

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
          %90 = icmp sgt i64 %6, 0, !dbg !298
          %91 = select i1 %90, i64 %6, i64 0, !dbg !298
; ││││└└└└
; ││││ @ abstractarray.jl:1879 within `_sub2ind' @ abstractarray.jl:1895
; ││││┌ @ abstractarray.jl:1911 within `_sub2ind_recurse' @ abstractarray.jl:1911
; │││││┌ @ abstractarray.jl:1918 within `offsetin'
; ││││││┌ @ int.jl:85 within `-'
         %92 = add nsw i64 %.pre72, -1, !dbg !308
; │││││└└
; │││││┌ @ int.jl:87 within `*'
        %93 = mul nsw i64 %92, %91, !dbg !313
; │││││└
; │││││┌ @ int.jl:86 within `+'
        %94 = add nsw i64 %.pre67, -1, !dbg !314
; ││└└└└
; ││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:101 within `setindex!'
; │││┌ @ /home/local/.julia/packages/CUDA/BIYoG/src/device/array.jl:86 within `arrayset'
; ││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:82 within `unsafe_store!'
; │││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `pointerset'
; ││││││┌ @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl:42 within `macro expansion' @ /home/local/.julia/packages/LLVM/dVU7J/src/interop/base.jl:80
; │││││││┌ @ int.jl:85 within `-'
          %95 = add nsw i64 %94, %93, !dbg !315
; │││││││└
         %96 = inttoptr i64 %0 to double addrspace(1)*, !dbg !316
         %97 = getelementptr inbounds double, double addrspace(1)* %96, i64 %95, !dbg !316
         store double %value_phi21, double addrspace(1)* %97, align 8, !dbg !316, !tbaa !251
; │└└└└└└
   br label %L593, !dbg !306

L593:                                             ; preds = %L562, %L525
; └
;  @ /home/local/git/MIT6828_HardAware/binaries/generate_binaries.jl:150 within `coalesced_matmul_kernel!'
  ret void, !dbg !322
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
!47 = !DILocation(line: 95, scope: !11)
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
!60 = !DILocation(line: 96, scope: !11)
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
!71 = !DILocation(line: 97, scope: !11)
!72 = !{i32 0, i32 65534}
!73 = !DILocation(line: 80, scope: !49, inlinedAt: !74)
!74 = !DILocation(line: 7, scope: !52, inlinedAt: !75)
!75 = !DILocation(line: 7, scope: !55, inlinedAt: !76)
!76 = !DILocation(line: 47, scope: !77, inlinedAt: !78)
!77 = distinct !DISubprogram(name: "threadIdx_x;", linkageName: "threadIdx_x", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 91, scope: !79, inlinedAt: !80)
!79 = distinct !DISubprogram(name: "threadIdx;", linkageName: "threadIdx", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 98, scope: !11)
!81 = !{i32 0, i32 1023}
!82 = !DILocation(line: 86, scope: !63, inlinedAt: !76)
!83 = !DILocation(line: 80, scope: !49, inlinedAt: !84)
!84 = !DILocation(line: 7, scope: !52, inlinedAt: !85)
!85 = !DILocation(line: 7, scope: !55, inlinedAt: !86)
!86 = !DILocation(line: 47, scope: !87, inlinedAt: !88)
!87 = distinct !DISubprogram(name: "threadIdx_y;", linkageName: "threadIdx_y", scope: !53, file: !53, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!88 = !DILocation(line: 91, scope: !79, inlinedAt: !89)
!89 = !DILocation(line: 99, scope: !11)
!90 = !DILocation(line: 86, scope: !63, inlinedAt: !86)
!91 = !DILocation(line: 82, scope: !92, inlinedAt: !93)
!92 = distinct !DISubprogram(name: "<;", linkageName: "<", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 409, scope: !94, inlinedAt: !96)
!94 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !95, file: !95, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!95 = !DIFile(filename: "promotion.jl", directory: ".")
!96 = !DILocation(line: 538, scope: !97, inlinedAt: !99)
!97 = distinct !DISubprogram(name: "max;", linkageName: "max", scope: !98, file: !98, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!98 = !DIFile(filename: "operators.jl", directory: ".")
!99 = !DILocation(line: 107, scope: !11)
!100 = !DILocation(line: 398, scope: !101, inlinedAt: !102)
!101 = distinct !DISubprogram(name: "==;", linkageName: "==", scope: !95, file: !95, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!102 = !DILocation(line: 108, scope: !11)
!103 = !DILocation(line: 476, scope: !104, inlinedAt: !105)
!104 = distinct !DISubprogram(name: "rem;", linkageName: "rem", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!105 = !DILocation(line: 920, scope: !63, inlinedAt: !106)
!106 = !DILocation(line: 109, scope: !11)
!107 = !DILocation(line: 86, scope: !63, inlinedAt: !108)
!108 = !DILocation(line: 922, scope: !63, inlinedAt: !106)
!109 = !DILocation(line: 260, scope: !110, inlinedAt: !106)
!110 = distinct !DISubprogram(name: "div;", linkageName: "div", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!111 = !DILocation(line: 85, scope: !112, inlinedAt: !113)
!112 = distinct !DISubprogram(name: "-;", linkageName: "-", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!113 = !DILocation(line: 112, scope: !11)
!114 = !DILocation(line: 441, scope: !115, inlinedAt: !116)
!115 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!116 = !DILocation(line: 350, scope: !117, inlinedAt: !118)
!117 = distinct !DISubprogram(name: ">=;", linkageName: ">=", scope: !98, file: !98, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!118 = !DILocation(line: 285, scope: !119, inlinedAt: !121)
!119 = distinct !DISubprogram(name: "unitrange_last;", linkageName: "unitrange_last", scope: !120, file: !120, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!120 = !DIFile(filename: "range.jl", directory: ".")
!121 = !DILocation(line: 280, scope: !122, inlinedAt: !123)
!122 = distinct !DISubprogram(name: "UnitRange;", linkageName: "UnitRange", scope: !120, file: !120, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!123 = !DILocation(line: 5, scope: !124, inlinedAt: !113)
!124 = distinct !DISubprogram(name: "Colon;", linkageName: "Colon", scope: !120, file: !120, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!125 = !DILocation(line: 620, scope: !126, inlinedAt: !113)
!126 = distinct !DISubprogram(name: "iterate;", linkageName: "iterate", scope: !120, file: !120, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!127 = !DILocation(line: 0, scope: !11)
!128 = !DILocation(line: 147, scope: !11)
!129 = !DILocation(line: 0, scope: !115, inlinedAt: !130)
!130 = !DILocation(line: 350, scope: !131, inlinedAt: !132)
!131 = distinct !DISubprogram(name: "<=;", linkageName: "<=", scope: !95, file: !95, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!132 = !DILocation(line: 118, scope: !11)
!133 = !DILocation(line: 0, scope: !94, inlinedAt: !134)
!134 = !DILocation(line: 317, scope: !135, inlinedAt: !136)
!135 = distinct !DISubprogram(name: "OneTo;", linkageName: "OneTo", scope: !120, file: !120, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!136 = !DILocation(line: 326, scope: !135, inlinedAt: !137)
!137 = !DILocation(line: 158, scope: !138, inlinedAt: !140)
!138 = distinct !DISubprogram(name: "map;", linkageName: "map", scope: !139, file: !139, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!139 = !DIFile(filename: "tuple.jl", directory: ".")
!140 = !DILocation(line: 75, scope: !141, inlinedAt: !142)
!141 = distinct !DISubprogram(name: "axes;", linkageName: "axes", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!142 = !DILocation(line: 1879, scope: !143, inlinedAt: !144)
!143 = distinct !DISubprogram(name: "_sub2ind;", linkageName: "_sub2ind", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!144 = !DILocation(line: 1089, scope: !145, inlinedAt: !146)
!145 = distinct !DISubprogram(name: "_to_linear_index;", linkageName: "_to_linear_index", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!146 = !DILocation(line: 1083, scope: !147, inlinedAt: !148)
!147 = distinct !DISubprogram(name: "_getindex;", linkageName: "_getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!148 = !DILocation(line: 1060, scope: !149, inlinedAt: !150)
!149 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!150 = !DILocation(line: 119, scope: !11)
!151 = !DILocation(line: 0, scope: !63, inlinedAt: !150)
!152 = !DILocation(line: 0, scope: !63, inlinedAt: !153)
!153 = !DILocation(line: 1911, scope: !154, inlinedAt: !155)
!154 = distinct !DISubprogram(name: "_sub2ind_recurse;", linkageName: "_sub2ind_recurse", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!155 = !DILocation(line: 1911, scope: !154, inlinedAt: !156)
!156 = !DILocation(line: 1895, scope: !143, inlinedAt: !142)
!157 = !DILocation(line: 0, scope: !49, inlinedAt: !158)
!158 = !DILocation(line: 7, scope: !159, inlinedAt: !161)
!159 = distinct !DISubprogram(name: "macro expansion;", linkageName: "macro expansion", scope: !160, file: !160, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!160 = !DIFile(filename: "/home/local/.julia/packages/LLVM/dVU7J/src/interop/pointer.jl", directory: ".")
!161 = !DILocation(line: 7, scope: !162, inlinedAt: !163)
!162 = distinct !DISubprogram(name: "pointerref;", linkageName: "pointerref", scope: !160, file: !160, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!163 = !DILocation(line: 79, scope: !164, inlinedAt: !165)
!164 = distinct !DISubprogram(name: "unsafe_load;", linkageName: "unsafe_load", scope: !160, file: !160, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!165 = !DILocation(line: 80, scope: !166, inlinedAt: !167)
!166 = distinct !DISubprogram(name: "arrayref;", linkageName: "arrayref", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!167 = !DILocation(line: 99, scope: !168, inlinedAt: !146)
!168 = distinct !DISubprogram(name: "getindex;", linkageName: "getindex", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!169 = !DILocation(line: 0, scope: !170, inlinedAt: !171)
!170 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !64, file: !64, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!171 = !DILocation(line: 1911, scope: !154, inlinedAt: !172)
!172 = !DILocation(line: 1911, scope: !154, inlinedAt: !173)
!173 = !DILocation(line: 1895, scope: !143, inlinedAt: !174)
!174 = !DILocation(line: 1879, scope: !143, inlinedAt: !175)
!175 = !DILocation(line: 1089, scope: !145, inlinedAt: !176)
!176 = !DILocation(line: 1176, scope: !177, inlinedAt: !178)
!177 = distinct !DISubprogram(name: "_setindex!;", linkageName: "_setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!178 = !DILocation(line: 1153, scope: !179, inlinedAt: !150)
!179 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!180 = !DILocation(line: 0, scope: !63, inlinedAt: !171)
!181 = !DILocation(line: 0, scope: !112, inlinedAt: !182)
!182 = !DILocation(line: 80, scope: !49, inlinedAt: !183)
!183 = !DILocation(line: 42, scope: !159, inlinedAt: !184)
!184 = !DILocation(line: 42, scope: !185, inlinedAt: !186)
!185 = distinct !DISubprogram(name: "pointerset;", linkageName: "pointerset", scope: !160, file: !160, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!186 = !DILocation(line: 82, scope: !187, inlinedAt: !188)
!187 = distinct !DISubprogram(name: "unsafe_store!;", linkageName: "unsafe_store!", scope: !160, file: !160, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!188 = !DILocation(line: 86, scope: !189, inlinedAt: !190)
!189 = distinct !DISubprogram(name: "arrayset;", linkageName: "arrayset", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!190 = !DILocation(line: 101, scope: !191, inlinedAt: !176)
!191 = distinct !DISubprogram(name: "setindex!;", linkageName: "setindex!", scope: !34, file: !34, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!192 = !DILocation(line: 0, scope: !49, inlinedAt: !183)
!193 = !DILocation(line: 0, scope: !49, inlinedAt: !194)
!194 = !DILocation(line: 42, scope: !159, inlinedAt: !195)
!195 = !DILocation(line: 42, scope: !185, inlinedAt: !196)
!196 = !DILocation(line: 82, scope: !187, inlinedAt: !197)
!197 = !DILocation(line: 86, scope: !189, inlinedAt: !198)
!198 = !DILocation(line: 101, scope: !191, inlinedAt: !199)
!199 = !DILocation(line: 1176, scope: !177, inlinedAt: !200)
!200 = !DILocation(line: 1153, scope: !179, inlinedAt: !201)
!201 = !DILocation(line: 126, scope: !11)
!202 = !DILocation(line: 0, scope: !94, inlinedAt: !203)
!203 = !DILocation(line: 317, scope: !135, inlinedAt: !204)
!204 = !DILocation(line: 326, scope: !135, inlinedAt: !205)
!205 = !DILocation(line: 158, scope: !138, inlinedAt: !206)
!206 = !DILocation(line: 75, scope: !141, inlinedAt: !207)
!207 = !DILocation(line: 1879, scope: !143, inlinedAt: !208)
!208 = !DILocation(line: 1089, scope: !145, inlinedAt: !209)
!209 = !DILocation(line: 1083, scope: !147, inlinedAt: !210)
!210 = !DILocation(line: 1060, scope: !149, inlinedAt: !211)
!211 = !DILocation(line: 124, scope: !11)
!212 = !DILocation(line: 0, scope: !112, inlinedAt: !213)
!213 = !DILocation(line: 1918, scope: !214, inlinedAt: !215)
!214 = distinct !DISubprogram(name: "offsetin;", linkageName: "offsetin", scope: !6, file: !6, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!215 = !DILocation(line: 1911, scope: !154, inlinedAt: !216)
!216 = !DILocation(line: 1911, scope: !154, inlinedAt: !217)
!217 = !DILocation(line: 1895, scope: !143, inlinedAt: !207)
!218 = !DILocation(line: 0, scope: !170, inlinedAt: !215)
!219 = !DILocation(line: 0, scope: !63, inlinedAt: !211)
!220 = !DILocation(line: 0, scope: !63, inlinedAt: !215)
!221 = !DILocation(line: 0, scope: !49, inlinedAt: !222)
!222 = !DILocation(line: 7, scope: !159, inlinedAt: !223)
!223 = !DILocation(line: 7, scope: !162, inlinedAt: !224)
!224 = !DILocation(line: 79, scope: !164, inlinedAt: !225)
!225 = !DILocation(line: 80, scope: !166, inlinedAt: !226)
!226 = !DILocation(line: 99, scope: !168, inlinedAt: !209)
!227 = !DILocation(line: 0, scope: !49, inlinedAt: !228)
!228 = !DILocation(line: 42, scope: !159, inlinedAt: !229)
!229 = !DILocation(line: 42, scope: !185, inlinedAt: !230)
!230 = !DILocation(line: 82, scope: !187, inlinedAt: !231)
!231 = !DILocation(line: 86, scope: !189, inlinedAt: !232)
!232 = !DILocation(line: 101, scope: !191, inlinedAt: !233)
!233 = !DILocation(line: 1176, scope: !177, inlinedAt: !234)
!234 = !DILocation(line: 1153, scope: !179, inlinedAt: !211)
!235 = !DILocation(line: 0, scope: !63, inlinedAt: !236)
!236 = !DILocation(line: 1911, scope: !154, inlinedAt: !237)
!237 = !DILocation(line: 1911, scope: !154, inlinedAt: !238)
!238 = !DILocation(line: 1895, scope: !143, inlinedAt: !239)
!239 = !DILocation(line: 1879, scope: !143, inlinedAt: !240)
!240 = !DILocation(line: 1089, scope: !145, inlinedAt: !241)
!241 = !DILocation(line: 1083, scope: !147, inlinedAt: !242)
!242 = !DILocation(line: 1060, scope: !149, inlinedAt: !243)
!243 = !DILocation(line: 138, scope: !11)
!244 = !DILocation(line: 86, scope: !63, inlinedAt: !132)
!245 = !DILocation(line: 441, scope: !115, inlinedAt: !130)
!246 = !DILocation(line: 85, scope: !112, inlinedAt: !247)
!247 = !DILocation(line: 1918, scope: !214, inlinedAt: !153)
!248 = !DILocation(line: 87, scope: !170, inlinedAt: !153)
!249 = !DILocation(line: 85, scope: !112, inlinedAt: !250)
!250 = !DILocation(line: 80, scope: !49, inlinedAt: !158)
!251 = !{!252, !252, i64 0, i64 0}
!252 = !{!"custom_tbaa_addrspace(1)", !253, i64 0}
!253 = !{!"custom_tbaa"}
!254 = !{!255, !255, i64 0, i64 0}
!255 = !{!"custom_tbaa_addrspace(3)", !253, i64 0}
!256 = !DILocation(line: 80, scope: !49, inlinedAt: !257)
!257 = !DILocation(line: 42, scope: !159, inlinedAt: !258)
!258 = !DILocation(line: 42, scope: !185, inlinedAt: !259)
!259 = !DILocation(line: 82, scope: !187, inlinedAt: !260)
!260 = !DILocation(line: 86, scope: !189, inlinedAt: !261)
!261 = !DILocation(line: 101, scope: !191, inlinedAt: !262)
!262 = !DILocation(line: 1176, scope: !177, inlinedAt: !263)
!263 = !DILocation(line: 1153, scope: !179, inlinedAt: !264)
!264 = !DILocation(line: 121, scope: !11)
!265 = !DILocation(line: 86, scope: !63, inlinedAt: !266)
!266 = !DILocation(line: 123, scope: !11)
!267 = !DILocation(line: 441, scope: !115, inlinedAt: !268)
!268 = !DILocation(line: 350, scope: !131, inlinedAt: !266)
!269 = !DILocation(line: 85, scope: !112, inlinedAt: !270)
!270 = !DILocation(line: 80, scope: !49, inlinedAt: !222)
!271 = !DILocation(line: 80, scope: !49, inlinedAt: !228)
!272 = !DILocation(line: 80, scope: !49, inlinedAt: !194)
!273 = !DILocation(line: 14, scope: !274, inlinedAt: !276)
!274 = distinct !DISubprogram(name: "sync_threads;", linkageName: "sync_threads", scope: !275, file: !275, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!275 = !DIFile(filename: "/home/local/.julia/packages/CUDA/BIYoG/src/device/intrinsics/synchronization.jl", directory: ".")
!276 = !DILocation(line: 130, scope: !11)
!277 = !DILocation(line: 87, scope: !170, inlinedAt: !236)
!278 = !DILocation(line: 85, scope: !112, inlinedAt: !279)
!279 = !DILocation(line: 80, scope: !49, inlinedAt: !280)
!280 = !DILocation(line: 7, scope: !159, inlinedAt: !281)
!281 = !DILocation(line: 7, scope: !162, inlinedAt: !282)
!282 = !DILocation(line: 79, scope: !164, inlinedAt: !283)
!283 = !DILocation(line: 80, scope: !166, inlinedAt: !284)
!284 = !DILocation(line: 99, scope: !168, inlinedAt: !241)
!285 = !DILocation(line: 405, scope: !286, inlinedAt: !243)
!286 = distinct !DISubprogram(name: "*;", linkageName: "*", scope: !287, file: !287, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!287 = !DIFile(filename: "float.jl", directory: ".")
!288 = !DILocation(line: 401, scope: !289, inlinedAt: !243)
!289 = distinct !DISubprogram(name: "+;", linkageName: "+", scope: !287, file: !287, type: !12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!290 = !DILocation(line: 624, scope: !126, inlinedAt: !243)
!291 = !DILocation(line: 398, scope: !101, inlinedAt: !290)
!292 = !DILocation(line: 14, scope: !274, inlinedAt: !293)
!293 = !DILocation(line: 141, scope: !11)
!294 = !DILocation(line: 398, scope: !101, inlinedAt: !295)
!295 = !DILocation(line: 624, scope: !126, inlinedAt: !293)
!296 = !DILocation(line: 441, scope: !115, inlinedAt: !297)
!297 = !DILocation(line: 350, scope: !131, inlinedAt: !128)
!298 = !DILocation(line: 409, scope: !94, inlinedAt: !299)
!299 = !DILocation(line: 317, scope: !135, inlinedAt: !300)
!300 = !DILocation(line: 326, scope: !135, inlinedAt: !301)
!301 = !DILocation(line: 158, scope: !138, inlinedAt: !302)
!302 = !DILocation(line: 75, scope: !141, inlinedAt: !303)
!303 = !DILocation(line: 1879, scope: !143, inlinedAt: !304)
!304 = !DILocation(line: 1089, scope: !145, inlinedAt: !305)
!305 = !DILocation(line: 1176, scope: !177, inlinedAt: !306)
!306 = !DILocation(line: 1153, scope: !179, inlinedAt: !307)
!307 = !DILocation(line: 148, scope: !11)
!308 = !DILocation(line: 85, scope: !112, inlinedAt: !309)
!309 = !DILocation(line: 1918, scope: !214, inlinedAt: !310)
!310 = !DILocation(line: 1911, scope: !154, inlinedAt: !311)
!311 = !DILocation(line: 1911, scope: !154, inlinedAt: !312)
!312 = !DILocation(line: 1895, scope: !143, inlinedAt: !303)
!313 = !DILocation(line: 87, scope: !170, inlinedAt: !310)
!314 = !DILocation(line: 86, scope: !63, inlinedAt: !310)
!315 = !DILocation(line: 85, scope: !112, inlinedAt: !316)
!316 = !DILocation(line: 80, scope: !49, inlinedAt: !317)
!317 = !DILocation(line: 42, scope: !159, inlinedAt: !318)
!318 = !DILocation(line: 42, scope: !185, inlinedAt: !319)
!319 = !DILocation(line: 82, scope: !187, inlinedAt: !320)
!320 = !DILocation(line: 86, scope: !189, inlinedAt: !321)
!321 = !DILocation(line: 101, scope: !191, inlinedAt: !305)
!322 = !DILocation(line: 150, scope: !11)
