; ModuleID = 'mul_tile!'
source_filename = "mul_tile!"
target datalayout = "e-m:e-i64:64-n32:64"
target triple = "powerpc64le-unknown-linux-gnu"

%jl_value_t = type opaque

@llvm.compiler.used = appending global [3 x i8*] [i8* bitcast (void (%jl_value_t*)* @jl_gc_queue_root to i8*), i8* bitcast (%jl_value_t* (i8*, i32, i32)* @jl_gc_pool_alloc to i8*), i8* bitcast (%jl_value_t* (i8*, i64)* @jl_gc_big_alloc to i8*)], section "llvm.metadata"

define nonnull %jl_value_t* @"japi1_mul_tile!_1523"(%jl_value_t*, %jl_value_t**, i32) #0 {
top:
  %3 = alloca %jl_value_t*, i32 3
  %gcframe = alloca %jl_value_t*, i32 4, align 16
  %4 = bitcast %jl_value_t** %gcframe to i8*
  call void @llvm.memset.p0i8.i32(i8* align 16 %4, i8 0, i32 32, i1 false)
  %5 = alloca %jl_value_t**, align 8
  store volatile %jl_value_t** %1, %jl_value_t*** %5, align 8
  %6 = call %jl_value_t*** inttoptr (i64 17590368344944 to %jl_value_t*** ()*)() #7
  %7 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 0
  %8 = bitcast %jl_value_t** %7 to i64*
  store i64 8, i64* %8
  %9 = getelementptr %jl_value_t**, %jl_value_t*** %6, i32 0
  %10 = load %jl_value_t**, %jl_value_t*** %9
  %11 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 1
  %12 = bitcast %jl_value_t** %11 to %jl_value_t***
  store %jl_value_t** %10, %jl_value_t*** %12
  %13 = bitcast %jl_value_t*** %9 to %jl_value_t***
  store %jl_value_t** %gcframe, %jl_value_t*** %13
  %14 = load %jl_value_t*, %jl_value_t** %1, align 8
  %15 = getelementptr inbounds %jl_value_t*, %jl_value_t** %1, i64 1
  %16 = load %jl_value_t*, %jl_value_t** %15, align 8
  %17 = getelementptr inbounds %jl_value_t*, %jl_value_t** %1, i64 2
  %18 = load %jl_value_t*, %jl_value_t** %17, align 8
  %19 = bitcast %jl_value_t* %16 to %jl_value_t**
  %20 = getelementptr inbounds %jl_value_t*, %jl_value_t** %19, i64 3
  %21 = bitcast %jl_value_t** %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = bitcast %jl_value_t* %14 to %jl_value_t**
  %24 = getelementptr inbounds %jl_value_t*, %jl_value_t** %23, i64 4
  %25 = bitcast %jl_value_t** %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = icmp eq i64 %22, %26
  br i1 %27, label %L5, label %L124

L5:                                               ; preds = %top
  %28 = getelementptr inbounds %jl_value_t*, %jl_value_t** %23, i64 3
  %29 = bitcast %jl_value_t** %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = bitcast %jl_value_t* %18 to %jl_value_t**
  %32 = getelementptr inbounds %jl_value_t*, %jl_value_t** %31, i64 3
  %33 = bitcast %jl_value_t** %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = icmp eq i64 %30, %34
  br i1 %35, label %L10, label %L121

L10:                                              ; preds = %L5
  %36 = getelementptr inbounds %jl_value_t*, %jl_value_t** %19, i64 4
  %37 = bitcast %jl_value_t** %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds %jl_value_t*, %jl_value_t** %31, i64 4
  %40 = bitcast %jl_value_t** %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = icmp eq i64 %38, %41
  br i1 %42, label %L15, label %L118

L15:                                              ; preds = %L10
  %43 = icmp ne i64 %22, %30
  %44 = icmp ne i64 %38, %22
  %value_phi.off0 = or i1 %44, %43
  br i1 %value_phi.off0, label %L115, label %L53

L53:                                              ; preds = %L15
  %45 = sitofp i64 %30 to double
  %46 = fmul double %45, 3.125000e-02
  %47 = fcmp ult double %46, 0xC3E0000000000000
  %48 = fcmp uge double %46, 0x43E0000000000000
  %49 = or i1 %47, %48
  %50 = call double @llvm.trunc.f64(double %46)
  %51 = fcmp une double %50, %46
  %or.cond = or i1 %49, %51
  br i1 %or.cond, label %L73, label %L71

L71:                                              ; preds = %L53
  %52 = fptosi double %46 to i64
  %53 = icmp sgt i64 %52, 0
  %54 = select i1 %53, i64 %52, i64 0
  %55 = getelementptr %jl_value_t**, %jl_value_t*** %6, i64 2
  %56 = bitcast %jl_value_t*** %55 to i16*
  %57 = load i16, i16* %56, align 2
  %58 = icmp eq i16 %57, 0
  br i1 %58, label %L87, label %L91

