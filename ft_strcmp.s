	global _ft_strcmp

	section .text

_ft_strcmp:
	mov		al, [rdi]
	mov		bl, [rsi]
	cmp		al, BYTE 0
	je		end
	cmp		bl, BYTE 0
	je		end
	cmp		bl, al
	jne		end
	inc		rsi
	inc		rdi
	jmp		_ft_strcmp

end:
	cmp		al, bl
	ja		positive
	cmp		al, bl
	jb		negative
	mov		rax, 0
	ret

negative:
	mov		rax, -1
	ret

positive:
	mov		rax, 1
	ret
