	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy

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