L73:                                              ; preds = %L53
  %59 = bitcast %jl_value_t*** %6 to i8*
  %60 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %59, i32 1400, i32 16) #3
  %61 = bitcast %jl_value_t* %60 to %jl_value_t**
  %62 = getelementptr %jl_value_t*, %jl_value_t** %61, i64 -1
  store %jl_value_t* inttoptr (i64 127778503907088 to %jl_value_t*), %jl_value_t** %62
  %63 = bitcast %jl_value_t* %60 to double*
  store double %46, double* %63, align 8
  %64 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %60, %jl_value_t** %64
  %65 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
  store %jl_value_t* inttoptr (i64 127778422599776 to %jl_value_t*), %jl_value_t** %65
  %66 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 1
  store %jl_value_t* inttoptr (i64 127778503282784 to %jl_value_t*), %jl_value_t** %66
  %67 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 2
  store %jl_value_t* %60, %jl_value_t** %67
  %68 = call nonnull %jl_value_t* @jl_invoke(%jl_value_t* inttoptr (i64 127778509606800 to %jl_value_t*), %jl_value_t** %3, i32 3, %jl_value_t* inttoptr (i64 127778509606272 to %jl_value_t*))
  %69 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %68, %jl_value_t** %69
  call void @jl_throw(%jl_value_t* %68)
  unreachable

L87:                                              ; preds = %L71
  %70 = call i32 inttoptr (i64 127778901237168 to i32 ()*)()
  %71 = icmp ne i32 %70, 0
  br label %L91

L91:                                              ; preds = %L87, %L71
  %value_phi5.off0 = phi i1 [ %71, %L87 ], [ true, %L71 ]
  %72 = bitcast %jl_value_t*** %6 to i8*
  %73 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %72, i32 1472, i32 64) #3
  %74 = bitcast %jl_value_t* %73 to %jl_value_t**
  %75 = getelementptr %jl_value_t*, %jl_value_t** %74, i64 -1
  store %jl_value_t* inttoptr (i64 127760773352368 to %jl_value_t*), %jl_value_t** %75
  %76 = bitcast %jl_value_t* %73 to { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }*
  %.repack = bitcast %jl_value_t* %73 to %jl_value_t**
  store %jl_value_t* %14, %jl_value_t** %.repack, align 8
  %.repack21 = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %76, i64 0, i32 1
  store %jl_value_t* %16, %jl_value_t** %.repack21, align 8
  %.repack23 = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %76, i64 0, i32 2
  store %jl_value_t* %18, %jl_value_t** %.repack23, align 8
  %.repack25 = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %76, i64 0, i32 3
  store i64 %52, i64* %.repack25, align 8
  %.repack27.repack = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %76, i64 0, i32 4, i64 0
  store i64 1, i64* %.repack27.repack, align 8
  %.repack27.repack29 = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %76, i64 0, i32 4, i64 1
  store i64 %54, i64* %.repack27.repack29, align 8
  %77 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 3
  store %jl_value_t* %73, %jl_value_t** %77
  br i1 %value_phi5.off0, label %L107, label %L112

L107:                                             ; preds = %L91
  %78 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %72, i32 1400, i32 16) #3
  %79 = bitcast %jl_value_t* %78 to %jl_value_t**
  %80 = getelementptr %jl_value_t*, %jl_value_t** %79, i64 -1
  store %jl_value_t* inttoptr (i64 127778504817648 to %jl_value_t*), %jl_value_t** %80
  %81 = bitcast %jl_value_t* %78 to i8*
  store i8 1, i8* %81, align 8
  %82 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %78, %jl_value_t** %82
  %83 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
  store %jl_value_t* %73, %jl_value_t** %83
  %84 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 1
  store %jl_value_t* %78, %jl_value_t** %84
  %85 = call nonnull %jl_value_t* @jl_f__apply_latest(%jl_value_t* null, %jl_value_t** %3, i32 2)
  br label %L113

L112:                                             ; preds = %L91
  %86 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
  store %jl_value_t* %73, %jl_value_t** %86
  %87 = call nonnull %jl_value_t* @jl_invoke(%jl_value_t* inttoptr (i64 127778560362864 to %jl_value_t*), %jl_value_t** %3, i32 1, %jl_value_t* inttoptr (i64 127760952627664 to %jl_value_t*))
  br label %L113

L113:                                             ; preds = %L112, %L107
  %88 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 1
  %89 = load %jl_value_t*, %jl_value_t** %88
  %90 = getelementptr %jl_value_t**, %jl_value_t*** %6, i32 0
  %91 = bitcast %jl_value_t*** %90 to %jl_value_t**
  store %jl_value_t* %89, %jl_value_t** %91
  ret %jl_value_t* inttoptr (i64 127778503625680 to %jl_value_t*)

