NEWLINE equ 10

SYS_WRITE equ 1
; input: 
; -ARG1 pointer to string 
; -ARG2 len of string
%macro print_str 2
	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall 
%endmacro
