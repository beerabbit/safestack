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
	.file	"sysmem.c"
	.globl	_sbrk                           @ -- Begin function _sbrk
	.p2align	2
	.type	_sbrk,%function
	.code	16                              @ @_sbrk
	.thumb_func
_sbrk:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#24
	sub	sp, #24
	str	r0, [sp, #16]
	movw	r0, :lower16:_Min_Stack_Size
	movt	r0, :upper16:_Min_Stack_Size
	movw	r1, :lower16:_estack
	movt	r1, :upper16:_estack
	subs	r0, r1, r0
	str	r0, [sp, #12]
	ldr	r0, [sp, #12]
	str	r0, [sp, #8]
	movw	r0, :lower16:__sbrk_heap_end
	movt	r0, :upper16:__sbrk_heap_end
	ldr	r0, [r0]
	cbnz	r0, .LBB0_2
	b	.LBB0_1
.LBB0_1:
	movw	r0, :lower16:__sbrk_heap_end
	movt	r0, :upper16:__sbrk_heap_end
	movw	r1, :lower16:_end
	movt	r1, :upper16:_end
	str	r1, [r0]
	b	.LBB0_2
.LBB0_2:
	movw	r0, :lower16:__sbrk_heap_end
	movt	r0, :upper16:__sbrk_heap_end
	ldr	r0, [r0]
	ldr	r1, [sp, #16]
	add	r0, r1
	ldr	r1, [sp, #8]
	cmp	r0, r1
	bls	.LBB0_4
	b	.LBB0_3
.LBB0_3:
	bl	__errno
	movs	r1, #12
	str	r1, [r0]
	mov.w	r0, #-1
	str	r0, [sp, #20]
	b	.LBB0_5
.LBB0_4:
	movw	r0, :lower16:__sbrk_heap_end
	movt	r0, :upper16:__sbrk_heap_end
	ldr	r1, [r0]
	str	r1, [sp, #4]
	ldr	r1, [sp, #16]
	ldr	r2, [r0]
	add	r1, r2
	str	r1, [r0]
	ldr	r0, [sp, #4]
	str	r0, [sp, #20]
	b	.LBB0_5
.LBB0_5:
	ldr	r0, [sp, #20]
	add	sp, #24
	pop	{r7, pc}
.Lfunc_end0:
	.size	_sbrk, .Lfunc_end0-_sbrk
	.cantunwind
	.fnend
                                        @ -- End function
	.type	__sbrk_heap_end,%object         @ @__sbrk_heap_end
	.local	__sbrk_heap_end
	.comm	__sbrk_heap_end,4,4
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 789cdbd730d0d33650f9940fff17c432b1dc4a4a)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
