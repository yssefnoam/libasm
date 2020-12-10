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

	EXIT_SUCCESS		EQU 0
	EXIT_ERROR			EQU -1

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
	ja		positive
	cmp		rax, rbx
	jb		negative
	mov		rax, 0
	ret

negative:
	mov		rax, -1
	ret

positive:
	mov		rax, 1
	ret