	global _ft_read

;;; Constant

	SYS_EXIT			EQU 0x2000001
	SYS_WRITE			EQU 0x2000004
	SYS_READ			EQU 0x2000005
	STDIN				EQU 0
	STDOUT				EQU 1
	EXIT_SUCCESS		EQU 0
	NULL				EQU 0

	section .text

_ft_read:
	xor		rax, rax
	ret
