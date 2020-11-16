define nonnull %jl_value_t* @"japi1_mul_tile!_2174"(%jl_value_t*, %jl_value_t**, i32) #0 {
top:
  %3 = alloca %jl_value_t*, i32 3
  %gcframe = alloca %jl_value_t*, i32 4, align 16
  %4 = bitcast %jl_value_t** %gcframe to i8*
  call void @llvm.memset.p0i8.i32(i8* align 16 %4, i8 0, i32 32, i1 false)
  %5 = alloca %jl_value_t**, align 8
  store volatile %jl_value_t** %1, %jl_value_t*** %5, align 8
  %6 = call %jl_value_t*** inttoptr (i64 9874886892400 to %jl_value_t*** ()*)() #7
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
;  @ REPL[14]:2 within `mul_tile!'
; ┌ @ array.jl:154 within `size'
   %19 = bitcast %jl_value_t* %16 to %jl_value_t**
   %20 = getelementptr inbounds %jl_value_t*, %jl_value_t** %19, i64 3
   %21 = bitcast %jl_value_t** %20 to i64*
   %22 = load i64, i64* %21, align 8
   %23 = bitcast %jl_value_t* %14 to %jl_value_t**
   %24 = getelementptr inbounds %jl_value_t*, %jl_value_t** %23, i64 4
   %25 = bitcast %jl_value_t** %24 to i64*
   %26 = load i64, i64* %25, align 8
; └
; ┌ @ promotion.jl:398 within `=='
   %27 = icmp eq i64 %22, %26
; └
  br i1 %27, label %L5, label %L124

L5:                                               ; preds = %top
;  @ REPL[14]:3 within `mul_tile!'
; ┌ @ array.jl:154 within `size'
   %28 = getelementptr inbounds %jl_value_t*, %jl_value_t** %23, i64 3
   %29 = bitcast %jl_value_t** %28 to i64*
   %30 = load i64, i64* %29, align 8
   %31 = bitcast %jl_value_t* %18 to %jl_value_t**
   %32 = getelementptr inbounds %jl_value_t*, %jl_value_t** %31, i64 3
   %33 = bitcast %jl_value_t** %32 to i64*
   %34 = load i64, i64* %33, align 8
; └
; ┌ @ promotion.jl:398 within `=='
   %35 = icmp eq i64 %30, %34
; └
  br i1 %35, label %L10, label %L121

L10:                                              ; preds = %L5
;  @ REPL[14]:4 within `mul_tile!'
; ┌ @ array.jl:154 within `size'
   %36 = getelementptr inbounds %jl_value_t*, %jl_value_t** %19, i64 4
   %37 = bitcast %jl_value_t** %36 to i64*
   %38 = load i64, i64* %37, align 8
   %39 = getelementptr inbounds %jl_value_t*, %jl_value_t** %31, i64 4
   %40 = bitcast %jl_value_t** %39 to i64*
   %41 = load i64, i64* %40, align 8
; └
; ┌ @ promotion.jl:398 within `=='
   %42 = icmp eq i64 %38, %41
; └
  br i1 %42, label %L15, label %L118

L15:                                              ; preds = %L10
;  @ REPL[14]:5 within `mul_tile!'
; ┌ @ tuple.jl:284 within `=='
; │┌ @ tuple.jl:288 within `_eq'
; ││┌ @ promotion.jl:398 within `=='
     %43 = icmp ne i64 %22, %30
; ││└
; ││ @ tuple.jl:289 within `_eq'
    %44 = icmp ne i64 %38, %22
    %value_phi.off0 = or i1 %44, %43
; └└
  br i1 %value_phi.off0, label %L115, label %L53

L53:                                              ; preds = %L15
;  @ REPL[14]:8 within `mul_tile!'
; ┌ @ int.jl:92 within `/'
; │┌ @ float.jl:277 within `float'
; ││┌ @ float.jl:262 within `AbstractFloat'
; │││┌ @ float.jl:60 within `Float64'
      %45 = sitofp i64 %30 to double
; │└└└
; │ @ int.jl:92 within `/' @ float.jl:407
   %46 = fmul double %45, 3.125000e-02
; └
; ┌ @ float.jl:707 within `Int64'
; │┌ @ float.jl:460 within `<='
    %47 = fcmp ult double %46, 0xC3E0000000000000
; │└
   %48 = fcmp uge double %46, 0x43E0000000000000
   %49 = or i1 %47, %48
; │┌ @ float.jl:370 within `round'
    %50 = call double @llvm.trunc.f64(double %46)
; │└
; │┌ @ float.jl:454 within `=='
    %51 = fcmp une double %50, %46
; │└
   %or.cond = or i1 %49, %51
   br i1 %or.cond, label %L73, label %L71

