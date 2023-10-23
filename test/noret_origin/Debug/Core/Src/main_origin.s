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
	@APP
benchmark_0_FORPUSH:
	movw	lr, #0
	movt	lr, #2060
	push	{lr}
	@NO_APP
	movw	r0, :lower16:Array
	movt	r0, :upper16:Array
	bl	BubbleSort
	movs	r0, #0
	pop	{r7, pc}
.Lfunc_end0:
	.size	benchmark, .Lfunc_end0-benchmark
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	BubbleSort                      @ -- Begin function BubbleSort
	.p2align	2
	.type	BubbleSort,%function
	.code	16                              @ @BubbleSort
	.thumb_func
BubbleSort:
	.fnstart
@ %bb.0:
	.pad	#20
	sub	sp, #20
	str	r0, [sp, #16]
	movs	r0, #0
	str	r0, [sp, #12]
	str	r0, [sp]
	b	.LBB1_1
.LBB1_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB1_3 Depth 2
	ldr	r0, [sp]
	cmp	r0, #99
	bgt	.LBB1_15
	b	.LBB1_2
.LBB1_2:                                @   in Loop: Header=BB1_1 Depth=1
	movs	r0, #1
	str	r0, [sp, #12]
	movs	r0, #0
	str	r0, [sp, #4]
	b	.LBB1_3
.LBB1_3:                                @   Parent Loop BB1_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [sp, #4]
	cmp	r0, #99
	bgt	.LBB1_10
	b	.LBB1_4
.LBB1_4:                                @   in Loop: Header=BB1_3 Depth=2
	ldr	r0, [sp, #4]
	ldr	r1, [sp]
	rsb.w	r1, r1, #100
	cmp	r0, r1
	blt	.LBB1_6
	b	.LBB1_5
.LBB1_5:                                @   in Loop: Header=BB1_1 Depth=1
	b	.LBB1_11
.LBB1_6:                                @   in Loop: Header=BB1_3 Depth=2
	ldr	r0, [sp, #16]
	ldr	r1, [sp, #4]
	add.w	r2, r0, r1, lsl #2
	ldr.w	r0, [r0, r1, lsl #2]
	ldr	r1, [r2, #4]
	cmp	r0, r1
	ble	.LBB1_8
	b	.LBB1_7
.LBB1_7:                                @   in Loop: Header=BB1_3 Depth=2
	ldr	r0, [sp, #16]
	ldr	r1, [sp, #4]
	ldr.w	r0, [r0, r1, lsl #2]
	str	r0, [sp, #8]
	ldr	r0, [sp, #16]
	ldr	r1, [sp, #4]
	add.w	r2, r0, r1, lsl #2
	ldr	r2, [r2, #4]
	str.w	r2, [r0, r1, lsl #2]
	ldr	r0, [sp, #8]
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #4]
	add.w	r1, r1, r2, lsl #2
	str	r0, [r1, #4]
	movs	r0, #0
	str	r0, [sp, #12]
	b	.LBB1_8
.LBB1_8:                                @   in Loop: Header=BB1_3 Depth=2
	b	.LBB1_9
.LBB1_9:                                @   in Loop: Header=BB1_3 Depth=2
	ldr	r0, [sp, #4]
	adds	r0, #1
	str	r0, [sp, #4]
	b	.LBB1_3
.LBB1_10:                               @ %.loopexit
                                        @   in Loop: Header=BB1_1 Depth=1
	b	.LBB1_11
.LBB1_11:                               @   in Loop: Header=BB1_1 Depth=1
	ldr	r0, [sp, #12]
	cbz	r0, .LBB1_13
	b	.LBB1_12
.LBB1_12:
	b	.LBB1_16
.LBB1_13:                               @   in Loop: Header=BB1_1 Depth=1
	b	.LBB1_14
.LBB1_14:                               @   in Loop: Header=BB1_1 Depth=1
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	b	.LBB1_1
.LBB1_15:                               @ %.loopexit1
	b	.LBB1_16
.LBB1_16:
	add	sp, #20
	bx	lr
.Lfunc_end1:
	.size	BubbleSort, .Lfunc_end1-BubbleSort
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
	.pad	#8
	sub	sp, #8
	movw	r0, :lower16:factor
	movt	r0, :upper16:factor
	mov.w	r1, #-1
	str	r1, [r0]
	ldr	r0, [r0]
	str	r0, [sp]
	movs	r0, #0
	str	r0, [sp, #4]
	b	.LBB2_1
.LBB2_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp, #4]
	cmp	r0, #99
	bgt	.LBB2_4
	b	.LBB2_2
.LBB2_2:                                @   in Loop: Header=BB2_1 Depth=1
	ldr	r0, [sp, #4]
	ldr	r1, [sp]
	muls	r1, r0, r1
	movw	r2, :lower16:Array
	movt	r2, :upper16:Array
	str.w	r1, [r2, r0, lsl #2]
	b	.LBB2_3
.LBB2_3:                                @   in Loop: Header=BB2_1 Depth=1
	ldr	r0, [sp, #4]
	adds	r0, #1
	str	r0, [sp, #4]
	b	.LBB2_1
.LBB2_4:
	add	sp, #8
	bx	lr
.Lfunc_end2:
	.size	initialise_benchmark, .Lfunc_end2-initialise_benchmark
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
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#416
	sub	sp, #416
	str	r0, [sp, #408]
	movw	r1, :lower16:.L__const.verify_benchmark.expected
	movt	r1, :upper16:.L__const.verify_benchmark.expected
	add	r0, sp, #8
	mov.w	r2, #400
	bl	__aeabi_memcpy4
	movs	r0, #0
	str	r0, [sp, #4]
	b	.LBB3_1
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp, #4]
	cmp	r0, #99
	bgt	.LBB3_6
	b	.LBB3_2
.LBB3_2:                                @   in Loop: Header=BB3_1 Depth=1
	ldr	r0, [sp, #4]
	movw	r1, :lower16:Array
	movt	r1, :upper16:Array
	ldr.w	r1, [r1, r0, lsl #2]
	add	r2, sp, #8
	ldr.w	r0, [r2, r0, lsl #2]
	cmp	r1, r0
	beq	.LBB3_4
	b	.LBB3_3
.LBB3_3:
	movs	r0, #0
	str	r0, [sp, #412]
	b	.LBB3_7
.LBB3_4:                                @   in Loop: Header=BB3_1 Depth=1
	b	.LBB3_5
.LBB3_5:                                @   in Loop: Header=BB3_1 Depth=1
	ldr	r0, [sp, #4]
	adds	r0, #1
	str	r0, [sp, #4]
	b	.LBB3_1
.LBB3_6:
	movs	r0, #1
	str	r0, [sp, #412]
	b	.LBB3_7
.LBB3_7:
	ldr	r0, [sp, #412]
	add	sp, #416
	pop	{r7, pc}
.Lfunc_end3:
	.size	verify_benchmark, .Lfunc_end3-verify_benchmark
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
	@APP
	ldr	r0, .Ltmp0
	ldr	r1, .Ltmp1
	str	r1, [r0]
	@NO_APP
	movs	r0, #0
	str	r0, [sp, #12]
	bl	HAL_Init
	@APP
main_4_FORPUSH:
	movw	lr, #12
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	SystemClock_Config
	@APP
main_8_FORPUSH:
	movw	lr, #24
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_GPIO_Init
	@APP
main_12_FORPUSH:
	movw	lr, #36
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_I2C1_Init
	@APP
main_16_FORPUSH:
	movw	lr, #48
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_I2S3_Init
	@APP
main_20_FORPUSH:
	movw	lr, #60
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_SPI1_Init
	bl	MX_USB_HOST_Init
	@APP
main_24_FORPUSH:
	movw	lr, #72
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_USART2_UART_Init
	bl	HAL_GetTick
	str	r0, [sp, #8]
	@APP
main_28_FORPUSH:
	movw	lr, #84
	movt	lr, #2060
	push	{lr}
	@NO_APP
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
	movw	r1, #9999
	cmp	r0, r1
	bgt	.LBB5_5
	b	.LBB5_3
.LBB5_3:                                @   in Loop: Header=BB5_2 Depth=2
	@APP
main_32_FORPUSH:
	movw	lr, #96
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	benchmark
	b	.LBB5_4
.LBB5_4:                                @   in Loop: Header=BB5_2 Depth=2
	ldr	r0, [sp, #4]
	adds	r0, #1
	str	r0, [sp, #4]
	b	.LBB5_2
.LBB5_5:                                @   in Loop: Header=BB5_1 Depth=1
	@APP
main_36_FORPUSH:
	movw	lr, #108
	movt	lr, #2060
	push	{lr}
	@NO_APP
	movs	r0, #1
	bl	verify_benchmark
	str	r0, [sp]
	ldr	r0, [sp]
	cmp	r0, #1
	bne	.LBB5_7
	b	.LBB5_6
.LBB5_6:                                @   in Loop: Header=BB5_1 Depth=1
	bl	HAL_GetTick
	ldr	r1, [sp, #8]
	subs	r1, r0, r1
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	bl	printf
	b	.LBB5_7
.LBB5_7:                                @   in Loop: Header=BB5_1 Depth=1
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
	@APP
SystemClock_Config_40_FORPUSH:
	movw	lr, #120
	movt	lr, #2060
	push	{lr}
	@NO_APP
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
	@APP
SystemClock_Config_44_FORPUSH:
	movw	lr, #132
	movt	lr, #2060
	push	{lr}
	@NO_APP
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
	@APP
MX_I2C1_Init_48_FORPUSH:
	movw	lr, #144
	movt	lr, #2060
	push	{lr}
	@NO_APP
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
	@APP
MX_I2S3_Init_52_FORPUSH:
	movw	lr, #156
	movt	lr, #2060
	push	{lr}
	@NO_APP
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
	@APP
MX_SPI1_Init_56_FORPUSH:
	movw	lr, #168
	movt	lr, #2060
	push	{lr}
	@NO_APP
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
	@APP
MX_USART2_UART_Init_60_FORPUSH:
	movw	lr, #180
	movt	lr, #2060
	push	{lr}
	@NO_APP
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
.Lfunc_end13:
	.size	MasterForward, .Lfunc_end13-MasterForward
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
.Lfunc_end14:
	.size	MasterBackward, .Lfunc_end14-MasterBackward
	.fnend
                                        @ -- End function
	.type	Array,%object                   @ @Array
	.bss
	.globl	Array
	.p2align	2, 0x0
Array:
	.zero	404
	.size	Array, 404

	.type	factor,%object                  @ @factor
	.globl	factor
	.p2align	2, 0x0
factor:
	.long	0                               @ 0x0
	.size	factor, 4

	.type	.L__const.verify_benchmark.expected,%object @ @__const.verify_benchmark.expected
	.section	.rodata.str4.4,"aMS",%progbits,4
	.p2align	2, 0x0
.L__const.verify_benchmark.expected:
	.long	4294967197                      @ 0xffffff9d
	.long	4294967198                      @ 0xffffff9e
	.long	4294967199                      @ 0xffffff9f
	.long	4294967200                      @ 0xffffffa0
	.long	4294967201                      @ 0xffffffa1
	.long	4294967202                      @ 0xffffffa2
	.long	4294967203                      @ 0xffffffa3
	.long	4294967204                      @ 0xffffffa4
	.long	4294967205                      @ 0xffffffa5
	.long	4294967206                      @ 0xffffffa6
	.long	4294967207                      @ 0xffffffa7
	.long	4294967208                      @ 0xffffffa8
	.long	4294967209                      @ 0xffffffa9
	.long	4294967210                      @ 0xffffffaa
	.long	4294967211                      @ 0xffffffab
	.long	4294967212                      @ 0xffffffac
	.long	4294967213                      @ 0xffffffad
	.long	4294967214                      @ 0xffffffae
	.long	4294967215                      @ 0xffffffaf
	.long	4294967216                      @ 0xffffffb0
	.long	4294967217                      @ 0xffffffb1
	.long	4294967218                      @ 0xffffffb2
	.long	4294967219                      @ 0xffffffb3
	.long	4294967220                      @ 0xffffffb4
	.long	4294967221                      @ 0xffffffb5
	.long	4294967222                      @ 0xffffffb6
	.long	4294967223                      @ 0xffffffb7
	.long	4294967224                      @ 0xffffffb8
	.long	4294967225                      @ 0xffffffb9
	.long	4294967226                      @ 0xffffffba
	.long	4294967227                      @ 0xffffffbb
	.long	4294967228                      @ 0xffffffbc
	.long	4294967229                      @ 0xffffffbd
	.long	4294967230                      @ 0xffffffbe
	.long	4294967231                      @ 0xffffffbf
	.long	4294967232                      @ 0xffffffc0
	.long	4294967233                      @ 0xffffffc1
	.long	4294967234                      @ 0xffffffc2
	.long	4294967235                      @ 0xffffffc3
	.long	4294967236                      @ 0xffffffc4
	.long	4294967237                      @ 0xffffffc5
	.long	4294967238                      @ 0xffffffc6
	.long	4294967239                      @ 0xffffffc7
	.long	4294967240                      @ 0xffffffc8
	.long	4294967241                      @ 0xffffffc9
	.long	4294967242                      @ 0xffffffca
	.long	4294967243                      @ 0xffffffcb
	.long	4294967244                      @ 0xffffffcc
	.long	4294967245                      @ 0xffffffcd
	.long	4294967246                      @ 0xffffffce
	.long	4294967247                      @ 0xffffffcf
	.long	4294967248                      @ 0xffffffd0
	.long	4294967249                      @ 0xffffffd1
	.long	4294967250                      @ 0xffffffd2
	.long	4294967251                      @ 0xffffffd3
	.long	4294967252                      @ 0xffffffd4
	.long	4294967253                      @ 0xffffffd5
	.long	4294967254                      @ 0xffffffd6
	.long	4294967255                      @ 0xffffffd7
	.long	4294967256                      @ 0xffffffd8
	.long	4294967257                      @ 0xffffffd9
	.long	4294967258                      @ 0xffffffda
	.long	4294967259                      @ 0xffffffdb
	.long	4294967260                      @ 0xffffffdc
	.long	4294967261                      @ 0xffffffdd
	.long	4294967262                      @ 0xffffffde
	.long	4294967263                      @ 0xffffffdf
	.long	4294967264                      @ 0xffffffe0
	.long	4294967265                      @ 0xffffffe1
	.long	4294967266                      @ 0xffffffe2
	.long	4294967267                      @ 0xffffffe3
	.long	4294967268                      @ 0xffffffe4
	.long	4294967269                      @ 0xffffffe5
	.long	4294967270                      @ 0xffffffe6
	.long	4294967271                      @ 0xffffffe7
	.long	4294967272                      @ 0xffffffe8
	.long	4294967273                      @ 0xffffffe9
	.long	4294967274                      @ 0xffffffea
	.long	4294967275                      @ 0xffffffeb
	.long	4294967276                      @ 0xffffffec
	.long	4294967277                      @ 0xffffffed
	.long	4294967278                      @ 0xffffffee
	.long	4294967279                      @ 0xffffffef
	.long	4294967280                      @ 0xfffffff0
	.long	4294967281                      @ 0xfffffff1
	.long	4294967282                      @ 0xfffffff2
	.long	4294967283                      @ 0xfffffff3
	.long	4294967284                      @ 0xfffffff4
	.long	4294967285                      @ 0xfffffff5
	.long	4294967286                      @ 0xfffffff6
	.long	4294967287                      @ 0xfffffff7
	.long	4294967288                      @ 0xfffffff8
	.long	4294967289                      @ 0xfffffff9
	.long	4294967290                      @ 0xfffffffa
	.long	4294967291                      @ 0xfffffffb
	.long	4294967292                      @ 0xfffffffc
	.long	4294967293                      @ 0xfffffffd
	.long	4294967294                      @ 0xfffffffe
	.long	4294967295                      @ 0xffffffff
	.long	0                               @ 0x0
	.size	.L__const.verify_benchmark.expected, 400

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

	.type	Seed,%object                    @ @Seed
	.globl	Seed
	.p2align	2, 0x0
Seed:
	.long	0                               @ 0x0
	.size	Seed, 4

	.text
	.p2align	2, 0x0
.Ltmp0:
	.long	536936448
	.p2align	2, 0x0
.Ltmp1:
	.long	536936452
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 657e45f2db36cd908632137b10e29ed8cb467baf)"
	.section	".note.GNU-stack","",%progbits
