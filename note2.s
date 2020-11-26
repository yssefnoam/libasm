;<
;;The data section:
;;	syntax	:	section .data
;;	note	: the data section is used for declaring initialized data or constant
;;This data does not change ata runtime. You can declare various constant values,
;;file names of buffer size etc. in this section.
;;
;;The bss section:
;;	syntax	:	section .bss
;;	note	: the bss for declaring variables.
;;
;;The text section:
;;	syntax	:	section .text
;;					global main
;;				main:
;;	note	: the text for keeping the actual code. this section must begin with
;;the declaration global main, which tells the kernel where the program execution
;; begins.

;;
;; Memory segment:

;; Data segment : it represented by .data section and the .bss.
;;  The .data section ;  is used to declare the memory region where data element
;;  are stored for the
;;  program. This section cannot be expanded after the data elements are declared,
;;  and it remains static throughout the program.
;;  The .bss section is also a static memory section that contains buffers for data
;;  to be declared later in the program. This buffer memory is zero-filled.
;;
;; Code segment - it is represented by .text section. This defines an area in
;;  memory that stores the instruction codes. This also a fixed area.
;;
;; Stack - this segment contains data values passed to functions and procedures
;;;within the program.
;
;;;
;;; Processor Registers
;
;;; There are ten (10) 32-bit and six (6) 16-bit processor registers in IA-32
;;;  architecture. The registers are grouped into three categories:
;;;  .generale registers
;;;  .control registers
;;;  .segment registers
;; The general registers are futher divided into the following groups:
;;  .Data registers
;;  .Pointer registers
;  .Index registers

; Data Registers
; Four (4) 32-bit data registers are used for arithmetic, logical and other
;  opetations. These 32-bit registers can be used in three ways:
;  1. As complete 32-bit data registers: EAX, EBX, ECX, EDX.
;  2. Lower halves of the 32-bit registers can be used as four 16-bit data
;   registers : AX, BX, CX ,DX.
;  3. Lower halves of the above-mentioned four 16-bit registers can be as eight
;  8-bit data registers : AH, AL, BH, BL , CH, CL , DH, DL.
;     31                          16 15                             0
;     ---------------------------------------------------------------
;EAX  |                             |      AH       |      AL       |AX = AH + AL
;     ---------------------------------------------------------------
;EBX  |                             |      BH       |      BL       |BX = BH + BL
;     --------------------------------------------------------------
;ECX  |                             |      CH       |      CL       |CX = CH + CL
;     ---------------------------------------------------------------
;EDX  |                             |      DH       |      DL       |DX = DH + DL
;     ---------------------------------------------------------------
; some of these data registers has specific used in arithmetic operations.
;
; AX: is the primary accumulator: it is used in input/output and most arithmetic
; instructions. For example, in multiplication operation, one operand is stored in
; EAX, or AX or AL register according to the size of the operand.
;
; BX: is known as the base register as it could be used in indexed addressing.
;
; CX: is known as the count register as the ECX, CX registers store the loop count
; in iterative operations.
;
; Dx: is known as the data register. it is also used in input/output operations.
; it is also used with AX register along with DX for multiply and divide opeations
; involving large values.

; Pointer Registers
; The pointer registers are 32-bit EIP, ESP and EBP registers and corresponding
; 16-bit right portions IP, SP and BP. There are three categories of pointer
; registers:
; . Instruction Pointer (IP) - the 16-bit IP register stores the offset address of
; the next instruction to be executed. IP in association with the CS register (as
; CS: IP) gives the complete address of the current instruction in the code
; segment.
; . STACK Pointer (SP) - the 16-bit SP register provides the offset value within
; the program stack. SP in association with the SS register (SS:SP) refers to be
; current position of data or address within the program stack.
; . Base Pointer (BP) - the 16-bit BP register mainly helps in referencing the
; parameter variables passed to a subroutine. The address in SS register is
; combined with the offset in BP to get the location of the parameter. BP can
; also be combined with DI and SI as base register for special addressing.
;     31                          16 15                             0
;     ---------------------------------------------------------------
;ESP  |                             |              SP               |
;     ---------------------------------------------------------------
;EBP  |                             |              BP               |
;     --------------------------------------------------------------
;
; Index Registers
; The 32-bit index registers ESI and EDI and their 16-bit rightmost portions SI
; and DI are used for indexed addressing and sometimes used in addition and
; subtraction. There are two sets of index pointers:
; . Source Index (SI) - it is used as source index for string operations
; . Destination Index (DI) - it used as destination index for string operations.
;     31                          16 15                             0
;     ---------------------------------------------------------------
;ESI  |                             |              SI               |
;     ---------------------------------------------------------------
;EDI  |                             |              DI               |
;     --------------------------------------------------------------
;
; Control Registers:
; The 32-bit instruction pointer register and 32-bit flags register combined are
; considered as the control registers.
; Many instructions involve comparisons and mathematical calculations and change
; the status of the flags and some other conditional instructions test the value
; of these status flags to take the control flow to other location.
; The common flag bits are:

; Overflow Flag (OF): indicates the overflow of a high-order bit (leftmost bit)
; of data after a signed arithmetic operation.

; Direction Flag (DF): determines left or right direction for moving or comparing
; string data. When the DF value is 0, the string operation takes left-to-right
; direction and when the value is set to 1, the string operation takes
; right-to-left direction.

; Interrupt Flag (IF): determines whether the external interrupts like, keyboard
; entry etc. are to be ignored or processed. It disables the external interrupt
; when the value is 0 and enables interrupts when set to 1.

; Trap Flag (TF): allows setting the operation of the processor in single-step
; mode. The DEBUG program we used sets the trap flag, so we could step through
; the execution one instruction at a time.

; Sign Flag (SF): shows the sign of the result of an arithmetic operation. This
; flag is set according to the sign of a data item following the arithmetic
; operation. The sign is indicated by the high-order of leftmost bit. A positive
; result clears the value of SF to 0 and negative result sets it to 1.

; Zero Flag (ZF): indicates the result of an arithmetic or comparison operation.
; A nonzero result clears the zero flag to 0, and a zero result sets it to 1.

; Auxiliary Carry Flag (AF): contains the carry from bit 3 to bit 4 following an
; arithmetic operation used for specialized arithmetic. The AF is set when a
; 1-byte arithmetic operation causes a carry from bit 3 into bit 4.

; Parity Flag (PF): indicates the total number of 1-bits in the result obtained
; from an arithmetic operation. An even number of 1-bits clears the parity flag
; to 0 and an odd number of 1-bits sets the parity flag to 1.

; Carry Flag (CF): contains the carry of 0 or 1 from a high-order bit (leftmost)
; after an arithmetic operation. It also stores the contents of last bit of a
; shift or rotate operation.

; The following table indicates the position of flag bits in the 16-bit Flags
; registers:
;----------------------------------------------------------------
;Flag:    |   |   |   |   |O  |D  |I |T |S |Z |  |A |  |P |  |C |
;----------------------------------------------------------------
;Bit no : |15 |14 |13 |12 |11 |10 |9 |8 |7 |6 |5 |4 |3 |2 |1 |0 |
;----------------------------------------------------------------

; Segment Registers:
; Segments are specific areas defined in a program for containing data, code and
; stack. There are three main segments:
; . Code Segment: it contains all the instructions to be executed. A 16-bit Code
; Segment register or CS register stores the starting address fo the code segment.
; . Data Segment: it contains data, constant and work areas. A 16-bit Data segment
; register of DS register stores the starting address of the data segment.
; . Stack Segment: it contains data and return addresses of procedures or
; subroutines. it is implemented as a 'stack' data structure. The stack segment
; register or SS register stores the starting address of the stack.

; All the syscalls are listed in /usr/include/asm/unistd.h, together with their
; numbers (the value to put in EAX before you call int 80h).

;------------------------------------------------------------------
;EAX |    Name   | EBX            | ECX          | EDX    |ESX|EDI|
;------------------------------------------------------------------
; 1  | sys_exit  | int            |              |        |   |   |
;------------------------------------------------------------------
; 2  | sys_fork  | struct pt_regs |              |        |   |   |
;------------------------------------------------------------------
; 3  | sys_read  | unsigned int   | char *       | size_t |   |   |
;------------------------------------------------------------------
; 4  | sys_write | unsigned int   | const char * | size_t |   |   |
;------------------------------------------------------------------
; 5  | sys_open  | const char *   | int          | int    |   |   |
;------------------------------------------------------------------
; 6  | sys_close | unsigned int   |              |        |   |   |
;------------------------------------------------------------------

