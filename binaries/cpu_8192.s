	.text
	.abiversion 2
	.file	"mul_tile!"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2               # -- Begin function japi1_mul_tile!_1274
.LCPI0_0:
	.long	1023410176              # float 0.03125
.LCPI0_1:
	.long	3741319168              # float -9.22337203E+18
.LCPI0_2:
	.long	1593835520              # float 9.22337203E+18
	.text
	.globl	"japi1_mul_tile!_1274"
	.p2align	4
	.type	"japi1_mul_tile!_1274",@function
"japi1_mul_tile!_1274":                 # @"japi1_mul_tile!_1274"
.Lfunc_begin0:
	.cfi_startproc
.Lfunc_gep0:
	addis 2, 12, .TOC.-.Lfunc_gep0@ha
	addi 2, 2, .TOC.-.Lfunc_gep0@l
.Lfunc_lep0:
	.localentry	"japi1_mul_tile!_1274", .Lfunc_lep0-.Lfunc_gep0
# %bb.0:                                # %top
	mfocrf 12, 32
	mflr 0
	stw 12, 8(1)
	.cfi_def_cfa_offset 176
	.cfi_offset lr, 16
	.cfi_offset r24, -72
	.cfi_offset r25, -64
	.cfi_offset r26, -56
	.cfi_offset r27, -48
	.cfi_offset r28, -40
	.cfi_offset r29, -32
	.cfi_offset r30, -24
	.cfi_offset f31, -8
	.cfi_offset cr2, 8
	std 24, -72(1)                  # 8-byte Folded Spill
	std 25, -64(1)                  # 8-byte Folded Spill
	std 26, -56(1)                  # 8-byte Folded Spill
	std 27, -48(1)                  # 8-byte Folded Spill
	std 28, -40(1)                  # 8-byte Folded Spill
	std 29, -32(1)                  # 8-byte Folded Spill
	std 30, -24(1)                  # 8-byte Folded Spill
	stfd 31, -8(1)                  # 8-byte Folded Spill
	std 0, 16(1)
	stdu 1, -176(1)
	xxlxor 34, 34, 34
	li 3, 16
	addi 28, 1, 48
	std 2, 24(1)
	mr 29, 4
	stvx 2, 28, 3
	li 3, 313
	sldi 3, 3, 32
	stvx 2, 0, 28
	std 4, 40(1)
	oris 3, 3, 63003
	ori 12, 3, 7024
	mtctr 12
	bctrl
	ld 2, 24(1)
	mr 30, 3
	li 3, 8
	std 3, 48(1)
	ld 3, 0(30)
	std 3, 56(1)
	std 28, 0(30)
	ld 28, 16(29)
	lfd 0, 24(28)
	addis 3, 2, .LCPI0_0@toc@ha
	lfs 1, .LCPI0_0@toc@l(3)
	addis 3, 2, .LCPI0_1@toc@ha
	xscvsxddp 0, 0
	xsmuldp 31, 0, 1
	lfs 0, .LCPI0_1@toc@l(3)
	addis 3, 2, .LCPI0_2@toc@ha
	fcmpu 0, 31, 0
	lfs 0, .LCPI0_2@toc@l(3)
	xsrdpiz 1, 31
	fcmpu 1, 31, 0
	fcmpu 5, 1, 31
	cror 24, 0, 3
	crorc 24, 24, 4
	crorc 20, 24, 22
	bc 12, 20, .LBB0_7
# %bb.1:                                # %L18
	xscvdpsxds 0, 31
	lhz 3, 16(30)
	ld 24, 0(29)
	ld 25, 8(29)
	creqv 8, 8, 8
	cmplwi	3, 0
	mffprd	27, 0
	sradi 3, 27, 63
	andc 26, 27, 3
	bne	0, .LBB0_3
# %bb.2:                                # %L34
	li 3, 30490
	sldi 3, 3, 32
	oris 3, 3, 56355
	ori 12, 3, 40368
	mtctr 12
	bctrl
	ld 2, 24(1)
	cmpwi 0, 3, 0
	crnor 8, 2, 2
.LBB0_3:                                # %L38
	mr 3, 30
	li 4, 1472
	li 5, 64
	bl jl_gc_pool_alloc
	nop
	mr 29, 3
	li 3, 30486
	sldi 3, 3, 32
	std 28, 16(29)
	li 28, 1
	std 24, 0(29)
	std 25, 8(29)
	std 27, 24(29)
	oris 4, 3, 45574
	ori 4, 4, 3184
	std 4, -8(29)
	std 28, 32(29)
	std 26, 40(29)
	std 29, 72(1)
	bc 4, 8, .LBB0_5
# %bb.4:                                # %L54
	mr 3, 30
	li 4, 1400
	li 5, 16
	bl jl_gc_pool_alloc
	nop
	li 4, 30490
	stb 28, 0(3)
	std 3, 64(1)
	std 3, 88(1)
	li 5, 2
	std 29, 80(1)
	sldi 4, 4, 32
	oris 4, 4, 50306
	ori 4, 4, 48112
	std 4, -8(3)
	addi 4, 1, 80
	li 3, 0
	bl jl_f__apply_latest
	nop
	b .LBB0_6
.LBB0_5:                                # %L59
	li 4, 30490
	oris 5, 3, 56155
	std 29, 80(1)
	sldi 4, 4, 32
	ori 6, 5, 26576
	li 5, 1
	oris 4, 4, 51154
	ori 3, 4, 18800
	addi 4, 1, 80
	bl jl_invoke
	nop
.LBB0_6:                                # %L60
	li 3, 30490
	ld 4, 56(1)
	sldi 3, 3, 32
	oris 3, 3, 50288
	ori 3, 3, 35792
	std 4, 0(30)
	addi 1, 1, 176
	ld 0, 16(1)
	mtlr 0
	lfd 31, -8(1)                   # 8-byte Folded Reload
	ld 30, -24(1)                   # 8-byte Folded Reload
	ld 29, -32(1)                   # 8-byte Folded Reload
	ld 28, -40(1)                   # 8-byte Folded Reload
	ld 27, -48(1)                   # 8-byte Folded Reload
	ld 26, -56(1)                   # 8-byte Folded Reload
	ld 25, -64(1)                   # 8-byte Folded Reload
	ld 24, -72(1)                   # 8-byte Folded Reload
	lwz 12, 8(1)
	mtocrf 32, 12
	blr
.LBB0_7:                                # %L20
	mr 3, 30
	li 4, 1400
	li 5, 16
	bl jl_gc_pool_alloc
	nop
	li 4, 30490
	std 3, 64(1)
	std 3, 96(1)
	sldi 4, 4, 32
	oris 5, 4, 50292
	oris 6, 4, 50283
	ori 5, 5, 55056
	ori 7, 6, 20576
	std 5, -8(3)
	oris 5, 4, 49043
	oris 4, 4, 50379
	stfdx 31, 0, 3
	std 7, 88(1)
	ori 5, 5, 12384
	ori 6, 4, 52608
	addi 4, 1, 80
	std 5, 80(1)
	ori 3, 6, 528
	li 5, 3
	bl jl_invoke
	nop
	std 3, 64(1)
	bl jl_throw
	nop
	.long	0
	.quad	0
.Lfunc_end0:
	.size	"japi1_mul_tile!_1274", .Lfunc_end0-.Lfunc_begin0
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
