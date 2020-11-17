	.text
	.abiversion 2
	.file	"overdub"
	.globl	julia_overdub_1856      # -- Begin function julia_overdub_1856
	.p2align	4
	.type	julia_overdub_1856,@function
julia_overdub_1856:                     # @julia_overdub_1856
.Lfunc_begin0:
	.cfi_startproc
# %bb.0:                                # %top
	stdu 1, -25264(1)
	.cfi_def_cfa_offset 25264
	.cfi_offset r15, -136
	.cfi_offset r16, -128
	.cfi_offset r17, -120
	.cfi_offset r18, -112
	.cfi_offset r19, -104
	.cfi_offset r20, -96
	.cfi_offset r21, -88
	.cfi_offset r22, -80
	.cfi_offset r23, -72
	.cfi_offset r24, -64
	.cfi_offset r25, -56
	.cfi_offset r26, -48
	.cfi_offset r27, -40
	.cfi_offset r28, -32
	.cfi_offset r29, -24
	.cfi_offset r30, -16
	li 9, 1
	li 8, 31
	ld 7, 24(4)
	std 25, 25208(1)                # 8-byte Folded Spill
	std 26, 25216(1)                # 8-byte Folded Spill
	std 30, 25248(1)                # 8-byte Folded Spill
	sldi 10, 9, 63
	sradi 11, 8, 63
	addi 26, 1, 16672
	addi 25, 1, 8224
	addi 8, 1, -232
	li 30, 1
	li 12, 1
	std 15, 25128(1)                # 8-byte Folded Spill
	std 16, 25136(1)                # 8-byte Folded Spill
	std 17, 25144(1)                # 8-byte Folded Spill
	std 18, 25152(1)                # 8-byte Folded Spill
	std 19, 25160(1)                # 8-byte Folded Spill
	std 20, 25168(1)                # 8-byte Folded Spill
	std 21, 25176(1)                # 8-byte Folded Spill
	std 22, 25184(1)                # 8-byte Folded Spill
	std 23, 25192(1)                # 8-byte Folded Spill
	std 24, 25200(1)                # 8-byte Folded Spill
	std 27, 25224(1)                # 8-byte Folded Spill
	std 28, 25232(1)                # 8-byte Folded Spill
	std 29, 25240(1)                # 8-byte Folded Spill
	.p2align	4
.LBB0_1:                                # %L11
                                        # =>This Inner Loop Header: Depth=1
	cmpdi	30, 32
	cmpdi 1, 12, 32
	subfic 28, 30, 31
	rldicl 29, 30, 1, 63
	sldi 0, 12, 5
	cror 20, 4, 0
	adde 29, 29, 11
	add 0, 30, 0
	xori 29, 29, 1
	cmpdi	30, 31
	addi 30, 30, 1
	sldi 0, 0, 3
	isel 30, 9, 30, 1
	add 12, 12, 29
	stdx 10, 8, 0
	bc 12, 20, .LBB0_1
# %bb.2:                                # %L86
	sradi 9, 7, 5
	cmpdi	7, 32
	li 10, -1
	addze 9, 9
	addi 9, 9, -1
	isel 10, 10, 9, 0
	cmpdi	10, -1
	ble 0, .LBB0_11
# %bb.3:                                # %L98.preheader
	ld 9, 0(3)
	ld 12, 8(3)
	ld 29, 0(5)
	ld 28, 0(6)
	li 11, 31
	addi 30, 1, 16400
	ld 5, 24(5)
	ld 6, 24(6)
	sradi 11, 11, 63
	addi 27, 1, 7952
	addi 0, 26, -272
	addi 26, 25, -272
	sldi 9, 9, 5
	sldi 12, 12, 5
	addi 29, 29, -264
	addi 28, 28, -8
	li 24, 0
	li 25, 1
	li 23, 32
	.p2align	4