;
; Addressing Modes:

; Registers Addressing
; In this addressing mode, a register contains the operand. Depending upon the
; instruction, the register may be the first operand, the second operand or
; both.
; For example:
;           MOV DX, TAX_RATE	; Register in first operand
;           MOV COUNT, CX		; Register in second operand
;           MOV EAX, EBX		; Both the operands are in registers
; As processing data between registers does not involve memory, it provides
; fastest processing of data.

;< Immediate Addressing
;; An immediate operand has a constant value or an expression. when an instruction
;; with two operands uses immediate addressing, the first operand may be a
;; register or memory location, and the second operand is an immediate constant.
;; the first operand defines the length of the data.
;;
;; For example:
;; 		BYTE_VALUE  DB 150		; A byte value is defined
;; 		WORD_VALUE  DW 300		; A word value is defined
;; 		ADD BYTE_VALUE, 65		; An immediate operand 65 is added
;; 		MOV AX, 45H				; Immediate constant 45H is transferred to AX
;>

;<
;; Direct Memory Addressing:
;; In direct memory addressing, one of the operands refers to a memory location
;; and the other operand references a register.
;;
;; For example:
;; 		ADD BYTE_VALUE, DL		; Adds the register in the memory location
;; 		MOV BX, WORD_VALUE		; Operand from he Memory is assed to register
;;
;; Direct-Offset Addressing
;; This addressing mode uses the arithmetic operators to modify an address. For
;; example, look at the following definitions that define tables of data:
;;
;; 		BYTE_VALUE DB 14, 15, 22 45		; Tables of bytes
;; 		WORD_VALUE DW 134, 345, 564, 124	; Tables of words
;;
;; The following operations access data from the tables in the memory into
;; registers:
;;
;; 		MOV CL, BYTE_VALUE [2]		; Gets the 3rd element of the BYTE_TABLE
;; 		MOV CL, BYTE_VALUE + 2		; Gets the 3rd element of the BYTE_TABLE
;; 		MOV CX, WORD_VALUE [3]		; Gets the 4rd element of the BYTE_TABLE
;; 		MOV CX, WORD_VALUE + 3		; Gets the 4rd element of the BYTE_TABLE
;;
;; Indirect Memory Addressing
;; This addressing mode utilizes the computer's ability of segment:offset
;; addressing. Generally the base registers EBX, EBP(or BX, BP) and the index
;; registers (DI, SI), coded within square brackets for memory references, are
;; used for this purpose.
;; Indirect addressing is Generally used for variables containing several elements
;; like, arrays. Starting address of the array is stored in, say, the EBX
;; register.
;; The following code snippet shows how to access different elements of the
;; variable.
;; 		MY_TABLE TIMES 10 DW 0		; Allocates 10 words each initialized to 0
;; 		MOV EBX, [MY_TABLE]			; Effective Address of MY_TABLE in EBX; *MY_TABLE
;; 		MOV [EBX], 110				; MY_TABLE[0] = 110
;; 		ADD EBX, 2					; EBX = EBX + 2
;; 		MOV [EBX], 123				; MY_TABLE[1] = 123
;;
;; The MOV Instruction
;; syntax:
;; 		MOV destination, source
;; The MOV instruction may have one of the following five forms:
;; 		MOV register, register
;; 		MOV register, immediate
;; 		MOV memory, immediate
;; 		MOV register, memory
;; 		MOV memory, register
;; Please note that:
;; . Both the operands in MOV operation should be of same size
;; . The value of source operand remains unchanged
;; The MOV instruction causes ambiguity at times. For example, look at the
;; statements:
;; 		MOV EBX, [MY_TABLE]		; Effective Address fo MY_TABLE in EBX
;; 		MOV [EBX], 110 			; MY_TABLE[0] = 110
;; it is not clear whether you want to move a byte equivalent or word equivalent
;; of the number 110. In such cases, it is wise to use a type specifier
;;     ---------------------------------------------------------------
;;     |       Type Specifier        |      Byte addressed           |
;;     ---------------------------------------------------------------
;;     |        Byte                 |      1                        |
;;     --------------------------------------------------------------
;;     |        WORD                 |      2                        |
;;     ---------------------------------------------------------------
;;     |        DWORD                |      4                        |
;;     ---------------------------------------------------------------
;;     |        QWORD                |      8                        |
;;     ---------------------------------------------------------------
;;     |        TBYTE                |      10                       |
;;     ---------------------------------------------------------------
;; EXAMPLE:
;; The following program illustrates some of the concepts discussed above. It
;; stores a name 'Zara Ali' in the data section of the memory. Then changes its
;; value to another name 'Nuha Ali' programmatically and displays both the names.
;; " section .text
;; "	global main			; must be declared for linker (ld)
;; "main:					; tell linker entry point
;; "; writing the name 'Zara Ali'
;; "		mov edx, 9		; message length
;; "		mov ecx, name	; message to write
;; "		mov ebx, 1		; file descriptor (stdout)
;; "		mov eax, 4		; system call number (sys_write)
;; "		int	0x80		; call kernel
;; "
;; "		mov [name], dword 'Nuha'	; Changed the name to Nuha Ali
;; "; writing the name 'Nuha Ali'
;; "		mov edx, 8		; message length
;; "		mov ecx, name	; message to write
;; "		mov	ebx, 1		; file descriptor (stdout)
;; "		mov eax, 4		; system call number (sys_write)
;; "		int	0x80		; call kernel
;; "		mov eax, 1		; system call number (sys_exit)
;; "		int	0x80		; call kernel
;; "section .data
;; "	name db 'Zara Ali '
;>

;<
;; Assembly Variables
;;
;; Nasm (assembler) provides various define directives for reserving storage space
;; for variables, The define assembler directive is used for allocation fo storage
;; space. it can be used to reserve as well as initialize one or more bytes.
;;
;; Allocating Storage Space for Initialized Data:
;;
;; The syntax for storage allocation statement for initialized data is:
;; [variable-name]  define-directive  initial-value  [,initial-value]...
;; where, variable-name is the identifier for each storage space. The assembler
;; associates an offset value for each variable name defined in the data segment
;; Following are some examples of using define directives:
;; 		choice			DB		'y'
;; 		number			DW		12345
;; 		neg_number		DW		-12345
;; 		big_number		DQ		123456789
;; 		real_number1	DD	1.234
;;		real_number2	DQ	123.456
;;	Please note that:
;;	. Each byte of characte is stored as its ASCII value in hexadecimal.
;;	. Each decimal value is automatically converted to its 16-bit binary
;;	equivalent and stored as a hexadecimal number.
;;	. Processor uses the littel-endian byte ordering.
;;	. Negative numbers are converted to its 2's completement representation.
;;	. Short and long floating-point numbers are represented using 32 or 64 bits,
;;	respectively.
;;
;;	Allocating Storage Space for Uninitialized Data
;;
;;	The reserve directives are used for reserving space for Uninitialized data.
;;	The reserve directive take a single operand that specifies the number of units
;;	of space to reserved. Each define directives has a related reserve directive.
;;
;;	There are five basic forms of the reserve directive:
;;     ---------------------------------------------------------------
;;     |       Directive             |      Purpose                  |
;;     ---------------------------------------------------------------
;;     |        RESB                 |      Reserve a Byte = 1       |
;;     --------------------------------------------------------------
;;     |        RESW                 |      Reserve a Word = 2       |
;;     ---------------------------------------------------------------
;;     |        RESD                 |      Reserve a Doubleword = 4 |
;;     ---------------------------------------------------------------
;;     |        RESQ                 |      Reserve a Quadword = 8   |
;;     ---------------------------------------------------------------
;;     |        REST                 |      Reserve a Ten Bytes = 10 |
;;     ---------------------------------------------------------------
;;
;; Multiple Definitions:
;; You can have multiple data definition statements in a program. For example:
;; 		choice		DB		'Y'			; ASCII of Y = 79H
;; 		number1		DW		12345		; 12345D = 3039H
;; 		number2		DD		123456789	; 123456789D = 75BCD15H
;; The assembler allocates contiguous memory for multiple variable definitions.
;;
;; Multiple Initializetions:
;; The TIMES directive allows multiple Initializetions to the same value. For
;; example, an array named marks of size 9 can be defined and initialized to zero
;; using the following statement:
;; 		marks	TIMES	9	DW	0
;; 	The TIMES directive is useful is definig arraysand tables. The following
;; 	program displays 9 asterisks on the screen:
;; " section .text
;; "	global main			; must be declared for linker (ld)
;; "main:					; tell linker entry point
;; "		mov edx, 9		; message length
;; "		mov ecx, stars	; message to write
;; "		mov ebx, 1		; file descriptor (stdout)
;; "		mov eax, 4		; system call number (sys_write)
;; "		int	0x80		; call kernel
;; "
;; "		mov eax, 1		; system call number (sys_exit)
;; "		int	0x80		; call kernel
;; "section .data
;; "	stars times 9 db '*'
;>