L115:                                             ; preds = %L15
  %92 = bitcast %jl_value_t*** %6 to i8*
  %93 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %92, i32 1400, i32 16) #3
  %94 = bitcast %jl_value_t* %93 to %jl_value_t**
  %95 = getelementptr %jl_value_t*, %jl_value_t** %94, i64 -1
  store %jl_value_t* inttoptr (i64 127778505231072 to %jl_value_t*), %jl_value_t** %95
  %96 = bitcast %jl_value_t* %93 to %jl_value_t**
  store %jl_value_t* inttoptr (i64 127760915770256 to %jl_value_t*), %jl_value_t** %96, align 8
  %97 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %93, %jl_value_t** %97
  call void @jl_throw(%jl_value_t* %93)
  unreachable

L118:                                             ; preds = %L10
  %98 = bitcast %jl_value_t*** %6 to i8*
  %99 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %98, i32 1400, i32 16) #3
  %100 = bitcast %jl_value_t* %99 to %jl_value_t**
  %101 = getelementptr %jl_value_t*, %jl_value_t** %100, i64 -1
  store %jl_value_t* inttoptr (i64 127778505231072 to %jl_value_t*), %jl_value_t** %101
  %102 = bitcast %jl_value_t* %99 to %jl_value_t**
  store %jl_value_t* inttoptr (i64 127760915769232 to %jl_value_t*), %jl_value_t** %102, align 8
  %103 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %99, %jl_value_t** %103
  call void @jl_throw(%jl_value_t* %99)
  unreachable

L121:                                             ; preds = %L5
  %104 = bitcast %jl_value_t*** %6 to i8*
  %105 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %104, i32 1400, i32 16) #3
  %106 = bitcast %jl_value_t* %105 to %jl_value_t**
  %107 = getelementptr %jl_value_t*, %jl_value_t** %106, i64 -1
  store %jl_value_t* inttoptr (i64 127778505231072 to %jl_value_t*), %jl_value_t** %107
  %108 = bitcast %jl_value_t* %105 to %jl_value_t**
  store %jl_value_t* inttoptr (i64 127760915768272 to %jl_value_t*), %jl_value_t** %108, align 8
  %109 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %105, %jl_value_t** %109
  call void @jl_throw(%jl_value_t* %105)
  unreachable

L124:                                             ; preds = %top
  %110 = bitcast %jl_value_t*** %6 to i8*
  %111 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %110, i32 1400, i32 16) #3
  %112 = bitcast %jl_value_t* %111 to %jl_value_t**
  %113 = getelementptr %jl_value_t*, %jl_value_t** %112, i64 -1
  store %jl_value_t* inttoptr (i64 127778505231072 to %jl_value_t*), %jl_value_t** %113
  %114 = bitcast %jl_value_t* %111 to %jl_value_t**
  store %jl_value_t* inttoptr (i64 127760915767312 to %jl_value_t*), %jl_value_t** %114, align 8
  %115 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %111, %jl_value_t** %115
  call void @jl_throw(%jl_value_t* %111)
  unreachable
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.trunc.f64(double) #1

declare nonnull %jl_value_t* @j_getindex_1524(%jl_value_t* readonly, i64)

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #2

; Function Attrs: allocsize(1)
declare noalias nonnull %jl_value_t* @julia.gc_alloc_obj(i8*, i64, %jl_value_t*) #3

declare nonnull %jl_value_t* @jl_f__apply_latest(%jl_value_t*, %jl_value_t**, i32) #0

declare nonnull %jl_value_t* @jl_invoke(%jl_value_t*, %jl_value_t** nocapture readonly, i32, %jl_value_t*)

; Function Attrs: noreturn
declare void @jl_throw(%jl_value_t*) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: inaccessiblemem_or_argmemonly
declare void @jl_gc_queue_root(%jl_value_t*) #6

; Function Attrs: allocsize(1)
declare noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8*, i32, i32) #3

; Function Attrs: allocsize(1)
declare noalias nonnull %jl_value_t* @jl_gc_big_alloc(i8*, i64) #3

declare noalias nonnull %jl_value_t** @julia.new_gc_frame(i32)

declare void @julia.push_gc_frame(%jl_value_t**, i32)

declare %jl_value_t** @julia.get_gc_frame_slot(%jl_value_t**, i32)

declare void @julia.pop_gc_frame(%jl_value_t**)

; Function Attrs: allocsize(1)
declare noalias nonnull %jl_value_t* @julia.gc_alloc_bytes(i8*, i64) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #5

attributes #0 = { "thunk" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { cold noreturn nounwind }
attributes #3 = { allocsize(1) }
attributes #4 = { noreturn }
attributes #5 = { argmemonly nounwind }
attributes #6 = { inaccessiblemem_or_argmemonly }
attributes #7 = { nounwind readnone }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Dwarf Version", i32 4}
!1 = !{i32 1, !"Debug Info Version", i32 3}