L71:                                              ; preds = %L53
; │ @ float.jl:708 within `Int64'
; │┌ @ float.jl:310 within `unsafe_trunc'
    %52 = fptosi double %46 to i64
; └└
;  @ REPL[14]:11 within `mul_tile!'
; ┌ @ threadingconstructs.jl:46 within `macro expansion'
; │┌ @ range.jl:5 within `Colon'
; ││┌ @ range.jl:280 within `UnitRange'
; │││┌ @ range.jl:285 within `unitrange_last'
; ││││┌ @ operators.jl:350 within `>='
; │││││┌ @ int.jl:441 within `<='
        %53 = icmp sgt i64 %52, 0
; ││││└└
      %54 = select i1 %53, i64 %52, i64 0
; │└└└
; │ @ threadingconstructs.jl:85 within `macro expansion'
; │┌ @ threadingconstructs.jl:10 within `threadid'
    %55 = getelementptr %jl_value_t**, %jl_value_t*** %6, i64 2
    %56 = bitcast %jl_value_t*** %55 to i16*
    %57 = load i16, i16* %56, align 2
; │└
; │┌ @ operators.jl:202 within `!='
; ││┌ @ promotion.jl:398 within `=='
     %58 = icmp eq i16 %57, 0
; │└└
   br i1 %58, label %L87, label %L91

L73:                                              ; preds = %L53
; └
;  @ REPL[14]:8 within `mul_tile!'
; ┌ @ float.jl:710 within `Int64'
   %59 = bitcast %jl_value_t*** %6 to i8*
   %60 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %59, i32 1400, i32 16) #3
   %61 = bitcast %jl_value_t* %60 to %jl_value_t**
   %62 = getelementptr %jl_value_t*, %jl_value_t** %61, i64 -1
   store %jl_value_t* inttoptr (i64 137940805277456 to %jl_value_t*), %jl_value_t** %62
   %63 = bitcast %jl_value_t* %60 to double*
   store double %46, double* %63, align 8
   %64 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
   store %jl_value_t* %60, %jl_value_t** %64
   %65 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
   store %jl_value_t* inttoptr (i64 137940723970144 to %jl_value_t*), %jl_value_t** %65
   %66 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 1
   store %jl_value_t* inttoptr (i64 137940804653152 to %jl_value_t*), %jl_value_t** %66
   %67 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 2
   store %jl_value_t* %60, %jl_value_t** %67
   %68 = call nonnull %jl_value_t* @jl_invoke(%jl_value_t* inttoptr (i64 137940810977168 to %jl_value_t*), %jl_value_t** %3, i32 3, %jl_value_t* inttoptr (i64 137940810976640 to %jl_value_t*))
   %69 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
   store %jl_value_t* %68, %jl_value_t** %69
   call void @jl_throw(%jl_value_t* %68)
   unreachable

L87:                                              ; preds = %L71
; └
;  @ REPL[14]:11 within `mul_tile!'
; ┌ @ threadingconstructs.jl:85 within `macro expansion'
   %70 = call i32 inttoptr (i64 137941202607536 to i32 ()*)()
; │┌ @ operators.jl:202 within `!='
; ││┌ @ promotion.jl:348 within `==' @ promotion.jl:398
     %71 = icmp ne i32 %70, 0
; ││└
; ││┌ @ bool.jl:36 within `!'
     br label %L91

L91:                                              ; preds = %L87, %L71
     %value_phi5.off0 = phi i1 [ %71, %L87 ], [ true, %L71 ]
; │└└
   %72 = bitcast %jl_value_t*** %6 to i8*
   %73 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %72, i32 1472, i32 64) #3
   %74 = bitcast %jl_value_t* %73 to %jl_value_t**
   %75 = getelementptr %jl_value_t*, %jl_value_t** %74, i64 -1
   store %jl_value_t* inttoptr (i64 137923048272560 to %jl_value_t*), %jl_value_t** %75
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
; │ @ threadingconstructs.jl:85 within `macro expansion'
   br i1 %value_phi5.off0, label %L107, label %L112

L107:                                             ; preds = %L91
; │ @ threadingconstructs.jl:86 within `macro expansion'
; │┌ @ essentials.jl:709 within `invokelatest'
; ││┌ @ essentials.jl:710 within `#invokelatest#1'
     %78 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %72, i32 1400, i32 16) #3
     %79 = bitcast %jl_value_t* %78 to %jl_value_t**
     %80 = getelementptr %jl_value_t*, %jl_value_t** %79, i64 -1
     store %jl_value_t* inttoptr (i64 137940806188016 to %jl_value_t*), %jl_value_t** %80
     %81 = bitcast %jl_value_t* %78 to i8*
     store i8 1, i8* %81, align 8
     %82 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
     store %jl_value_t* %78, %jl_value_t** %82
     %83 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
     store %jl_value_t* %73, %jl_value_t** %83
     %84 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 1
     store %jl_value_t* %78, %jl_value_t** %84
     %85 = call nonnull %jl_value_t* @jl_f__apply_latest(%jl_value_t* null, %jl_value_t** %3, i32 2)