;<
;; Assembly Constants
;;
;; There are several directives provided by NASM that define constants. We have
;; already used the EQU directive in previous chapters. We will particularly
;; discuss three directives:
;; . EQU
;; . %assign
;; . %define
;;
;; The EQU Directive
;; The EQU Directive is used for defining contants. The syntax of the EQU
;; directive is as follows:
;; 		CONSTANT_NAME  EQU expression
;; for example,
;; 		TOTAL_STUDENTS equ 50
;; You can then use this constant value in you code, like:
;; 		mov		ecx,   TOTAL_STUDENTS
;; 		cmp		eax,   TOTAL_STUDENTS
;; The operand of an EQU statement can be an expression:
;; 		LENGTH	equ 20
;; 		WIDTH	equ 10
;; 		AREA	equ length * width
;; Above code segment would define AREA as 200.
;; Example:
;; The following example illustrates the use of the EQU directive:
;; 		SYS_EXIT	equ 1
;; 		SYS_WRITE	equ 4
;; 		STDIN		equ 0
;; 		STDOUT		equ 1
;; 		section .text
;; 			global main
;; 		main:
;; 			mov eax, SYS_WRITE
;; 			mov ebx, STDOUT
;; 			mov ecx, msg1
;; 			mov edx, len1
;; 			int 0x80
;;
;; 			mov eax, SYS_EXIT
;; 			int 0x80
;;
;; section .data
;; 		msg1 db 'Hello, programmers!', 0xA, 0xD
;; 		len1 equ $ -msg1
;;
;; The %assign Directive
;; The %assign directive can be used to define numeric constants like the EQU
;; direcitve. This directive allows redefinition. For example, you may define the
;; constant TOTAL as:
;; 		%assign TOTAL 10
;; Later in the code you can redefine it as:
;; 		%assign TOTAL 20
;; This directive is case-sensitive.
;;
;; The %define Directive
;; The %define Directive allows defining both numeric and string constants. This
;; directive is similar to the #define in C. For example, you may define the
;; constants PTR as:
;; 		%define PTR [EBP + 4]
;; The above replaces PTR by [EBP + 4]
;; This directive also allows redefinition and it is case sensitive
;>

;<
;; Arithmetic Instructions
;;
;; The INC Instruction
;; The INC Instruction is used for incrementing an operand by one. it works on a
;; single operand that can be either in a register or in memory.
;; SYNTAX:
;; The INC instruction has the following syntax:
;; 		INC destination
;; The operand Destination could be an 8-bit, 16-bit, or 32-bit operand.
;; EXAMPLE:
;; 		INC EBX		; Increments 32-bit register
;; 		INC DL		; Increments 8-bit register
;; 		INC [count]	; Increments the count variable
;;
;; THe DEC Instruction
;; THe DEC Instruction is used for decrementing an operand by one. it works on a
;; single operand that can be either in a register or in memory.
;; SYNTAX:
;; The DEC instruction has the following syntax:
;; 		DEC destination
;; The operand destination could be an 8-bit, 16-bit or 32-bit operand.
;; EXAMPLE:
;; 		segment	.data
;; 				count dw 0
;; 				value db 15
;; 		segment .text
;; 				inc [count] ; *count += 1; = 1
;; 				inc [value] ; *value += 1; = 16
;;
;; 				mov ebx, count ; ebx = *count; like in c language.
;; 				inc word [ebx] ; *ebx += 1; = 2
;; 				mov esi, value ; esi = value;
;; 				dec byte [esi] ; *esi = 15
;;
;; The ADD and SUB Instructions
;; The ADD and SUB Instructions are used for performing simple addition/subtration
;; of binary data in byte, word and doubleword size, i,e., for adding or
;; subtracing 8-bit, 16-bit or 32-bit operands respectively.
;; SYNTAX:
;; The ADD and SUB instructions have the following syntax:
;; 		ADD/SUB destination, source
;; The ADD/SUB instruction can take place between:
;; . Register to register
;; . Memory to register
;; . Register to memory
;; . Register to constant data
;; . Memory to constant data
;; However, like other instructions, memory-to-Memory operations are not possible
;; using ADD/SUB instructions. An ADD or SUB operations sets or clears the
;; overflow and carry flags.
;; EXAMPLE:
;; The following example asks two digits from the user, stores the digits in the
;; EAX and EBX register respectively, adds the values, stores the result in a
;; memory location 'res' and finally displays the result.
;; 		SYS_EXIT equ 1
;; 		SYS_READ equ 3
;; 		SYS_WRITE equ 4
;; 		STDIN equ 0
;; 		STDOUT equ 1
;;
;; 		segment .data
;; 			msg1 db "Enter a digit ", 10, 13
;; 			len1 equ $ - msg1
;; 			msg2 db "Please enter a second digit", 10, 13
;; 			len2 equ $ - msg2
;; 			msg3 db "The sum is:"
;; 			len3 equ $ - msg3
;; 		segment .bss
;; 			num1 resb 2
;; 			num2 resb 2
;; 			res resb 1
;; 		section .text
;; 			global main
;; 		main:
;;		 		mov eax, SYS_WRITE
;; 				mov ebx, STDOUT
;; 				mov ecx, msg1
;; 				mov edx, len1
;; 				int 128
;;
;; 				mov eax, SYS_READ
;; 				mov ebx, STDIN
;; 				mov ecx, num1
;; 				mov edx, 2
;; 				int 128
;;
;; 				mov eax, SYS_WRITE
;; 				mov ebx, STDOUT
;;		 		mov ecx, msg2
;; 				mov edx, len2
;; 				int 128
;;
;; 				mov eax, SYS_READ
;; 				mov ebx, STDIN
;; 				mov ecx, num2
;; 				mov edx, 2
;; 				int 128
;;
;; 				mov eax, SYS_WRITE
;; 				mov ebx, STDOUT
;; 				mov ecx, msg3
;; 				mov edx, len3
;; 				int 128
;;
;; 				; moving the first number to eax register and second number to ebx and
;; 				; subtracting ascii '0' to convert it into a decimal number
;; 				mov eax, [number1]
;; 				sub eax, '0'
;; 				mov ebx, [number2]
;; 				sub ebx, '0'
;;
;; 				; add '0' to convert the sum from decimal to ASCII
;; 				add eax, ebx
;; 				add eax, '0'
;;
;; 				; storing the sum in memory location res
;; 				mov [res], eax
;;
;; 				; print the sum
;; 				mov eax, SYS_WRITE
;;		 		mov ebx, STDOUT
;; 				mov ecx, res
;; 				mov edx, 1
;; 				int 128
;; 		exit:
;; 				mov eax, SYS_EXIT
;; 				xor ebx, ebx
;; 				int 128
;;
;; The MUL/IMUL Instruction
;; There are two instructions for multiplying binary data. The MUL (Multiply)
;; instraction handles unsigned data and the IMUL (Integer Multiply) handles
;; signed data. Both instructions affect the Carry and Overflow flag.
;; SYNTAX:
;; The syntax for MUL/IMUL instructions is as follows:
;; 		MUL/IMUL multiplier
;; Multiplicand in both cases will be in an accumulator, Depending upon the size
;; of the multiplicand and the multiplier and the generated product is also stored
;; in two registers depending upon the size of the operands.
;; Following section explains MULL instructions with three different cases:
;;
;;     ---------------------------------------------------------------
;;     |       AL   X   8 bit source   =           AH AL             |
;;     ---------------------------------------------------------------
;;     ---------------------------------------------------------------
;;     |       AX   X   16 bit source  =           DX AX             |
;;     ---------------------------------------------------------------
;;     ---------------------------------------------------------------
;;     |       EAX  X   32 bit source  =          EDX EAX            |
;;     ---------------------------------------------------------------
;;
;; The DIV/IDIV Instructions
;; The division operation generates two elements - a quotient and a remainder. In
;; case of multiplication, overflow does not occur because double-length registers
;; are used to keep the product. However, in case fo division, overflow may occur.
;; The processor generates an interrupt if overflow occurs.
;; The DIV (Divide) instruction is used or unsigned data and the IDIV (Integer
;; Divide) is used for signed data.
;; SYNTAX:
;; The format for the DIV/IDIV instruction:
;; 		DIV/IDIV divisor
;;
;;     ----------------------------------------------------------------
;;    | AL / 8 bit Divisor ==> AL = quotient ; AH = remainder          |
;;     ----------------------------------------------------------------
;;     ----------------------------------------------------------------
;;    | DX AX / 16 bit Divisor ==> AX = quotient ; DX = remainder      |
;;     ----------------------------------------------------------------
;;     ----------------------------------------------------------------
;;    | EDX EAX / 32 bit Divisor ==> EAX = quotient ; EDX = remainder  |
;;     ----------------------------------------------------------------
;; EXAMPLE:
;; 		mov ax, 8
;; 		mov bl, 2
;; 		div bl
;; 		quotient in AL and remainder in AH the result is AL = 4 and AH = 0
;>

