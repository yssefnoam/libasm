	global _ft_write
	extern ___error

;;; Constant

	SYS_WRITE			EQU 0x2000004
	EXIT_SUCCESS		EQU 0
	EXIT_ERROR			EQU	-1
	NULL				EQU 0

	section .text

_ft_write:
	mov		rax, SYS_WRITE
	syscall
	jc		error
	mov		rax, rdx
	ret
error:
	mov		rbx, rax
	call	___error
	mov		[rax], rbx
	mov		rax, EXIT_ERROR
	ret