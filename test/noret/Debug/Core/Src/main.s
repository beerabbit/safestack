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
	.globl	divides                         @ -- Begin function divides
	.p2align	2
	.type	divides,%function
	.code	16                              @ @divides
	.thumb_func
divides:
	.fnstart
@ %bb.0:
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	udiv	r2, r0, r1
	mls	r0, r2, r1, r0
	clz	r0, r0
	lsrs	r0, r0, #5
	add	sp, #8
	bl	MasterBackward
.Lfunc_end0:
	.size	divides, .Lfunc_end0-divides
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	even                            @ -- Begin function even
	.p2align	2
	.type	even,%function
	.code	16                              @ @even
	.thumb_func
even:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	ldr	r1, [sp, #4]
	@APP
even_0_FORPUSH:

	@NO_APP
	movs	r0, #2
	movw	lr, #0
	movt	lr, #2060
	push	{lr}
	bl	MasterForward
	add	sp, #8
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end1:
	.size	even, .Lfunc_end1-even
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	prime                           @ -- Begin function prime
	.p2align	2
	.type	prime,%function
	.code	16                              @ @prime
	.thumb_func
prime:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#16
	sub	sp, #16
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	@APP
prime_4_FORPUSH:
	movw	lr, #12
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	cbz	r0, .LBB2_2
	b	.LBB2_1
.LBB2_1:
	ldr	r0, [sp, #8]
	subs	r0, #2
	clz	r0, r0
	lsrs	r0, r0, #5
	strb	r0, [r7, #-1]
	b	.LBB2_9
.LBB2_2:
	movs	r0, #3
	str	r0, [sp, #4]
	b	.LBB2_3
.LBB2_3:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp, #4]
	muls	r0, r0, r0
	ldr	r1, [sp, #8]
	cmp	r0, r1
	bhi	.LBB2_8
	b	.LBB2_4
.LBB2_4:                                @   in Loop: Header=BB2_3 Depth=1
	ldr	r0, [sp, #4]
	ldr	r1, [sp, #8]
	@APP
prime_8_FORPUSH:
	movw	lr, #24
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	cbz	r0, .LBB2_6
	b	.LBB2_5
.LBB2_5:
	movs	r0, #0
	strb	r0, [r7, #-1]
	b	.LBB2_9
.LBB2_6:                                @   in Loop: Header=BB2_3 Depth=1
	b	.LBB2_7
.LBB2_7:                                @   in Loop: Header=BB2_3 Depth=1
	ldr	r0, [sp, #4]
	adds	r0, #2
	str	r0, [sp, #4]
	b	.LBB2_3
.LBB2_8:
	ldr	r0, [sp, #8]
	movs	r1, #0
	cmp	r0, #1
	it	hi
	movhi	r1, #1
	strb	r1, [r7, #-1]
	b	.LBB2_9
.LBB2_9:
	ldrb	r0, [r7, #-1]
	add	sp, #16
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end2:
	.size	prime, .Lfunc_end2-prime
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	swap                            @ -- Begin function swap
	.p2align	2
	.type	swap,%function
	.code	16                              @ @swap
	.thumb_func
swap:
	.fnstart
@ %bb.0:
	.pad	#12
	sub	sp, #12
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	ldr	r0, [sp, #8]
	ldr	r0, [r0]
	str	r0, [sp]
	ldr	r0, [sp, #4]
	ldr	r0, [r0]
	ldr	r1, [sp, #8]
	str	r0, [r1]
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	str	r0, [r1]
	add	sp, #12
	bl	MasterBackward
.Lfunc_end3:
	.size	swap, .Lfunc_end3-swap
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
	.save	{r4, r6, r7, lr}
	push	{r4, r6, r7, lr}
	.setfp	r7, sp, #8
	add	r7, sp, #8
	@APP
benchmark_12_FORPUSH:

	@NO_APP
	movw	r4, :lower16:x
	movt	r4, :upper16:x
	movw	r1, :lower16:y
	movt	r1, :upper16:y
	mov	r0, r4
	movw	lr, #36
	movt	lr, #2060
	push	{lr}
	bl	MasterForward
	ldr	r0, [r4]
	@APP
benchmark_16_FORPUSH:
	movw	lr, #48
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	mov	r1, r0
	movs	r0, #0
	cbz	r1, .LBB4_2
	b	.LBB4_1
.LBB4_1:
	movw	r0, :lower16:y
	movt	r0, :upper16:y
	ldr	r0, [r0]
	@APP
benchmark_20_FORPUSH:
	movw	lr, #60
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	cmp	r0, #0
	it	ne
	movne	r0, #1
	b	.LBB4_2
.LBB4_2:
	movs	r1, #1
	bic.w	r0, r1, r0
	movw	r1, :lower16:result
	movt	r1, :upper16:result
	str	r0, [r1]
	movs	r0, #0
	pop	{r4, r6, r7, lr}
	bl	MasterBackward
.Lfunc_end4:
	.size	benchmark, .Lfunc_end4-benchmark
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
	movw	r0, :lower16:x
	movt	r0, :upper16:x
	movw	r1, #21649
	str	r1, [r0]
	movw	r0, :lower16:y
	movt	r0, :upper16:y
	movw	r1, #54487
	movt	r1, #7
	str	r1, [r0]
	bl	MasterBackward
.Lfunc_end5:
	.size	initialise_benchmark, .Lfunc_end5-initialise_benchmark
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
	.pad	#12
	sub	sp, #12
	str	r0, [sp, #4]
	movs	r0, #0
	str	r0, [sp]
	movw	r0, :lower16:result
	movt	r0, :upper16:result
	ldr	r0, [r0]
	ldr	r1, [sp]
	cmp	r0, r1
	beq	.LBB6_2
	b	.LBB6_1
.LBB6_1:
	movs	r0, #0
	str	r0, [sp, #8]
	b	.LBB6_3
.LBB6_2:
	movs	r0, #1
	str	r0, [sp, #8]
	b	.LBB6_3
.LBB6_3:
	ldr	r0, [sp, #8]
	add	sp, #12
	bl	MasterBackward
.Lfunc_end6:
	.size	verify_benchmark, .Lfunc_end6-verify_benchmark
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
.Lfunc_end7:
	.size	__io_putchar, .Lfunc_end7-__io_putchar
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
main_24_FORPUSH:
	movw	lr, #72
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	@APP
main_28_FORPUSH:
	movw	lr, #84
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	@APP
main_32_FORPUSH:
	movw	lr, #96
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	@APP
main_36_FORPUSH:
	movw	lr, #108
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	@APP
main_40_FORPUSH:
	movw	lr, #120
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	bl	MX_USB_HOST_Init
	@APP
main_44_FORPUSH:
	movw	lr, #132
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	bl	HAL_GetTick
	str	r0, [sp, #8]
	@APP
main_48_FORPUSH:
	movw	lr, #144
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	b	.LBB8_1
.LBB8_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB8_2 Depth 2
	bl	MX_USB_HOST_Process
	movs	r0, #0
	str	r0, [sp, #4]
	b	.LBB8_2
.LBB8_2:                                @   Parent Loop BB8_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r0, [sp, #4]
	cmp.w	r0, #1000
	bge	.LBB8_5
	b	.LBB8_3
.LBB8_3:                                @   in Loop: Header=BB8_2 Depth=2
	@APP
main_52_FORPUSH:
	movw	lr, #156
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	b	.LBB8_4
.LBB8_4:                                @   in Loop: Header=BB8_2 Depth=2
	ldr	r0, [sp, #4]
	adds	r0, #1
	str	r0, [sp, #4]
	b	.LBB8_2
.LBB8_5:                                @   in Loop: Header=BB8_1 Depth=1
	bl	HAL_GetTick
	ldr	r1, [sp, #8]
	subs	r1, r0, r1
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	bl	printf
	bl	HAL_GetTick
	str	r0, [sp, #8]
	b	.LBB8_1
.Lfunc_end8:
	.size	main, .Lfunc_end8-main
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
	b	.LBB9_1
.LBB9_1:
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
	b	.LBB9_2
.LBB9_2:
	b	.LBB9_3
.LBB9_3:
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
	b	.LBB9_4
.LBB9_4:
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
	cbz	r0, .LBB9_6
	b	.LBB9_5
.LBB9_5:
	@APP
SystemClock_Config_56_FORPUSH:
	movw	lr, #168
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	b	.LBB9_6
.LBB9_6:
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
	cbz	r0, .LBB9_8
	b	.LBB9_7
.LBB9_7:
	@APP
SystemClock_Config_60_FORPUSH:
	movw	lr, #180
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	b	.LBB9_8
.LBB9_8:
	add	sp, #80
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end9:
	.size	SystemClock_Config, .Lfunc_end9-SystemClock_Config
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
	b	.LBB10_1
.LBB10_1:
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
	b	.LBB10_2
.LBB10_2:
	b	.LBB10_3
.LBB10_3:
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
	b	.LBB10_4
.LBB10_4:
	b	.LBB10_5
.LBB10_5:
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
	b	.LBB10_6
.LBB10_6:
	b	.LBB10_7
.LBB10_7:
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
	b	.LBB10_8
.LBB10_8:
	b	.LBB10_9
.LBB10_9:
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
	b	.LBB10_10
.LBB10_10:
	b	.LBB10_11
.LBB10_11:
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
	b	.LBB10_12
.LBB10_12:
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
	pop	{r4, r5, r6, r7, lr}
	bl	MasterBackward
.Lfunc_end10:
	.size	MX_GPIO_Init, .Lfunc_end10-MX_GPIO_Init
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
	cbz	r0, .LBB11_2
	b	.LBB11_1
.LBB11_1:
	@APP
MX_I2C1_Init_64_FORPUSH:
	movw	lr, #192
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	b	.LBB11_2
.LBB11_2:
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end11:
	.size	MX_I2C1_Init, .Lfunc_end11-MX_I2C1_Init
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
	cbz	r0, .LBB12_2
	b	.LBB12_1
.LBB12_1:
	@APP
MX_I2S3_Init_68_FORPUSH:
	movw	lr, #204
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	b	.LBB12_2
.LBB12_2:
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end12:
	.size	MX_I2S3_Init, .Lfunc_end12-MX_I2S3_Init
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
	cbz	r0, .LBB13_2
	b	.LBB13_1
.LBB13_1:
	@APP
MX_SPI1_Init_72_FORPUSH:
	movw	lr, #216
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	b	.LBB13_2
.LBB13_2:
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end13:
	.size	MX_SPI1_Init, .Lfunc_end13-MX_SPI1_Init
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
	cbz	r0, .LBB14_2
	b	.LBB14_1
.LBB14_1:
	@APP
MX_USART2_UART_Init_76_FORPUSH:
	movw	lr, #228
	movt	lr, #2060
	push	{lr}
	@NO_APP
	bl	MasterForward
	b	.LBB14_2
.LBB14_2:
	pop	{r7, lr}
	bl	MasterBackward
.Lfunc_end14:
	.size	MX_USART2_UART_Init, .Lfunc_end14-MX_USART2_UART_Init
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
	b	.LBB15_1
.LBB15_1:                               @ =>This Inner Loop Header: Depth=1
	b	.LBB15_1
.Lfunc_end15:
	.size	Error_Handler, .Lfunc_end15-Error_Handler
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
.Lfunc_end16:
	.size	MasterForward, .Lfunc_end16-MasterForward
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
.Lfunc_end17:
	.size	MasterBackward, .Lfunc_end17-MasterBackward
	.fnend
                                        @ -- End function
	.type	result,%object                  @ @result
	.bss
	.globl	result
	.p2align	2, 0x0
result:
	.long	0                               @ 0x0
	.size	result, 4

	.type	x,%object                       @ @x
	.globl	x
	.p2align	2, 0x0
x:
	.long	0                               @ 0x0
	.size	x, 4

	.type	y,%object                       @ @y
	.globl	y
	.p2align	2, 0x0
y:
	.long	0                               @ 0x0
	.size	y, 4

	.type	huart2,%object                  @ @huart2
	.globl	huart2
	.p2align	2, 0x0
huart2:
	.zero	76
	.size	huart2, 76

	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"Total Time : %d\r\n"
	.size	.L.str, 18

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

	.text
	.p2align	2, 0x0
.Ltmp0:
	.long	536936448
	.p2align	2, 0x0
.Ltmp1:
	.long	536936452
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 789cdbd730d0d33650f9940fff17c432b1dc4a4a)"
	.section	".note.GNU-stack","",%progbits
