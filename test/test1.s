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
	.file	"test.c"
	.globl	a                               @ -- Begin function a
	.p2align	2
	.type	a,%function
	.code	16                              @ @a
	.thumb_func
a:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	@APP
	mov.w	lr, #0
	@NO_APP
	@APP
	push	{lr}
	@NO_APP
	movs	r0, #5
	str	r0, [sp]
	movs	r0, #1
	movs	r1, #2
	movs	r2, #3
	movs	r3, #4
	bl	b
	str	r0, [sp, #4]
	@APP
	mov.w	lr, #0
	@NO_APP
	@APP
	push	{lr}
	@NO_APP
	bl	c
	@APP
	mov.w	lr, #0
	@NO_APP
	@APP
	push	{lr}
	@NO_APP
	movs	r0, #6
	str	r0, [sp]
	movs	r0, #1
	movs	r1, #2
	movs	r2, #3
	movs	r3, #4
	bl	b
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end0:
	.size	a, .Lfunc_end0-a
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	b                               @ -- Begin function b
	.p2align	2
	.type	b,%function
	.code	16                              @ @b
	.thumb_func
b:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#24
	sub	sp, #24
	ldr.w	r12, [r7, #8]
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r0, [sp, #20]
	ldr	r1, [sp, #16]
	add	r0, r1
	ldr	r1, [sp, #12]
	add	r0, r1
	ldr	r1, [sp, #8]
	add	r0, r1
	ldr	r1, [r7, #8]
	add	r0, r1
	str	r0, [sp, #4]
	@APP
	mov.w	lr, #0
	@NO_APP
	@APP
	push	{lr}
	@NO_APP
	bl	c
	ldr	r0, [sp, #4]
	add	sp, #24
	pop	{r7, pc}
.Lfunc_end1:
	.size	b, .Lfunc_end1-b
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	c                               @ -- Begin function c
	.p2align	2
	.type	c,%function
	.code	16                              @ @c
	.thumb_func
c:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	@APP
	mov.w	lr, #0
	@NO_APP
	@APP
	push	{lr}
	@NO_APP
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	bl	printf
	pop	{r7, pc}
.Lfunc_end2:
	.size	c, .Lfunc_end2-c
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	main                            @ -- Begin function main
	.p2align	2
	.type	main,%function
	.code	16                              @ @main
	.thumb_func
main:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	@APP
	mov.w	lr, #0
	@NO_APP
	@APP
	push	{lr}
	@NO_APP
	bl	a
	str	r0, [sp, #4]
	ldr	r1, [sp, #4]
	@APP
	mov.w	lr, #0
	@NO_APP
	@APP
	push	{lr}
	@NO_APP
	movw	r0, :lower16:.L.str.1
	movt	r0, :upper16:.L.str.1
	bl	printf
	movs	r0, #0
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cantunwind
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"EOF\n"
	.size	.L.str, 5

	.type	.L.str.1,%object                @ @.str.1
.L.str.1:
	.asciz	"%d\n"
	.size	.L.str.1, 4

	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git ca57aba38883a0f018b42378ceb988b892f1acd9)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
