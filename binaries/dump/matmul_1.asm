//
// Generated by LLVM NVPTX Back-End
//

.version 6.0
.target sm_60
.address_size 64

	// .globl	_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1_ // -- Begin function _Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1_
// __static_shmem_285 has been demoted
// __static_shmem_286 has been demoted
.weak .global .align 8 .u64 exception_flag;
                                        // @_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1_
.visible .entry _Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1_(
	.param .u64 _Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_0,
	.param .u64 _Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_1,
	.param .u64 _Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_2,
	.param .u32 _Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_3,
	.param .u32 _Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_4,
	.param .u32 _Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_5
)
{
	.reg .pred 	%p<15>;
	.reg .f32 	%f<15>;
	.reg .b32 	%r<15>;
	.reg .b64 	%rd<79>;
	// demoted variable
	.shared .align 32 .b8 __static_shmem_285[4224];
	// demoted variable
	.shared .align 32 .b8 __static_shmem_286[4224];
// %bb.0:                               // %top
	ld.param.u32 	%r2, [_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_5];
	ld.param.s32 	%rd1, [_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_3];
	ld.param.s32 	%rd2, [_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_4];
	mov.u32 	%r3, %ctaid.x;
	add.s32 	%r4, %r3, 1;
	mov.u32 	%r5, %ctaid.y;
	mov.u32 	%r1, %tid.x;
	add.s32 	%r6, %r1, 1;
	cvt.u64.u32 	%rd3, %r6;
	mov.u32 	%r7, %tid.y;
	add.s32 	%r8, %r7, 1;
	shr.s64 	%rd31, %rd2, 63;
	shr.u64 	%rd32, %rd31, 59;
	add.s64 	%rd33, %rd2, %rd32;
	and.b64  	%rd34, %rd33, -32;
	add.s64 	%rd35, %rd34, 32;
	shr.s64 	%rd36, %rd35, 5;
	add.s64 	%rd37, %rd36, -1;
	setp.lt.s64 	%p1, %rd35, 32;
	selp.b64 	%rd5, -1, %rd37, %p1;
	setp.gt.s64 	%p2, %rd5, -1;
	mul.wide.u32 	%rd6, %r4, 32;
	add.s64 	%rd38, %rd3, %rd6;
	add.s64 	%rd7, %rd38, -32;
	shl.b32 	%r9, %r5, 5;
	add.s32 	%r10, %r8, %r9;
	cvt.u64.u32 	%rd8, %r10;
	setp.gt.s64 	%p14, %rd7, %rd1;
	max.s64 	%rd72, %rd1, 0;
	add.s64 	%rd73, %rd8, -1;
	cvt.u64.u32 	%rd74, %r1;
	@%p2 bra 	LBB0_2;
	bra.uni 	LBB0_1;
LBB0_2:                                 // %L74.preheader
	ld.param.u64 	%rd30, [_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_2];
	ld.param.u64 	%rd29, [_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_1];
	cvt.u64.u32 	%rd4, %r8;
	mul.lo.s64 	%rd40, %rd4, 33;
	add.s64 	%rd41, %rd74, %rd40;
	shl.b64 	%rd42, %rd41, 2;
	add.s64 	%rd43, %rd42, -136;
	mov.u64 	%rd44, __static_shmem_285;
	add.s64 	%rd12, %rd44, %rd43;
	cvt.s64.s32 	%rd78, %r2;
	mov.u64 	%rd45, __static_shmem_286;
	add.s64 	%rd14, %rd45, %rd43;
	max.s64 	%rd46, %rd2, 0;
	mul.lo.s64 	%rd15, %rd73, %rd46;
	mul.wide.u32 	%rd48, %r1, 4;
	add.s64 	%rd21, %rd44, %rd48;
	shl.b64 	%rd49, %rd40, 2;
	add.s64 	%rd50, %rd49, %rd45;
	add.s64 	%rd17, %rd50, -128;
	mov.u64 	%rd75, 0;
	mov.f32 	%f13, 0f00000000;
	mov.u32 	%r12, 0;
	setp.gt.s64 	%p6, %rd8, %rd78;
	add.s64 	%rd58, %rd74, %rd15;
LBB0_3:                                 // %L74
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_10 Depth 2
	shl.b64 	%rd19, %rd75, 5;
	add.s64 	%rd20, %rd19, %rd4;
	setp.gt.s64 	%p4, %rd20, %rd2;
	or.pred  	%p5, %p14, %p4;
	@%p5 bra 	LBB0_5;
	bra.uni 	LBB0_4;
LBB0_5:                                 // %L214
                                        //   in Loop: Header=BB0_3 Depth=1
	st.shared.u32 	[%rd12+4], %r12;
	bra.uni 	LBB0_6;
LBB0_4:                                 // %L97
                                        //   in Loop: Header=BB0_3 Depth=1
	add.s64 	%rd51, %rd20, -1;
	mul.lo.s64 	%rd52, %rd51, %rd72;
	add.s64 	%rd53, %rd74, %rd6;
	add.s64 	%rd54, %rd53, %rd52;
	shl.b64 	%rd55, %rd54, 2;
	add.s64 	%rd56, %rd55, %rd29;
	ld.global.u32 	%r11, [%rd56+-128];
	st.shared.u32 	[%rd12+4], %r11;
LBB0_6:                                 // %L241
                                        //   in Loop: Header=BB0_3 Depth=1
	add.s64 	%rd57, %rd19, %rd3;
	setp.gt.s64 	%p7, %rd57, %rd2;
	or.pred  	%p8, %p6, %p7;
	@%p8 bra 	LBB0_8;
// %bb.7:                               // %L253
                                        //   in Loop: Header=BB0_3 Depth=1
	add.s64 	%rd59, %rd58, %rd19;
	shl.b64 	%rd60, %rd59, 2;
	add.s64 	%rd61, %rd60, %rd30;
	ld.global.u32 	%r14, [%rd61];
	st.shared.u32 	[%rd14+4], %r14;
	bra.uni 	LBB0_9;
LBB0_8:                                 // %L370
                                        //   in Loop: Header=BB0_3 Depth=1
	st.shared.u32 	[%rd14+4], %r12;
LBB0_9:                                 // %L397
                                        //   in Loop: Header=BB0_3 Depth=1
	bar.sync 	0;
	mov.u64 	%rd76, 0;
	mov.u64 	%rd77, %rd21;
LBB0_10:                                // %L399
                                        //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld.shared.f32 	%f6, [%rd77];
	add.s64 	%rd63, %rd17, %rd76;
	ld.shared.f32 	%f7, [%rd63+-4];
	fma.rn.f32 	%f8, %f6, %f7, %f13;
	ld.shared.f32 	%f9, [%rd77+132];
	ld.shared.f32 	%f10, [%rd63];
	fma.rn.f32 	%f13, %f9, %f10, %f8;
	add.s64 	%rd77, %rd77, 264;
	add.s64 	%rd76, %rd76, 8;
	setp.ne.s64 	%p9, %rd76, 128;
	@%p9 bra 	LBB0_10;
// %bb.11:                              // %L505
                                        //   in Loop: Header=BB0_3 Depth=1
	bar.sync 	0;
	add.s64 	%rd26, %rd75, 1;
	setp.ne.s64 	%p10, %rd75, %rd5;
	mov.u64 	%rd75, %rd26;
	@%p10 bra 	LBB0_3;
	bra.uni 	LBB0_12;
LBB0_1:                                 // %top.L518_crit_edge
	cvt.s64.s32 	%rd78, %r2;
	mov.f32 	%f13, 0f00000000;
LBB0_12:                                // %L518
	setp.lt.s64 	%p12, %rd78, %rd8;
	or.pred  	%p13, %p14, %p12;
	@%p13 bra 	LBB0_14;
// %bb.13:                              // %L555
	ld.param.u64 	%rd28, [_Z12julia_matmul3PtrI7Float32ES_IS0_ES_IS0_E5Int32S1_S1__param_0];
	mul.lo.s64 	%rd66, %rd73, %rd72;
	add.s64 	%rd68, %rd74, %rd6;
	add.s64 	%rd69, %rd68, %rd66;
	shl.b64 	%rd70, %rd69, 2;
	add.s64 	%rd71, %rd70, %rd28;
	st.global.f32 	[%rd71+-128], %f13;
LBB0_14:                                // %L586
	ret;
                                        // -- End function
}

