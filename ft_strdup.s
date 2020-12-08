	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy

;; Constant

	SYS_EXIT			EQU 0x2000001
	SYS_WRITE			EQU 0x2000004
	SYS_READ			EQU 0x2000005
	STDIN				EQU 0
	STDOUT				EQU 1
	EXIT_SUCCESS		EQU 0
	NULL				EQU 0

	section .text
	_ft_strdup:
push	rdi
call	_ft_strlen
mov		rdi, rax
inc		rdi
call	_malloc
mov		rdi, rax
pop		rsi 
push	rdi
call	_ft_strcpy
pop		rax
ret