;<
;; Logical Instructions
;; The processor instruction set provides the instructions AND, OR, XOR, TEST and
;; NOT Boolean logic, which tests, sets and clears the bits according to the need
;; of the program.
;; The format for these instructions:
;; 		AND		operand1, operand2
;; 		OR		operand1, operand2
;; 		XOR		operand1, operand2
;; 		TEST	operand1, operand2
;; 		NOT		operand1
;; The first operand in all the cases could be either in register or in memory,
;; The second operand could be either in registe/memory or an immediate (constant)
;; value. However, memory to memory operations are not possible.
;; These instructions compare or match bits of the operands and set the CF, OF,
;; PF, SF and ZF flags.
;;
;; The AND Instruction
;; The AND Instruction is used for supporting logical expressions by performaing
;; bitwise AND operation. The bitwise AND operation returns 1, if the matching
;; bits from both the operands are 1, othewise it returns 0. For example:
;; 					Operand1:   0101
;; 					Operand2:   0011
;; 		----------------------------
;; 		After AND -> Operand1:  0001
;; The AND operation can be used for clearing one or more bits. For example, say,
;; the BL register contants 0011 1010. if you need to clear the high order bits to
;; zero, you AND it with to 0FH.
;; 			AND		BL,		OFH	; this sets BL to 0000 1010
;; Let's take up another example. if you want to check whether a given number is
;; odd or even, a simple test would be to check the least significant bit of the
;; number. if this is 1, the number is odd, else the number is even.
;; Assuming the number is in AL register, we can write:
;; 		AND		AL, 01H		; ANDing with 0000 0001
;; 		JZ		EVEN_NUMBER
;; The following program illustrates this:
;; 		section .text
;; 			global main
;; 		main:
;; 			mov		ax, 8h		; getting 8 in the ax
;; 			and		ax, 1		; and ax with 1
;; 			jz		evnn
;; 			mov 	eax, 4		; system call number (sys_write)
;; 			mov 	ebx, 1		; file descriptor (stdout)
;; 			mov 	ecx, odd_msg; message to write
;; 			mov 	edx, len2	; length of message
;; 			int		0x80		; call kernel
;; 			jmp		outprog
;; 		evnn:
;; 			mov		ah, 09h
;; 			mov 	eax, 4		; system call number (sys_write)
;; 			mov 	ebx, 1		; file descriptor (stdout)
;; 			mov 	ecx, even_msg; message to write
;; 			mov 	edx, len1	; length of message
;; 			int		0x80		; call kernel
;; 		outprog:
;; 			mov		eax, 1		; system call number (sys_exit)
;; 			int		0x80		; call kernel
;; 		section .data
;; 		even_msg db 'Even Number!' ; message showing even number
;; 		len1 equ $ - even_msg
;; 		odd_msg db 'Odd Number!'   ; message showing odd number
;; 		len2 equ $ - odd_msg
;>

;<
;; Assembly Conditions
;; Conditional execution in assembly language is accomplished by several looping
;; and branching instructions. These instructions can change the flow of control
;; in a program. Conditional execution is observed in two scenarios:
;; -------------------------------------------------------------------------------
;; |SN| Conditional Instructions                                                 |
;; -------------------------------------------------------------------------------
;; |  |Unconditional jump                                                        |
;; |  | This is performed by the JMP instruction. Conditional execution often    |
;; |  |involves a transfer of control to the address of an instruction that does |
;; |1 |not follow the currently execution instruction. Transfer of control may be|
;; |  |forward to execute a new set of instructions, or backward to re-execute   |
;; |  |the same steps.                                                           |
;; -------------------------------------------------------------------------------
;; |  |Conditional jump                                                          |
;; |  |This is performed by a set of jump instructions j<condition> depending    |
;; |2 |upon the condition. The conditional instructions transfer the control by  |
;; |  |breaking the sequential flow and they do it by changing the offset value  |
;; |  |in IP.                                                                    |
;; -------------------------------------------------------------------------------
;; Let us discuss the CMP instruction before discussing the conditional
;; instructions.
;;
;; The CMP Instruction
;; The CMP Instruction compares two operands. it is generally used in conditional
;; execution. This instruction basically subtracts one operand from the other for
;; comparing whether the operands are equal or not. it does not disturb the
;; distination or source operands operands. it is used along with the conditional
;; jump instruction for decision making.
;; SYNTAX:
;; 		CMP destination, source
;; CMP compares two numeric data fields. The destination operand could be either
;; in register or in memory. The source operand could be a constant (immediate)
;; data, register or memory.
;; EXAMPLE:
;; 		CMP DX, 00 ; compare the DX value withe zero
;; 		JE L7     ; if yes, the jump to label L7
;; 		L7: ...
;; CMP is often used for comparing whether a counter value has reached te number
;; of time a loop needs to be run.  Consider the following typical condition.
;; 		INC	EDX
;; 		CMP	EDX, 10		; Compares whether the counter has reached 10
;; 		JLE LP1			; if it is less than or equal to 10, then jump to LP1
;; Unconditional Jump
;; As mentioned earlier this is performed by the JMP instruction. Conditional
;; execution often involves a transfer of control to the address of an instruction
;; that does not follow the currently executing instruction. Transfer of control
;; may be forward to execute a new set fo instructions, or backward to re-execute
;; the same steps.
;; SYNTAX:
;; The JMP instruction provides a label name where the flow of control is
;; transferred Immediately. The syntax of the JMP instruction is:
;; 		JMP label
;; EXAMPLE:
;; The following code snippet illustrates the JMP instruction:
;; 		MOV AX, 00			; Initializing AX to 0
;; 		MOV BX, 00			; Initializing BX to 0
;; 		MOV CX, 01			; Initializing CX to 1
;; 		L20:
;; 		ADD AX, 01			; Increment AX
;; 		ADD BX, AX			; Add AX to BX
;; 		SHL CX, 1			; shift left CX, this in turn doubles the CX value
;; 		JMP L20				; repeats the statements
;; Conditional Jump
;; if some specified conditional is satisfied in conditional jump, the control
;; flow is transferred to a target instruction.
;; There are numerous conditional jump instructions, depending upon the condition
;; and data.
;; Following are the conditional jump instructions used on signed data used for
;; arithmetic operations:
;;------------------------------------------------------------------------------
;;Instruction | Description                                     | Flags tested |
;;------------------------------------------------------------------------------
;;JE/JZ       | Jump Equal or Jump Zero                         | ZF           |
;;------------------------------------------------------------------------------
;;JNE/JNZ     | Jump not Equal or Jump Not Zero                 | ZF           |
;;------------------------------------------------------------------------------
;;JG/JNLE     | Jump Greater or Jump Not Less/Equal             | OF,SF,ZF     |
;;------------------------------------------------------------------------------
;;JGE/JNL     | Jump Greater or Jump Not Less                   | OF,SF        |
;;------------------------------------------------------------------------------
;;JL/JNGLE    | Jump Less or Jump Not Greater/Equal             | OF,SF        |
;;------------------------------------------------------------------------------
;;JLE/JNG     | Jump Less/Equal or Jump Not Greater             | OF,SF,ZF     |
;;------------------------------------------------------------------------------
;; Following are the conditional jump instructions used on unsigned data used for
;; logical operations:
;;------------------------------------------------------------------------------
;;Instruction | Description                                     | Flags tested |
;;------------------------------------------------------------------------------
;;JE/JZ       | Jump Equal or Jump Zero                         | ZF           |
;;------------------------------------------------------------------------------
;;JNE/JNZ     | Jump not Equal or Jump Not Zero                 | ZF           |
;;------------------------------------------------------------------------------
;;JA/JNBE     | Jump Above or Jump Not Below/Equal              | CF,ZF        |
;;------------------------------------------------------------------------------
;;JAE/JNB     | Jump Above/Equal or Jump Not Below              | CF           |
;;------------------------------------------------------------------------------
;;JB/JNAE     | Jump Below or Jump Not Above/Equal              | CF           |
;;------------------------------------------------------------------------------
;;JBE/JNA     | Jump Below/Equal or Jump Not Above              | AF,CF        |
;;------------------------------------------------------------------------------
;; The following conditional jump instructions have special uses and check the
;; value of flags:
;;------------------------------------------------------------------------------
;;Instruction | Description                                     | Flags tested |
;;------------------------------------------------------------------------------
;;JXCZ        | Jump if CX is Zero                              | none         |
;;------------------------------------------------------------------------------
;;JC          | Jump if Carry                                   | CF           |
;;------------------------------------------------------------------------------
;;JNC         | Jump if No Carry                                | CF           |
;;------------------------------------------------------------------------------
;;JO          | Jump if Overflow                                | OF           |
;;------------------------------------------------------------------------------
;;JNO         | Jump if No Overflow                             | OF           |
;;------------------------------------------------------------------------------
;;JP/JPE      | Jump Parity or Jump Parity Even                 | PF           |
;;------------------------------------------------------------------------------
;;JNP/JPO     | Jump No Parity or Jump Parity Odd               | PF           |
;;------------------------------------------------------------------------------
;;JS          | Jump Sign (negative value)                      | SF           |
;;------------------------------------------------------------------------------
;;JNS         | Jump No Sign (positive value)                   | SF           |
;;------------------------------------------------------------------------------
;; The syntax for the J<condition> set of instructions:
;; Example,
;; 			CMP AL, BL
;; 			JE  EQUAL
;; 			CMP AL, BH
;; 			JE  EQUAL
;; 			CMP AL, CL
;; 			JE  EQUAL
;; 		NON_EQUAL: ...
;; 		EQUAL: ...
;; Example:
;; The following program displays the largest of three variables. The variables
;; are double-digit variables. The three variables num1, num2 and num3 have value
;; 47, 72 and 31 respectively:
;; 		section .text
;; 			global main
;; 		main:
;; 			mov ecx, [num1]
;; 			cmp ecx, [num2]
;; 			jg  check_third_num
;; 			mov ecx, [num3]
;; 		check_third_num:
;; 			cmp ecx, [num3]
;; 			jg  _exit
;; 			mov ecx, [num3]
;; 		_exit:
;; 			mov [largest], word ecx
;; 			mov ecx, msg
;; 			mov edx, len
;; 			mov ebx, 1
;; 			mov eax, 4
;; 			int 0x80
;; 			nwln
;; 			mov ecx, largest
;; 			mov edx, 2
;; 			mov ebx, 1
;; 			mov eax, 4
;; 			int 0x80
;;
;; 			mov eax, 1
;; 			int 0x80
;;
;; 		section .data
;; 			msg db "The largest digit is: ", 10, 13
;; 			len equ $ - msg
;;	 		num1 dd '47'
;; 			num2 dd '22'
;; 			num3 dd '31'
;; 		segment .bss
;; 			largest resb 2
;>

