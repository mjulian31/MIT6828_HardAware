; ModuleID = 'overdub'
source_filename = "overdub"
target datalayout = "e-m:e-i64:64-n32:64"
target triple = "powerpc64le-unknown-linux-gnu"

%jl_value_t = type opaque

@llvm.compiler.used = appending global [3 x i8*] [i8* bitcast (void (%jl_value_t*)* @jl_gc_queue_root to i8*), i8* bitcast (%jl_value_t* (i8*, i32, i32)* @jl_gc_pool_alloc to i8*), i8* bitcast (%jl_value_t* (i8*, i64)* @jl_gc_big_alloc to i8*)], section "llvm.metadata"

define void @julia_overdub_1856({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture nonnull readonly dereferenceable(48), %jl_value_t* nonnull align 16 dereferenceable(40), %jl_value_t* nonnull align 16 dereferenceable(40), %jl_value_t* nonnull align 16 dereferenceable(40)) {
top:
  %4 = alloca i67584, align 16
  %5 = bitcast i67584* %4 to i8*
  %6 = alloca i67584, align 16
  %7 = bitcast i67584* %6 to i8*
  %8 = alloca i65536, align 16
  %9 = bitcast i65536* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8448, i8* nonnull %5)
  call void @llvm.lifetime.start.p0i8(i64 8448, i8* nonnull %7)
  call void @llvm.lifetime.start.p0i8(i64 8192, i8* nonnull %9)
  %10 = bitcast %jl_value_t* %1 to %jl_value_t**
  %11 = getelementptr inbounds %jl_value_t*, %jl_value_t** %10, i64 3
  %12 = bitcast %jl_value_t** %11 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = bitcast i65536* %8 to double*
  br label %L11

L11:                                              ; preds = %L11, %top
  %value_phi = phi i64 [ 1, %top ], [ %value_phi7, %L11 ]
  %value_phi1 = phi i64 [ 1, %top ], [ %value_phi8, %L11 ]
  %15 = shl i64 %value_phi1, 5
  %16 = add i64 %value_phi, -33
  %17 = add i64 %16, %15
  %18 = getelementptr inbounds double, double* %14, i64 %17
  store double -0.000000e+00, double* %18, align 8
  %19 = icmp sgt i64 %value_phi, 31
  %20 = add i64 %value_phi, 1
  %21 = icmp slt i64 %value_phi1, 32
  %not. = xor i1 %19, true
  %value_phi6.off0 = or i1 %21, %not.
  %value_phi7 = select i1 %19, i64 1, i64 %20
  %22 = zext i1 %19 to i64
  %value_phi8 = add i64 %value_phi1, %22
  br i1 %value_phi6.off0, label %L11, label %L86

L86:                                              ; preds = %L11
  %23 = sdiv i64 %13, 32
  %24 = add nsw i64 %23, -1
  %25 = icmp slt i64 %13, 32
  %26 = select i1 %25, i64 -1, i64 %24
  %27 = icmp sgt i64 %26, -1
  %28 = getelementptr inbounds { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }, { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* %0, i64 0, i32 0, i32 0, i64 0, i64 0
  br i1 %27, label %L98.preheader, label %L86.L450.L451_crit_edge_crit_edge

L86.L450.L451_crit_edge_crit_edge:                ; preds = %L86
  %.pre = load i64, i64* %28, align 8
  %.pre121 = shl i64 %.pre, 5
  br label %L450.L451_crit_edge

L98.preheader:                                    ; preds = %L86
  %29 = getelementptr inbounds { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }, { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* %0, i64 0, i32 0, i32 0, i64 0, i64 1
  %30 = load i64, i64* %28, align 8
  %31 = shl i64 %30, 5
  %32 = load i64, i64* %29, align 8
  %33 = shl i64 %32, 5
  %34 = bitcast %jl_value_t* %2 to %jl_value_t**
  %35 = getelementptr inbounds %jl_value_t*, %jl_value_t** %34, i64 3
  %36 = bitcast %jl_value_t** %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = bitcast %jl_value_t* %2 to double**
  %39 = load double*, double** %38, align 8
  %40 = bitcast i67584* %4 to double*
  %41 = bitcast %jl_value_t* %3 to %jl_value_t**
  %42 = getelementptr inbounds %jl_value_t*, %jl_value_t** %41, i64 3
  %43 = bitcast %jl_value_t** %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = bitcast %jl_value_t* %3 to double**
  %46 = load double*, double** %45, align 8
  %47 = bitcast i67584* %6 to double*
  br label %L98

L98:                                              ; preds = %L439, %L98.preheader
  %value_phi21 = phi i64 [ %99, %L439 ], [ 0, %L98.preheader ]
  %48 = shl i64 %value_phi21, 5
  br label %L101

L101:                                             ; preds = %L101, %L98
  %value_phi23 = phi i64 [ 1, %L98 ], [ %value_phi30, %L101 ]
  %value_phi24 = phi i64 [ 1, %L98 ], [ %value_phi31, %L101 ]
  %49 = add i64 %value_phi24, -1
  %50 = add i64 %49, %48
  %51 = mul i64 %37, %50
  %52 = add i64 %value_phi23, -33
  %53 = add i64 %52, %31
  %54 = add i64 %53, %51
  %55 = getelementptr inbounds double, double* %39, i64 %54
  %56 = bitcast double* %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = mul i64 %value_phi24, 33
  %59 = add i64 %value_phi23, -34
  %60 = add i64 %59, %58
  %61 = getelementptr inbounds double, double* %40, i64 %60
  %62 = bitcast double* %61 to i64*
  store i64 %57, i64* %62, align 8
  %63 = add i64 %value_phi24, -33
  %64 = add i64 %63, %33
  %65 = mul i64 %44, %64
  %66 = add i64 %value_phi23, -1
  %67 = add i64 %66, %48
  %68 = add i64 %67, %65
  %69 = getelementptr inbounds double, double* %46, i64 %68
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds double, double* %47, i64 %60
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %74 = icmp sgt i64 %value_phi23, 31
  %75 = add i64 %value_phi23, 1
  %76 = icmp slt i64 %value_phi24, 32
  %not.123 = xor i1 %74, true
  %value_phi29.off0 = or i1 %76, %not.123
  %value_phi30 = select i1 %74, i64 1, i64 %75
  %77 = zext i1 %74 to i64
  %value_phi31 = add i64 %value_phi24, %77
  br i1 %value_phi29.off0, label %L101, label %L222

L222:                                             ; preds = %L410, %L101
  %value_phi41 = phi i64 [ %value_phi57, %L410 ], [ 1, %L101 ]
  %value_phi42 = phi i64 [ %value_phi58, %L410 ], [ 1, %L101 ]
  %78 = shl i64 %value_phi42, 5
  %79 = add i64 %value_phi41, -33
  %80 = add i64 %79, %78
  %81 = getelementptr inbounds double, double* %14, i64 %80
  %82 = add i64 %value_phi41, -34
  %83 = mul i64 %value_phi42, 33
  %84 = add i64 %83, -34
  %.promoted = load double, double* %81, align 8
  br label %L233

L233:                                             ; preds = %L233, %L222
  %x.i117120 = phi double [ %.promoted, %L222 ], [ %x.i117, %L233 ]
  %value_phi51 = phi i64 [ 1, %L222 ], [ %93, %L233 ]
  %85 = mul nuw nsw i64 %value_phi51, 33
  %86 = add i64 %82, %85
  %87 = getelementptr inbounds double, double* %40, i64 %86
  %88 = load double, double* %87, align 8
  %89 = add i64 %84, %value_phi51
  %90 = getelementptr inbounds double, double* %47, i64 %89
  %91 = load double, double* %90, align 8
  %x.i = fmul contract double %88, %91
  %x.i117 = fadd contract double %x.i117120, %x.i
  %92 = icmp eq i64 %value_phi51, 32
  %93 = add nuw nsw i64 %value_phi51, 1
  br i1 %92, label %L410, label %L233

L410:                                             ; preds = %L233
  %x.i117.lcssa = phi double [ %x.i117, %L233 ]
  store double %x.i117.lcssa, double* %81, align 8
  %94 = icmp sgt i64 %value_phi41, 31
  %95 = add i64 %value_phi41, 1
  %96 = icmp slt i64 %value_phi42, 32
  %not.124 = xor i1 %94, true
  %value_phi56.off0 = or i1 %96, %not.124
  %value_phi57 = select i1 %94, i64 1, i64 %95
  %97 = zext i1 %94 to i64
  %value_phi58 = add i64 %value_phi42, %97
  br i1 %value_phi56.off0, label %L222, label %L439

L439:                                             ; preds = %L410
  %98 = icmp eq i64 %value_phi21, %26
  %99 = add i64 %value_phi21, 1
  br i1 %98, label %L450.L451_crit_edge, label %L98

L450.L451_crit_edge:                              ; preds = %L439, %L86.L450.L451_crit_edge_crit_edge
  %.pre-phi = phi i64 [ %.pre121, %L86.L450.L451_crit_edge_crit_edge ], [ %31, %L439 ]
  %100 = getelementptr inbounds { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }, { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* %0, i64 0, i32 0, i32 0, i64 0, i64 1
  %101 = load i64, i64* %100, align 8
  %102 = shl i64 %101, 5
  %103 = bitcast %jl_value_t* %1 to double**
  %104 = load double*, double** %103, align 8
  br label %L451

L451:                                             ; preds = %L451, %L450.L451_crit_edge
  %value_phi75 = phi i64 [ 1, %L450.L451_crit_edge ], [ %value_phi84, %L451 ]
  %value_phi76 = phi i64 [ 1, %L450.L451_crit_edge ], [ %value_phi85, %L451 ]
  %105 = shl i64 %value_phi76, 5
  %106 = add i64 %value_phi75, -33
  %107 = add i64 %106, %105
  %108 = getelementptr inbounds double, double* %14, i64 %107
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = add i64 %value_phi76, -33
  %112 = add i64 %111, %102
  %113 = mul i64 %112, %13
  %114 = add i64 %106, %.pre-phi
  %115 = add i64 %114, %113
  %116 = getelementptr inbounds double, double* %104, i64 %115
  %117 = bitcast double* %116 to i64*
  store i64 %110, i64* %117, align 8
  %118 = icmp sgt i64 %value_phi75, 31
  %119 = add i64 %value_phi75, 1
  %120 = icmp slt i64 %value_phi76, 32
  %not.122 = xor i1 %118, true
  %value_phi83.off0 = or i1 %120, %not.122
  %value_phi84 = select i1 %118, i64 1, i64 %119
  %121 = zext i1 %118 to i64
  %value_phi85 = add i64 %value_phi76, %121
  br i1 %value_phi83.off0, label %L451, label %L545

L545:                                             ; preds = %L451
  ret void
}

define nonnull %jl_value_t* @jfptr_overdub_1857(%jl_value_t*, %jl_value_t**, i32) #0 {
top:
  %gcframe = alloca %jl_value_t*, i32 3, align 16
  %3 = bitcast %jl_value_t** %gcframe to i8*
  call void @llvm.memset.p0i8.i32(i8* align 16 %3, i8 0, i32 24, i1 false)
  %4 = call %jl_value_t*** inttoptr (i64 17590368344944 to %jl_value_t*** ()*)() #3
  %5 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 0
  %6 = bitcast %jl_value_t** %5 to i64*
  store i64 4, i64* %6
  %7 = getelementptr %jl_value_t**, %jl_value_t*** %4, i32 0
  %8 = load %jl_value_t**, %jl_value_t*** %7
  %9 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 1
  %10 = bitcast %jl_value_t** %9 to %jl_value_t***
  store %jl_value_t** %8, %jl_value_t*** %10
  %11 = bitcast %jl_value_t*** %7 to %jl_value_t***
  store %jl_value_t** %gcframe, %jl_value_t*** %11
  %12 = bitcast %jl_value_t** %1 to { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }**
  %13 = load { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }*, { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }** %12, align 8
  %14 = getelementptr inbounds %jl_value_t*, %jl_value_t** %1, i64 2
  %15 = load %jl_value_t*, %jl_value_t** %14, align 8
  %16 = getelementptr inbounds %jl_value_t*, %jl_value_t** %1, i64 3
  %17 = load %jl_value_t*, %jl_value_t** %16, align 8
  %18 = getelementptr inbounds %jl_value_t*, %jl_value_t** %1, i64 4
  %19 = load %jl_value_t*, %jl_value_t** %18, align 8
  %20 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  %21 = bitcast { { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* %13 to %jl_value_t*
  store %jl_value_t* %21, %jl_value_t** %20
  call void @julia_overdub_1856({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly %13, %jl_value_t* %15, %jl_value_t* %17, %jl_value_t* %19)
  %22 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 1
  %23 = load %jl_value_t*, %jl_value_t** %22
  %24 = getelementptr %jl_value_t**, %jl_value_t*** %4, i32 0
  %25 = bitcast %jl_value_t*** %24 to %jl_value_t**
  store %jl_value_t* %23, %jl_value_t** %25
  ret %jl_value_t* inttoptr (i64 127778503625680 to %jl_value_t*)
}

; Function Attrs: allocsize(1)
declare noalias nonnull %jl_value_t* @julia.gc_alloc_obj(i8*, i64, %jl_value_t*) #1

; Function Attrs: noreturn
declare void @jl_throw(%jl_value_t*) #2

declare token @llvm.julia.gc_preserve_begin(...)

; Function Attrs: nounwind readnone
declare %jl_value_t* @julia.pointer_from_objref(%jl_value_t*) #3

declare void @llvm.julia.gc_preserve_end(token)

declare nonnull %jl_value_t* @j_overdub_1859({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [1 x i64]* nocapture readonly)

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #4

declare nonnull %jl_value_t* @j_overdub_1860({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [3 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1861({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [1 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1862({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [3 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1863({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [1 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1864({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [2 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1865({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [1 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1866({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [2 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1867({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [1 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1868({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [3 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1869({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [1 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1870({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [2 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1871({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [1 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1872({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [2 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1873({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [1 x i64]* nocapture readonly)

declare nonnull %jl_value_t* @j_overdub_1874({ { [1 x [2 x i64]], [1 x [2 x [1 x i64]]], { [1 x [2 x [1 x i64]]] } } }* nocapture readonly, %jl_value_t*, [3 x i64]* nocapture readonly)

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: inaccessiblemem_or_argmemonly
declare void @jl_gc_queue_root(%jl_value_t*) #6

; Function Attrs: allocsize(1)
declare noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8*, i32, i32) #1

; Function Attrs: allocsize(1)
declare noalias nonnull %jl_value_t* @jl_gc_big_alloc(i8*, i64) #1

; Function Attrs: nounwind
declare void @llvm.assume(i1) #7

declare noalias nonnull %jl_value_t** @julia.new_gc_frame(i32)

declare void @julia.push_gc_frame(%jl_value_t**, i32)

declare %jl_value_t** @julia.get_gc_frame_slot(%jl_value_t**, i32)

declare void @julia.pop_gc_frame(%jl_value_t**)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #5

attributes #0 = { "thunk" }
attributes #1 = { allocsize(1) }
attributes #2 = { noreturn }
attributes #3 = { nounwind readnone }
attributes #4 = { cold noreturn nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { inaccessiblemem_or_argmemonly }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 1, !"Debug Info Version", i32 3}