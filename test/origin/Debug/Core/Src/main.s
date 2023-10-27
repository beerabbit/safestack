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
	.globl	fir_filter_int                  @ -- Begin function fir_filter_int
	.p2align	2
	.type	fir_filter_int,%function
	.code	16                              @ @fir_filter_int
	.thumb_func
fir_filter_int:
	.fnstart
@ %bb.0:
	.pad	#56
	sub	sp, #56
	ldr.w	r12, [sp, #60]
	ldr.w	r12, [sp, #56]
	str	r0, [sp, #52]
	str	r1, [sp, #48]
	str	r2, [sp, #44]
	str	r3, [sp, #40]
	ldr	r0, [sp, #40]
	str	r0, [sp, #8]
	ldr	r0, [sp, #56]
	adds	r0, #1
	asrs	r0, r0, #1
	str	r0, [sp, #28]
	ldr	r0, [sp, #52]
	ldr	r1, [sp, #44]
	add.w	r0, r0, r1, lsl #2
	subs	r0, #4
	str	r0, [sp]
	ldr	r0, [sp, #52]
	ldr	r1, [sp, #28]
	add.w	r0, r0, r1, lsl #2
	subs	r0, #4
	str	r0, [sp, #16]
	ldr	r0, [sp, #28]
	str	r0, [sp, #24]
	movs	r0, #0
	str	r0, [sp, #36]
	b	.LBB0_1
.LBB0_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB0_3 Depth 2
	ldr	r0, [sp, #36]
	ldr	r1, [sp, #44]
	cmp	r0, r1
	bge	.LBB0_13
	b	.LBB0_2
.LBB0_2:                                @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp, #16]
	str	r0, [sp, #12]
	ldr	r0, [sp, #8]
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	adds	r1, r0, #4
	str	r1, [sp, #4]
	ldr	r0, [r0]
	ldr	r1, [sp, #12]
	subs	r2, r1, #4
	str	r2, [sp, #12]
	ldr	r1, [r1]
	muls	r0, r1, r0
	str	r0, [sp, #20]
	movs	r0, #1
	str	r0, [sp, #32]
	b	.LBB0_3
.LBB0_3:                                @   Parent Loop BB0_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [sp, #32]
	ldr	r1, [sp, #24]
	cmp	r0, r1
	bge	.LBB0_6
	b	.LBB0_4
.LBB0_4:                                @   in Loop: Header=BB0_3 Depth=2
	ldr	r0, [sp, #4]
	adds	r1, r0, #4
	str	r1, [sp, #4]
	ldr	r0, [r0]
	ldr	r1, [sp, #12]
	subs	r2, r1, #4
	str	r2, [sp, #12]
	ldr	r1, [r1]
	ldr	r2, [sp, #20]
	mla	r0, r0, r1, r2
	str	r0, [sp, #20]
	b	.LBB0_5
.LBB0_5:                                @   in Loop: Header=BB0_3 Depth=2
	ldr	r0, [sp, #32]
	adds	r0, #1
	str	r0, [sp, #32]
	b	.LBB0_3
.LBB0_6:                                @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp, #20]
	ldr	r1, [sp, #60]
	sdiv	r0, r0, r1
	ldr	r1, [sp, #48]
	adds	r2, r1, #4
	str	r2, [sp, #48]
	str	r0, [r1]
	ldr	r0, [sp, #16]
	ldr	r1, [sp]
	cmp	r0, r1
	bne	.LBB0_8
	b	.LBB0_7
.LBB0_7:                                @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp, #24]
	subs	r0, #1
	str	r0, [sp, #24]
	ldr	r0, [sp, #8]
	adds	r0, #4
	str	r0, [sp, #8]
	b	.LBB0_11
.LBB0_8:                                @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp, #24]
	ldr	r1, [sp, #56]
	cmp	r0, r1
	bge	.LBB0_10
	b	.LBB0_9
.LBB0_9:                                @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp, #24]
	adds	r0, #1
	str	r0, [sp, #24]
	b	.LBB0_10
.LBB0_10:                               @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp, #16]
	adds	r0, #4
	str	r0, [sp, #16]
	b	.LBB0_11
.LBB0_11:                               @   in Loop: Header=BB0_1 Depth=1
	b	.LBB0_12
.LBB0_12:                               @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp, #36]
	adds	r0, #1
	str	r0, [sp, #36]
	b	.LBB0_1
.LBB0_13:
	add	sp, #56
	bx	lr
.Lfunc_end0:
	.size	fir_filter_int, .Lfunc_end0-fir_filter_int
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	verify_benchmark                @ -- Begin function verify_benchmark
	.p2align	2
	.type	verify_benchmark,%function
	.code	16                              @ @verify_benchmark
	.thumb_func
verify_benchmark:
	.fnstart
@ %bb.0:
	.pad	#4
	sub	sp, #4
	str	r0, [sp]
	mov.w	r0, #-1
	add	sp, #4
	bx	lr
.Lfunc_end1:
	.size	verify_benchmark, .Lfunc_end1-verify_benchmark
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	initialise_benchmark            @ -- Begin function initialise_benchmark
	.p2align	2
	.type	initialise_benchmark,%function
	.code	16                              @ @initialise_benchmark
	.thumb_func
initialise_benchmark:
	.fnstart
@ %bb.0:
	bx	lr
.Lfunc_end2:
	.size	initialise_benchmark, .Lfunc_end2-initialise_benchmark
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	benchmark                       @ -- Begin function benchmark
	.p2align	2
	.type	benchmark,%function
	.code	16                              @ @benchmark
	.thumb_func
benchmark:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#2888
	subw	sp, sp, #2888
	movw	r0, #285
	str	r0, [sp, #4]
	movs	r0, #35
	str	r0, [sp]
	movw	r0, :lower16:in_data
	movt	r0, :upper16:in_data
	movw	r3, :lower16:fir_int
	movt	r3, :upper16:fir_int
	add	r1, sp, #8
	mov.w	r2, #700
	bl	fir_filter_int
	movs	r0, #0
	addw	sp, sp, #2888
	pop	{r7, pc}
.Lfunc_end3:
	.size	benchmark, .Lfunc_end3-benchmark
	.cantunwind
	.fnend
                                        @ -- End function
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
.Lfunc_end4:
	.size	__io_putchar, .Lfunc_end4-__io_putchar
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
	.pad	#16
	sub	sp, #16
	movs	r0, #0
	str	r0, [sp, #12]
	bl	HAL_Init
	bl	SystemClock_Config
	bl	MX_GPIO_Init
	bl	MX_I2C1_Init
	bl	MX_I2S3_Init
	bl	MX_SPI1_Init
	bl	MX_USB_HOST_Init
	bl	MX_USART2_UART_Init
	bl	HAL_GetTick
	str	r0, [sp, #8]
	bl	initialise_benchmark
	b	.LBB5_1
.LBB5_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_2 Depth 2
	bl	MX_USB_HOST_Process
	movs	r0, #0
	str	r0, [sp, #4]
	b	.LBB5_2
.LBB5_2:                                @   Parent Loop BB5_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [sp, #4]
	cmp.w	r0, #500
	bge	.LBB5_5
	b	.LBB5_3
.LBB5_3:                                @   in Loop: Header=BB5_2 Depth=2
	bl	benchmark
	b	.LBB5_4
.LBB5_4:                                @   in Loop: Header=BB5_2 Depth=2
	ldr	r0, [sp, #4]
	adds	r0, #1
	str	r0, [sp, #4]
	b	.LBB5_2
.LBB5_5:                                @   in Loop: Header=BB5_1 Depth=1
	bl	HAL_GetTick
	ldr	r1, [sp, #8]
	subs	r1, r0, r1
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	bl	printf
	bl	HAL_GetTick
	str	r0, [sp, #8]
	b	.LBB5_1
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
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
	b	.LBB6_1
.LBB6_1:
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
	b	.LBB6_2
.LBB6_2:
	b	.LBB6_3
.LBB6_3:
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
	b	.LBB6_4
.LBB6_4:
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
	cbz	r0, .LBB6_6
	b	.LBB6_5
.LBB6_5:
	bl	Error_Handler
	b	.LBB6_6
.LBB6_6:
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
	cbz	r0, .LBB6_8
	b	.LBB6_7
.LBB6_7:
	bl	Error_Handler
	b	.LBB6_8
.LBB6_8:
	add	sp, #80
	pop	{r7, pc}
.Lfunc_end6:
	.size	SystemClock_Config, .Lfunc_end6-SystemClock_Config
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
	b	.LBB7_1
.LBB7_1:
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
	b	.LBB7_2
.LBB7_2:
	b	.LBB7_3
.LBB7_3:
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
	b	.LBB7_4
.LBB7_4:
	b	.LBB7_5
.LBB7_5:
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
	b	.LBB7_6
.LBB7_6:
	b	.LBB7_7
.LBB7_7:
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
	b	.LBB7_8
.LBB7_8:
	b	.LBB7_9
.LBB7_9:
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
	b	.LBB7_10
.LBB7_10:
	b	.LBB7_11
.LBB7_11:
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
	b	.LBB7_12
.LBB7_12:
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
.Lfunc_end7:
	.size	MX_GPIO_Init, .Lfunc_end7-MX_GPIO_Init
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
	cbz	r0, .LBB8_2
	b	.LBB8_1
.LBB8_1:
	bl	Error_Handler
	b	.LBB8_2
.LBB8_2:
	pop	{r7, pc}
.Lfunc_end8:
	.size	MX_I2C1_Init, .Lfunc_end8-MX_I2C1_Init
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
	cbz	r0, .LBB9_2
	b	.LBB9_1
.LBB9_1:
	bl	Error_Handler
	b	.LBB9_2
.LBB9_2:
	pop	{r7, pc}
.Lfunc_end9:
	.size	MX_I2S3_Init, .Lfunc_end9-MX_I2S3_Init
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
	cbz	r0, .LBB10_2
	b	.LBB10_1
.LBB10_1:
	bl	Error_Handler
	b	.LBB10_2
.LBB10_2:
	pop	{r7, pc}
.Lfunc_end10:
	.size	MX_SPI1_Init, .Lfunc_end10-MX_SPI1_Init
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
	cbz	r0, .LBB11_2
	b	.LBB11_1
.LBB11_1:
	bl	Error_Handler
	b	.LBB11_2
.LBB11_2:
	pop	{r7, pc}
.Lfunc_end11:
	.size	MX_USART2_UART_Init, .Lfunc_end11-MX_USART2_UART_Init
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
	b	.LBB12_1
.LBB12_1:                               @ =>This Inner Loop Header: Depth=1
	b	.LBB12_1
.Lfunc_end12:
	.size	Error_Handler, .Lfunc_end12-Error_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.type	fir_int,%object                 @ @fir_int
	.section	.rodata,"a",%progbits
	.globl	fir_int
	.p2align	2, 0x0
fir_int:
	.long	4294967294                      @ 0xfffffffe
	.long	1                               @ 0x1
	.long	4                               @ 0x4
	.long	3                               @ 0x3
	.long	4294967294                      @ 0xfffffffe
	.long	4294967292                      @ 0xfffffffc
	.long	2                               @ 0x2
	.long	7                               @ 0x7
	.long	0                               @ 0x0
	.long	4294967287                      @ 0xfffffff7
	.long	4294967292                      @ 0xfffffffc
	.long	12                              @ 0xc
	.long	11                              @ 0xb
	.long	4294967282                      @ 0xfffffff2
	.long	4294967270                      @ 0xffffffe6
	.long	15                              @ 0xf
	.long	89                              @ 0x59
	.long	127                             @ 0x7f
	.long	89                              @ 0x59
	.long	15                              @ 0xf
	.long	4294967270                      @ 0xffffffe6
	.long	4294967282                      @ 0xfffffff2
	.long	11                              @ 0xb
	.long	12                              @ 0xc
	.long	4294967292                      @ 0xfffffffc
	.long	4294967287                      @ 0xfffffff7
	.long	0                               @ 0x0
	.long	7                               @ 0x7
	.long	2                               @ 0x2
	.long	4294967292                      @ 0xfffffffc
	.long	4294967294                      @ 0xfffffffe
	.long	3                               @ 0x3
	.long	4                               @ 0x4
	.long	1                               @ 0x1
	.long	4294967294                      @ 0xfffffffe
	.long	0                               @ 0x0
	.size	fir_int, 144

	.type	in_data,%object                 @ @in_data
	.globl	in_data
	.p2align	2, 0x0
in_data:
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	121                             @ 0x79
	.long	114                             @ 0x72
	.long	121                             @ 0x79
	.long	13                              @ 0xd
	.long	13                              @ 0xd
	.long	0                               @ 0x0
	.long	3                               @ 0x3
	.long	5                               @ 0x5
	.long	2                               @ 0x2
	.long	3                               @ 0x3
	.long	127                             @ 0x7f
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	126                             @ 0x7e
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	126                             @ 0x7e
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	127                             @ 0x7f
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	125                             @ 0x7d
	.long	123                             @ 0x7b
	.long	115                             @ 0x73
	.long	106                             @ 0x6a
	.long	119                             @ 0x77
	.long	16                              @ 0x10
	.long	14                              @ 0xe
	.long	1                               @ 0x1
	.long	5                               @ 0x5
	.long	5                               @ 0x5
	.long	5                               @ 0x5
	.long	5                               @ 0x5
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	1                               @ 0x1
	.long	126                             @ 0x7e
	.long	127                             @ 0x7f
	.long	3                               @ 0x3
	.long	124                             @ 0x7c
	.long	126                             @ 0x7e
	.long	6                               @ 0x6
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	3                               @ 0x3
	.long	2                               @ 0x2
	.long	127                             @ 0x7f
	.long	126                             @ 0x7e
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	127                             @ 0x7f
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	126                             @ 0x7e
	.long	0                               @ 0x0
	.long	3                               @ 0x3
	.long	127                             @ 0x7f
	.long	125                             @ 0x7d
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	5                               @ 0x5
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	126                             @ 0x7e
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	0                               @ 0x0
	.long	5                               @ 0x5
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	1                               @ 0x1
	.long	3                               @ 0x3
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	2                               @ 0x2
	.long	3                               @ 0x3
	.long	126                             @ 0x7e
	.long	125                             @ 0x7d
	.long	114                             @ 0x72
	.long	104                             @ 0x68
	.long	113                             @ 0x71
	.long	5                               @ 0x5
	.long	12                              @ 0xc
	.long	7                               @ 0x7
	.long	2                               @ 0x2
	.long	6                               @ 0x6
	.long	13                              @ 0xd
	.long	5                               @ 0x5
	.long	125                             @ 0x7d
	.long	3                               @ 0x3
	.long	2                               @ 0x2
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	121                             @ 0x79
	.long	122                             @ 0x7a
	.long	3                               @ 0x3
	.long	126                             @ 0x7e
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	125                             @ 0x7d
	.long	8                               @ 0x8
	.long	3                               @ 0x3
	.long	124                             @ 0x7c
	.long	6                               @ 0x6
	.long	0                               @ 0x0
	.long	122                             @ 0x7a
	.long	6                               @ 0x6
	.long	2                               @ 0x2
	.long	124                             @ 0x7c
	.long	3                               @ 0x3
	.long	126                             @ 0x7e
	.long	121                             @ 0x79
	.long	6                               @ 0x6
	.long	5                               @ 0x5
	.long	116                             @ 0x74
	.long	127                             @ 0x7f
	.long	13                              @ 0xd
	.long	122                             @ 0x7a
	.long	120                             @ 0x78
	.long	6                               @ 0x6
	.long	5                               @ 0x5
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	1                               @ 0x1
	.long	4                               @ 0x4
	.long	124                             @ 0x7c
	.long	127                             @ 0x7f
	.long	3                               @ 0x3
	.long	127                             @ 0x7f
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	122                             @ 0x7a
	.long	6                               @ 0x6
	.long	10                              @ 0xa
	.long	118                             @ 0x76
	.long	124                             @ 0x7c
	.long	10                              @ 0xa
	.long	124                             @ 0x7c
	.long	127                             @ 0x7f
	.long	6                               @ 0x6
	.long	121                             @ 0x79
	.long	3                               @ 0x3
	.long	12                              @ 0xc
	.long	117                             @ 0x75
	.long	120                             @ 0x78
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	121                             @ 0x79
	.long	3                               @ 0x3
	.long	126                             @ 0x7e
	.long	124                             @ 0x7c
	.long	6                               @ 0x6
	.long	0                               @ 0x0
	.long	121                             @ 0x79
	.long	2                               @ 0x2
	.long	126                             @ 0x7e
	.long	127                             @ 0x7f
	.long	6                               @ 0x6
	.long	118                             @ 0x76
	.long	127                             @ 0x7f
	.long	13                              @ 0xd
	.long	121                             @ 0x79
	.long	127                             @ 0x7f
	.long	6                               @ 0x6
	.long	121                             @ 0x79
	.long	6                               @ 0x6
	.long	3                               @ 0x3
	.long	113                             @ 0x71
	.long	6                               @ 0x6
	.long	10                              @ 0xa
	.long	115                             @ 0x73
	.long	127                             @ 0x7f
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	122                             @ 0x7a
	.long	124                             @ 0x7c
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	117                             @ 0x75
	.long	127                             @ 0x7f
	.long	12                              @ 0xc
	.long	10                              @ 0xa
	.long	124                             @ 0x7c
	.long	121                             @ 0x79
	.long	9                               @ 0x9
	.long	13                              @ 0xd
	.long	125                             @ 0x7d
	.long	122                             @ 0x7a
	.long	5                               @ 0x5
	.long	11                              @ 0xb
	.long	10                              @ 0xa
	.long	121                             @ 0x79
	.long	124                             @ 0x7c
	.long	22                              @ 0x16
	.long	3                               @ 0x3
	.long	114                             @ 0x72
	.long	13                              @ 0xd
	.long	7                               @ 0x7
	.long	121                             @ 0x79
	.long	12                              @ 0xc
	.long	7                               @ 0x7
	.long	122                             @ 0x7a
	.long	11                              @ 0xb
	.long	7                               @ 0x7
	.long	122                             @ 0x7a
	.long	10                              @ 0xa
	.long	7                               @ 0x7
	.long	121                             @ 0x79
	.long	10                              @ 0xa
	.long	5                               @ 0x5
	.long	117                             @ 0x75
	.long	6                               @ 0x6
	.long	5                               @ 0x5
	.long	121                             @ 0x79
	.long	5                               @ 0x5
	.long	6                               @ 0x6
	.long	1                               @ 0x1
	.long	6                               @ 0x6
	.long	0                               @ 0x0
	.long	122                             @ 0x7a
	.long	2                               @ 0x2
	.long	7                               @ 0x7
	.long	3                               @ 0x3
	.long	125                             @ 0x7d
	.long	1                               @ 0x1
	.long	10                              @ 0xa
	.long	7                               @ 0x7
	.long	2                               @ 0x2
	.long	127                             @ 0x7f
	.long	127                             @ 0x7f
	.long	9                               @ 0x9
	.long	7                               @ 0x7
	.long	121                             @ 0x79
	.long	121                             @ 0x79
	.long	6                               @ 0x6
	.long	8                               @ 0x8
	.long	125                             @ 0x7d
	.long	122                             @ 0x7a
	.long	6                               @ 0x6
	.long	12                              @ 0xc
	.long	6                               @ 0x6
	.long	125                             @ 0x7d
	.long	127                             @ 0x7f
	.long	13                              @ 0xd
	.long	7                               @ 0x7
	.long	121                             @ 0x79
	.long	1                               @ 0x1
	.long	6                               @ 0x6
	.long	127                             @ 0x7f
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	126                             @ 0x7e
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	125                             @ 0x7d
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	6                               @ 0x6
	.long	3                               @ 0x3
	.long	125                             @ 0x7d
	.long	5                               @ 0x5
	.long	7                               @ 0x7
	.long	127                             @ 0x7f
	.long	124                             @ 0x7c
	.long	1                               @ 0x1
	.long	6                               @ 0x6
	.long	6                               @ 0x6
	.long	124                             @ 0x7c
	.long	122                             @ 0x7a
	.long	7                               @ 0x7
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	120                             @ 0x78
	.long	1                               @ 0x1
	.long	8                               @ 0x8
	.long	0                               @ 0x0
	.long	121                             @ 0x79
	.long	122                             @ 0x7a
	.long	4                               @ 0x4
	.long	10                              @ 0xa
	.long	0                               @ 0x0
	.long	120                             @ 0x78
	.long	1                               @ 0x1
	.long	6                               @ 0x6
	.long	122                             @ 0x7a
	.long	117                             @ 0x75
	.long	122                             @ 0x7a
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	121                             @ 0x79
	.long	118                             @ 0x76
	.long	127                             @ 0x7f
	.long	7                               @ 0x7
	.long	0                               @ 0x0
	.long	122                             @ 0x7a
	.long	125                             @ 0x7d
	.long	2                               @ 0x2
	.long	4                               @ 0x4
	.long	124                             @ 0x7c
	.long	122                             @ 0x7a
	.long	2                               @ 0x2
	.long	5                               @ 0x5
	.long	124                             @ 0x7c
	.long	122                             @ 0x7a
	.long	125                             @ 0x7d
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	120                             @ 0x78
	.long	117                             @ 0x75
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	121                             @ 0x79
	.long	120                             @ 0x78
	.long	121                             @ 0x79
	.long	1                               @ 0x1
	.long	3                               @ 0x3
	.long	121                             @ 0x79
	.long	121                             @ 0x79
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	127                             @ 0x7f
	.long	121                             @ 0x79
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	122                             @ 0x7a
	.long	124                             @ 0x7c
	.long	125                             @ 0x7d
	.long	124                             @ 0x7c
	.long	127                             @ 0x7f
	.long	125                             @ 0x7d
	.long	121                             @ 0x79
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	121                             @ 0x79
	.long	122                             @ 0x7a
	.long	124                             @ 0x7c
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	126                             @ 0x7e
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	3                               @ 0x3
	.long	3                               @ 0x3
	.long	125                             @ 0x7d
	.long	1                               @ 0x1
	.long	5                               @ 0x5
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	125                             @ 0x7d
	.long	127                             @ 0x7f
	.long	3                               @ 0x3
	.long	125                             @ 0x7d
	.long	121                             @ 0x79
	.long	1                               @ 0x1
	.long	2                               @ 0x2
	.long	125                             @ 0x7d
	.long	127                             @ 0x7f
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	127                             @ 0x7f
	.long	126                             @ 0x7e
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	124                             @ 0x7c
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	121                             @ 0x79
	.long	120                             @ 0x78
	.long	124                             @ 0x7c
	.long	124                             @ 0x7c
	.long	123                             @ 0x7b
	.long	123                             @ 0x7b
	.long	125                             @ 0x7d
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	1                               @ 0x1
	.long	2                               @ 0x2
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	126                             @ 0x7e
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	2                               @ 0x2
	.long	6                               @ 0x6
	.long	5                               @ 0x5
	.long	3                               @ 0x3
	.long	6                               @ 0x6
	.long	8                               @ 0x8
	.long	5                               @ 0x5
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	3                               @ 0x3
	.long	0                               @ 0x0
	.long	125                             @ 0x7d
	.long	127                             @ 0x7f
	.long	0                               @ 0x0
	.long	127                             @ 0x7f
	.long	126                             @ 0x7e
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	3                               @ 0x3
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.long	2                               @ 0x2
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	124                             @ 0x7c
	.long	125                             @ 0x7d
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	124                             @ 0x7c
	.long	127                             @ 0x7f
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	124                             @ 0x7c
	.long	127                             @ 0x7f
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	126                             @ 0x7e
	.long	127                             @ 0x7f
	.long	2                               @ 0x2
	.long	3                               @ 0x3
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	4                               @ 0x4
	.long	6                               @ 0x6
	.long	5                               @ 0x5
	.long	6                               @ 0x6
	.long	7                               @ 0x7
	.long	10                              @ 0xa
	.long	10                              @ 0xa
	.long	4                               @ 0x4
	.long	2                               @ 0x2
	.long	5                               @ 0x5
	.long	8                               @ 0x8
	.long	9                               @ 0x9
	.long	8                               @ 0x8
	.long	7                               @ 0x7
	.long	12                              @ 0xc
	.long	20                              @ 0x14
	.long	20                              @ 0x14
	.long	16                              @ 0x10
	.long	14                              @ 0xe
	.long	20                              @ 0x14
	.long	21                              @ 0x15
	.long	15                              @ 0xf
	.long	9                               @ 0x9
	.long	7                               @ 0x7
	.long	4                               @ 0x4
	.long	126                             @ 0x7e
	.long	118                             @ 0x76
	.long	100                             @ 0x64
	.long	65                              @ 0x41
	.long	72                              @ 0x48
	.long	125                             @ 0x7d
	.long	108                             @ 0x6c
	.long	61                              @ 0x3d
	.long	103                             @ 0x67
	.long	16                              @ 0x10
	.long	6                               @ 0x6
	.long	125                             @ 0x7d
	.long	117                             @ 0x75
	.long	7                               @ 0x7
	.long	29                              @ 0x1d
	.long	0                               @ 0x0
	.long	108                             @ 0x6c
	.long	2                               @ 0x2
	.long	125                             @ 0x7d
	.long	120                             @ 0x78
	.long	119                             @ 0x77
	.long	111                             @ 0x6f
	.long	119                             @ 0x77
	.long	1                               @ 0x1
	.long	0                               @ 0x0
	.long	2                               @ 0x2
	.long	7                               @ 0x7
	.long	10                              @ 0xa
	.long	28                              @ 0x1c
	.long	28                              @ 0x1c
	.long	23                              @ 0x17
	.long	35                              @ 0x23
	.long	47                              @ 0x2f
	.long	65                              @ 0x41
	.long	67                              @ 0x43
	.long	79                              @ 0x4f
	.long	85                              @ 0x55
	.long	88                              @ 0x58
	.long	126                             @ 0x7e
	.long	2                               @ 0x2
	.long	76                              @ 0x4c
	.long	16                              @ 0x10
	.long	105                             @ 0x69
	.long	44                              @ 0x2c
	.long	13                              @ 0xd
	.long	116                             @ 0x74
	.long	42                              @ 0x2a
	.long	116                             @ 0x74
	.long	99                              @ 0x63
	.long	41                              @ 0x29
	.long	124                             @ 0x7c
	.long	94                              @ 0x5e
	.long	33                              @ 0x21
	.long	53                              @ 0x35
	.long	70                              @ 0x46
	.long	36                              @ 0x24
	.long	103                             @ 0x67
	.long	53                              @ 0x35
	.long	60                              @ 0x3c
	.long	60                              @ 0x3c
	.long	38                              @ 0x26
	.long	38                              @ 0x26
	.long	47                              @ 0x2f
	.long	71                              @ 0x47
	.long	100                             @ 0x64
	.long	4                               @ 0x4
	.long	19                              @ 0x13
	.long	24                              @ 0x18
	.long	39                              @ 0x27
	.long	43                              @ 0x2b
	.long	48                              @ 0x30
	.long	27                              @ 0x1b
	.long	127                             @ 0x7f
	.long	120                             @ 0x78
	.long	114                             @ 0x72
	.long	104                             @ 0x68
	.long	92                              @ 0x5c
	.long	90                              @ 0x5a
	.long	104                             @ 0x68
	.long	124                             @ 0x7c
	.long	3                               @ 0x3
	.long	13                              @ 0xd
	.long	38                              @ 0x26
	.long	65                              @ 0x41
	.long	81                              @ 0x51
	.long	90                              @ 0x5a
	.long	106                             @ 0x6a
	.long	108                             @ 0x6c
	.long	84                              @ 0x54
	.long	120                             @ 0x78
	.long	9                               @ 0x9
	.long	69                              @ 0x45
	.long	121                             @ 0x79
	.long	31                              @ 0x1f
	.long	11                              @ 0xb
	.long	46                              @ 0x2e
	.long	96                              @ 0x60
	.long	11                              @ 0xb
	.long	102                             @ 0x66
	.long	127                             @ 0x7f
	.long	104                             @ 0x68
	.long	119                             @ 0x77
	.long	78                              @ 0x4e
	.long	70                              @ 0x46
	.long	74                              @ 0x4a
	.long	59                              @ 0x3b
	.long	18                              @ 0x12
	.long	91                              @ 0x5b
	.long	55                              @ 0x37
	.long	49                              @ 0x31
	.long	33                              @ 0x21
	.long	11                              @ 0xb
	.long	18                              @ 0x12
	.long	46                              @ 0x2e
	.long	87                              @ 0x57
	.long	126                             @ 0x7e
	.long	25                              @ 0x19
	.long	34                              @ 0x22
	.long	43                              @ 0x2b
	.long	63                              @ 0x3f
	.long	58                              @ 0x3a
	.long	37                              @ 0x25
	.long	11                              @ 0xb
	.long	121                             @ 0x79
	.long	113                             @ 0x71
	.long	104                             @ 0x68
	.long	97                              @ 0x61
	.long	92                              @ 0x5c
	.long	102                             @ 0x66
	.long	114                             @ 0x72
	.long	6                               @ 0x6
	.long	22                              @ 0x16
	.long	41                              @ 0x29
	.long	65                              @ 0x41
	.long	94                              @ 0x5e
	.long	109                             @ 0x6d
	.long	102                             @ 0x66
	.long	96                              @ 0x60
	.long	110                             @ 0x6e
	.long	23                              @ 0x17
	.long	72                              @ 0x48
	.long	54                              @ 0x36
	.long	18                              @ 0x12
	.long	23                              @ 0x17
	.long	47                              @ 0x2f
	.long	99                              @ 0x63
	.long	120                             @ 0x78
	.long	92                              @ 0x5c
	.long	119                             @ 0x77
	.long	108                             @ 0x6c
	.long	117                             @ 0x75
	.long	65                              @ 0x41
	.long	73                              @ 0x49
	.long	79                              @ 0x4f
	.long	59                              @ 0x3b
	.long	11                              @ 0xb
	.long	84                              @ 0x54
	.long	55                              @ 0x37
	.long	0                               @ 0x0
	.size	in_data, 2804

	.type	out_data,%object                @ @out_data
	.data
	.globl	out_data
	.p2align	2, 0x0
out_data:
	.long	3                               @ 0x3
	.long	4294967290                      @ 0xfffffffa
	.long	4294967293                      @ 0xfffffffd
	.long	29                              @ 0x1d
	.long	88                              @ 0x58
	.long	137                             @ 0x89
	.long	135                             @ 0x87
	.long	86                              @ 0x56
	.long	32                              @ 0x20
	.long	7                               @ 0x7
	.long	7                               @ 0x7
	.long	4                               @ 0x4
	.long	4294967289                      @ 0xfffffff9
	.long	0                               @ 0x0
	.long	40                              @ 0x28
	.long	91                              @ 0x5b
	.long	107                             @ 0x6b
	.long	79                              @ 0x4f
	.long	43                              @ 0x2b
	.long	33                              @ 0x21
	.long	45                              @ 0x2d
	.long	48                              @ 0x30
	.long	39                              @ 0x27
	.long	39                              @ 0x27
	.long	55                              @ 0x37
	.long	71                              @ 0x47
	.long	66                              @ 0x42
	.long	39                              @ 0x27
	.long	8                               @ 0x8
	.long	4294967284                      @ 0xfffffff4
	.long	4294967285                      @ 0xfffffff5
	.long	13                              @ 0xd
	.long	46                              @ 0x2e
	.long	59                              @ 0x3b
	.long	37                              @ 0x25
	.long	0                               @ 0x0
	.long	4294967288                      @ 0xfffffff8
	.long	29                              @ 0x1d
	.long	89                              @ 0x59
	.long	131                             @ 0x83
	.long	135                             @ 0x87
	.long	111                             @ 0x6f
	.long	78                              @ 0x4e
	.long	47                              @ 0x2f
	.long	18                              @ 0x12
	.long	4294967295                      @ 0xffffffff
	.long	4294967291                      @ 0xfffffffb
	.long	4                               @ 0x4
	.long	21                              @ 0x15
	.long	35                              @ 0x23
	.long	45                              @ 0x2d
	.long	49                              @ 0x31
	.long	47                              @ 0x2f
	.long	41                              @ 0x29
	.long	38                              @ 0x26
	.long	42                              @ 0x2a
	.long	54                              @ 0x36
	.long	72                              @ 0x48
	.long	88                              @ 0x58
	.long	95                              @ 0x5f
	.long	90                              @ 0x5a
	.long	79                              @ 0x4f
	.long	70                              @ 0x46
	.long	65                              @ 0x41
	.long	50                              @ 0x32
	.long	27                              @ 0x1b
	.long	23                              @ 0x17
	.long	55                              @ 0x37
	.long	105                             @ 0x69
	.long	123                             @ 0x7b
	.long	89                              @ 0x59
	.long	47                              @ 0x2f
	.long	36                              @ 0x24
	.long	48                              @ 0x30
	.long	42                              @ 0x2a
	.long	8                               @ 0x8
	.long	4294967286                      @ 0xfffffff6
	.long	7                               @ 0x7
	.long	36                              @ 0x24
	.long	49                              @ 0x31
	.long	47                              @ 0x2f
	.long	51                              @ 0x33
	.long	50                              @ 0x32
	.long	30                              @ 0x1e
	.long	4                               @ 0x4
	.long	7                               @ 0x7
	.long	35                              @ 0x23
	.long	51                              @ 0x33
	.long	33                              @ 0x21
	.long	14                              @ 0xe
	.long	30                              @ 0x1e
	.long	74                              @ 0x4a
	.long	97                              @ 0x61
	.long	75                              @ 0x4b
	.long	33                              @ 0x21
	.long	14                              @ 0xe
	.long	34                              @ 0x22
	.long	73                              @ 0x49
	.long	94                              @ 0x5e
	.long	77                              @ 0x4d
	.long	37                              @ 0x25
	.long	11                              @ 0xb
	.long	24                              @ 0x18
	.long	50                              @ 0x32
	.long	51                              @ 0x33
	.long	21                              @ 0x15
	.long	5                               @ 0x5
	.long	41                              @ 0x29
	.long	100                             @ 0x64
	.long	118                             @ 0x76
	.long	77                              @ 0x4d
	.long	22                              @ 0x16
	.long	9                               @ 0x9
	.long	38                              @ 0x26
	.long	55                              @ 0x37
	.long	35                              @ 0x23
	.long	11                              @ 0xb
	.long	21                              @ 0x15
	.long	60                              @ 0x3c
	.long	82                              @ 0x52
	.long	64                              @ 0x40
	.long	35                              @ 0x23
	.long	29                              @ 0x1d
	.long	45                              @ 0x2d
	.long	54                              @ 0x36
	.long	45                              @ 0x2d
	.long	36                              @ 0x24
	.long	41                              @ 0x29
	.long	50                              @ 0x32
	.long	44                              @ 0x2c
	.long	33                              @ 0x21
	.long	43                              @ 0x2b
	.long	80                              @ 0x50
	.long	123                             @ 0x7b
	.long	141                             @ 0x8d
	.long	115                             @ 0x73
	.long	71                              @ 0x47
	.long	34                              @ 0x22
	.long	15                              @ 0xf
	.long	7                               @ 0x7
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.long	19                              @ 0x13
	.long	45                              @ 0x2d
	.long	54                              @ 0x36
	.long	43                              @ 0x2b
	.long	35                              @ 0x23
	.long	50                              @ 0x32
	.long	78                              @ 0x4e
	.long	92                              @ 0x5c
	.long	85                              @ 0x55
	.long	79                              @ 0x4f
	.long	85                              @ 0x55
	.long	92                              @ 0x5c
	.long	80                              @ 0x50
	.long	52                              @ 0x34
	.long	32                              @ 0x20
	.long	34                              @ 0x22
	.long	50                              @ 0x32
	.long	56                              @ 0x38
	.long	47                              @ 0x2f
	.long	37                              @ 0x25
	.long	42                              @ 0x2a
	.long	53                              @ 0x35
	.long	50                              @ 0x32
	.long	35                              @ 0x23
	.long	31                              @ 0x1f
	.long	54                              @ 0x36
	.long	87                              @ 0x57
	.long	96                              @ 0x60
	.long	76                              @ 0x4c
	.long	49                              @ 0x31
	.long	45                              @ 0x2d
	.long	64                              @ 0x40
	.long	87                              @ 0x57
	.long	103                             @ 0x67
	.long	103                             @ 0x67
	.long	76                              @ 0x4c
	.long	33                              @ 0x21
	.long	4                               @ 0x4
	.long	8                               @ 0x8
	.long	32                              @ 0x20
	.long	48                              @ 0x30
	.long	44                              @ 0x2c
	.long	51                              @ 0x33
	.long	78                              @ 0x4e
	.long	97                              @ 0x61
	.long	86                              @ 0x56
	.long	57                              @ 0x39
	.long	38                              @ 0x26
	.long	38                              @ 0x26
	.long	43                              @ 0x2b
	.long	46                              @ 0x2e
	.long	56                              @ 0x38
	.long	74                              @ 0x4a
	.long	87                              @ 0x57
	.long	88                              @ 0x58
	.long	92                              @ 0x5c
	.long	95                              @ 0x5f
	.long	80                              @ 0x50
	.long	49                              @ 0x31
	.long	29                              @ 0x1d
	.long	49                              @ 0x31
	.long	88                              @ 0x58
	.long	93                              @ 0x5d
	.long	55                              @ 0x37
	.long	22                              @ 0x16
	.long	35                              @ 0x23
	.long	85                              @ 0x55
	.long	113                             @ 0x71
	.long	86                              @ 0x56
	.long	40                              @ 0x28
	.long	24                              @ 0x18
	.long	48                              @ 0x30
	.long	81                              @ 0x51
	.long	96                              @ 0x60
	.long	92                              @ 0x5c
	.long	82                              @ 0x52
	.long	79                              @ 0x4f
	.long	84                              @ 0x54
	.long	94                              @ 0x5e
	.long	98                              @ 0x62
	.long	87                              @ 0x57
	.long	69                              @ 0x45
	.long	58                              @ 0x3a
	.long	53                              @ 0x35
	.long	38                              @ 0x26
	.long	23                              @ 0x17
	.long	35                              @ 0x23
	.long	71                              @ 0x47
	.long	93                              @ 0x5d
	.long	72                              @ 0x48
	.long	39                              @ 0x27
	.long	48                              @ 0x30
	.long	97                              @ 0x61
	.long	121                             @ 0x79
	.long	90                              @ 0x5a
	.long	49                              @ 0x31
	.long	45                              @ 0x2d
	.long	69                              @ 0x45
	.long	79                              @ 0x4f
	.long	65                              @ 0x41
	.long	62                              @ 0x3e
	.long	72                              @ 0x48
	.long	72                              @ 0x48
	.long	58                              @ 0x3a
	.long	61                              @ 0x3d
	.long	83                              @ 0x53
	.long	85                              @ 0x55
	.long	47                              @ 0x2f
	.long	13                              @ 0xd
	.long	31                              @ 0x1f
	.long	85                              @ 0x55
	.long	105                             @ 0x69
	.long	71                              @ 0x47
	.long	30                              @ 0x1e
	.long	28                              @ 0x1c
	.long	50                              @ 0x32
	.long	60                              @ 0x3c
	.long	49                              @ 0x31
	.long	40                              @ 0x28
	.long	45                              @ 0x2d
	.long	52                              @ 0x34
	.long	50                              @ 0x32
	.long	46                              @ 0x2e
	.long	46                              @ 0x2e
	.long	47                              @ 0x2f
	.long	45                              @ 0x2d
	.long	47                              @ 0x2f
	.long	50                              @ 0x32
	.long	47                              @ 0x2f
	.long	38                              @ 0x26
	.long	35                              @ 0x23
	.long	48                              @ 0x30
	.long	61                              @ 0x3d
	.long	44                              @ 0x2c
	.long	3                               @ 0x3
	.long	4294967279                      @ 0xffffffef
	.long	10                              @ 0xa
	.long	52                              @ 0x34
	.long	57                              @ 0x39
	.long	24                              @ 0x18
	.long	10                              @ 0xa
	.long	40                              @ 0x28
	.long	66                              @ 0x42
	.long	40                              @ 0x28
	.long	4294967291                      @ 0xfffffffb
	.long	4294967294                      @ 0xfffffffe
	.long	55                              @ 0x37
	.long	97                              @ 0x61
	.long	83                              @ 0x53
	.long	50                              @ 0x32
	.long	53                              @ 0x35
	.long	75                              @ 0x4b
	.long	76                              @ 0x4c
	.long	54                              @ 0x36
	.long	54                              @ 0x36
	.long	78                              @ 0x4e
	.long	86                              @ 0x56
	.long	51                              @ 0x33
	.long	14                              @ 0xe
	.long	27                              @ 0x1b
	.long	78                              @ 0x4e
	.long	105                             @ 0x69
	.long	81                              @ 0x51
	.long	34                              @ 0x22
	.long	13                              @ 0xd
	.long	36                              @ 0x24
	.long	75                              @ 0x4b
	.long	94                              @ 0x5e
	.long	77                              @ 0x4d
	.long	42                              @ 0x2a
	.long	18                              @ 0x12
	.long	22                              @ 0x16
	.long	41                              @ 0x29
	.long	53                              @ 0x35
	.long	51                              @ 0x33
	.long	42                              @ 0x2a
	.long	37                              @ 0x25
	.long	38                              @ 0x26
	.long	47                              @ 0x2f
	.long	56                              @ 0x38
	.long	49                              @ 0x31
	.long	29                              @ 0x1d
	.long	29                              @ 0x1d
	.long	66                              @ 0x42
	.long	104                             @ 0x68
	.long	88                              @ 0x58
	.long	26                              @ 0x1a
	.long	4294967295                      @ 0xffffffff
	.long	42                              @ 0x2a
	.long	99                              @ 0x63
	.long	95                              @ 0x5f
	.long	39                              @ 0x27
	.long	10                              @ 0xa
	.long	34                              @ 0x22
	.long	52                              @ 0x34
	.long	30                              @ 0x1e
	.long	11                              @ 0xb
	.long	39                              @ 0x27
	.long	88                              @ 0x58
	.long	90                              @ 0x5a
	.long	46                              @ 0x2e
	.long	16                              @ 0x10
	.long	27                              @ 0x1b
	.long	40                              @ 0x28
	.long	35                              @ 0x23
	.long	49                              @ 0x31
	.long	96                              @ 0x60
	.long	124                             @ 0x7c
	.long	86                              @ 0x56
	.long	27                              @ 0x1b
	.long	29                              @ 0x1d
	.long	93                              @ 0x5d
	.long	129                             @ 0x81
	.long	92                              @ 0x5c
	.long	41                              @ 0x29
	.long	44                              @ 0x2c
	.long	78                              @ 0x4e
	.long	81                              @ 0x51
	.long	53                              @ 0x35
	.long	51                              @ 0x33
	.long	77                              @ 0x4d
	.long	83                              @ 0x53
	.long	50                              @ 0x32
	.long	36                              @ 0x24
	.long	80                              @ 0x50
	.long	134                             @ 0x86
	.long	133                             @ 0x85
	.long	90                              @ 0x5a
	.long	70                              @ 0x46
	.long	93                              @ 0x5d
	.long	107                             @ 0x6b
	.long	91                              @ 0x5b
	.long	79                              @ 0x4f
	.long	99                              @ 0x63
	.long	113                             @ 0x71
	.long	84                              @ 0x54
	.long	42                              @ 0x2a
	.long	44                              @ 0x2c
	.long	80                              @ 0x50
	.long	86                              @ 0x56
	.long	48                              @ 0x30
	.long	30                              @ 0x1e
	.long	77                              @ 0x4d
	.long	141                             @ 0x8d
	.long	144                             @ 0x90
	.long	91                              @ 0x5b
	.long	58                              @ 0x3a
	.long	85                              @ 0x55
	.long	128                             @ 0x80
	.long	137                             @ 0x89
	.long	120                             @ 0x78
	.long	123                             @ 0x7b
	.long	138                             @ 0x8a
	.long	125                             @ 0x7d
	.long	83                              @ 0x53
	.long	62                              @ 0x3e
	.long	91                              @ 0x5b
	.long	131                             @ 0x83
	.long	127                             @ 0x7f
	.long	89                              @ 0x59
	.long	74                              @ 0x4a
	.long	91                              @ 0x5b
	.long	94                              @ 0x5e
	.long	46                              @ 0x2e
	.long	4294967284                      @ 0xfffffff4
	.long	4294967283                      @ 0xfffffff3
	.long	45                              @ 0x2d
	.long	95                              @ 0x5f
	.long	97                              @ 0x61
	.long	80                              @ 0x50
	.long	84                              @ 0x54
	.long	94                              @ 0x5e
	.long	80                              @ 0x50
	.long	48                              @ 0x30
	.long	38                              @ 0x26
	.long	52                              @ 0x34
	.long	50                              @ 0x32
	.long	24                              @ 0x18
	.long	9                               @ 0x9
	.long	39                              @ 0x27
	.long	91                              @ 0x5b
	.long	116                             @ 0x74
	.long	109                             @ 0x6d
	.long	94                              @ 0x5e
	.long	82                              @ 0x52
	.long	64                              @ 0x40
	.long	45                              @ 0x2d
	.long	52                              @ 0x34
	.long	84                              @ 0x54
	.long	92                              @ 0x5c
	.long	49                              @ 0x31
	.long	0                               @ 0x0
	.long	10                              @ 0xa
	.long	86                              @ 0x56
	.long	156                             @ 0x9c
	.long	150                             @ 0x96
	.long	89                              @ 0x59
	.long	46                              @ 0x2e
	.long	56                              @ 0x38
	.long	87                              @ 0x57
	.long	94                              @ 0x5e
	.long	75                              @ 0x4b
	.long	70                              @ 0x46
	.long	94                              @ 0x5e
	.long	120                             @ 0x78
	.long	124                             @ 0x7c
	.long	119                             @ 0x77
	.long	128                             @ 0x80
	.long	141                             @ 0x8d
	.long	125                             @ 0x7d
	.long	79                              @ 0x4f
	.long	43                              @ 0x2b
	.long	43                              @ 0x2b
	.long	51                              @ 0x33
	.long	30                              @ 0x1e
	.long	0                               @ 0x0
	.long	6                               @ 0x6
	.long	40                              @ 0x28
	.long	55                              @ 0x37
	.long	29                              @ 0x1d
	.long	9                               @ 0x9
	.long	36                              @ 0x24
	.long	83                              @ 0x53
	.long	93                              @ 0x5d
	.long	61                              @ 0x3d
	.long	31                              @ 0x1f
	.long	33                              @ 0x21
	.long	41                              @ 0x29
	.long	24                              @ 0x18
	.long	4294967292                      @ 0xfffffffc
	.long	4294967285                      @ 0xfffffff5
	.long	6                               @ 0x6
	.long	18                              @ 0x12
	.long	9                               @ 0x9
	.long	4294967293                      @ 0xfffffffd
	.long	1                               @ 0x1
	.long	15                              @ 0xf
	.long	12                              @ 0xc
	.long	4294967290                      @ 0xfffffffa
	.long	4294967282                      @ 0xfffffff2
	.long	9                               @ 0x9
	.long	50                              @ 0x32
	.long	77                              @ 0x4d
	.long	86                              @ 0x56
	.long	92                              @ 0x5c
	.long	98                              @ 0x62
	.long	83                              @ 0x53
	.long	39                              @ 0x27
	.long	0                               @ 0x0
	.long	4294967292                      @ 0xfffffffc
	.long	12                              @ 0xc
	.long	8                               @ 0x8
	.long	4294967280                      @ 0xfffffff0
	.long	4294967289                      @ 0xfffffff9
	.long	54                              @ 0x36
	.long	106                             @ 0x6a
	.long	85                              @ 0x55
	.long	28                              @ 0x1c
	.long	27                              @ 0x1b
	.long	96                              @ 0x60
	.long	142                             @ 0x8e
	.long	97                              @ 0x61
	.long	21                              @ 0x15
	.long	20                              @ 0x14
	.long	94                              @ 0x5e
	.long	140                             @ 0x8c
	.long	97                              @ 0x61
	.long	29                              @ 0x1d
	.long	26                              @ 0x1a
	.long	82                              @ 0x52
	.long	107                             @ 0x6b
	.long	61                              @ 0x3d
	.long	4294967291                      @ 0xfffffffb
	.long	4294967272                      @ 0xffffffe8
	.long	1                               @ 0x1
	.long	21                              @ 0x15
	.long	12                              @ 0xc
	.long	4294967294                      @ 0xfffffffe
	.long	0                               @ 0x0
	.long	13                              @ 0xd
	.long	17                              @ 0x11
	.long	9                               @ 0x9
	.long	1                               @ 0x1
	.long	1                               @ 0x1
	.long	7                               @ 0x7
	.long	12                              @ 0xc
	.long	11                              @ 0xb
	.long	7                               @ 0x7
	.long	6                               @ 0x6
	.long	13                              @ 0xd
	.long	22                              @ 0x16
	.long	23                              @ 0x17
	.long	16                              @ 0x10
	.long	12                              @ 0xc
	.long	19                              @ 0x13
	.long	28                              @ 0x1c
	.long	19                              @ 0x13
	.long	0                               @ 0x0
	.long	0                               @ 0x0
	.long	38                              @ 0x26
	.long	95                              @ 0x5f
	.long	123                             @ 0x7b
	.long	104                             @ 0x68
	.long	72                              @ 0x48
	.long	72                              @ 0x48
	.long	104                             @ 0x68
	.long	125                             @ 0x7d
	.long	96                              @ 0x60
	.long	45                              @ 0x2d
	.long	25                              @ 0x19
	.long	55                              @ 0x37
	.long	92                              @ 0x5c
	.long	90                              @ 0x5a
	.long	49                              @ 0x31
	.long	15                              @ 0xf
	.long	19                              @ 0x13
	.long	49                              @ 0x31
	.long	76                              @ 0x4c
	.long	94                              @ 0x5e
	.long	113                             @ 0x71
	.long	131                             @ 0x83
	.long	127                             @ 0x7f
	.long	88                              @ 0x58
	.long	32                              @ 0x20
	.long	4294967293                      @ 0xfffffffd
	.long	4294967288                      @ 0xfffffff8
	.long	9                               @ 0x9
	.long	24                              @ 0x18
	.long	25                              @ 0x19
	.long	22                              @ 0x16
	.long	25                              @ 0x19
	.long	39                              @ 0x27
	.long	55                              @ 0x37
	.long	61                              @ 0x3d
	.long	66                              @ 0x42
	.long	79                              @ 0x4f
	.long	98                              @ 0x62
	.long	101                             @ 0x65
	.long	79                              @ 0x4f
	.long	51                              @ 0x33
	.long	44                              @ 0x2c
	.long	54                              @ 0x36
	.long	61                              @ 0x3d
	.long	56                              @ 0x38
	.long	52                              @ 0x34
	.long	64                              @ 0x40
	.long	84                              @ 0x54
	.long	93                              @ 0x5d
	.long	91                              @ 0x5b
	.long	88                              @ 0x58
	.long	89                              @ 0x59
	.long	83                              @ 0x53
	.long	65                              @ 0x41
	.long	50                              @ 0x32
	.long	51                              @ 0x33
	.long	63                              @ 0x3f
	.long	74                              @ 0x4a
	.long	75                              @ 0x4b
	.long	67                              @ 0x43
	.long	51                              @ 0x33
	.long	37                              @ 0x25
	.long	40                              @ 0x28
	.long	61                              @ 0x3d
	.long	79                              @ 0x4f
	.long	68                              @ 0x44
	.long	35                              @ 0x23
	.long	14                              @ 0xe
	.long	22                              @ 0x16
	.long	41                              @ 0x29
	.long	44                              @ 0x2c
	.long	40                              @ 0x28
	.long	57                              @ 0x39
	.long	99                              @ 0x63
	.long	132                             @ 0x84
	.long	125                             @ 0x7d
	.long	95                              @ 0x5f
	.long	86                              @ 0x56
	.long	105                             @ 0x69
	.long	115                             @ 0x73
	.long	86                              @ 0x56
	.long	36                              @ 0x24
	.long	12                              @ 0xc
	.long	30                              @ 0x1e
	.long	64                              @ 0x40
	.long	86                              @ 0x56
	.long	96                              @ 0x60
	.long	105                             @ 0x69
	.long	110                             @ 0x6e
	.long	99                              @ 0x63
	.long	78                              @ 0x4e
	.long	66                              @ 0x42
	.long	68                              @ 0x44
	.long	71                              @ 0x47
	.long	59                              @ 0x3b
	.long	42                              @ 0x2a
	.long	34                              @ 0x22
	.long	45                              @ 0x2d
	.long	69                              @ 0x45
	.long	93                              @ 0x5d
	.long	112                             @ 0x70
	.long	119                             @ 0x77
	.long	109                             @ 0x6d
	.long	91                              @ 0x5b
	.long	74                              @ 0x4a
	.long	63                              @ 0x3f
	.long	55                              @ 0x37
	.long	50                              @ 0x32
	.long	57                              @ 0x39
	.long	67                              @ 0x43
	.long	61                              @ 0x3d
	.long	32                              @ 0x20
	.long	5                               @ 0x5
	.long	16                              @ 0x10
	.long	63                              @ 0x3f
	.long	100                             @ 0x64
	.long	90                              @ 0x5a
	.long	52                              @ 0x34
	.long	33                              @ 0x21
	.long	46                              @ 0x2e
	.long	62                              @ 0x3e
	.long	51                              @ 0x33
	.long	34                              @ 0x22
	.long	48                              @ 0x30
	.long	89                              @ 0x59
	.long	117                             @ 0x75
	.long	113                             @ 0x71
	.long	96                              @ 0x60
	.long	97                              @ 0x61
	.long	103                             @ 0x67
	.long	85                              @ 0x55
	.long	45                              @ 0x2d
	.long	18                              @ 0x12
	.long	29                              @ 0x1d
	.long	67                              @ 0x43
	.long	101                             @ 0x65
	.long	113                             @ 0x71
	.long	108                             @ 0x6c
	.long	95                              @ 0x5f
	.long	83                              @ 0x53
	.long	71                              @ 0x47
	.long	57                              @ 0x39
	.long	41                              @ 0x29
	.long	28                              @ 0x1c
	.long	30                              @ 0x1e
	.long	53                              @ 0x35
	.long	86                              @ 0x56
	.long	111                             @ 0x6f
	.long	116                             @ 0x74
	.long	111                             @ 0x6f
	.long	106                             @ 0x6a
	.long	102                             @ 0x66
	.long	92                              @ 0x5c
	.long	75                              @ 0x4b
	.long	58                              @ 0x3a
	.long	51                              @ 0x33
	.long	54                              @ 0x36
	.long	56                              @ 0x38
	.long	44                              @ 0x2c
	.zero	80
	.size	out_data, 2880

	.type	huart2,%object                  @ @huart2
	.bss
	.globl	huart2
	.p2align	2, 0x0
huart2:
	.zero	76
	.size	huart2, 76

	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"%d\r\n"
	.size	.L.str, 5

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

	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git f70f7242ad3dc55fc7dd91601ac39ce3e54a1096)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
