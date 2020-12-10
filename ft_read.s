	global _ft_read
	extern ___error

;;; Constant

	SYS_READ		EQU 0x2000003
	EXIT_ERROR		EQU -1

	section .text

_ft_read:
	mov		rax, SYS_READ
	syscall
	jc 		error
	ret
error:
	push	rax
	call	___error
	pop		rbx
	mov		[rax], rbx
	mov		rax, EXIT_ERROR
	mov		rbx, 0
	ret