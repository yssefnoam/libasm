;; ########################################################################## ;;
;;                                                                            ;;
;;                                                        :::      ::::::::   ;;
;;   ft_strcmp.s                                        :+:      :+:    :+:   ;;
;;                                                    +:+ +:+         +:+     ;;
;;   By: ynoam <ynoam@student.1337.ma>              +#+  +:+       +#+        ;;
;;                                                +#+#+#+#+#+   +#+           ;;
;;   Created: 2020/11/27 19:49:58 by ynoam             #+#    #+#             ;;
;;   Updated: 2020/12/05 18:47:15 by ynoam            ###   ########.fr       ;;
;;                                                                            ;;
;; ########################################################################## ;;

	global _ft_strcmp

;;; Constant

	SYS_EXIT			EQU 0x2000001
	SYS_WRITE			EQU 0x2000004
	SYS_READ			EQU 0x2000005
	STDIN				EQU 0
	STDOUT				EQU 1
	EXIT_SUCCESS		EQU 0
	NULL				EQU 0

	section .text

_ft_strcmp:
	xor		rax, rax
	xor		rbx, rbx
	mov		rax, [rdi]
	mov		rbx, [rsi]
	cmp		rax, BYTE 0
	je		end_string
	cmp		rbx, BYTE 0
	je		end_string
	cmp		rbx, rax
	jne		end_string
	inc		rsi
	inc		rdi
	jmp		_ft_strcmp

end_string:
	cmp		rax, rbx
	jg		negative
	cmp		rax, rbx
	jl		positive
	mov		rax, 0
	ret

negative:
	mov		rax, -1
	ret

positive:
	mov		rax, 1
	ret
