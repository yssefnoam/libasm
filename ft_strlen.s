	global _ft_strlen

	section .text

_ft_strlen:
	mov rax, 0
L2:
	cmp [rdi], byte 0
	je L3							; if [rdi] == 0 go to L3
	inc rax							; counter ++
	inc rdi
	jmp L2
L3:
	ret