;<
;; Assembly Loops
;; The JMP instruction can be used for implementing loops. For example, the
;; following code snippet can be used for executing the loop-body 10 times.
;; 		MOV CL, 10
;; 		L1:
;; 		<LOOP-BODY>
;; 		DEC CL
;; 		JNZ L1
;; The Processor instruction set However includes a group of loop instructions for
;; implementing iteration. The basic LOOP instruction has the following syntax:
;; 		LOOP label
;; Where, label is the target label that identifies the target instruction as in
;; the jump instructions. The LOOP instruction assumes that the ECX register
;; contains the loop count. When the loop instruction is executed, the ECX
;; register is decremented and the control jumps to the target label, until the
;; ECX register value, i.e., the counter reaches the value zero.
;; The above code snippet could be written as:
;; 		mov ECX, 10
;; 		11:
;; 		<loop_body>
;; 		loop 11
;; Example:
;; The following program prints the number 1 to 9 on the screen:
;; 		section .text
;; 			global main
;; 		main:
;; 			mov ecx, 10
;; 			mov eax, '1'
;;
;; 		11:
;; 			mov [num], eax
;; 			mov eax, 4
;; 			mov ebx, 1
;; 			push ecx
;; 			mov ecx, num
;; 			mov edx, 1
;; 			int 0x80
;; 			mov eax, [num]
;; 			sub eax, '0'
;; 			inc eax
;; 			add eax, '0'
;; 			pop ecx
;; 			loop 11
;;
;; 		outprog:
;; 			mov eax, 1
;; 			int 0x80
;;
;; 		section .bss
;; 		num resb 1
;>

;<
;; Assembly Numbers
;; Numerical data is Generally represented in binary system, Arithmetic
;; instructions operat on binary data.
;; When numbers are displayed on screen or entered from keyboard, they are in
;; ASCII form.
;; So far, we have converted this input data in ASCII form to binary for
;; arithmetic calculations and converted the result back to binary. The following
;; code shows this:
;; 		section .text
;; 			global main
;; 		main:
;; 			mov eax, '3'
;; 			sub eax, '0'
;; 			mov	ebx, '4'
;; 			sub ebx, '0'
;;
;; 			add eax, ebx
;; 			add eax, '0'
;; 			mov [sum], eax
;; 			mov eax, SYS_WRITE
;; 			mov ebx, STDOUT
;; 			mov ecx, msg
;; 			mov edx, len
;; 			int 0x80
;;
;;			mov ecx, sum
;; 			mov eax, SYS_WRITE
;; 			mov ebx, STDOUT
;; 			mov edx, 1
;; 			int 0x80
;;
;; 			mov eax, 1
;; 			int 0x80
;; 		section .data
;; 			msg db "The sum is:", 0xa, 0xd
;; 			len equ $ - msg
;; 		segment .bss
;; 			sum resb 1
;; SUck conversions are however, has an overhead and assembly language programming
;; allows processing numbers in a more efficient way, in the binary form. Decimal
;; numbers can be represente in two forms:
;; . ASCII form
;; . BCD or Binary Coded Decimal form
;; >>>>>>>> ASCII Representation <<<<<<<<<<
;; in ASCII representation, decimal numbers are stored as string of ASCII
;; characters, For example, the decimal value 1234 is stored as:
;; 		31	32	33	34H
;; Where, 31H is ASCII value for 1, 32H is ASCII value for 2, and so on. There are
;; the following four instructions for processing numbers in ASCII representation:
;; . AAA - ASCII Adjust After Addition
;; . AAS - ASCII Adjust After Subtration
;; . AAM - ASCII Adjust After Multiplication
;; . AAD - ASCII Adjust Before Division
;; These instructions do not take any operands and assumes the required operand to
;; be in the AL register.
;; These following example uses the AAS instruction to demonstrate the concept:
;;	section .text
;;		global main
;;	main:
;;		sub ah, ah
;;		mov al, '9'
;;		sub al, '3'
;;		aas
;;		or  al, 30h			; 30h = 48d = 11110000
;;		mov [res], ax
;;
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, msg
;;		mov edx, len
;;		int 0x80
;;
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, res
;;		mov edx, 1
;;		int 0x80
;;
;;		mov eax, 1
;;		int 0x80
;;	section .data
;;		msg db "The result is:", 0xa
;;		len equ $ - msg
;;	segment .bss
;;		res resb 1
;; BCD Representation
;; There are two types of BCD representation
;; . Unpacked BCD representation
;; . Packed BCD representation
;; In unpacked BCD representation, each byte sotres the binary equivalent of a
;; decimal digit. For example, the number 1234 is stored as:
;; 			01 02 03 04H
;; There are two instructions for processing these numbers:
;; . AAM - ASCII Adjust After Multiplication
;; . AAD - ASCII Adjust Before Division
;; The four ASCII adjust instructions, AAA, AAS, AAM and AAD
;; .....
;; ...
;; ..
;; .
;>

