; ModuleID = 'mul_tile!'
source_filename = "mul_tile!"
target datalayout = "e-m:e-i64:64-n32:64"
target triple = "powerpc64le-unknown-linux-gnu"

%jl_value_t = type opaque

@llvm.compiler.used = appending global [3 x i8*] [i8* bitcast (void (%jl_value_t*)* @jl_gc_queue_root to i8*), i8* bitcast (%jl_value_t* (i8*, i32, i32)* @jl_gc_pool_alloc to i8*), i8* bitcast (%jl_value_t* (i8*, i64)* @jl_gc_big_alloc to i8*)], section "llvm.metadata"

define nonnull %jl_value_t* @"japi1_mul_tile!_1271"(%jl_value_t*, %jl_value_t**, i32) #0 {
top:
  %3 = alloca %jl_value_t*, i32 3
  %gcframe = alloca %jl_value_t*, i32 4, align 16
  %4 = bitcast %jl_value_t** %gcframe to i8*
  call void @llvm.memset.p0i8.i32(i8* align 16 %4, i8 0, i32 32, i1 false)
  %5 = alloca %jl_value_t**, align 8
  store volatile %jl_value_t** %1, %jl_value_t*** %5, align 8
  %6 = call %jl_value_t*** inttoptr (i64 10353236384624 to %jl_value_t*** ()*)() #7
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
  %19 = bitcast %jl_value_t* %18 to %jl_value_t**
  %20 = getelementptr inbounds %jl_value_t*, %jl_value_t** %19, i64 3
  %21 = bitcast %jl_value_t** %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = sitofp i64 %22 to double
  %24 = fmul double %23, 3.125000e-02
  %25 = fcmp ult double %24, 0xC3E0000000000000
  %26 = fcmp uge double %24, 0x43E0000000000000
  %27 = or i1 %25, %26
  %28 = call double @llvm.trunc.f64(double %24)
  %29 = fcmp une double %28, %24
  %or.cond = or i1 %27, %29
  br i1 %or.cond, label %L20, label %L18

L18:                                              ; preds = %top
  %30 = fptosi double %24 to i64
  %31 = icmp sgt i64 %30, 0
  %32 = select i1 %31, i64 %30, i64 0
  %33 = getelementptr %jl_value_t**, %jl_value_t*** %6, i64 2
  %34 = bitcast %jl_value_t*** %33 to i16*
  %35 = load i16, i16* %34, align 2
  %36 = icmp eq i16 %35, 0
  br i1 %36, label %L34, label %L38

L20:                                              ; preds = %top
  %37 = bitcast %jl_value_t*** %6 to i8*
  %38 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %37, i32 1400, i32 16) #3
  %39 = bitcast %jl_value_t* %38 to %jl_value_t**
  %40 = getelementptr %jl_value_t*, %jl_value_t** %39, i64 -1
  store %jl_value_t* inttoptr (i64 130118011574032 to %jl_value_t*), %jl_value_t** %40
  %41 = bitcast %jl_value_t* %38 to double*
  store double %24, double* %41, align 8
  %42 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %38, %jl_value_t** %42
  %43 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
  store %jl_value_t* inttoptr (i64 130117930266720 to %jl_value_t*), %jl_value_t** %43
  %44 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 1
  store %jl_value_t* inttoptr (i64 130118010949728 to %jl_value_t*), %jl_value_t** %44
  %45 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 2
  store %jl_value_t* %38, %jl_value_t** %45
  %46 = call nonnull %jl_value_t* @jl_invoke(%jl_value_t* inttoptr (i64 130118017273744 to %jl_value_t*), %jl_value_t** %3, i32 3, %jl_value_t* inttoptr (i64 130118017273216 to %jl_value_t*))
  %47 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %46, %jl_value_t** %47
  call void @jl_throw(%jl_value_t* %46)
  unreachable

L34:                                              ; preds = %L18
  %48 = call i32 inttoptr (i64 130118221340080 to i32 ()*)()
  %49 = icmp ne i32 %48, 0
  br label %L38

L38:                                              ; preds = %L34, %L18
  %value_phi2.off0 = phi i1 [ %49, %L34 ], [ true, %L18 ]
  %50 = bitcast %jl_value_t*** %6 to i8*
  %51 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %50, i32 1472, i32 64) #3
  %52 = bitcast %jl_value_t* %51 to %jl_value_t**
  %53 = getelementptr %jl_value_t*, %jl_value_t** %52, i64 -1
  store %jl_value_t* inttoptr (i64 130114755907056 to %jl_value_t*), %jl_value_t** %53
  %54 = bitcast %jl_value_t* %51 to { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }*
  %.repack = bitcast %jl_value_t* %51 to %jl_value_t**
  store %jl_value_t* %14, %jl_value_t** %.repack, align 8
  %.repack7 = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %54, i64 0, i32 1
  store %jl_value_t* %16, %jl_value_t** %.repack7, align 8
  %.repack9 = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %54, i64 0, i32 2
  store %jl_value_t* %18, %jl_value_t** %.repack9, align 8
  %.repack11 = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %54, i64 0, i32 3
  store i64 %30, i64* %.repack11, align 8
  %.repack13.repack = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %54, i64 0, i32 4, i64 0
  store i64 1, i64* %.repack13.repack, align 8
  %.repack13.repack15 = getelementptr inbounds { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }, { %jl_value_t*, %jl_value_t*, %jl_value_t*, i64, [2 x i64] }* %54, i64 0, i32 4, i64 1
  store i64 %32, i64* %.repack13.repack15, align 8
  %55 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 3
  store %jl_value_t* %51, %jl_value_t** %55
  br i1 %value_phi2.off0, label %L54, label %L59

L54:                                              ; preds = %L38
  %56 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %50, i32 1400, i32 16) #3
  %57 = bitcast %jl_value_t* %56 to %jl_value_t**
  %58 = getelementptr %jl_value_t*, %jl_value_t** %57, i64 -1
  store %jl_value_t* inttoptr (i64 130118012484592 to %jl_value_t*), %jl_value_t** %58
  %59 = bitcast %jl_value_t* %56 to i8*
  store i8 1, i8* %59, align 8
  %60 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %56, %jl_value_t** %60
  %61 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
  store %jl_value_t* %51, %jl_value_t** %61
  %62 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 1
  store %jl_value_t* %56, %jl_value_t** %62
  %63 = call nonnull %jl_value_t* @jl_f__apply_latest(%jl_value_t* null, %jl_value_t** %3, i32 2)
  br label %L60

L59:                                              ; preds = %L38
  %64 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
  store %jl_value_t* %51, %jl_value_t** %64
  %65 = call nonnull %jl_value_t* @jl_invoke(%jl_value_t* inttoptr (i64 130118068029808 to %jl_value_t*), %jl_value_t** %3, i32 1, %jl_value_t* inttoptr (i64 130115543425680 to %jl_value_t*))
  br label %L60

L60:                                              ; preds = %L59, %L54
  %66 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 1
  %67 = load %jl_value_t*, %jl_value_t** %66
  %68 = getelementptr %jl_value_t**, %jl_value_t*** %6, i32 0
  %69 = bitcast %jl_value_t*** %68 to %jl_value_t**
  store %jl_value_t* %67, %jl_value_t** %69
  ret %jl_value_t* inttoptr (i64 130118011292624 to %jl_value_t*)
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.trunc.f64(double) #1

declare nonnull %jl_value_t* @j_getindex_1272(%jl_value_t* readonly, i64)

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
