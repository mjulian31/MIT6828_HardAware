; PTX CompilerJob of kernel gpu_coalesced_matmul_kernel!(Cassette.Context{nametype(CUDACtx),KernelAbstractions.CompilerMetadata{KernelAbstractions.NDIteration.DynamicSize,KernelAbstractions.NDIteration.DynamicCheck,Nothing,CartesianIndices{2,Tuple{Base.OneTo{Int64},Base.OneTo{Int64}}},KernelAbstractions.NDIteration.NDRange{2,KernelAbstractions.NDIteration.DynamicSize,KernelAbstractions.NDIteration.StaticSize{(32, 32)},CartesianIndices{2,Tuple{Base.OneTo{Int64},Base.OneTo{Int64}}},Nothing}},Nothing,KernelAbstractions.var"##PassType#253",Nothing,Cassette.DisableHooks}, typeof(gpu_coalesced_matmul_kernel!), CuDeviceArray{Float32,2,1}, CuDeviceArray{Float32,2,1}, CuDeviceArray{Float32,2,1}) for sm_60, maxthreads=1024
; ModuleID = 'julia'
source_filename = "julia"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%printf_args = type { i64 }

@__static_shmem_283 = internal unnamed_addr addrspace(3) global [1056 x float] zeroinitializer, align 32
@__static_shmem_284 = internal unnamed_addr addrspace(3) global [1056 x float] zeroinitializer, align 32
@exception11 = private unnamed_addr constant [10 x i8] c"exception\00", align 1
@0 = internal unnamed_addr constant [108 x i8] c"ERROR: a %s was thrown during kernel execution.\0A       Run Julia on debug level 2 for device stack traces.\0A\00", align 1
@1 = internal unnamed_addr constant [110 x i8] c"WARNING: could not signal exception status to the host, execution will continue.\0A         Please file a bug.\0A\00", align 1