;<
;; Assembly Strings
;; We have already used variable lenghts strings in our previous examples. You
;; must have noticed that, the variable lengths strings can have as many
;; characters as required. Generally, we specify the length of the string by
;; either of the two ways:
;; . Explicitly storing string lenght
;; . using a sentinel character
;; We can store the string length explicitly by using the $ location counter
;; symbol, that represents the current value of the location counter. In the
;; following example:
;;			msg db 'Hello, world!', 0xa		; our dear string
;;			len equ $ - msg					; length of our dear string
;; $ points to the byte after the last character of the string variable msg.
;; Therefore, $-msg gives the length of the string. We can also write
;;			msg db 'Hello, world!', 0xa		; our dear string
;;			len equ 13						; length of our dear string
;; Alternatively, you can store strings with a trailing sentinel character to
;; delimit a string instead of storing the string length explicitly. The sentinel
;; character should be a special character that does not appear within a string.
;; For example:
;;			msg db 'Hello, world!', 0
;; String Instructions
;; Eash string instruction may require a source operand, a destination operand, or
;; both. For 32-bit segements, string instructions use ESI and EDI registers to
;; point to the source and distination operands, respectively.
;; For 16-bit segments, however, the SI and the DI registers are used to point to
;; the source and distination respectively.
;; There are five basic instructions for processing strinfs. They are:
;; . MOVS - This instruction moves 1 Byte, Word or Doubleword fo data from memory
;; location to another.
;; . LODS - This instruction loads from memory. If the operand is of one byte, it
;; is loaded into the AL register, if the operand is one word, it is loaded into
;; the AX register and a doubleword is loaded into the EAX register.
;; . STOS - This instruction stores data from register (AL, AX, or EAX) to memory.
;; . CMPS - This instruction compares two data items in memory. Data could be of a
;; byte size, word or doubleword.
;; . SCAS - This instruction compares the contents of a register (AL, AX or EAX)
;; with the contents of an item in memory.
;;
;; Each of the above instruction has a byte, word and doubleword version and
;; string instructions can be repeated by using a repetition prefix.
;;
;; These instructions use the ES:DI and DS:SI pair of registers, where DI and SI
;; registers contain valid offset addresses that refers to bytes stored in memory.
;; SI is normally associated with DS (data segment) and DI is always associated
;; with ES (extra segment).
;;
;; The DS:SI (or ESI) and ES:DI (or EDI) registers point to the source and
;; destination operands respectively. The source operand is assumed to be at DS:SI
;; (or ESI) and the destination operand at ES:DI (or EDI) in memory.
;; For 16-bit addresses the SI and DI registers are used and for 32-bit addresses
;; the ESI and EDI registers are used.
;; The following table provides various versions of string instructions and the
;; assumed space of the operands.
;;----------------------------------------------------------------------------
;;|Instruction|Operands at|Byte Operation|Word Operation|Doubleword Operation|
;;|-----------|-----------|--------------|--------------|--------------------|
;;|MOVS       |ES:DI,DS:EI|MOVSB         |MOVSW         |MOVSD               |
;;|LODS       |AX,DS:SI   |LODSB         |LODSW         |LODSD               |
;;|STOS       |ES:DI,AX   |STOSB         |STOSW         |STOSD               |
;;|CMPS       |DS:SI,ES:DI|CMPSB         |CMPSW         |CMPSD               |
;;|SCAS       |ES:DI,AX   |SCASB         |SCASW         |SCASD               |
;;----------------------------------------------------------------------------
;; MOVS
;; The MOVS instruction in used to copy a data item (byte, word or doubleword)
;; from the source string to the destination string. The source string is pointed
;; by DS:SI and the distination string is pointed by ES:DI.
;; 		segment .text
;; 			global main
;; 		main:
;; 			mov ecx, len
;; 			mov esi, s1
;; 			mov edi, s2
;; 			cld
;; 			rep movsb
;;			mov eax, SYS_WRITE
;;			mov ebx, STDOUT
;;			mov ecx, s2
;;			mov edx, 20
;;			int 0x80
;;
;;			mov eax, 1
;;			mov ebx, 0
;;			int 0x80
;;		section .data
;;			s1 db "Hello, world!", 0 ; stringq
;;			len equ $ - s1
;;		segment .bss
;;			s2 resb 20
;; LODS
;;   In cryptography, a Caesar cipher is one of the simplest known encryption
;; techniques. In this method, each letter in the data to be encrypted is replaced
;; by a letter some fixed number of positions down the alphaber.
;; In this example, let us encrypt a data by simply replacing each alphabet in it
;; with a shift of two alphabet in it with a shift of two alphabets, so a will be
;; substituted by c, b with d and so on.
;;
;;	section .text
;;		global main
;;	main:
;;		mov ecx, len
;;		mov esi, s1
;;		mov edi, s2
;;	loop1:
;;		lodsb
;;		add al, 2
;;		stosb
;;		loop loop1
;;
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, s2
;;		mov edx, len
;;		int 0x80
;;
;;		mov eax, 1
;;		mov ebx, 0
;;		int 0x80
;;	section .data
;;		s1 db 'password', 0
;;		len equ $ - s1
;;	segment .bss
;;		s2 resb 10
;;
;; STOS
;; The STOS instruction copies the data item from AL (for bytes - STOSB), AX (for
;; words - STOSW) or EAX (for doubleword - STOSD) to the destination string,
;; pointed to by ES:DI in memory.
;; The following example demonstrates use of the LODS and STOS instruction to
;; convert an upper case string to its lower case value:
;;	section .text
;;		global main
;;	main:
;;		mov ecx, len
;;		mov esi, s1
;;		mov edi, s2
;;	loop1:
;;		lodsb
;;		or al, 20h
;;		stosb
;;		loop loop1
;;
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, s2
;;		mov edx, len
;;		int 0x80
;;
;;		mov eax, 1
;;		mov ebx, 0
;;		int 0x80
;;	section .data
;;		s1 db 'HELLO, WORLD', 0
;;		len equ $ - s1
;;	segment .bss
;;		s2 resb 20
;; CMPS
;; The CMPS instruction compares two strings. This instruction compares two data
;; items of one byte, word or doubleword, pointed to by the DS:SI an ES:DI
;; registers and sets the flags accordingly. You can also use the Conditional jump
;; instructions along with this instruction.
;; The following example demonstrates comparing two strings using the CMPS
;; instruction:
;;	section .text
;;		global main
;;	main:
;;		mov ecx, lens2
;;		mov esi, s1
;;		mov edi, s2
;;		cld
;;		repe cmpsb
;;		jecxz equal		; jump when ecx is zero
;;
;;		;if not equal then the following code
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, msg_neq
;;		mov edx, len_neq
;;		int 0x80
;;		jmp exit
;;	equal:
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, msg_eq
;;		mov edx, len_eq
;;		int 0x80
;;	exit:
;;		mov eax, SYS_EXIT
;;		mov eax, 0
;;		int 0x80
;;	section .data
;;		s1 db "hello, world!", 0 ; our first string
;;		lens1 equ $ - s1
;;		s2 db "hello, there!", 0 ; our second string
;;		lens2 equ $ - s2
;;		msg_eq db "String are equal", 10
;;		len_eq equ $ - msg_eq
;;		msg_neq db "String are not equal", 10
;;		len_neq equ $ - msg_neq
;;
;; SCAS
;; The SCAS instruction is used for searching a particular character or set of
;; characters in a string. The data item to be searched should be in AL (for
;; SCASB), AX (for SCASW) or EAX (for SCASD) registers. the sring to be searched
;; should be in memory and pointed be the ES:DI (ro EDI) register.
;; Look at the following program to understand the concept:
;;	section .text
;;		global main
;;	main:
;;		mov ecx, len
;;		mov edi, my_string
;;		mov al , 'e'
;;		cld
;;		repne scasb
;;		je found		; when found
;;
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, msg_notfound
;;		mov edx, len_notfound
;;		int 0x80
;;		jmp exit
;;	found:
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, msg_found
;;		mov edx, len_found
;;		int 0x80
;;	exit:
;;		mov eax, SYS_EXIT
;;		mov ebx, 0
;;		int 0x80
;;	section .data
;;		my_string db 'Hello, world!',0
;;		len equ $ - my_string
;;		msg_found db "found", 10
;;		len_found equ $ - msg_found
;;		msg_notfound db "not found", 10
;;		len_notfound equ $ - msg_notfound
;;
;;	Repetition Prefixes
;;	The REP prefix, when set before a string instruction, for example - REP MOVSB,
;;	causes repetition of the instruction based on a counter placed at the CX
;;	register, REP executes the instruction, decreases CX by 1, and checks whther
;;	CX is zero. it repeats the instruction processing until CX is zero.
;;	The Direction Flag (DF) determines the direction of the operation.
;;	. Use CLD (Clear Direction Flag, DF = 0) to make the opetation left to right.
;;	. Use SLD (Set Direction Flag, DF = 1) to make the opetation right to left.
;;	The REP prefix also has the following variations:
;;	. REP: it is the unconditional repeat. It repeats the operation until CX is
;;	zero.
;;	. REPE or REPZ: It is conditional repeat. It repeats the operation while the
;;	zero flag indicate equal/zero. It stops when the ZF indicates not equal/zero
;;	or when CX is zero.
;;	. REPNE or REPNZ: It is also conditional repeat. It repeats the operation
;;	while the zero flag indicate not equal/zero. It stops when the ZF indicates
;;	equal/zero or when CX is decremented to zero.
;>

