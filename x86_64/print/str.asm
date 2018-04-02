%ifndef X86_64_PRINT_STR
%define X86_64_PRINT_STR 
	NEWLINE equ 10
	SYS_WRITE equ 1
; input: 
; -ARG1 pointer to string 
; -ARG2 len of string
%macro print_str 3 
	mov rax, SYS_WRITE
	mov rdi, %3
	mov rsi, %1
	mov rdx, %2
	syscall 
%endmacro
%endif
