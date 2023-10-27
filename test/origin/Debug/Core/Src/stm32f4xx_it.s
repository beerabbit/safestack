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
	.file	"stm32f4xx_it.c"
	.globl	NMI_Handler                     @ -- Begin function NMI_Handler
	.p2align	2
	.type	NMI_Handler,%function
	.code	16                              @ @NMI_Handler
	.thumb_func
NMI_Handler:
	.fnstart
@ %bb.0:
	b	.LBB0_1
.LBB0_1:                                @ =>This Inner Loop Header: Depth=1
	b	.LBB0_1
.Lfunc_end0:
	.size	NMI_Handler, .Lfunc_end0-NMI_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	HardFault_Handler               @ -- Begin function HardFault_Handler
	.p2align	2
	.type	HardFault_Handler,%function
	.code	16                              @ @HardFault_Handler
	.thumb_func
HardFault_Handler:
	.fnstart
@ %bb.0:
	b	.LBB1_1
.LBB1_1:                                @ =>This Inner Loop Header: Depth=1
	b	.LBB1_1
.Lfunc_end1:
	.size	HardFault_Handler, .Lfunc_end1-HardFault_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	MemManage_Handler               @ -- Begin function MemManage_Handler
	.p2align	2
	.type	MemManage_Handler,%function
	.code	16                              @ @MemManage_Handler
	.thumb_func
MemManage_Handler:
	.fnstart
@ %bb.0:
	b	.LBB2_1
.LBB2_1:                                @ =>This Inner Loop Header: Depth=1
	b	.LBB2_1
.Lfunc_end2:
	.size	MemManage_Handler, .Lfunc_end2-MemManage_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	BusFault_Handler                @ -- Begin function BusFault_Handler
	.p2align	2
	.type	BusFault_Handler,%function
	.code	16                              @ @BusFault_Handler
	.thumb_func
BusFault_Handler:
	.fnstart
@ %bb.0:
	b	.LBB3_1
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	b	.LBB3_1
.Lfunc_end3:
	.size	BusFault_Handler, .Lfunc_end3-BusFault_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	UsageFault_Handler              @ -- Begin function UsageFault_Handler
	.p2align	2
	.type	UsageFault_Handler,%function
	.code	16                              @ @UsageFault_Handler
	.thumb_func
UsageFault_Handler:
	.fnstart
@ %bb.0:
	b	.LBB4_1
.LBB4_1:                                @ =>This Inner Loop Header: Depth=1
	b	.LBB4_1
.Lfunc_end4:
	.size	UsageFault_Handler, .Lfunc_end4-UsageFault_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	SVC_Handler                     @ -- Begin function SVC_Handler
	.p2align	2
	.type	SVC_Handler,%function
	.code	16                              @ @SVC_Handler
	.thumb_func
SVC_Handler:
	.fnstart
@ %bb.0:
	bx	lr
.Lfunc_end5:
	.size	SVC_Handler, .Lfunc_end5-SVC_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	DebugMon_Handler                @ -- Begin function DebugMon_Handler
	.p2align	2
	.type	DebugMon_Handler,%function
	.code	16                              @ @DebugMon_Handler
	.thumb_func
DebugMon_Handler:
	.fnstart
@ %bb.0:
	bx	lr
.Lfunc_end6:
	.size	DebugMon_Handler, .Lfunc_end6-DebugMon_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	PendSV_Handler                  @ -- Begin function PendSV_Handler
	.p2align	2
	.type	PendSV_Handler,%function
	.code	16                              @ @PendSV_Handler
	.thumb_func
PendSV_Handler:
	.fnstart
@ %bb.0:
	bx	lr
.Lfunc_end7:
	.size	PendSV_Handler, .Lfunc_end7-PendSV_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	SysTick_Handler                 @ -- Begin function SysTick_Handler
	.p2align	2
	.type	SysTick_Handler,%function
	.code	16                              @ @SysTick_Handler
	.thumb_func
SysTick_Handler:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	bl	HAL_IncTick
	pop	{r7, pc}
.Lfunc_end8:
	.size	SysTick_Handler, .Lfunc_end8-SysTick_Handler
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	OTG_FS_IRQHandler               @ -- Begin function OTG_FS_IRQHandler
	.p2align	2
	.type	OTG_FS_IRQHandler,%function
	.code	16                              @ @OTG_FS_IRQHandler
	.thumb_func
OTG_FS_IRQHandler:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	movw	r0, :lower16:hhcd_USB_OTG_FS
	movt	r0, :upper16:hhcd_USB_OTG_FS
	bl	HAL_HCD_IRQHandler
	pop	{r7, pc}
.Lfunc_end9:
	.size	OTG_FS_IRQHandler, .Lfunc_end9-OTG_FS_IRQHandler
	.cantunwind
	.fnend
                                        @ -- End function
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git f70f7242ad3dc55fc7dd91601ac39ce3e54a1096)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
