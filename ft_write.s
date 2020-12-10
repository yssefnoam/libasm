	global _ft_write
	extern ___error

;;; Constant
	SYS_WRITE			EQU 0x2000004
	EXIT_ERROR			EQU	-1

	section .text

_ft_write:
	mov		rax, SYS_WRITE
	syscall
	jc		error
	ret
error:
	push	rax
	call	___error
	pop		rbx
	mov		[rax], rbx
	mov		rax, EXIT_ERROR
	mov		rbx, 0
	ret