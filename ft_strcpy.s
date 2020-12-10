	global _ft_strcpy

	section .text

_ft_strcpy:
	xor		rax, rax
loop:
	mov		rbx, rsi[rax]
	mov 	rdi[rax], rbx
	inc		rax
	cmp 	rsi[rax], byte 0
	jne		loop
	mov		rax, rdi
	ret