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
	.file	"syscalls.c"
	.globl	initialise_monitor_handles      @ -- Begin function initialise_monitor_handles
	.p2align	2
	.type	initialise_monitor_handles,%function
	.code	16                              @ @initialise_monitor_handles
	.thumb_func
initialise_monitor_handles:
	.fnstart
@ %bb.0:
	bx	lr
.Lfunc_end0:
	.size	initialise_monitor_handles, .Lfunc_end0-initialise_monitor_handles
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_getpid                         @ -- Begin function _getpid
	.p2align	2
	.type	_getpid,%function
	.code	16                              @ @_getpid
	.thumb_func
_getpid:
	.fnstart
@ %bb.0:
	movs	r0, #1
	bx	lr
.Lfunc_end1:
	.size	_getpid, .Lfunc_end1-_getpid
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_kill                           @ -- Begin function _kill
	.p2align	2
	.type	_kill,%function
	.code	16                              @ @_kill
	.thumb_func
_kill:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	str	r1, [sp]
	bl	__errno
	movs	r1, #22
	str	r1, [r0]
	mov.w	r0, #-1
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end2:
	.size	_kill, .Lfunc_end2-_kill
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_exit                           @ -- Begin function _exit
	.p2align	2
	.type	_exit,%function
	.code	16                              @ @_exit
	.thumb_func
_exit:
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
	mov.w	r1, #-1
	bl	_kill
	b	.LBB3_1
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	b	.LBB3_1
.Lfunc_end3:
	.size	_exit, .Lfunc_end3-_exit
	.cantunwind
	.fnend
                                        @ -- End function
	.weak	_read                           @ -- Begin function _read
	.p2align	2
	.type	_read,%function
	.code	16                              @ @_read
	.thumb_func
_read:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#16
	sub	sp, #16
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	movs	r0, #0
	str	r0, [sp]
	b	.LBB4_1
.LBB4_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	cmp	r0, r1
	bge	.LBB4_4
	b	.LBB4_2