;<
;; Assembly Arrays
;; We have already discussed that the data definition directives to the assembler
;; are used for allocating storage for variables. The variable could also be
;; initialized with some specific value. The initialized value could be specified
;; in hexadecimal, decimal or binary form.
;; For example, we cam define a word variable months in either of the following
;; way:
;; 		MONTHS DW 12
;; 		MONTHS DW 0CH
;; 		MONTHS DW 0110B
;; The data definition directives can also be used for defining a one dimensional
;; array. Let us define a one dimensional array of numbers.
;; 		NUMBERS DW 34, 45, 56, 67, 75, 89
;; The above definition declares an array of six words each initialized with the
;; numbers 34, 45, 56, 67, 75, 89. This allocates 2x6 = 12 bytes of consecutive
;; memory space. The symbolic address of the first number will be NUMBERS and that
;; of the second number will be NUMBERS + 1 and so on.
;; Let us take up another example. You can define an array named inventory of size
;; 8, and initialize all the values with zero, as:
;; 		INVENTORY DW 0
;; 		          DW 0
;; 		          DW 0
;; 		          DW 0
;; 		          DW 0
;; 		          DW 0
;; 		          DW 0
;; 		          DW 0
;; Which, can be abbreviated as:
;; 		INVENTORY DW 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
;; The TIMES directive can also be used for multiple initialions to the same
;; value. Using TIMES, the INVENTORY array can be defined as
;; 		INVENTORY TIMES 8 DW 0
;; Example:
;; The following example demonstrates the above concepts by defining a 3 element
;; array x, which stores three value: 2,3 and 4. it adds the value in the array
;; and displays the sum 9.
;;	section .text
;;		global main
;;	main:
;;		mov eax, 3			; number bytes to be summed
;;		mov ebx, 0 			; EBX will stores the sum
;;		mov ecx, x 			; ECX will point to the current element to be summed
;;	top:
;;		add ebx, [ecx]
;;		add ecx, 1			; move pointer to next element
;;		dec eax				; decrement counter
;;		jnz top				; if counter not 0, then loop again
;;	done:
;;		add ebx, '0'
;;		mov [sum], byte ebx ; done, store result in "sum"
;;	display:
;;		mov eax, SYS_WRITE
;;		mov ebx, STDOUT
;;		mov ecx, sum
;;		mov edx, 1
;;		int 0x80
;;
;;	exit:
;;		mov eax, SYS_EXIT
;;		mov eax, 0
;;		int 0x80
;;	section .data
;;		global x
;;	x:
;;		db 2
;;		db 4
;;		db 3
;;	sum:
;;		db 0
;>

;<
;; Assembly Procedures
;; Procedures or subroutines are very important in assembly language, as the
;; assembly language programs tend to be large in size. Procedures are identified
;; by a name. Following this name, the body of the procedure is described, which
;; perform a well-defined job. End of the procedure is indicated by a return
;; statement.
;; Syntax:
;; Following is the syntax to define a procedure:
;; 		proc_name:
;; 			procedure body
;; 			...
;; 			ret
;; The procedure is called from another function by using the CALL instruction.
;; The CALL instruction should have the name of the called procedure as argument
;; as shown below:
;; 			CALL proc_name
;; The called procedure returns the control to he calling procedure by using the
;; RET instruction.
;; Example:
;; Let us write a very simple procedure named sun that adds the variables stored
;; in the ECX and EDX register and returns the sum in the EAX register:
;; 		section .text
;; 			global main
;; 		main:
;; 			mov ecx, 4
;; 			mov edx, 5
;; 			call sum		; call sum procedure
;; 			mov [res], eax
;; 			mov eax, SYS_WRITE
;; 			mov ebx, STDOUT
;; 			mov ecx, msg
;; 			mov edx, len
;; 			int 0x80
;; 			nwln
;; 			mov eax, SYS_WRITE
;; 			mov ebx, STDOUT
;; 			mov ecx, res
;; 			mov edx, 1
;; 			int 0x80
;; 		exit:
;; 			mov eax, SYS_EXIT
;; 			mov ebx, 0
;; 			int 0x80
;; 		sum:
;; 			mov eax, ecx
;; 			add eax, edx
;; 			add eax, '0'
;; 			ret
;; 		section .data
;; 			msg db "The sum is :", 0xA, 0xD
;; 			len equ $ - msg
;; 		segment .bxx
;; 			res resb 1
;; Stacks Data Structure:
;; A stack is an array-like data structure in the memory in which data can be
;; stored and removed from a location called the 'top' of the stack. The data need
;; to be stored is 'pushed' into the stack and data to be retrieved is 'pepped'
;; out from the stack. Stack is a LIFO data structure, i.e., the data stored first
;; is retrieved last.
;; Assembly language provides two instructions for stack operations: PUSH and POP.
;; These instructions have syntaxes like:
;; 		PUSH operand
;; 		POP  address/ register
;; The memory space reserved in the stack segment is used for implementing stack.
;; The registers SS and ESP (or SP) are used for implementing the stack. The top of
;; the stack, which points to the last data item inserted into the stack is pointed
;; to by the SS:ESP register, where the SS register points to the beginning of the
;; stack segment and the SP (or ESP) gives the offset into the stack segment.
;; The stack implementation has the following characteristics:
;; . Only words or doublewords could be saved into the stack, not a byte.
;; . The stack grows in the reverse direction i.e., toward the lower memory
;; address.
;; . The top of the stack points to the last item inserted in the stack; it points
;; to the lower byte os the last word inserted.
;; As we discussed about storing the value of the registers in the stack before
;; using them for some use; it can be done in following way:
;;		; Save the AX and BX registers inthe stack
;;		PUSH AX
;;		PUSH BX
;;		; Use the registers for other purpose
;;		MOV AX, VALUE1
;;		MOV BX, VALUE2
;;		...
;;		MOV VALUE1, AX
;;		MOV VALUE2, BX
;;		; Restore the original value
;;		POP AX
;;		POP BX
;; Example:
;; The following program displays the entire ASCII character set. The main program
;; calls a procedure named display, which displays the ASCII character set.
;; 		section .text
;; 			global main
;; 		main:
;; 			call display
;; 			mov eax, 1
;; 			int 0x80
;; 		display:
;; 			mov ecx, 256
;; 		next:
;; 			push ecx
;; 			mov eax, SYS_WRITE
;; 			mov ebx, STDOUT
;; 			mov ecx, achar
;; 			mov ecx, 1
;; 			int 0x80
;; 			pop ecx
;; 			mov dx, [achar]
;; 			cmp byte [achar], 0dh
;; 			inc byte [achar]
;; 			loop next
;; 			ret
;; 		section .data
;; 		achar db '0'
;>

;<
;; Assembly Recursion
;; A recursion procedure is one that calls itself. There are two kinds of
;; recursion: direct and indirect. In direct recursion, the procedure calls itself
;; and in indirect recursion, the first procedure calls a second procedure, which
;; in turn, calls the first procedure.
;; Recursion could be observed in numerous maathematical algorithms. For example
;; consider the case of calculating the factorial of a number. Factorial of a
;; number is given by the equation:
;; 		Fact (n) = n * fact (n-1) for n > 0
;; ...
;; ..
;; .
;>