; │└└
   br label %L113

L112:                                             ; preds = %L91
; │ @ threadingconstructs.jl:93 within `macro expansion'
   %86 = getelementptr %jl_value_t*, %jl_value_t** %3, i32 0
   store %jl_value_t* %73, %jl_value_t** %86
   %87 = call nonnull %jl_value_t* @jl_invoke(%jl_value_t* inttoptr (i64 137940861733232 to %jl_value_t*), %jl_value_t** %3, i32 1, %jl_value_t* inttoptr (i64 137923325354512 to %jl_value_t*))
   br label %L113

L113:                                             ; preds = %L112, %L107
   %88 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 1
   %89 = load %jl_value_t*, %jl_value_t** %88
   %90 = getelementptr %jl_value_t**, %jl_value_t*** %6, i32 0
   %91 = bitcast %jl_value_t*** %90 to %jl_value_t**
   store %jl_value_t* %89, %jl_value_t** %91
; └
  ret %jl_value_t* inttoptr (i64 137940804996048 to %jl_value_t*)

L115:                                             ; preds = %L15
;  @ REPL[14]:5 within `mul_tile!'
  %92 = bitcast %jl_value_t*** %6 to i8*
  %93 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %92, i32 1400, i32 16) #3
  %94 = bitcast %jl_value_t* %93 to %jl_value_t**
  %95 = getelementptr %jl_value_t*, %jl_value_t** %94, i64 -1
  store %jl_value_t* inttoptr (i64 137940806601440 to %jl_value_t*), %jl_value_t** %95
  %96 = bitcast %jl_value_t* %93 to %jl_value_t**
  store %jl_value_t* inttoptr (i64 137923658998352 to %jl_value_t*), %jl_value_t** %96, align 8
  %97 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %93, %jl_value_t** %97
  call void @jl_throw(%jl_value_t* %93)
  unreachable

L118:                                             ; preds = %L10
;  @ REPL[14]:4 within `mul_tile!'
  %98 = bitcast %jl_value_t*** %6 to i8*
  %99 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %98, i32 1400, i32 16) #3
  %100 = bitcast %jl_value_t* %99 to %jl_value_t**
  %101 = getelementptr %jl_value_t*, %jl_value_t** %100, i64 -1
  store %jl_value_t* inttoptr (i64 137940806601440 to %jl_value_t*), %jl_value_t** %101
  %102 = bitcast %jl_value_t* %99 to %jl_value_t**
  store %jl_value_t* inttoptr (i64 137923658997200 to %jl_value_t*), %jl_value_t** %102, align 8
  %103 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %99, %jl_value_t** %103
  call void @jl_throw(%jl_value_t* %99)
  unreachable

L121:                                             ; preds = %L5
;  @ REPL[14]:3 within `mul_tile!'
  %104 = bitcast %jl_value_t*** %6 to i8*
  %105 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %104, i32 1400, i32 16) #3
  %106 = bitcast %jl_value_t* %105 to %jl_value_t**
  %107 = getelementptr %jl_value_t*, %jl_value_t** %106, i64 -1
  store %jl_value_t* inttoptr (i64 137940806601440 to %jl_value_t*), %jl_value_t** %107
  %108 = bitcast %jl_value_t* %105 to %jl_value_t**
  store %jl_value_t* inttoptr (i64 137923658996240 to %jl_value_t*), %jl_value_t** %108, align 8
  %109 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %105, %jl_value_t** %109
  call void @jl_throw(%jl_value_t* %105)
  unreachable

L124:                                             ; preds = %top
;  @ REPL[14]:2 within `mul_tile!'
  %110 = bitcast %jl_value_t*** %6 to i8*
  %111 = call noalias nonnull %jl_value_t* @jl_gc_pool_alloc(i8* %110, i32 1400, i32 16) #3
  %112 = bitcast %jl_value_t* %111 to %jl_value_t**
  %113 = getelementptr %jl_value_t*, %jl_value_t** %112, i64 -1
  store %jl_value_t* inttoptr (i64 137940806601440 to %jl_value_t*), %jl_value_t** %113
  %114 = bitcast %jl_value_t* %111 to %jl_value_t**
  store %jl_value_t* inttoptr (i64 137923658995216 to %jl_value_t*), %jl_value_t** %114, align 8
  %115 = getelementptr %jl_value_t*, %jl_value_t** %gcframe, i32 2
  store %jl_value_t* %111, %jl_value_t** %115
  call void @jl_throw(%jl_value_t* %111)
  unreachable
}