.LBB0_4:                                # %L98
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_7 Depth 2
                                        #       Child Loop BB0_8 Depth 3
	sldi 22, 24, 5
	li 20, 1
	li 21, 1
	.p2align	5
.LBB0_5:                                # %L101
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add 19, 21, 22
	add 18, 21, 12
	add 17, 20, 9
	add 15, 20, 22
	addi 19, 19, -1
	addi 18, 18, -33
	mulld 19, 5, 19
	mulld 18, 6, 18
	sldi 16, 21, 5
	cmpdi	20, 32
	cmpdi 1, 21, 32
	cror 20, 4, 0
	cmpdi	20, 31
	add 19, 17, 19
	add 18, 15, 18
	add 17, 21, 16
	subfic 15, 20, 31
	sldi 19, 19, 3
	sldi 18, 18, 3
	add 17, 20, 17
	rldicl 16, 20, 1, 63
	ldx 19, 29, 19
	ldx 18, 28, 18
	addi 20, 20, 1
	adde 16, 16, 11
	sldi 17, 17, 3
	xori 16, 16, 1
	isel 20, 25, 20, 1
	add 21, 21, 16
	stdx 19, 30, 17
	stdx 18, 27, 17
	bc 12, 20, .LBB0_5
# %bb.6:                                # %L222.preheader
                                        #   in Loop: Header=BB0_4 Depth=1
	li 22, 1
	li 21, 1
	.p2align	4
.LBB0_7:                                # %L222
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_8 Depth 3
	sldi 20, 21, 5
	mulli 18, 21, 264
	add 20, 22, 20
	sldi 19, 22, 3
	sldi 20, 20, 3
	add 19, 0, 19
	lfdx 0, 8, 20
	mtctr 23
	add 18, 26, 18
	.p2align	5
.LBB0_8:                                # %L233
                                        #   Parent Loop BB0_4 Depth=1
                                        #     Parent Loop BB0_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lfdu 1, 8(18)
	lfdu 2, 264(19)
	xsmaddadp 0, 2, 1
	bdnz .LBB0_8
# %bb.9:                                # %L410
                                        #   in Loop: Header=BB0_7 Depth=2
	cmpdi	22, 32
	cmpdi 1, 21, 32
	subfic 18, 22, 31
	stfdx 0, 8, 20
	rldicl 19, 22, 1, 63
	cror 20, 4, 0
	cmpdi	22, 31
	addi 22, 22, 1
	adde 19, 19, 11
	isel 22, 25, 22, 1
	xori 19, 19, 1
	add 21, 21, 19
	bc 12, 20, .LBB0_7
# %bb.10:                               # %L439
                                        #   in Loop: Header=BB0_4 Depth=1
	cmpld	24, 10
	addi 24, 24, 1
	bne	0, .LBB0_4
	b .LBB0_12
.LBB0_11:                               # %L86.L450.L451_crit_edge_crit_edge
	ld 5, 0(3)
	sldi 9, 5, 5
.LBB0_12:                               # %L450.L451_crit_edge
	ld 5, 8(3)
	ld 6, 0(4)
	li 3, 31
	li 11, 1
	li 10, 1
	sradi 3, 3, 63
	sldi 4, 5, 5
	addi 5, 6, -264
	li 6, 1
	.p2align	4
.LBB0_13:                               # %L451
                                        # =>This Inner Loop Header: Depth=1
	add 12, 10, 4
	sldi 0, 10, 5
	add 29, 11, 9
	addi 12, 12, -33
	add 0, 11, 0
	mulld 12, 12, 7
	rldicl 30, 11, 1, 63
	cmpdi	11, 32
	cmpdi 1, 10, 32
	sldi 0, 0, 3
	cror 20, 4, 0
	cmpdi	11, 31
	ldx 0, 8, 0
	add 12, 29, 12
	subfic 29, 11, 31
	addi 11, 11, 1
	adde 30, 30, 3
	sldi 12, 12, 3
	xori 30, 30, 1
	isel 11, 6, 11, 1
	stdx 0, 5, 12
	add 10, 10, 30
	bc 12, 20, .LBB0_13
