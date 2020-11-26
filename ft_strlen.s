; *****************************************************************************
;
;                                                         :::      ::::::::
;    ft_strlen.s                                        :+:      :+:    :+:
;                                                     +:+ +:+         +:+
;    By: ynoam <ynoam@student.1337.ma>              +#+  +:+       +#+
;                                                 +#+#+#+#+#+   +#+
;    Created: 2020/09/02 20:05:50 by ynoam             #+#    #+#
;    Updated: 2020/10/04 21:16:18 by ynoam            ###   ########.fr
;
; *****************************************************************************

	global ft_strlen

	;<
	;;; Constant
	;>
	SYS_EXIT	EQU 1
	SYS_FORK 	EQU 2
	SYS_READ 	EQU 3
	SYS_WRITE	EQU 4
	SYS_OPEN 	EQU 5
	SYS_CLOSE	EQU 6
	SYS_CREAT	EQU 8
	SYS_LSEEK	EQU 19
	STDIN		EQU 0
	STDOUT		EQU 1
	EXIT_SUCCESS EQU 0
	NULL		EQU 0

	section .text
ft_strlen:
	mov rax, 0
	cmp rdi, NULL
	je L3			; if rdi == NULL go to L3
L2:
	cmp [rdi], byte 0
	je L3			; if [rdi] == 0 go to L3
	inc rax
	inc rdi			; rdi++
	jmp L2

L3:
	ret