;<
;; Assembly Macros
;; Writing a macro is another way of ensuring modular programming in assembly
;; language.
;; . A macro is a sequence of instructions, assigned by a name and could be used
;; anywhere in the program.
;; . In NASM, macros are defined with %macro and %endmacro directives.
;; The macro begins with the %macro directive and ends with %endmacro directive.
;; The Syntax for macro definition:
;; 		%macro macro_name number_of_params
;; 			<macro body>
;; 		%endmacro
;; Where, number_of_params specifies the number parameters, macro_name specifies
;; the name of the macro.
;; The macro is invoked by using the macro name along with the necessary
;; parameters. When you need to use some sequence of instructions many times in a
;; program, you can put those instructions in a macro and use it instead of
;; writing the instructions all the time.
;; For example, a very common need for programs is to write a string of characters
;; in the screen. For displaying a string of characters, you need the following
;; sequence of instructions:
;; 			mov eax, SYS_WRITE	; system call number (sys_write)
;; 			mov ebx, STDOUT		; file descriptor
;; 			mov ecx, msg		; message to write
;; 			mov edx, len		; message length
;; 			int 0x80			; call kernel
;; We have observed that, some instructions like IMUL, IDIV, INT etc., need some
;; of the information to be stored in some particular registers and even returns
;; value in sone specific register(s). if the program was already using those
;; registers for keeping important data, than the existing data from these
;; registers should be saved in the stack and restored alfter the instruction is
;; executed.
;; In the above example of displaying a character string also, the registers EAX,
;; EBX, ECX and EDX we will used by the INT 80H function call. So for each time
;; you need to display on screen, you need to save these registers on the stack,
;; invoke INT 80H and then restore the original value of the registers from the
;; stack. So it could be useful to write two macros for saving and restoring data.
;; Example:
;; Following example shows defining and using macros:
;; 			; A macro with two parameters
;; 			; Implements the write system call
;; 				%macro write_string 2
;; 					mov eax, SYS_WRITE
;; 					mov ebx, STDOUT
;; 					mov ecx, %1
;; 					mov edx, %2
;; 					int 80h
;; 				%endmacro
;; 			section .text
;; 				global main
;; 			main:
;; 				write_string msg1, len1
;; 				write_string msg2, len2
;; 				write_string msg3, len3
;; 			exit:
;; 				mov eax, SYS_EXIT
;; 				mov ebx, 0
;; 				int 0x80
;; 			section .data
;; 				msg1 db 'Hello, programmers!', 0xA, 0xD
;; 				len1 equ $ - msg1
;; 				msg2 db 'Welcome to the world of, ', 0xA, 0xD
;; 				len2 equ $ - msg2
;; 				msg3 db 'Linux assembly programming!', 0xA, 0xD
;; 				len3 equ $ - msg3
;>

;<
;; Assembly File Management
;; The system considers any input or output data as stream of bytes. There are
;; three standard file streams:
;; . Standard input (stdin)
;; . Standard output (stdout)
;; . Standard error (stderr)
;; File Descriptor
;; A file descriptor is a 16-bit interger assigned to a file as a file id. When a
;; new file is created, or an exiting file is opened, the file descriptor is used
;; for accessing the file.
;; File descriptor of the standard file streams - stdin, stdout and stderr are 0,
;; 1 and 2 respectively.
;; File Pointer
;; A file pointer specifies the location for a subsequent read/write operation in
;; the file in terms of bytes. Each file is considered as a sequence of bytes.
;; Each open file is associated with a file pointer that specifies an offset in
;; bytes, relative to the beginning of the file. When a file is opened, the file
;; pointer is set to zero.
;; File Handling System Calls
;; The following table  briefly describes the system calls related to file
;; handling:
;;---------------------------------------------------------------
;;EAX |    Name   | EBX            | ECX          | EDX          |
;;---------------------------------------------------------------
;; 2  | sys_fork  | struct pt_regs | -            | -            |
;;---------------------------------------------------------------
;; 3  | sys_read  | unsigned int   | char *       | size_t       |
;;---------------------------------------------------------------
;; 4  | sys_write | unsigned int   | const char * | size_t       |
;;---------------------------------------------------------------
;; 5  | sys_open  | const char *   | int          | int          |
;;---------------------------------------------------------------
;; 6  | sys_close | unsigned int   | -            | -            |
;;---------------------------------------------------------------
;; 8  | sys_creat | const char *   | int          | -            |
;;---------------------------------------------------------------
;; 19 | sys_lseek | unsigned int   | off_t        | unsigned int |
;;---------------------------------------------------------------
;; The steps required for using the system calls are same, as we discussed
;; earlier:
;; . Put the system call number in the EAX register.
;; . Store the arguments to the system call in the registers EBX, ECX, etc.
;; . Call the relevant interrupt (80h)
;; . The result is usually returned in the EAX register
;; Creating and Opening a File
;; For creating and opening a file, perform the following tasks:
;; . Put the system call sys_creat() number 8, in the EAX register
;; . Put the filename in the EBX register
;; . Put the file permissions in the ECX register
;; The system call returns the file descriptor of the created file in the EAX
;; register, in case of error, the error code is in the EAX register.
;; Opening an Exixting File
;; For opening an existing file, perform the following tasks:
;; . Put the system call sys_open() number 5, in the EAX register
;; . Put the filename in the EBX register
;; . Put the file access mode in the ECX register
;; . Put the file permissions in the EDX register
;; The system call returns the file descriptor of the created file in the EAX
;; register, in case of error, the error code is in the EAX register.
;; Among the file access modes, most commonly used are: read-only (0), write-only
;; (1), and read-write (2).
;; Reading from a File
;; For reading from a file, perform the following tasks:
;; . Put the system call sys_read() number 3, in the EAX register
;; . Put the file descriptor in the EBX register
;; . Put the pointer to the input buffer in the ECX register
;; . Put the buffer size, i.e., the number of bytes to read, in the EDX register
;; The system call returns the number of bytes read in the EAX register, in case
;; of error, the error code is in the EAX register.
;; Writing to a File
;; For writing to a file, perform the following tasks:
;; . Put the system call sys_write() number 4, in the EAX register
;; . Put the file descriptor in the EBX register
;; . Put the pointer to the output buffer in the ECX register
;; . Put the buffer size, i.e., the number of bytes to write, in the EDX register
;; The system call returns the actual number of bytes written in the EAX register,
;; in case of error, the error code is in the EAX register.
;; Closing a File
;; For closing a fie, perform the following tasks:
;; . Put the system call sys_close() number 6, in the EAX register
;; . Put the file descriptor in the EBX register
;; The system call returns, in case of error, the error code in the EAX register.
;; Updating a File
;; For updating a file, perform following tasks:
;; . Put the system call sys_lseek() number 19, in the EAX register
;; . Put the file descriptor in the EBX register
;; . Put the offset value in the ECX register
;; . Put the reference position for the offset in the EDX registe
;; The reference position could be:
;; . Beginning of file - value 0
;; . Current position - value 1
;; . End of file - value 2
;; The system call returns, in case of error, the error code in the EAX register.
;; Example:
;; The following program creates and open a file named myfile.txt, and writes a
;; text "Welcome to Tutorials Point" in this file. Next the program reads from the
;; file and stores the data into a buffer named info. Lastly it displays the text
;; as stored in info.
;; 		section .text
;; 			global main
;; 		main:
;; 		; create the file
;; 			mov eax, 8
;; 			mov ebx, file_name
;; 			mov ecx, 0777		;read, write and execute by all
;; 			int 0x80
;; 			mov [fd_out], byte eax
;;
;; 		; write into the file
;; 			mov eax, SYS_WRITE
;; 			mov ebx, [fd_out]
;; 			mov ecx, msg
;; 			mov edx, len
;; 			int 0x80
;; 		; close the file
;; 			mov eax, 6
;; 			mov ebx, [fd_out]
;; 		; write the message indicating end of file write
;; 			mov eax, SYS_WRITE
;; 			mov ebx, SSTDOUT
;; 			mov ecx, msg_done
;; 			mov edx, len_done
;; 			int 0x80
;;
;; 		; openthe file for reading
;; 			mov eax, SYS_OPEN
;; 			mov ebx, file_name
;; 			mov ecx, 0			; for read only access
;; 			mov edx, 0777		; read, write and execute by all
;; 			int 0x80
;; 			mov [fd_out], byte eax
;;
;; 		; read from file
;; 			mov eax, SYS_READ
;; 			mov ebx, [fd_in]
;; 			mov ecx, info
;; 			mov edx, 26
;; 			int 0x80
;;
;; 		; close the file
;; 			mov eax, 6
;; 			mov ebx, [fd_in]
;;
;; 		; print the info
;; 			mov eax, SYS_WRITE
;; 			mov ebx, STDOUT
;; 			mov ecx, info
;; 			mov edx, 26
;; 			int 0x80
;;
;; 			mov eax, SYS_EXIT
;; 			mov ebx, 0
;; 			int 0x80
;; 		section .data
;;			file_name db 'myfile.txt'
;;			msg db 'Welcome to Tutorials Point'
;;			len equ $-msg
;;			msg_done db 'Written to file', 0xa
;;			len_done equ $-msg_done
;;		section .bss
;;			fd_out	resb 1
;;			fd_in	resb 1
;;			info	resb 26
