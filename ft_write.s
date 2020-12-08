	global _ft_write
	extern ___error

;;; Constant

	SYS_EXIT			EQU 0x2000001
	SYS_WRITE			EQU 0x2000004
	SYS_READ			EQU 0x2000005
	STDIN				EQU 0
	STDOUT				EQU 1
	EXIT_SUCCESS		EQU 0
	NULL				EQU 0

	section .text

_ft_write:
	push	rdx
	mov		rax, SYS_WRITE
	mov		rbx, rdi
	mov		rcx, rsi
	syscall
	cmp		rax, 0
	jl		error
	pop		rax
	ret
error:
	ret