.LBB4_2:                                @   in Loop: Header=BB4_1 Depth=1
	bl	__io_getchar
	ldr	r1, [sp, #8]
	adds	r2, r1, #1
	str	r2, [sp, #8]
	strb	r0, [r1]
	b	.LBB4_3
.LBB4_3:                                @   in Loop: Header=BB4_1 Depth=1
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	b	.LBB4_1
.LBB4_4:
	ldr	r0, [sp, #4]
	add	sp, #16
	pop	{r7, pc}
.Lfunc_end4:
	.size	_read, .Lfunc_end4-_read
	.cantunwind
	.fnend
                                        @ -- End function
	.weak	_write                          @ -- Begin function _write
	.p2align	2
	.type	_write,%function
	.code	16                              @ @_write
	.thumb_func
_write:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#16
	sub	sp, #16
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	movs	r0, #0
	str	r0, [sp]
	b	.LBB5_1
.LBB5_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	cmp	r0, r1
	bge	.LBB5_4
	b	.LBB5_2
.LBB5_2:                                @   in Loop: Header=BB5_1 Depth=1
	ldr	r0, [sp, #8]
	adds	r1, r0, #1
	str	r1, [sp, #8]
	ldrb	r0, [r0]
	bl	__io_putchar
	b	.LBB5_3
.LBB5_3:                                @   in Loop: Header=BB5_1 Depth=1
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	b	.LBB5_1
.LBB5_4:
	ldr	r0, [sp, #4]
	add	sp, #16
	pop	{r7, pc}
.Lfunc_end5:
	.size	_write, .Lfunc_end5-_write
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_close                          @ -- Begin function _close
	.p2align	2
	.type	_close,%function
	.code	16                              @ @_close
	.thumb_func
_close:
	.fnstart
@ %bb.0:
	.pad	#4
	sub	sp, #4
	str	r0, [sp]
	mov.w	r0, #-1
	add	sp, #4
	bx	lr
.Lfunc_end6:
	.size	_close, .Lfunc_end6-_close
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_fstat                          @ -- Begin function _fstat
	.p2align	2
	.type	_fstat,%function
	.code	16                              @ @_fstat
	.thumb_func
_fstat:
	.fnstart
@ %bb.0:
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r0, [sp]
	mov.w	r1, #8192
	str	r1, [r0, #4]
	movs	r0, #0
	add	sp, #8
	bx	lr
.Lfunc_end7:
	.size	_fstat, .Lfunc_end7-_fstat
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_isatty                         @ -- Begin function _isatty
	.p2align	2
	.type	_isatty,%function
	.code	16                              @ @_isatty
	.thumb_func
_isatty:
	.fnstart
@ %bb.0:
	.pad	#4
	sub	sp, #4
	str	r0, [sp]
	movs	r0, #1
	add	sp, #4
	bx	lr
.Lfunc_end8:
	.size	_isatty, .Lfunc_end8-_isatty
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_lseek                          @ -- Begin function _lseek
	.p2align	2
	.type	_lseek,%function
	.code	16                              @ @_lseek
	.thumb_func
_lseek:
	.fnstart
@ %bb.0:
	.pad	#12
	sub	sp, #12
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	movs	r0, #0
	add	sp, #12
	bx	lr
.Lfunc_end9:
	.size	_lseek, .Lfunc_end9-_lseek
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_open                           @ -- Begin function _open
	.p2align	2
	.type	_open,%function
	.code	16                              @ @_open
	.thumb_func
_open:
	.fnstart
@ %bb.0:
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	str	r1, [sp]
	mov.w	r0, #-1
	add	sp, #8
	bx	lr
.Lfunc_end10:
	.size	_open, .Lfunc_end10-_open
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_wait                           @ -- Begin function _wait
	.p2align	2
	.type	_wait,%function
	.code	16                              @ @_wait
	.thumb_func
_wait:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	bl	__errno
	movs	r1, #10
	str	r1, [r0]
	mov.w	r0, #-1
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end11:
	.size	_wait, .Lfunc_end11-_wait
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_unlink                         @ -- Begin function _unlink
	.p2align	2
	.type	_unlink,%function
	.code	16                              @ @_unlink
	.thumb_func
_unlink:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	bl	__errno
	movs	r1, #2
	str	r1, [r0]
	mov.w	r0, #-1
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end12:
	.size	_unlink, .Lfunc_end12-_unlink
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_times                          @ -- Begin function _times
	.p2align	2
	.type	_times,%function
	.code	16                              @ @_times
	.thumb_func
_times:
	.fnstart
@ %bb.0:
	.pad	#4
	sub	sp, #4
	str	r0, [sp]
	mov.w	r0, #-1
	add	sp, #4
	bx	lr
.Lfunc_end13:
	.size	_times, .Lfunc_end13-_times
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_stat                           @ -- Begin function _stat
	.p2align	2
	.type	_stat,%function
	.code	16                              @ @_stat
	.thumb_func
_stat:
	.fnstart
@ %bb.0:
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r0, [sp]
	mov.w	r1, #8192
	str	r1, [r0, #4]
	movs	r0, #0
	add	sp, #8
	bx	lr
.Lfunc_end14:
	.size	_stat, .Lfunc_end14-_stat
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_link                           @ -- Begin function _link
	.p2align	2
	.type	_link,%function
	.code	16                              @ @_link
	.thumb_func
_link:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	str	r0, [sp, #4]
	str	r1, [sp]
	bl	__errno
	movs	r1, #31
	str	r1, [r0]
	mov.w	r0, #-1
	add	sp, #8
	pop	{r7, pc}
.Lfunc_end15:
	.size	_link, .Lfunc_end15-_link
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_fork                           @ -- Begin function _fork
	.p2align	2
	.type	_fork,%function
	.code	16                              @ @_fork
	.thumb_func
_fork:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	bl	__errno
	movs	r1, #11
	str	r1, [r0]
	mov.w	r0, #-1
	pop	{r7, pc}
.Lfunc_end16:
	.size	_fork, .Lfunc_end16-_fork
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_execve                         @ -- Begin function _execve
	.p2align	2
	.type	_execve,%function
	.code	16                              @ @_execve
	.thumb_func
_execve:
	.fnstart
@ %bb.0:
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#16
	sub	sp, #16
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	bl	__errno
	movs	r1, #12
	str	r1, [r0]
	mov.w	r0, #-1
	add	sp, #16
	pop	{r7, pc}
.Lfunc_end17:
	.size	_execve, .Lfunc_end17-_execve
	.cantunwind
	.fnend
                                        @ -- End function
	.type	__env,%object                   @ @__env
	.bss
	.globl	__env
	.p2align	2, 0x0
__env:
	.zero	4
	.size	__env, 4

	.type	environ,%object                 @ @environ
	.data
	.globl	environ
	.p2align	2, 0x0
environ:
	.long	__env
	.size	environ, 4

	.weak	__io_getchar
	.weak	__io_putchar
	.ident	"clang version 18.0.0 (https://github.com/beerabbit/safestack.git 657e45f2db36cd908632137b10e29ed8cb467baf)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
