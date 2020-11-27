;; ########################################################################## ;;
;;                                                                            ;;
;;                                                        :::      ::::::::   ;;
;;   ft_strlen.s                                        :+:      :+:    :+:   ;;
;;                                                    +:+ +:+         +:+     ;;
;;   By: ynoam <ynoam@student.1337.ma>              +#+  +:+       +#+        ;;
;;                                                +#+#+#+#+#+   +#+           ;;
;;   Created: 2020/11/27 12:51:54 by ynoam             #+#    #+#             ;;
;;   Updated: 2020/11/27 13:01:18 by ynoam            ###   ########.fr       ;;
;;                                                                            ;;
;; ########################################################################## ;;

	global _ft_strlen

;;; Constant

	SYS_EXIT			EQU 0x2000001
	SYS_WRITE			EQU 0x2000004
	STDIN					EQU 0
	STDOUT				EQU 1
	EXIT_SUCCESS	EQU 0
	NULL					EQU 0

	section .text
_ft_strlen:
	mov rax, 0
	cmp rdi, NULL
	je L3										; if rdi == NULL go to L3
L2:
	cmp [rdi], byte 0
	je L3										; if [rdi] == 0 go to L3
	inc rax
	inc rdi									; rdi++
	jmp L2

L3:
	ret
