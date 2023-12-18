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
	.file	"stm32f4xx_hal_timebase_tim.c"
	.globl	HAL_InitTick                    @ -- Begin function HAL_InitTick
	.p2align	2
	.type	HAL_InitTick,%function
	.code	16                              @ @HAL_InitTick
	.thumb_func
HAL_InitTick:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#48
	sub	sp, #48
	str	r0, [sp, #44]
	movs	r0, #0
	str	r0, [sp, #16]
	str	r0, [sp, #12]
	b	.LBB0_1
.LBB0_1:
	movs	r0, #0
	str	r0, [sp]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #16
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #16
	str	r0, [sp]
	ldr	r0, [sp]
	b	.LBB0_2
.LBB0_2:
	add	r0, sp, #24
	add	r1, sp, #8
	bl	HAL_RCC_GetClockConfig
	ldr	r0, [sp, #36]
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	cbnz	r0, .LBB0_4
	b	.LBB0_3
.LBB0_3:
	bl	HAL_RCC_GetPCLK1Freq
	str	r0, [sp, #20]
	b	.LBB0_5
.LBB0_4:
	bl	HAL_RCC_GetPCLK1Freq
	lsls	r0, r0, #1
	str	r0, [sp, #20]
	b	.LBB0_5
.LBB0_5:
	ldr	r0, [sp, #20]
	movw	r1, #56963
	movt	r1, #17179
	umull	r0, r1, r0, r1
	mov.w	r0, #-1
	add.w	r0, r0, r1, lsr #18
	str	r0, [sp, #12]
	movw	r0, :lower16:htim6
	movt	r0, :upper16:htim6
	movw	r1, #4096
	movt	r1, #16384
	str	r1, [r0]
	movw	r1, #999
	str	r1, [r0, #12]
	ldr	r1, [sp, #12]
	str	r1, [r0, #4]
	movs	r1, #0
	str	r1, [r0, #16]
	str	r1, [r0, #8]
	str	r1, [r0, #24]
	bl	HAL_TIM_Base_Init
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	cbnz	r0, .LBB0_12
	b	.LBB0_6
.LBB0_6:
	movw	r0, :lower16:htim6
	movt	r0, :upper16:htim6
	bl	HAL_TIM_Base_Start_IT
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	cbnz	r0, .LBB0_11
	b	.LBB0_7
.LBB0_7:
	movs	r0, #54
	bl	HAL_NVIC_EnableIRQ
	ldr	r0, [sp, #44]
	cmp	r0, #15
	bhi	.LBB0_9
	b	.LBB0_8
.LBB0_8:
	ldr	r1, [sp, #44]
	movs	r0, #54
	movs	r2, #0
	bl	HAL_NVIC_SetPriority
	ldr	r0, [sp, #44]
	movw	r1, :lower16:uwTickPrio
	movt	r1, :upper16:uwTickPrio
	str	r0, [r1]
	b	.LBB0_10
.LBB0_9:
	movs	r0, #1
	str	r0, [sp, #4]
	b	.LBB0_10
.LBB0_10:
	b	.LBB0_11
.LBB0_11:
	b	.LBB0_12
.LBB0_12:
	ldr	r0, [sp, #4]
	add	sp, #48
	pop	{r7, pc}
.Lfunc_end0:
	.size	HAL_InitTick, .Lfunc_end0-HAL_InitTick
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_SuspendTick                 @ -- Begin function HAL_SuspendTick
	.p2align	2
	.type	HAL_SuspendTick,%function
	.code	16                              @ @HAL_SuspendTick
	.thumb_func
HAL_SuspendTick:
	.fnstart
@ %bb.0:
	movw	r0, :lower16:htim6
	movt	r0, :upper16:htim6
	ldr	r0, [r0]
	ldr	r1, [r0, #12]
	bic	r1, r1, #1
	str	r1, [r0, #12]
	bx	lr
.Lfunc_end1:
	.size	HAL_SuspendTick, .Lfunc_end1-HAL_SuspendTick
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_ResumeTick                  @ -- Begin function HAL_ResumeTick
	.p2align	2
	.type	HAL_ResumeTick,%function
	.code	16                              @ @HAL_ResumeTick
	.thumb_func
HAL_ResumeTick:
	.fnstart
@ %bb.0:
	movw	r0, :lower16:htim6
	movt	r0, :upper16:htim6
	ldr	r0, [r0]
	ldr	r1, [r0, #12]
	orr	r1, r1, #1
	str	r1, [r0, #12]
	bx	lr
.Lfunc_end2:
	.size	HAL_ResumeTick, .Lfunc_end2-HAL_ResumeTick
	.cantunwind
	.fnend
                                        @ -- End function
	.type	htim6,%object                   @ @htim6
	.bss
	.globl	htim6
	.p2align	2, 0x0
htim6:
	.zero	104
	.size	htim6, 104

	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 789cdbd730d0d33650f9940fff17c432b1dc4a4a)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
