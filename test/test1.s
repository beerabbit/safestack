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
	.eabi_attribute	21, 1	@ Tag_ABI_FP_exceptions
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
	.pad	#24
	sub	sp, #24
	@APP
a_0_FORPUSH:
	movw	lr, #0
	movt	lr, #2060
	push	{lr}
	@NO_APP
	mov	r1, sp
	movs	r0, #5
	str	r0, [r1]
	movs	r0, #1
	str	r0, [sp, #4]                    @ 4-byte Spill
	movs	r1, #2
	str	r1, [sp, #8]                    @ 4-byte Spill
	movs	r2, #3
	str	r2, [sp, #12]                   @ 4-byte Spill
	movs	r3, #4
	str	r3, [sp, #16]                   @ 4-byte Spill
	bl	b
	str	r0, [sp, #20]
	@APP
a_4_FORPUSH:
	movw	lr, #12
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	c
	ldr	r0, [sp, #4]                    @ 4-byte Reload
	ldr	r1, [sp, #8]                    @ 4-byte Reload
	ldr	r2, [sp, #12]                   @ 4-byte Reload
	ldr	r3, [sp, #16]                   @ 4-byte Reload
	@APP
a_8_FORPUSH:
	movw	lr, #24
	movt	lr, #2060
	push	{lr}
	@NO_APP
	mov	lr, sp
	mov.w	r12, #6
	str.w	r12, [lr]
	bl	b
	str	r0, [sp, #20]
	ldr	r0, [sp, #20]
	add	sp, #24
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
b_12_FORPUSH:
	movw	lr, #36
	movt	lr, #2060
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
	.pad	#4
	sub	sp, #4
	movs	r0, #0
	str	r0, [sp]
	add	sp, #4
	bx	lr
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
	ldr	r0, .Ltmp0
	ldr	r1, .Ltmp1
	str	r1, [r0]
	@NO_APP
	@APP
main_16_FORPUSH:
	movw	lr, #48
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	a
	str	r0, [sp, #4]
	ldr	r1, [sp, #4]
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	bl	printf
	movs	r0, #0
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	MasterForward                   @ -- Begin function MasterForward
	.p2align	1
	.type	MasterForward,%function
	.code	16                              @ @MasterForward
	.thumb_func
MasterForward:
	.fnstart
@ %bb.0:                                @ %MasterForward_
	@APP
	push	{r0, r1, r2, r3}
	ldr	r0, [sp, #16]
	ldr	r1, [r0]
	cmp	r1, lr
	bne	fail
	ldr	r1, .Ltmp0
	ldr	r2, [r1]
	str	r0, [r2]
	add.w	r2, r2, #4
	str	r2, [r1]
	pop.w	{r0, r1, r2, r3, lr}
	add.w	lr, lr, #4
	ldr.w	lr, [lr]
	bx	lr
fail:
	@NO_APP
	bx	lr
.Lfunc_end4:
	.size	MasterForward, .Lfunc_end4-MasterForward
	.fnend
                                        @ -- End function
	.globl	MasterBackward                  @ -- Begin function MasterBackward
	.p2align	1
	.type	MasterBackward,%function
	.code	16                              @ @MasterBackward
	.thumb_func
MasterBackward:
	.fnstart
@ %bb.0:                                @ %MasterBackward_
	@APP
	ldr	r1, .Ltmp0
	ldr	r2, [r1]
	sub.w	r2, r2, #4
	ldr	r3, [r2]
	add.w	r3, r3, #8
	ldr	r3, [r3]
	cmp	r3, lr
	bne	fail_back
	ldr	r3, [r2]
	ldr.w	lr, [r3]
	str	r2, [r1]
	bx	lr
fail_back:
	@NO_APP
	bx	lr
.Lfunc_end5:
	.size	MasterBackward, .Lfunc_end5-MasterBackward
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.text
	.p2align	2, 0x0
.Ltmp0:
	.long	536936448
	.p2align	2, 0x0
.Ltmp1:
	.long	536936452
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git f70f7242ad3dc55fc7dd91601ac39ce3e54a1096)"
	.section	".note.GNU-stack","",%progbits
