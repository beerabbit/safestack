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
	.file	"stm32f4xx_hal_msp.c"
	.globl	HAL_MspInit                     @ -- Begin function HAL_MspInit
	.p2align	2
	.type	HAL_MspInit,%function
	.code	16                              @ @HAL_MspInit
	.thumb_func
HAL_MspInit:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	b	.LBB0_1
.LBB0_1:
	movs	r0, #0
	str	r0, [sp, #4]
	movw	r0, #14404
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #16384
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #16384
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	b	.LBB0_2
.LBB0_2:
	b	.LBB0_3
.LBB0_3:
	movs	r0, #0
	str	r0, [sp]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #268435456
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #268435456
	str	r0, [sp]
	ldr	r0, [sp]
	b	.LBB0_4
.LBB0_4:
	movs	r0, #7
	bl	HAL_NVIC_SetPriorityGrouping
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end0:
	.size	HAL_MspInit, .Lfunc_end0-HAL_MspInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_I2C_MspInit                 @ -- Begin function HAL_I2C_MspInit
	.p2align	2
	.type	HAL_I2C_MspInit,%function
	.code	16                              @ @HAL_I2C_MspInit
	.thumb_func
HAL_I2C_MspInit:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#32
	sub	sp, #32
	str	r0, [sp, #28]
	movs	r0, #0
	str	r0, [sp, #24]
	str	r0, [sp, #20]
	str	r0, [sp, #16]
	str	r0, [sp, #12]
	str	r0, [sp, #8]
	ldr	r0, [sp, #28]
	ldr	r0, [r0]
	movw	r1, #21504
	movt	r1, #16384
	cmp	r0, r1
	bne	.LBB1_6
	b	.LBB1_1
.LBB1_1:
	b	.LBB1_2
.LBB1_2:
	movs	r0, #0
	str	r0, [sp, #4]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #2
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	b	.LBB1_3
.LBB1_3:
	mov.w	r0, #576
	str	r0, [sp, #8]
	movs	r0, #18
	str	r0, [sp, #12]
	movs	r0, #1
	str	r0, [sp, #16]
	movs	r0, #0
	str	r0, [sp, #20]
	movs	r0, #4
	str	r0, [sp, #24]
	movw	r0, #1024
	movt	r0, #16386
	add	r1, sp, #8
	bl	HAL_GPIO_Init
	b	.LBB1_4
.LBB1_4:
	movs	r0, #0
	str	r0, [sp]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #2097152
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #2097152
	str	r0, [sp]
	ldr	r0, [sp]
	b	.LBB1_5
.LBB1_5:
	b	.LBB1_6
.LBB1_6:
	add	sp, #32
	pop	{r7, pc}
.Lfunc_end1:
	.size	HAL_I2C_MspInit, .Lfunc_end1-HAL_I2C_MspInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_I2C_MspDeInit               @ -- Begin function HAL_I2C_MspDeInit
	.p2align	2
	.type	HAL_I2C_MspDeInit,%function
	.code	16                              @ @HAL_I2C_MspDeInit
	.thumb_func
HAL_I2C_MspDeInit:
	.fnstart
@ %bb.0:
	.save	{r4, r6, r7, lr}
	push	{r4, r6, r7, lr}
	.setfp	r7, sp, #8
	add	r7, sp, #8
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r0, [r0]
	movw	r1, #21504
	movt	r1, #16384
	cmp	r0, r1
	bne	.LBB2_2
	b	.LBB2_1
.LBB2_1:
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	bic	r1, r1, #2097152
	str	r1, [r0]
	movw	r4, #1024
	movt	r4, #16386
	mov	r0, r4
	movs	r1, #64
	bl	HAL_GPIO_DeInit
	mov	r0, r4
	mov.w	r1, #512
	bl	HAL_GPIO_DeInit
	b	.LBB2_2
.LBB2_2:
	add	sp, #8
	pop	{r4, r6, r7, pc}
.Lfunc_end2:
	.size	HAL_I2C_MspDeInit, .Lfunc_end2-HAL_I2C_MspDeInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_I2S_MspInit                 @ -- Begin function HAL_I2S_MspInit
	.p2align	2
	.type	HAL_I2S_MspInit,%function
	.code	16                              @ @HAL_I2S_MspInit
	.thumb_func
HAL_I2S_MspInit:
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.setfp	r7, sp, #12
	add	r7, sp, #12
	.save	{r8}
	str	r8, [sp, #-4]!
	.pad	#56
	sub	sp, #56
	str	r0, [sp, #52]
	movs	r0, #0
	str	r0, [sp, #48]
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r0, [sp, #28]
	str	r0, [sp, #24]
	str	r0, [sp, #20]
	str	r0, [sp, #16]
	ldr	r0, [sp, #52]
	ldr	r0, [r0]
	movw	r1, #15360
	movt	r1, #16384
	cmp	r0, r1
	bne	.LBB3_10
	b	.LBB3_1
.LBB3_1:
	movs	r0, #1
	str	r0, [sp, #16]
	movs	r0, #192
	str	r0, [sp, #20]
	movs	r0, #2
	str	r0, [sp, #24]
	add	r0, sp, #16
	bl	HAL_RCCEx_PeriphCLKConfig
	cbz	r0, .LBB3_3
	b	.LBB3_2
.LBB3_2:
	bl	Error_Handler
	b	.LBB3_3
.LBB3_3:
	b	.LBB3_4
.LBB3_4:
	movs	r0, #0
	str	r0, [sp, #12]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #32768
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #32768
	str	r0, [sp, #12]
	ldr	r0, [sp, #12]
	b	.LBB3_5
.LBB3_5:
	b	.LBB3_6
.LBB3_6:
	movs	r0, #0
	str	r0, [sp, #8]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #1
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	b	.LBB3_7
.LBB3_7:
	b	.LBB3_8
.LBB3_8:
	movs	r0, #0
	str	r0, [sp, #4]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #4
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #4
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	b	.LBB3_9
.LBB3_9:
	movs	r0, #16
	str	r0, [sp, #32]
	mov.w	r8, #2
	str.w	r8, [sp, #36]
	movs	r6, #0
	str	r6, [sp, #40]
	str	r6, [sp, #44]
	movs	r5, #6
	str	r5, [sp, #48]
	movs	r0, #0
	movt	r0, #16386
	add	r4, sp, #32
	mov	r1, r4
	bl	HAL_GPIO_Init
	mov.w	r0, #5248
	str	r0, [sp, #32]
	str.w	r8, [sp, #36]
	str	r6, [sp, #40]
	str	r6, [sp, #44]
	str	r5, [sp, #48]
	movw	r0, #2048
	movt	r0, #16386
	mov	r1, r4
	bl	HAL_GPIO_Init
	b	.LBB3_10
.LBB3_10:
	add	sp, #56
	ldr	r8, [sp], #4
	pop	{r4, r5, r6, r7, pc}
.Lfunc_end3:
	.size	HAL_I2S_MspInit, .Lfunc_end3-HAL_I2S_MspInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_I2S_MspDeInit               @ -- Begin function HAL_I2S_MspDeInit
	.p2align	2
	.type	HAL_I2S_MspDeInit,%function
	.code	16                              @ @HAL_I2S_MspDeInit
	.thumb_func
HAL_I2S_MspDeInit:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r0, [r0]
	movw	r1, #15360
	movt	r1, #16384
	cmp	r0, r1
	bne	.LBB4_2
	b	.LBB4_1
.LBB4_1:
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	bic	r1, r1, #32768
	str	r1, [r0]
	movs	r0, #0
	movt	r0, #16386
	movs	r1, #16
	bl	HAL_GPIO_DeInit
	movw	r0, #2048
	movt	r0, #16386
	mov.w	r1, #5248
	bl	HAL_GPIO_DeInit
	b	.LBB4_2
.LBB4_2:
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end4:
	.size	HAL_I2S_MspDeInit, .Lfunc_end4-HAL_I2S_MspDeInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_SPI_MspInit                 @ -- Begin function HAL_SPI_MspInit
	.p2align	2
	.type	HAL_SPI_MspInit,%function
	.code	16                              @ @HAL_SPI_MspInit
	.thumb_func
HAL_SPI_MspInit:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#32
	sub	sp, #32
	str	r0, [sp, #28]
	movs	r0, #0
	str	r0, [sp, #24]
	str	r0, [sp, #20]
	str	r0, [sp, #16]
	str	r0, [sp, #12]
	str	r0, [sp, #8]
	ldr	r0, [sp, #28]
	ldr	r0, [r0]
	movw	r1, #12288
	movt	r1, #16385
	cmp	r0, r1
	bne	.LBB5_6
	b	.LBB5_1
.LBB5_1:
	b	.LBB5_2
.LBB5_2:
	movs	r0, #0
	str	r0, [sp, #4]
	movw	r0, #14404
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #4096
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #4096
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	b	.LBB5_3
.LBB5_3:
	b	.LBB5_4
.LBB5_4:
	movs	r0, #0
	str	r0, [sp]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #1
	str	r0, [sp]
	ldr	r0, [sp]
	b	.LBB5_5
.LBB5_5:
	movs	r0, #224
	str	r0, [sp, #8]
	movs	r0, #2
	str	r0, [sp, #12]
	movs	r0, #0
	str	r0, [sp, #16]
	str	r0, [sp, #20]
	movs	r0, #5
	str	r0, [sp, #24]
	movs	r0, #0
	movt	r0, #16386
	add	r1, sp, #8
	bl	HAL_GPIO_Init
	b	.LBB5_6
.LBB5_6:
	add	sp, #32
	pop	{r7, pc}
.Lfunc_end5:
	.size	HAL_SPI_MspInit, .Lfunc_end5-HAL_SPI_MspInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_SPI_MspDeInit               @ -- Begin function HAL_SPI_MspDeInit
	.p2align	2
	.type	HAL_SPI_MspDeInit,%function
	.code	16                              @ @HAL_SPI_MspDeInit
	.thumb_func
HAL_SPI_MspDeInit:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r0, [r0]
	movw	r1, #12288
	movt	r1, #16385
	cmp	r0, r1
	bne	.LBB6_2
	b	.LBB6_1
.LBB6_1:
	movw	r0, #14404
	movt	r0, #16386
	ldr	r1, [r0]
	bic	r1, r1, #4096
	str	r1, [r0]
	movs	r0, #0
	movt	r0, #16386
	movs	r1, #224
	bl	HAL_GPIO_DeInit
	b	.LBB6_2
.LBB6_2:
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end6:
	.size	HAL_SPI_MspDeInit, .Lfunc_end6-HAL_SPI_MspDeInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_UART_MspInit                @ -- Begin function HAL_UART_MspInit
	.p2align	2
	.type	HAL_UART_MspInit,%function
	.code	16                              @ @HAL_UART_MspInit
	.thumb_func
HAL_UART_MspInit:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#32
	sub	sp, #32
	str	r0, [sp, #28]
	movs	r0, #0
	str	r0, [sp, #24]
	str	r0, [sp, #20]
	str	r0, [sp, #16]
	str	r0, [sp, #12]
	str	r0, [sp, #8]
	ldr	r0, [sp, #28]
	ldr	r0, [r0]
	movw	r1, #17408
	movt	r1, #16384
	cmp	r0, r1
	bne	.LBB7_6
	b	.LBB7_1
.LBB7_1:
	b	.LBB7_2
.LBB7_2:
	movs	r0, #0
	str	r0, [sp, #4]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #131072
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #131072
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	b	.LBB7_3
.LBB7_3:
	b	.LBB7_4
.LBB7_4:
	movs	r0, #0
	str	r0, [sp]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #1
	str	r0, [sp]
	ldr	r0, [sp]
	b	.LBB7_5
.LBB7_5:
	movs	r0, #12
	str	r0, [sp, #8]
	movs	r0, #2
	str	r0, [sp, #12]
	movs	r0, #0
	str	r0, [sp, #16]
	movs	r0, #3
	str	r0, [sp, #20]
	movs	r0, #7
	str	r0, [sp, #24]
	movs	r0, #0
	movt	r0, #16386
	add	r1, sp, #8
	bl	HAL_GPIO_Init
	b	.LBB7_6
.LBB7_6:
	add	sp, #32
	pop	{r7, pc}
.Lfunc_end7:
	.size	HAL_UART_MspInit, .Lfunc_end7-HAL_UART_MspInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_UART_MspDeInit              @ -- Begin function HAL_UART_MspDeInit
	.p2align	2
	.type	HAL_UART_MspDeInit,%function
	.code	16                              @ @HAL_UART_MspDeInit
	.thumb_func
HAL_UART_MspDeInit:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r0, [r0]
	movw	r1, #17408
	movt	r1, #16384
	cmp	r0, r1
	bne	.LBB8_2
	b	.LBB8_1
.LBB8_1:
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	bic	r1, r1, #131072
	str	r1, [r0]
	movs	r0, #0
	movt	r0, #16386
	movs	r1, #12
	bl	HAL_GPIO_DeInit
	b	.LBB8_2
.LBB8_2:
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end8:
	.size	HAL_UART_MspDeInit, .Lfunc_end8-HAL_UART_MspDeInit
	.cantunwind
	.fnend
                                        @ -- End function
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 9e505eddd0ddb64833e98c352f5619f1353db354)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
