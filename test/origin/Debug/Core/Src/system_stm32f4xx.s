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
	.file	"system_stm32f4xx.c"
	.globl	SystemInit                      @ -- Begin function SystemInit
	.p2align	2
	.type	SystemInit,%function
	.code	16                              @ @SystemInit
	.thumb_func
SystemInit:
	.fnstart
@ %bb.0:
	movw	r0, #60808
	movt	r0, #57344
	ldr	r1, [r0]
	orr	r1, r1, #15728640
	str	r1, [r0]
	bx	lr
.Lfunc_end0:
	.size	SystemInit, .Lfunc_end0-SystemInit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	SystemCoreClockUpdate           @ -- Begin function SystemCoreClockUpdate
	.p2align	2
	.type	SystemCoreClockUpdate,%function
	.code	16                              @ @SystemCoreClockUpdate
	.thumb_func
SystemCoreClockUpdate:
	.fnstart
@ %bb.0:
	.pad	#20
	sub	sp, #20
	movs	r0, #0
	str	r0, [sp, #16]
	str	r0, [sp, #12]
	movs	r1, #2
	str	r1, [sp, #8]
	str	r0, [sp, #4]
	str	r1, [sp]
	movw	r0, #14344
	movt	r0, #16386
	ldr	r0, [r0]
	and	r0, r0, #12
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	cbz	r0, .LBB1_3
	b	.LBB1_1
.LBB1_1:
	cmp	r0, #4
	beq	.LBB1_4
	b	.LBB1_2
.LBB1_2:
	cmp	r0, #8
	beq	.LBB1_5
	b	.LBB1_9
.LBB1_3:
	movw	r0, :lower16:SystemCoreClock
	movt	r0, :upper16:SystemCoreClock
	movw	r1, #9216
	movt	r1, #244
	str	r1, [r0]
	b	.LBB1_10
.LBB1_4:
	movw	r0, :lower16:SystemCoreClock
	movt	r0, :upper16:SystemCoreClock
	movw	r1, #4608
	movt	r1, #122
	str	r1, [r0]
	b	.LBB1_10
.LBB1_5:
	movw	r0, #14340
	movt	r0, #16386
	ldr	r1, [r0]
	ubfx	r1, r1, #22, #1
	str	r1, [sp, #4]
	ldr	r0, [r0]
	and	r0, r0, #63
	str	r0, [sp]
	ldr	r0, [sp, #4]
	cbz	r0, .LBB1_7
	b	.LBB1_6
.LBB1_6:
	ldr	r0, [sp]
	movw	r1, #4608
	movt	r1, #122
	udiv	r0, r1, r0
	movw	r1, #14340
	movt	r1, #16386
	ldr	r1, [r1]
	ubfx	r1, r1, #6, #9
	muls	r0, r1, r0
	str	r0, [sp, #12]
	b	.LBB1_8
.LBB1_7:
	ldr	r0, [sp]
	movw	r1, #9216
	movt	r1, #244
	udiv	r0, r1, r0
	movw	r1, #14340
	movt	r1, #16386
	ldr	r1, [r1]
	ubfx	r1, r1, #6, #9
	muls	r0, r1, r0
	str	r0, [sp, #12]
	b	.LBB1_8
.LBB1_8:
	movw	r0, #14340
	movt	r0, #16386
	ldr	r0, [r0]
	and	r0, r0, #196608
	movs	r1, #2
	add.w	r0, r1, r0, lsr #15
	str	r0, [sp, #8]
	ldr	r0, [sp, #12]
	ldr	r1, [sp, #8]
	udiv	r0, r0, r1
	movw	r1, :lower16:SystemCoreClock
	movt	r1, :upper16:SystemCoreClock
	str	r0, [r1]
	b	.LBB1_10
.LBB1_9:
	movw	r0, :lower16:SystemCoreClock
	movt	r0, :upper16:SystemCoreClock
	movw	r1, #9216
	movt	r1, #244
	str	r1, [r0]
	b	.LBB1_10
.LBB1_10:
	movw	r0, #14344
	movt	r0, #16386
	ldr	r0, [r0]
	uxtb	r0, r0
	lsrs	r0, r0, #4
	movw	r1, :lower16:AHBPrescTable
	movt	r1, :upper16:AHBPrescTable
	ldrb	r0, [r1, r0]
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	movw	r1, :lower16:SystemCoreClock
	movt	r1, :upper16:SystemCoreClock
	ldr	r2, [r1]
	lsr.w	r0, r2, r0
	str	r0, [r1]
	add	sp, #20
	bx	lr
.Lfunc_end1:
	.size	SystemCoreClockUpdate, .Lfunc_end1-SystemCoreClockUpdate
	.cantunwind
	.fnend
                                        @ -- End function
	.type	SystemCoreClock,%object         @ @SystemCoreClock
	.data
	.globl	SystemCoreClock
	.p2align	2, 0x0
SystemCoreClock:
	.long	16000000                        @ 0xf42400
	.size	SystemCoreClock, 4

	.type	AHBPrescTable,%object           @ @AHBPrescTable
	.section	.rodata,"a",%progbits
	.globl	AHBPrescTable
AHBPrescTable:
	.ascii	"\000\000\000\000\000\000\000\000\001\002\003\004\006\007\b\t"
	.size	AHBPrescTable, 16

	.type	APBPrescTable,%object           @ @APBPrescTable
	.globl	APBPrescTable
APBPrescTable:
	.ascii	"\000\000\000\000\001\002\003\004"
	.size	APBPrescTable, 8

	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git f70f7242ad3dc55fc7dd91601ac39ce3e54a1096)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
