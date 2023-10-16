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
	.globl	function_a                      @ -- Begin function function_a
	.p2align	2
	.type	function_a,%function
	.code	16                              @ @function_a
	.thumb_func
function_a:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#24
	sub	sp, #24
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	ldr	r0, [sp, #20]
	ldr	r1, [sp, #16]
	add	r0, r1
	ldr	r1, [sp, #12]
	add	r0, r1
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	@APP
function_a_0_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	str	r0, [sp]
	movs	r0, #1
	movs	r1, #2
	movs	r2, #3
	movs	r3, #4
	bl	function_b
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	add	sp, #24
	pop	{r7, pc}
.Lfunc_end1:
	.size	function_a, .Lfunc_end1-function_a
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	function_b                      @ -- Begin function function_b
	.p2align	2
	.type	function_b,%function
	.code	16                              @ @function_b
	.thumb_func
function_b:
	.fnstart
@ %bb.0:
	.pad	#20
	sub	sp, #20
	ldr.w	r12, [sp, #20]
	str	r0, [sp, #16]
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	ldr	r0, [sp, #16]
	ldr	r1, [sp, #12]
	add	r0, r1
	ldr	r1, [sp, #8]
	add	r0, r1
	ldr	r1, [sp, #4]
	add	r0, r1
	ldr	r1, [sp, #20]
	add	r0, r1
	str	r0, [sp]
	ldr	r0, [sp]
	add	sp, #20
	bx	lr
.Lfunc_end2:
	.size	function_b, .Lfunc_end2-function_b
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
	.save	{r4, r6, r7, lr}
	push	{r4, r6, r7, lr}
	.setfp	r7, sp, #8
	add	r7, sp, #8
	.pad	#16
	sub	sp, #16
	movs	r4, #0
	str	r4, [sp, #12]
	bl	HAL_Init
	@APP
main_0_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	SystemClock_Config
	@APP
main_1_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_GPIO_Init
	@APP
main_2_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_I2C1_Init
	@APP
main_3_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_I2S3_Init
	@APP
main_4_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_SPI1_Init
	bl	MX_USB_HOST_Init
	@APP
main_5_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	MX_USART2_UART_Init
	str	r4, [sp, #8]
	b	.LBB3_1
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	bl	MX_USB_HOST_Process
	ldr	r1, [sp, #8]
	movw	r0, :lower16:.L.str
	movt	r0, :upper16:.L.str
	bl	printf
	@APP
main_6_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	movs	r0, #1
	movs	r1, #2
	movs	r2, #3
	bl	function_a
	str	r0, [sp, #4]
	ldr	r0, [sp, #8]
	adds	r0, #1
	str	r0, [sp, #8]
	movs	r0, #1
	bl	HAL_Delay
	b	.LBB3_1
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
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
	b	.LBB4_1
.LBB4_1:
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
	b	.LBB4_2
.LBB4_2:
	b	.LBB4_3
.LBB4_3:
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
	b	.LBB4_4
.LBB4_4:
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
	cbz	r0, .LBB4_6
	b	.LBB4_5
.LBB4_5:
	@APP
SystemClock_Config_0_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	Error_Handler
	b	.LBB4_6
.LBB4_6:
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
	cbz	r0, .LBB4_8
	b	.LBB4_7
.LBB4_7:
	@APP
SystemClock_Config_1_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	Error_Handler
	b	.LBB4_8
.LBB4_8:
	add	sp, #80
	pop	{r7, pc}
.Lfunc_end4:
	.size	SystemClock_Config, .Lfunc_end4-SystemClock_Config
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
	b	.LBB5_1
.LBB5_1:
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
	b	.LBB5_2
.LBB5_2:
	b	.LBB5_3
.LBB5_3:
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
	b	.LBB5_4
.LBB5_4:
	b	.LBB5_5
.LBB5_5:
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
	b	.LBB5_6
.LBB5_6:
	b	.LBB5_7
.LBB5_7:
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
	b	.LBB5_8
.LBB5_8:
	b	.LBB5_9
.LBB5_9:
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
	b	.LBB5_10
.LBB5_10:
	b	.LBB5_11
.LBB5_11:
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
	b	.LBB5_12
.LBB5_12:
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
.Lfunc_end5:
	.size	MX_GPIO_Init, .Lfunc_end5-MX_GPIO_Init
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
	cbz	r0, .LBB6_2
	b	.LBB6_1
.LBB6_1:
	@APP
MX_I2C1_Init_0_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	Error_Handler
	b	.LBB6_2
.LBB6_2:
	pop	{r7, pc}
.Lfunc_end6:
	.size	MX_I2C1_Init, .Lfunc_end6-MX_I2C1_Init
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
	cbz	r0, .LBB7_2
	b	.LBB7_1
.LBB7_1:
	@APP
MX_I2S3_Init_0_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	Error_Handler
	b	.LBB7_2
.LBB7_2:
	pop	{r7, pc}
.Lfunc_end7:
	.size	MX_I2S3_Init, .Lfunc_end7-MX_I2S3_Init
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
	cbz	r0, .LBB8_2
	b	.LBB8_1
.LBB8_1:
	@APP
MX_SPI1_Init_0_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	Error_Handler
	b	.LBB8_2
.LBB8_2:
	pop	{r7, pc}
.Lfunc_end8:
	.size	MX_SPI1_Init, .Lfunc_end8-MX_SPI1_Init
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
	cbz	r0, .LBB9_2
	b	.LBB9_1
.LBB9_1:
	@APP
MX_USART2_UART_Init_0_FORPUSH:
	movt	lr, #0
	movw	lr, #2060
	push	{lr}
	@NO_APP
	bl	Error_Handler
	b	.LBB9_2
.LBB9_2:
	pop	{r7, pc}
.Lfunc_end9:
	.size	MX_USART2_UART_Init, .Lfunc_end9-MX_USART2_UART_Init
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
.Lfunc_end11:
	.size	MasterForward, .Lfunc_end11-MasterForward
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
	add.w	r2, r2, #8
	ldr	r3, [r2]
	cmp	r3, lr
	bne	fail_back
	ldr.w	lr, [r1]
	sub.w	r1, r1, #4
	str	r1, [r1]
	bx	lr
fail_back:
	@NO_APP
	bx	lr
.Lfunc_end12:
	.size	MasterBackward, .Lfunc_end12-MasterBackward
	.fnend
                                        @ -- End function
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

	.text
	.p2align	2, 0x0
.Ltmp0:
	.long	135004160
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 9e505eddd0ddb64833e98c352f5619f1353db354)"
	.section	".note.GNU-stack","",%progbits
