//
// Generated by LLVM NVPTX Back-End
//

.version 6.0
.target sm_61
.address_size 64

	// .globl	_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_ // -- Begin function _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_
// __static_shmem_285 has been demoted
// __static_shmem_286 has been demoted
.weak .global .align 8 .u64 exception_flag;
                                        // @_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_
.visible .entry _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1_(
	.param .u64 _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_0,
	.param .u64 _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_1,
	.param .u64 _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_2,
	.param .u32 _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_3,
	.param .u32 _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_4,
	.param .u32 _Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_5
)
{
	.reg .pred 	%p<16>;
	.reg .b32 	%r<16>;
	.reg .f64 	%fd<15>;
	.reg .b64 	%rd<84>;
	// demoted variable
	.shared .align 32 .b8 __static_shmem_285[8448];
	// demoted variable
	.shared .align 32 .b8 __static_shmem_286[8448];
// %bb.0:                               // %top
	ld.param.u32 	%r2, [_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_5];
	ld.param.u32 	%r3, [_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_3];
	cvt.s64.s32 	%rd1, %r3;
	ld.param.u32 	%r4, [_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_4];
	mov.u32 	%r5, %ctaid.x;
	add.s32 	%r6, %r5, 1;
	mov.u32 	%r7, %ctaid.y;
	mov.u32 	%r1, %tid.x;
	add.s32 	%r8, %r1, 1;
	cvt.u64.u32 	%rd3, %r8;
	mov.u32 	%r9, %tid.y;
	add.s32 	%r10, %r9, 1;
	max.s32 	%r11, %r4, %r3;
	max.s32 	%r12, %r11, %r2;
	and.b32  	%r13, %r12, 31;
	setp.eq.s32 	%p1, %r13, 0;
	selp.b64 	%rd31, 0, 32, %p1;
	cvt.s64.s32 	%rd32, %r12;
	add.s64 	%rd33, %rd31, %rd32;
	shr.s64 	%rd34, %rd33, 63;
	shr.u64 	%rd35, %rd34, 59;
	add.s64 	%rd36, %rd33, %rd35;
	shr.s64 	%rd37, %rd36, 5;
	add.s64 	%rd38, %rd37, -1;
	setp.lt.s64 	%p2, %rd33, 32;
	selp.b64 	%rd5, -1, %rd38, %p2;
	setp.gt.s64 	%p3, %rd5, -1;
	mul.wide.u32 	%rd6, %r6, 32;
	add.s64 	%rd39, %rd3, %rd6;
	add.s64 	%rd7, %rd39, -32;
	shl.b32 	%r14, %r7, 5;
	add.s32 	%r15, %r10, %r14;
	cvt.u64.u32 	%rd8, %r15;
	setp.gt.s64 	%p15, %rd7, %rd1;
	max.s64 	%rd77, %rd1, 0;
	add.s64 	%rd78, %rd8, -1;
	cvt.u64.u32 	%rd79, %r1;
	@%p3 bra 	LBB0_2;
	bra.uni 	LBB0_1;
LBB0_2:                                 // %L81.preheader
	ld.param.u64 	%rd30, [_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_2];
	ld.param.u64 	%rd29, [_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_1];
	cvt.s64.s32 	%rd2, %r4;
	cvt.u64.u32 	%rd4, %r10;
	mul.lo.s64 	%rd41, %rd4, 33;
	add.s64 	%rd42, %rd79, %rd41;
	shl.b64 	%rd43, %rd42, 3;
	add.s64 	%rd44, %rd43, -272;
	mov.u64 	%rd45, __static_shmem_285;
	add.s64 	%rd12, %rd45, %rd44;
	cvt.s64.s32 	%rd83, %r2;
	mov.u64 	%rd46, __static_shmem_286;
	add.s64 	%rd14, %rd46, %rd44;
	max.s64 	%rd47, %rd2, 0;
	mul.lo.s64 	%rd15, %rd78, %rd47;
	mul.wide.u32 	%rd49, %r1, 8;
	add.s64 	%rd21, %rd45, %rd49;
	shl.b64 	%rd50, %rd41, 3;
	add.s64 	%rd51, %rd50, %rd46;
	add.s64 	%rd17, %rd51, -256;
	mov.u64 	%rd80, 0;
	mov.f64 	%fd13, 0d0000000000000000;
	setp.gt.s64 	%p7, %rd8, %rd83;
	add.s64 	%rd62, %rd79, %rd15;
LBB0_3:                                 // %L81
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_10 Depth 2
	shl.b64 	%rd19, %rd80, 5;
	add.s64 	%rd20, %rd19, %rd4;
	setp.gt.s64 	%p5, %rd20, %rd2;
	or.pred  	%p6, %p15, %p5;
	@%p6 bra 	LBB0_5;
	bra.uni 	LBB0_4;
LBB0_5:                                 // %L221
                                        //   in Loop: Header=BB0_3 Depth=1
	mov.u64 	%rd59, 0;
	st.shared.u64 	[%rd12+8], %rd59;
	bra.uni 	LBB0_6;
LBB0_4:                                 // %L104
                                        //   in Loop: Header=BB0_3 Depth=1
	add.s64 	%rd52, %rd20, -1;
	mul.lo.s64 	%rd53, %rd52, %rd77;
	add.s64 	%rd54, %rd79, %rd6;
	add.s64 	%rd55, %rd54, %rd53;
	shl.b64 	%rd56, %rd55, 3;
	add.s64 	%rd57, %rd56, %rd29;
	ld.global.u64 	%rd58, [%rd57+-256];
	st.shared.u64 	[%rd12+8], %rd58;
LBB0_6:                                 // %L248
                                        //   in Loop: Header=BB0_3 Depth=1
	add.s64 	%rd60, %rd19, %rd3;
	setp.gt.s64 	%p8, %rd60, %rd2;
	or.pred  	%p9, %p7, %p8;
	@%p9 bra 	LBB0_8;
// %bb.7:                               // %L260
                                        //   in Loop: Header=BB0_3 Depth=1
	add.s64 	%rd63, %rd62, %rd19;
	shl.b64 	%rd64, %rd63, 3;
	add.s64 	%rd65, %rd64, %rd30;
	ld.global.u64 	%rd66, [%rd65];
	st.shared.u64 	[%rd14+8], %rd66;
	bra.uni 	LBB0_9;
LBB0_8:                                 // %L377
                                        //   in Loop: Header=BB0_3 Depth=1
	mov.u64 	%rd61, 0;
	st.shared.u64 	[%rd14+8], %rd61;
LBB0_9:                                 // %L404
                                        //   in Loop: Header=BB0_3 Depth=1
	bar.sync 	0;
	mov.u64 	%rd81, 0;
	mov.u64 	%rd82, %rd21;
LBB0_10:                                // %L406
                                        //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld.shared.f64 	%fd6, [%rd82];
	add.s64 	%rd68, %rd17, %rd81;
	ld.shared.f64 	%fd7, [%rd68+-8];
	fma.rn.f64 	%fd8, %fd6, %fd7, %fd13;
	ld.shared.f64 	%fd9, [%rd82+264];
	ld.shared.f64 	%fd10, [%rd68];
	fma.rn.f64 	%fd13, %fd9, %fd10, %fd8;
	add.s64 	%rd82, %rd82, 528;
	add.s64 	%rd81, %rd81, 16;
	setp.ne.s64 	%p10, %rd81, 256;
	@%p10 bra 	LBB0_10;
// %bb.11:                              // %L512
                                        //   in Loop: Header=BB0_3 Depth=1
	bar.sync 	0;
	add.s64 	%rd26, %rd80, 1;
	setp.ne.s64 	%p11, %rd80, %rd5;
	mov.u64 	%rd80, %rd26;
	@%p11 bra 	LBB0_3;
	bra.uni 	LBB0_12;
LBB0_1:                                 // %top.L525_crit_edge
	cvt.s64.s32 	%rd83, %r2;
	mov.f64 	%fd13, 0d0000000000000000;
LBB0_12:                                // %L525
	setp.lt.s64 	%p13, %rd83, %rd8;
	or.pred  	%p14, %p15, %p13;
	@%p14 bra 	LBB0_14;
// %bb.13:                              // %L562
	ld.param.u64 	%rd28, [_Z12julia_matmul3PtrI7Float64ES_IS0_ES_IS0_E5Int32S1_S1__param_0];
	mul.lo.s64 	%rd71, %rd78, %rd77;
	add.s64 	%rd73, %rd79, %rd6;
	add.s64 	%rd74, %rd73, %rd71;
	shl.b64 	%rd75, %rd74, 3;
	add.s64 	%rd76, %rd75, %rd28;
	st.global.f64 	[%rd76+-256], %fd13;
LBB0_14:                                // %L593
	ret;
                                        // -- End function
}