# %bb.14:                               # %L545
	ld 30, 25248(1)                 # 8-byte Folded Reload
	ld 29, 25240(1)                 # 8-byte Folded Reload
	ld 28, 25232(1)                 # 8-byte Folded Reload
	ld 27, 25224(1)                 # 8-byte Folded Reload
	ld 26, 25216(1)                 # 8-byte Folded Reload
	ld 25, 25208(1)                 # 8-byte Folded Reload
	ld 24, 25200(1)                 # 8-byte Folded Reload
	ld 23, 25192(1)                 # 8-byte Folded Reload
	ld 22, 25184(1)                 # 8-byte Folded Reload
	ld 21, 25176(1)                 # 8-byte Folded Reload
	ld 20, 25168(1)                 # 8-byte Folded Reload
	ld 19, 25160(1)                 # 8-byte Folded Reload
	ld 18, 25152(1)                 # 8-byte Folded Reload
	ld 17, 25144(1)                 # 8-byte Folded Reload
	ld 16, 25136(1)                 # 8-byte Folded Reload
	ld 15, 25128(1)                 # 8-byte Folded Reload
	addi 1, 1, 25264
	blr
	.long	0
	.quad	0
.Lfunc_end0:
	.size	julia_overdub_1856, .Lfunc_end0-.Lfunc_begin0
	.cfi_endproc
                                        # -- End function
	.globl	jfptr_overdub_1857      # -- Begin function jfptr_overdub_1857
	.p2align	4
	.type	jfptr_overdub_1857,@function
jfptr_overdub_1857:                     # @jfptr_overdub_1857
.Lfunc_begin1:
	.cfi_startproc
.Lfunc_gep1:
	addis 2, 12, .TOC.-.Lfunc_gep1@ha
	addi 2, 2, .TOC.-.Lfunc_gep1@l
.Lfunc_lep1:
	.localentry	jfptr_overdub_1857, .Lfunc_lep1-.Lfunc_gep1
# %bb.0:                                # %top
	mflr 0
	.cfi_def_cfa_offset 96
	.cfi_offset lr, 16
	.cfi_offset r28, -32
	.cfi_offset r29, -24
	.cfi_offset r30, -16
	std 28, -32(1)                  # 8-byte Folded Spill
	std 29, -24(1)                  # 8-byte Folded Spill
	std 30, -16(1)                  # 8-byte Folded Spill
	std 0, 16(1)
	stdu 1, -96(1)
	li 3, 0
	std 2, 24(1)
	xxlxor 34, 34, 34
	addi 28, 1, 32
	mr 30, 4
	std 3, 48(1)
	li 3, 4095
	sldi 3, 3, 32
	oris 3, 3, 37800
	stvx 2, 0, 28
	ori 12, 3, 7024
	mtctr 12
	bctrl
	ld 2, 24(1)
	mr 29, 3
	li 3, 4
	std 3, 32(1)
	ld 3, 0(29)
	std 3, 40(1)
	std 28, 0(29)
	ld 3, 0(30)
	ld 4, 16(30)
	ld 5, 24(30)
	ld 6, 32(30)
	std 3, 48(1)
	bl julia_overdub_1856
	li 3, 29750
	ld 4, 40(1)
	sldi 3, 3, 32
	oris 3, 3, 49233
	ori 3, 3, 35792
	std 4, 0(29)
	addi 1, 1, 96
	ld 0, 16(1)
	mtlr 0
	ld 30, -16(1)                   # 8-byte Folded Reload
	ld 29, -24(1)                   # 8-byte Folded Reload
	ld 28, -32(1)                   # 8-byte Folded Reload
	blr
	.long	0
	.quad	0
.Lfunc_end1:
	.size	jfptr_overdub_1857, .Lfunc_end1-.Lfunc_begin1
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
