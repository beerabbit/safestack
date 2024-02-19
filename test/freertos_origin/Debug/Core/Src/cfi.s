	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.eabi_attribute	6, 13	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"cfi.c"
	.globl	forward                         @ -- Begin function forward
	.p2align	2
	.type	forward,%function
	.code	16                              @ @forward
	.thumb_func
forward:
	.fnstart
@ %bb.0:
	.pad	#16
	sub	sp, #16
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	ldr	r0, [sp, #8]
	movs	r1, #44
	movt	r1, #8193
	add.w	r0, r1, r0, lsl #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r0, [r0]
	str	r0, [sp]
	ldr	r0, [sp, #12]
	ldr	r1, [sp]
	str	r0, [r1]
	ldr	r0, [sp]
	adds	r0, #4
	str	r0, [sp]
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	str	r0, [r1]
	add	sp, #16
	bx	lr
.Lfunc_end0:
	.size	forward, .Lfunc_end0-forward
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	backward                        @ -- Begin function backward
	.p2align	2
	.type	backward,%function
	.code	16                              @ @backward
	.thumb_func
backward:
	.fnstart
@ %bb.0:
	.pad	#24
	sub	sp, #24
	str	r0, [sp, #16]
	str	r1, [sp, #12]
	ldr	r0, [sp, #12]
	movs	r1, #44
	movt	r1, #8193
	add.w	r0, r1, r0, lsl #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r0, [r0]
	str	r0, [sp]
	ldr	r0, [sp]
	subs	r0, #4
	str	r0, [sp]
	ldr	r0, [sp]
	ldr	r0, [r0]
	adds	r0, #8
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	ldr	r0, [r0]
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	ldr	r1, [sp, #16]
	cmp	r0, r1
	bne	.LBB1_2
	b	.LBB1_1
.LBB1_1:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	str	r0, [r1]
	ldr	r0, [sp, #8]
	str	r0, [sp, #20]
	b	.LBB1_3
.LBB1_2:
	@APP
	bx	r1
	@NO_APP
	b	.LBB1_3
.LBB1_3:
	ldr	r0, [sp, #20]
	add	sp, #24
	bx	lr
.Lfunc_end1:
	.size	backward, .Lfunc_end1-backward
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	getidx                          @ -- Begin function getidx
	.p2align	2
	.type	getidx,%function
	.code	16                              @ @getidx
	.thumb_func
getidx:
	.fnstart
@ %bb.0:
	.pad	#32
	sub	sp, #32
	movw	r0, :lower16:pxCurrentTCB
	movt	r0, :upper16:pxCurrentTCB
	ldr	r0, [r0]
	ldr	r0, [r0, #48]
	str	r0, [sp, #24]
	movs	r0, #0
	movt	r0, #8193
	str	r0, [sp, #20]
	movs	r0, #4
	movt	r0, #8193
	str	r0, [sp, #16]
	movs	r0, #0
	str	r0, [sp, #12]
	b	.LBB2_1
.LBB2_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp, #12]
	cmp	r0, #9
	bgt	.LBB2_6
	b	.LBB2_2
.LBB2_2:                                @   in Loop: Header=BB2_1 Depth=1
	ldr	r0, [sp, #16]
	ldr	r0, [r0]
	ldr	r1, [sp, #24]
	cmp	r0, r1
	bne	.LBB2_4
	b	.LBB2_3
.LBB2_3:
	ldr	r0, [sp, #12]
	str	r0, [sp, #28]
	b	.LBB2_7
.LBB2_4:                                @   in Loop: Header=BB2_1 Depth=1
	ldr	r0, [sp, #16]
	adds	r0, #4
	str	r0, [sp, #16]
	b	.LBB2_5
.LBB2_5:                                @   in Loop: Header=BB2_1 Depth=1
	ldr	r0, [sp, #12]
	adds	r0, #1
	str	r0, [sp, #12]
	b	.LBB2_1
.LBB2_6:
	ldr	r0, [sp, #20]
	ldrb	r0, [r0]
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	movs	r1, #4
	movt	r1, #8193
	add.w	r0, r1, r0, lsl #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #8]
	movs	r1, #44
	movt	r1, #8193
	add.w	r0, r1, r0, lsl #2
	str	r0, [sp]
	ldr	r0, [sp, #24]
	ldr	r1, [sp, #4]
	str	r0, [r1]
	ldr	r0, [sp, #8]
	movs	r1, #84
	movt	r1, #8193
	mov.w	r2, #400
	mla	r0, r0, r2, r1
	ldr	r1, [sp]
	str	r0, [r1]
	ldr	r0, [sp, #8]
	adds	r0, #1
	ldr	r1, [sp, #20]
	strb	r0, [r1]
	ldr	r0, [sp, #8]
	str	r0, [sp, #28]
	b	.LBB2_7
.LBB2_7:
	ldr	r0, [sp, #28]
	add	sp, #32
	bx	lr
.Lfunc_end2:
	.size	getidx, .Lfunc_end2-getidx
	.cantunwind
	.fnend
                                        @ -- End function
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 924411f7435188d98a0c744016baf7a22cb5b036)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
