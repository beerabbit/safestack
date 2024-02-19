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
	.file	"main.c"
	.globl	__io_putchar                    @ -- Begin function __io_putchar
	.p2align	2
	.type	__io_putchar,%function
	.code	16                              @ @__io_putchar
	.thumb_func
__io_putchar:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	movw	r0, :lower16:huart2
	movt	r0, :upper16:huart2
	add	r1, sp, #4
	movs	r2, #1
	movs	r3, #100
	bl	HAL_UART_Transmit
	ldr	r0, [sp, #4]
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end0:
	.size	__io_putchar, .Lfunc_end0-__io_putchar
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
	movs	r0, #0
	str	r0, [sp, #4]
	bl	HAL_Init
	bl	SystemClock_Config
	bl	MX_GPIO_Init
	bl	MX_I2C1_Init
	bl	MX_I2S3_Init
	bl	MX_SPI1_Init
	bl	MX_USART2_UART_Init
	bl	osKernelInitialize
	movs	r0, #0
	movt	r0, #8193
	str	r0, [sp]
	b	.LBB1_1
.LBB1_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp]
	movw	r1, #4095
	movt	r1, #8193
	cmp	r0, r1
	bgt	.LBB1_4
	b	.LBB1_2
.LBB1_2:                                @   in Loop: Header=BB1_1 Depth=1
	ldr	r0, [sp]
	movs	r1, #0
	strb	r1, [r0]
	b	.LBB1_3
.LBB1_3:                                @   in Loop: Header=BB1_1 Depth=1
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	b	.LBB1_1
.LBB1_4:
	movw	r0, :lower16:StartTask02
	movt	r0, :upper16:StartTask02
	movw	r2, :lower16:myTask02_attributes
	movt	r2, :upper16:myTask02_attributes
	movs	r1, #0
	bl	osThreadNew
	movw	r1, :lower16:myTask02Handle
	movt	r1, :upper16:myTask02Handle
	str	r0, [r1]
	movw	r0, :lower16:StartTask01
	movt	r0, :upper16:StartTask01
	movw	r2, :lower16:myTask01_attributes
	movt	r2, :upper16:myTask01_attributes
	movs	r1, #0
	bl	osThreadNew
	movw	r1, :lower16:myTask01Handle
	movt	r1, :upper16:myTask01Handle
	str	r0, [r1]
	bl	osKernelStart
	b	.LBB1_5
.LBB1_5:                                @ =>This Inner Loop Header: Depth=1
	b	.LBB1_5
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	SystemClock_Config              @ -- Begin function SystemClock_Config
	.p2align	2
	.type	SystemClock_Config,%function
	.code	16                              @ @SystemClock_Config
	.thumb_func
SystemClock_Config:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#80
	sub	sp, #80
	add	r0, sp, #32
	movs	r1, #48
	bl	__aeabi_memclr4
	movs	r0, #0
	str	r0, [sp, #28]
	str	r0, [sp, #24]
	str	r0, [sp, #20]
	str	r0, [sp, #16]
	str	r0, [sp, #12]
	b	.LBB2_1
.LBB2_1:
	movs	r0, #0
	str	r0, [sp, #8]
	movw	r0, #14400
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #268435456
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #268435456
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	b	.LBB2_2
.LBB2_2:
	b	.LBB2_3
.LBB2_3:
	movs	r0, #0
	str	r0, [sp, #4]
	movw	r0, #28672
	movt	r0, #16384
	ldr	r1, [r0]
	orr	r1, r1, #16384
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #16384
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	b	.LBB2_4
.LBB2_4:
	movs	r0, #1
	str	r0, [sp, #32]
	mov.w	r0, #65536
	str	r0, [sp, #36]
	movs	r0, #2
	str	r0, [sp, #56]
	mov.w	r1, #4194304
	str	r1, [sp, #60]
	movs	r1, #8
	str	r1, [sp, #64]
	mov.w	r1, #336
	str	r1, [sp, #68]
	str	r0, [sp, #72]
	movs	r0, #7
	str	r0, [sp, #76]
	add	r0, sp, #32
	bl	HAL_RCC_OscConfig
	cbz	r0, .LBB2_6
	b	.LBB2_5
.LBB2_5:
	bl	Error_Handler
	b	.LBB2_6
.LBB2_6:
	movs	r0, #15
	str	r0, [sp, #12]
	movs	r0, #2
	str	r0, [sp, #16]
	movs	r0, #0
	str	r0, [sp, #20]
	mov.w	r0, #5120
	str	r0, [sp, #24]
	mov.w	r0, #4096
	str	r0, [sp, #28]
	add	r0, sp, #12
	movs	r1, #5
	bl	HAL_RCC_ClockConfig
	cbz	r0, .LBB2_8
	b	.LBB2_7
.LBB2_7:
	bl	Error_Handler
	b	.LBB2_8
.LBB2_8:
	add	sp, #80
	pop	{r7, pc}
.Lfunc_end2:
	.size	SystemClock_Config, .Lfunc_end2-SystemClock_Config
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function MX_GPIO_Init
	.type	MX_GPIO_Init,%function
	.code	16                              @ @MX_GPIO_Init
	.thumb_func
MX_GPIO_Init:
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	.setfp	r7, sp, #12
	add	r7, sp, #12
	.save	{r8, r9, r10, r11}
	push.w	{r8, r9, r10, r11}
	.pad	#44
	sub	sp, #44
	movs	r0, #0
	str	r0, [sp, #40]
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	str	r0, [sp, #28]
	str	r0, [sp, #24]
	b	.LBB3_1
.LBB3_1:
	movs	r0, #0
	str	r0, [sp, #20]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #16
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #16
	str	r0, [sp, #20]
	ldr	r0, [sp, #20]
	b	.LBB3_2
.LBB3_2:
	b	.LBB3_3
.LBB3_3:
	movs	r0, #0
	str	r0, [sp, #16]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #4
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #4
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	b	.LBB3_4
.LBB3_4:
	b	.LBB3_5
.LBB3_5:
	movs	r0, #0
	str	r0, [sp, #12]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #128
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #128
	str	r0, [sp, #12]
	ldr	r0, [sp, #12]
	b	.LBB3_6
.LBB3_6:
	b	.LBB3_7
.LBB3_7:
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
	b	.LBB3_8
.LBB3_8:
	b	.LBB3_9
.LBB3_9:
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
	b	.LBB3_10
.LBB3_10:
	b	.LBB3_11
.LBB3_11:
	movs	r0, #0
	str	r0, [sp]
	movw	r0, #14384
	movt	r0, #16386
	ldr	r1, [r0]
	orr	r1, r1, #8
	str	r1, [r0]
	ldr	r0, [r0]
	and	r0, r0, #8
	str	r0, [sp]
	ldr	r0, [sp]
	b	.LBB3_12
.LBB3_12:
	movw	r9, #4096
	movt	r9, #16386
	mov.w	r8, #8
	movs	r5, #0
	mov	r0, r9
	movs	r1, #8
	movs	r2, #0
	bl	HAL_GPIO_WritePin
	movw	r4, #2048
	movt	r4, #16386
	mov.w	r10, #1
	mov	r0, r4
	movs	r1, #1
	movs	r2, #1
	bl	HAL_GPIO_WritePin
	movw	r0, #3072
	movt	r0, #16386
	movw	r1, #61456
	movs	r2, #0
	bl	HAL_GPIO_WritePin
	str.w	r8, [sp, #24]
	str.w	r10, [sp, #28]
	str	r5, [sp, #32]
	str	r5, [sp, #36]
	add	r6, sp, #24
	mov	r0, r9
	mov	r1, r6
	bl	HAL_GPIO_Init
	str.w	r10, [sp, #24]
	str.w	r10, [sp, #28]
	str	r5, [sp, #32]
	str	r5, [sp, #36]
	mov	r0, r4
	mov	r1, r6
	bl	HAL_GPIO_Init
	str.w	r8, [sp, #24]
	mov.w	r11, #2
	str.w	r11, [sp, #28]
	str	r5, [sp, #32]
	str	r5, [sp, #36]
	mov.w	r9, #5
	str.w	r9, [sp, #40]
	mov	r0, r4
	mov	r1, r6
	bl	HAL_GPIO_Init
	str.w	r10, [sp, #24]
	mov.w	r8, #1179648
	str.w	r8, [sp, #28]
	str	r5, [sp, #32]
	movs	r0, #0
	movt	r0, #16386
	mov	r1, r6
	bl	HAL_GPIO_Init
	movs	r0, #4
	str	r0, [sp, #24]
	str	r5, [sp, #28]
	str	r5, [sp, #32]
	movw	r4, #1024
	movt	r4, #16386
	mov	r0, r4
	mov	r1, r6
	bl	HAL_GPIO_Init
	mov.w	r0, #1024
	str	r0, [sp, #24]
	str.w	r11, [sp, #28]
	str	r5, [sp, #32]
	str	r5, [sp, #36]
	str.w	r9, [sp, #40]
	mov	r0, r4
	mov	r1, r6
	bl	HAL_GPIO_Init
	movw	r0, #61456
	str	r0, [sp, #24]
	str.w	r10, [sp, #28]
	str	r5, [sp, #32]
	str	r5, [sp, #36]
	movw	r4, #3072
	movt	r4, #16386
	mov	r0, r4
	mov	r1, r6
	bl	HAL_GPIO_Init
	movs	r0, #32
	str	r0, [sp, #24]
	str	r5, [sp, #28]
	str	r5, [sp, #32]
	mov	r0, r4
	mov	r1, r6
	bl	HAL_GPIO_Init
	str.w	r11, [sp, #24]
	str.w	r8, [sp, #28]
	str	r5, [sp, #32]
	movw	r0, #4096
	movt	r0, #16386
	mov	r1, r6
	bl	HAL_GPIO_Init
	add	sp, #44
	pop.w	{r8, r9, r10, r11}
	pop	{r4, r5, r6, r7, pc}
.Lfunc_end3:
	.size	MX_GPIO_Init, .Lfunc_end3-MX_GPIO_Init
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function MX_I2C1_Init
	.type	MX_I2C1_Init,%function
	.code	16                              @ @MX_I2C1_Init
	.thumb_func
MX_I2C1_Init:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	movw	r0, :lower16:hi2c1
	movt	r0, :upper16:hi2c1
	movw	r1, #21504
	movt	r1, #16384
	str	r1, [r0]
	movw	r1, #34464
	movt	r1, #1
	str	r1, [r0, #4]
	movs	r1, #0
	str	r1, [r0, #8]
	str	r1, [r0, #12]
	mov.w	r2, #16384
	str	r2, [r0, #16]
	str	r1, [r0, #20]
	str	r1, [r0, #24]
	str	r1, [r0, #28]
	str	r1, [r0, #32]
	bl	HAL_I2C_Init
	cbz	r0, .LBB4_2
	b	.LBB4_1
.LBB4_1:
	bl	Error_Handler
	b	.LBB4_2
.LBB4_2:
	pop	{r7, pc}
.Lfunc_end4:
	.size	MX_I2C1_Init, .Lfunc_end4-MX_I2C1_Init
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function MX_I2S3_Init
	.type	MX_I2S3_Init,%function
	.code	16                              @ @MX_I2S3_Init
	.thumb_func
MX_I2S3_Init:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	movw	r0, :lower16:hi2s3
	movt	r0, :upper16:hi2s3
	movw	r1, #15360
	movt	r1, #16384
	str	r1, [r0]
	mov.w	r1, #512
	str	r1, [r0, #4]
	movs	r2, #0
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	str	r1, [r0, #16]
	movw	r1, #30464
	movt	r1, #1
	str	r1, [r0, #20]
	str	r2, [r0, #24]
	str	r2, [r0, #28]
	str	r2, [r0, #32]
	bl	HAL_I2S_Init
	cbz	r0, .LBB5_2
	b	.LBB5_1
.LBB5_1:
	bl	Error_Handler
	b	.LBB5_2
.LBB5_2:
	pop	{r7, pc}
.Lfunc_end5:
	.size	MX_I2S3_Init, .Lfunc_end5-MX_I2S3_Init
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function MX_SPI1_Init
	.type	MX_SPI1_Init,%function
	.code	16                              @ @MX_SPI1_Init
	.thumb_func
MX_SPI1_Init:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	movw	r0, :lower16:hspi1
	movt	r0, :upper16:hspi1
	movw	r1, #12288
	movt	r1, #16385
	str	r1, [r0]
	mov.w	r1, #260
	str	r1, [r0, #4]
	movs	r1, #0
	str	r1, [r0, #8]
	str	r1, [r0, #12]
	str	r1, [r0, #16]
	str	r1, [r0, #20]
	mov.w	r2, #512
	str	r2, [r0, #24]
	str	r1, [r0, #28]
	str	r1, [r0, #32]
	str	r1, [r0, #36]
	str	r1, [r0, #40]
	movs	r1, #10
	str	r1, [r0, #44]
	bl	HAL_SPI_Init
	cbz	r0, .LBB6_2
	b	.LBB6_1
.LBB6_1:
	bl	Error_Handler
	b	.LBB6_2
.LBB6_2:
	pop	{r7, pc}
.Lfunc_end6:
	.size	MX_SPI1_Init, .Lfunc_end6-MX_SPI1_Init
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function MX_USART2_UART_Init
	.type	MX_USART2_UART_Init,%function
	.code	16                              @ @MX_USART2_UART_Init
	.thumb_func
MX_USART2_UART_Init:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	movw	r0, :lower16:huart2
	movt	r0, :upper16:huart2
	movw	r1, #17408
	movt	r1, #16384
	str	r1, [r0]
	mov.w	r1, #115200
	str	r1, [r0, #4]
	movs	r1, #0
	str	r1, [r0, #8]
	str	r1, [r0, #12]
	str	r1, [r0, #16]
	movs	r2, #12
	str	r2, [r0, #20]
	str	r1, [r0, #24]
	str	r1, [r0, #28]
	bl	HAL_UART_Init
	cbz	r0, .LBB7_2
	b	.LBB7_1
.LBB7_1:
	bl	Error_Handler
	b	.LBB7_2
.LBB7_2:
	pop	{r7, pc}
.Lfunc_end7:
	.size	MX_USART2_UART_Init, .Lfunc_end7-MX_USART2_UART_Init
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	StartTask02                     @ -- Begin function StartTask02
	.p2align	2
	.type	StartTask02,%function
	.code	16                              @ @StartTask02
	.thumb_func
StartTask02:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	b	.LBB8_1
.LBB8_1:                                @ =>This Inner Loop Header: Depth=1
	bl	getidx
	str	r0, [sp]
	ldr	r2, [sp]
	movw	r0, :lower16:.L.str.6
	movt	r0, :upper16:.L.str.6
	movw	r1, :lower16:StartTask02
	movt	r1, :upper16:StartTask02
	bl	printf
	@APP
StartTask02_0_FORPUSH:
	cpsid if
	movw	lr, #0
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	mov.w	r0, #1000
	bl	osDelay
	b	.LBB8_1
.Lfunc_end8:
	.size	StartTask02, .Lfunc_end8-StartTask02
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	StartTask01                     @ -- Begin function StartTask01
	.p2align	2
	.type	StartTask01,%function
	.code	16                              @ @StartTask01
	.thumb_func
StartTask01:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#16
	sub	sp, #16
	str	r0, [sp, #12]
	bl	HAL_GetTick
	str	r0, [sp, #8]
	b	.LBB9_1
.LBB9_1:                                @ =>This Inner Loop Header: Depth=1
	bl	getidx
	str	r0, [sp, #4]
	ldr	r2, [sp, #4]
	movw	r0, :lower16:.L.str.6
	movt	r0, :upper16:.L.str.6
	movw	r1, :lower16:StartTask02
	movt	r1, :upper16:StartTask02
	bl	printf
	@APP
StartTask01_4_FORPUSH:
	cpsid if
	movw	lr, #12
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	mov.w	r0, #1000
	bl	osDelay
	b	.LBB9_1
.Lfunc_end9:
	.size	StartTask01, .Lfunc_end9-StartTask01
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	Error_Handler                   @ -- Begin function Error_Handler
	.p2align	2
	.type	Error_Handler,%function
	.code	16                              @ @Error_Handler
	.thumb_func
Error_Handler:
	.fnstart
@ %bb.0:
	@APP
	cpsid i
	@NO_APP
	b	.LBB10_1
.LBB10_1:                               @ =>This Inner Loop Header: Depth=1
	b	.LBB10_1
.Lfunc_end10:
	.size	Error_Handler, .Lfunc_end10-Error_Handler
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
	.pad	#24
	sub	sp, #24
	ldr.w	r12, [r7, #8]
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	bl	getidx
	str	r0, [sp, #4]
	ldr	r1, [sp, #4]
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	printf
	movw	r0, :lower16:.L.str.3
	movt	r0, :upper16:.L.str.3
	bl	printf
	ldr	r0, [sp, #20]
	ldr	r1, [sp, #16]
	add	r0, r1
	ldr	r1, [sp, #12]
	add	r0, r1
	ldr	r1, [sp, #8]
	add	r0, r1
	ldr	r1, [r7, #8]
	add	r0, r1
	add	sp, #24
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end11:
	.size	c, .Lfunc_end11-c
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
	.pad	#16
	sub	sp, #16
	str	r0, [sp, #12]
	bl	getidx
	str	r0, [sp, #8]
	ldr	r1, [sp, #8]
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	printf
	movw	r0, :lower16:.L.str.4
	movt	r0, :upper16:.L.str.4
	bl	printf
	ldr	r0, [sp, #12]
	adds	r0, #123
	@APP
b_8_FORPUSH:
	cpsid if

	@NO_APP
	movs	r1, #4
	str	r1, [sp]
	movs	r1, #1
	movs	r2, #2
	movs	r3, #3
	movw	lr, #24
	movt	lr, #2060
	push	{lr}
	bl	MasterForward
	add	sp, #16
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end12:
	.size	b, .Lfunc_end12-b
	.cantunwind
	.fnend
                                        @ -- End function
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
	bl	getidx
	str	r0, [sp, #4]
	ldr	r1, [sp, #4]
	movw	r0, :lower16:.L.str.2
	movt	r0, :upper16:.L.str.2
	bl	printf
	movw	r0, :lower16:.L.str.5
	movt	r0, :upper16:.L.str.5
	bl	printf
	@APP
a_12_FORPUSH:
	cpsid if

	@NO_APP
	movs	r0, #1
	movw	lr, #36
	movt	lr, #2060
	push	{lr}
	bl	MasterForward
	add	sp, #8
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end13:
	.size	a, .Lfunc_end13-a
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HAL_TIM_PeriodElapsedCallback   @ -- Begin function HAL_TIM_PeriodElapsedCallback
	.p2align	2
	.type	HAL_TIM_PeriodElapsedCallback,%function
	.code	16                              @ @HAL_TIM_PeriodElapsedCallback
	.thumb_func
HAL_TIM_PeriodElapsedCallback:
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
	movw	r1, #4096
	movt	r1, #16384
	cmp	r0, r1
	bne	.LBB14_2
	b	.LBB14_1
.LBB14_1:
	bl	HAL_IncTick
	b	.LBB14_2
.LBB14_2:
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end14:
	.size	HAL_TIM_PeriodElapsedCallback, .Lfunc_end14-HAL_TIM_PeriodElapsedCallback
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
	.save	{r7, lr}
	push	{r7, lr}
	@APP
	pop.w	{r7, lr}
	push	{r0, r1, r2, r3}
	ldr	r0, [sp, #16]
	ldr	r1, [r0]
	push	{r0}
	cmp	r1, lr
	bne	fail

	@NO_APP
	bl	getidx
	mov	r1, r0
	@APP
	pop	{r2}
	mov	r0, r2
	@NO_APP
	bl	forward
	@APP
	pop.w	{r0, r1, r2, r3, lr}
	add.w	lr, lr, #4
	ldr.w	lr, [lr]
	cpsie if
	bx	lr
fail:
	@NO_APP
	pop	{r7, pc}
.Lfunc_end15:
	.size	MasterForward, .Lfunc_end15-MasterForward
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
	.save	{r7, lr}
	push	{r7, lr}
	@APP
	cpsid if
	pop.w	{r7, lr}
	push	{r0}
	push	{lr}

	@NO_APP
	bl	getidx
	mov	r1, r0
	@APP
	pop	{r2}

	@NO_APP
	@APP
	mov	r0, r2
	@NO_APP
	bl	backward
	@APP
	mov	lr, r0
	pop	{r0}
	cpsie if
	bx	lr
fail_back:
	@NO_APP
	pop	{r7, pc}
.Lfunc_end16:
	.size	MasterBackward, .Lfunc_end16-MasterBackward
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"myTask01"
	.size	.L.str, 9

	.type	myTask01_attributes,%object     @ @myTask01_attributes
	.section	.rodata,"a",%progbits
	.globl	myTask01_attributes
	.p2align	2, 0x0
myTask01_attributes:
	.long	.L.str
	.long	0                               @ 0x0
	.long	0
	.long	0                               @ 0x0
	.long	0
	.long	4096                            @ 0x1000
	.long	16                              @ 0x10
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.size	myTask01_attributes, 36

	.type	.L.str.1,%object                @ @.str.1
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.1:
	.asciz	"myTask02"
	.size	.L.str.1, 9

	.type	myTask02_attributes,%object     @ @myTask02_attributes
	.section	.rodata,"a",%progbits
	.globl	myTask02_attributes
	.p2align	2, 0x0
myTask02_attributes:
	.long	.L.str.1
	.long	0                               @ 0x0
	.long	0
	.long	0                               @ 0x0
	.long	0
	.long	4096                            @ 0x1000
	.long	16                              @ 0x10
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.size	myTask02_attributes, 36

	.type	huart2,%object                  @ @huart2
	.bss
	.globl	huart2
	.p2align	2, 0x0
huart2:
	.zero	76
	.size	huart2, 76

	.type	myTask02Handle,%object          @ @myTask02Handle
	.globl	myTask02Handle
	.p2align	2, 0x0
myTask02Handle:
	.long	0
	.size	myTask02Handle, 4

	.type	myTask01Handle,%object          @ @myTask01Handle
	.globl	myTask01Handle
	.p2align	2, 0x0
myTask01Handle:
	.long	0
	.size	myTask01Handle, 4

	.type	.L.str.2,%object                @ @.str.2
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.2:
	.asciz	"idx : %d\r\n"
	.size	.L.str.2, 11

	.type	.L.str.3,%object                @ @.str.3
.L.str.3:
	.asciz	"C\r\n"
	.size	.L.str.3, 4

	.type	.L.str.4,%object                @ @.str.4
.L.str.4:
	.asciz	"B\r\n"
	.size	.L.str.4, 4

	.type	.L.str.5,%object                @ @.str.5
.L.str.5:
	.asciz	"A\r\n"
	.size	.L.str.5, 4

	.type	.L.str.6,%object                @ @.str.6
.L.str.6:
	.asciz	"Task %p idx : %d\r\n"
	.size	.L.str.6, 19

	.type	hi2c1,%object                   @ @hi2c1
	.bss
	.globl	hi2c1
	.p2align	2, 0x0
hi2c1:
	.zero	92
	.size	hi2c1, 92

	.type	hi2s3,%object                   @ @hi2s3
	.globl	hi2s3
	.p2align	2, 0x0
hi2s3:
	.zero	76
	.size	hi2s3, 76

	.type	hspi1,%object                   @ @hspi1
	.globl	hspi1
	.p2align	2, 0x0
hspi1:
	.zero	92
	.size	hspi1, 92

	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 924411f7435188d98a0c744016baf7a22cb5b036)"
	.section	".note.GNU-stack","",%progbits
