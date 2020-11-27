;; ########################################################################## ;;
;;                                                                            ;;
;;                                                        :::      ::::::::   ;;
;;   ft_strcmp.s                                        :+:      :+:    :+:   ;;
;;                                                    +:+ +:+         +:+     ;;
;;   By: ynoam <ynoam@student.1337.ma>              +#+  +:+       +#+        ;;
;;                                                +#+#+#+#+#+   +#+           ;;
;;   Created: 2020/11/27 19:49:58 by ynoam             #+#    #+#             ;;
;;   Updated: 2020/11/27 20:58:54 by ynoam            ###   ########.fr       ;;
;;                                                                            ;;
;; ########################################################################## ;;

	global _ft_strcmp

;;; Constant

	SYS_EXIT			EQU 0x2000001
	SYS_WRITE			EQU 0x2000004
	SYS_READ			EQU 0x2000005
	STDIN					EQU 0
	STDOUT				EQU 1
	EXIT_SUCCESS	EQU 0
	NULL					EQU 0

	section .text

_ft_strcmp:
	xor		rax, rax
	mov		rax, [rdi]
	cmp		[rsi], BYTE 0
	je		E
	cmp		[rsi], rax
	jg		G
	cmp		[rsi], rax
	jl		L
	inc		rsi
	inc		rdi
	jmp		_ft_strcmp
E:
	mov		rax, 0
	ret

L:
	mov		rax, -1
	ret

G:
	mov		rax, 1
	ret