define dso_local ptx_kernel void @_Z34julia_gpu_coalesced_matmul_kernel_7ContextI14__CUDACtx_Name16CompilerMetadataI11DynamicSize12DynamicCheckv16CartesianIndicesILi2E5TupleI5OneToI5Int64ES6_IS7_EEE7NDRangeILi2ES2_10StaticSizeI8_32__32_ES4_ILi2ES5_IS6_IS7_ES6_IS7_EEEvEEv14__PassType_253v12DisableHooksE29_gpu_coalesced_matmul_kernel_13CuDeviceArrayI7Float32Li2ELi1EES13_IS14_Li2ELi1EES13_IS14_Li2ELi1EE({ { [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture nonnull readonly byval dereferenceable(32), { [2 x i64], i8 addrspace(1)* }* nocapture nonnull readonly byval dereferenceable(24), { [2 x i64], i8 addrspace(1)* }* nocapture nonnull readonly byval dereferenceable(24), { [2 x i64], i8 addrspace(1)* }* nocapture nonnull readonly byval dereferenceable(24)) local_unnamed_addr {
top:
  %.sroa.066.0..sroa_idx = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %1, i64 0, i32 0, i64 0
  %.sroa.066.0.copyload = load i64, i64* %.sroa.066.0..sroa_idx, align 1
  %.sroa.3.0..sroa_idx69 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %1, i64 0, i32 1
  %4 = bitcast i8 addrspace(1)** %.sroa.3.0..sroa_idx69 to float addrspace(1)**
  %.sroa.3.0.copyload75 = load float addrspace(1)*, float addrspace(1)** %4, align 1
  %.sroa.4.24..sroa_idx = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %2, i64 0, i32 0, i64 0
  %.sroa.4.24.copyload = load i64, i64* %.sroa.4.24..sroa_idx, align 1
  %.sroa.7.24..sroa_idx71 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %2, i64 0, i32 1
  %5 = bitcast i8 addrspace(1)** %.sroa.7.24..sroa_idx71 to float addrspace(1)**
  %.sroa.7.24.copyload76 = load float addrspace(1)*, float addrspace(1)** %5, align 1
  %.sroa.8.48..sroa_idx = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %3, i64 0, i32 0, i64 0
  %.sroa.8.48.copyload = load i64, i64* %.sroa.8.48..sroa_idx, align 1
  %.sroa.11.48..sroa_idx73 = getelementptr inbounds { [2 x i64], i8 addrspace(1)* }, { [2 x i64], i8 addrspace(1)* }* %3, i64 0, i32 1
  %6 = bitcast i8 addrspace(1)** %.sroa.11.48..sroa_idx73 to float addrspace(1)**
  %.sroa.11.48.copyload77 = load float addrspace(1)*, float addrspace(1)** %6, align 1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = getelementptr inbounds { { [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }, { { [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* %0, i64 0, i32 0, i32 1, i32 0, i64 0, i64 0, i64 0
  %10 = load i64, i64* %9, align 8
  %11 = icmp sgt i64 %10, 0
  %12 = select i1 %11, i64 %10, i64 0
  %13 = zext i32 %7 to i64
  br i1 %11, label %pass, label %fail

L162:                                             ; preds = %pass
  br i1 %11, label %pass5, label %fail4

L329:                                             ; preds = %L329.preheader, %L698
  %14 = phi float [ %x.i.1, %L698 ], [ -0.000000e+00, %L329.preheader ]
  %value_phi13 = phi i64 [ %46, %L698 ], [ 0, %L329.preheader ]
  %15 = shl i64 %value_phi13, 5
  %16 = or i64 %15, %58
  %17 = mul i64 %16, %81
  %18 = add i64 %17, %82
  %19 = getelementptr inbounds float, float addrspace(1)* %.sroa.7.24.copyload76, i64 %18
  %20 = bitcast float addrspace(1)* %19 to i32 addrspace(1)*
  %21 = load i32, i32 addrspace(1)* %20, align 4
  store i32 %21, i32 addrspace(3)* %86, align 4
  %22 = or i64 %15, %59
  %23 = add i64 %22, %90
  %24 = getelementptr inbounds float, float addrspace(1)* %.sroa.11.48.copyload77, i64 %23
  %25 = bitcast float addrspace(1)* %24 to i32 addrspace(1)*
  %26 = load i32, i32 addrspace(1)* %25, align 4
  store i32 %26, i32 addrspace(3)* %92, align 4
  call void @llvm.nvvm.barrier0()
  br label %L553

L553:                                             ; preds = %L553, %L329
  %27 = phi float [ %14, %L329 ], [ %x.i.1, %L553 ]
  %value_phi15 = phi i64 [ 1, %L329 ], [ %44, %L553 ]
  %28 = mul nuw nsw i64 %value_phi15, 33
  %29 = add nsw i64 %93, %28
  %30 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_283, i64 0, i64 %29
  %31 = load float, float addrspace(3)* %30, align 4
  %32 = add nsw i64 %94, %value_phi15
  %33 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_284, i64 0, i64 %32
  %34 = load float, float addrspace(3)* %33, align 4
  %x.i74 = fmul contract float %31, %34
  %x.i = fadd contract float %27, %x.i74
  %35 = add nuw nsw i64 %value_phi15, 1
  %36 = mul nuw nsw i64 %35, 33
  %37 = add nsw i64 %93, %36
  %38 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_283, i64 0, i64 %37
  %39 = load float, float addrspace(3)* %38, align 4
  %40 = add nuw i64 %83, %value_phi15
  %41 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_284, i64 0, i64 %40
  %42 = load float, float addrspace(3)* %41, align 4
  %x.i74.1 = fmul contract float %39, %42
  %x.i.1 = fadd contract float %x.i, %x.i74.1
  %43 = icmp eq i64 %35, 32
  %44 = add nuw nsw i64 %value_phi15, 2
  br i1 %43, label %L698, label %L553

L698:                                             ; preds = %L553
  call void @llvm.nvvm.barrier0()
  %45 = icmp eq i64 %value_phi13, %78
  %46 = add i64 %value_phi13, 1
  br i1 %45, label %L710.loopexit, label %L329

L710.loopexit:                                    ; preds = %L698
  %47 = bitcast float %x.i.1 to i32
  br label %L710

L710:                                             ; preds = %pass5.L710_crit_edge, %L710.loopexit
  %.pre-phi81 = phi i64 [ %.pre80, %pass5.L710_crit_edge ], [ %89, %L710.loopexit ]
  %.pre-phi = phi i64 [ %.pre, %pass5.L710_crit_edge ], [ %82, %L710.loopexit ]
  %.2 = phi i32 [ -2147483648, %pass5.L710_crit_edge ], [ %47, %L710.loopexit ]
  %48 = icmp sgt i64 %.sroa.066.0.copyload, 0
  %49 = select i1 %48, i64 %.sroa.066.0.copyload, i64 0
  %50 = mul i64 %.pre-phi81, %49
  %51 = add i64 %50, %.pre-phi
  %52 = getelementptr inbounds float, float addrspace(1)* %.sroa.3.0.copyload75, i64 %51
  %53 = bitcast float addrspace(1)* %52 to i32 addrspace(1)*
  store i32 %.2, i32 addrspace(1)* %53, align 4
  br label %L792

L792:                                             ; preds = %pass, %L710
  ret void

fail:                                             ; preds = %top
  call fastcc void @gpu_report_exception(i64 ptrtoint ([10 x i8]* @exception11 to i64))
  call fastcc void @gpu_signal_exception()
  call void asm sideeffect "trap;", ""() #3
  br label %pass

pass:                                             ; preds = %fail, %top
  %54 = sdiv i64 %13, %10
  %55 = mul i64 %54, %12
  %56 = sub i64 %13, %55
  %57 = zext i32 %8 to i64
  %58 = lshr i64 %57, 5
  %59 = and i64 %57, 31
  %60 = add nuw nsw i64 %59, 1
  %61 = add nuw nsw i64 %58, 1
  %62 = shl i64 %56, 5
  %63 = add i64 %60, %62
  %64 = shl i64 %54, 5
  %65 = add i64 %61, %64
  %66 = getelementptr inbounds { { [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }, { { [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* %0, i64 0, i32 0, i32 0, i64 0, i64 1, i64 0
  %67 = icmp sgt i64 %63, 0
  %68 = getelementptr inbounds { { [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }, { { [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* %0, i64 0, i32 0, i32 0, i64 0, i64 0, i64 0
  %69 = load i64, i64* %68, align 8
  %70 = icmp sle i64 %63, %69
  %value_phi.off0 = and i1 %70, %67
  %71 = icmp sgt i64 %65, 0
  %72 = load i64, i64* %66, align 8
  %73 = icmp sle i64 %65, %72
  %value_phi3 = and i1 %73, %71
  %74 = and i1 %value_phi3, %value_phi.off0
  br i1 %74, label %L162, label %L792

fail4:                                            ; preds = %L162
  call fastcc void @gpu_report_exception(i64 ptrtoint ([10 x i8]* @exception11 to i64))
  call fastcc void @gpu_signal_exception()
  call void asm sideeffect "trap;", ""() #3
  br label %pass5

pass5:                                            ; preds = %fail4, %L162
  %75 = sdiv i64 %.sroa.066.0.copyload, 32
  %76 = add nsw i64 %75, -1
  %77 = icmp slt i64 %.sroa.066.0.copyload, 32
  %78 = select i1 %77, i64 -1, i64 %76
  %79 = icmp slt i64 %78, 0
  br i1 %79, label %pass5.L710_crit_edge, label %L329.preheader

pass5.L710_crit_edge:                             ; preds = %pass5
  %.pre = or i64 %62, %59
  %.pre80 = or i64 %58, %64
  br label %L710

L329.preheader:                                   ; preds = %pass5
  %80 = icmp sgt i64 %.sroa.4.24.copyload, 0
  %81 = select i1 %80, i64 %.sroa.4.24.copyload, i64 0
  %82 = or i64 %62, %59
  %83 = mul nuw nsw i64 %58, 33
  %84 = add nuw nsw i64 %83, %59
  %85 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_283, i64 0, i64 %84
  %86 = bitcast float addrspace(3)* %85 to i32 addrspace(3)*
  %87 = icmp sgt i64 %.sroa.8.48.copyload, 0
  %88 = select i1 %87, i64 %.sroa.8.48.copyload, i64 0
  %89 = or i64 %58, %64
  %90 = mul i64 %89, %88
  %91 = getelementptr inbounds [1056 x float], [1056 x float] addrspace(3)* @__static_shmem_284, i64 0, i64 %84
  %92 = bitcast float addrspace(3)* %91 to i32 addrspace(3)*
  %93 = add nuw nsw i64 %59, -33
  %94 = add nsw i64 %83, -1
  br label %L329
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #1

define internal fastcc void @gpu_report_exception(i64) unnamed_addr {
top:
  %1 = alloca %printf_args, align 8
  %2 = bitcast %printf_args* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2)
  %3 = getelementptr inbounds %printf_args, %printf_args* %1, i64 0, i32 0
  store i64 %0, i64* %3, align 8
  %4 = call i32 @vprintf(i8* getelementptr inbounds ([108 x i8], [108 x i8]* @0, i64 0, i64 0), i8* nonnull %2)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare i32 @vprintf(i8*, i8*) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

define internal fastcc void @gpu_signal_exception() unnamed_addr {
top:
  %0 = call i64 @julia_exception_flag()
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %L9, label %L5

L5:                                               ; preds = %top
  %2 = inttoptr i64 %0 to i64*
  store i64 1, i64* %2, align 1
  call void @llvm.nvvm.membar.sys()
  br label %L11

L9:                                               ; preds = %top
  %3 = call i32 @vprintf(i8* getelementptr inbounds ([110 x i8], [110 x i8]* @1, i64 0, i64 0), i8* null)
  br label %L11

L11:                                              ; preds = %L9, %L5
  ret void
}

declare i64 @julia_exception_flag() local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.nvvm.membar.sys() #3

attributes #0 = { nounwind readnone }
attributes #1 = { convergent nounwind }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!nvvm.annotations = !{!2}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 1, !"Debug Info Version", i32 3}
!2 = !{void ({ { [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }*, { [2 x i64], i8 addrspace(1)* }*, { [2 x i64], i8 addrspace(1)* }*, { [2 x i64], i8 addrspace(1)* }*)* @_Z34julia_gpu_coalesced_matmul_kernel_7ContextI14__CUDACtx_Name16CompilerMetadataI11DynamicSize12DynamicCheckv16CartesianIndicesILi2E5TupleI5OneToI5Int64ES6_IS7_EEE7NDRangeILi2ES2_10StaticSizeI8_32__32_ES4_ILi2ES5_IS6_IS7_ES6_IS7_EEEvEEv14__PassType_253v12DisableHooksE29_gpu_coalesced_matmul_kernel_13CuDeviceArrayI7Float32Li2ELi1EES13_IS14_Li2ELi1EES13_IS14_Li2ELi1EE, !"kernel", i32 1, !"maxntidx", i32 1024, !"maxntidy", i32 1, !"maxntidz", i32 1}
