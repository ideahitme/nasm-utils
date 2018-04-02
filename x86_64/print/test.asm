%include "print/int.asm"
%include "print/str.asm"

%macro exit 0
	mov rax, 60
	mov rdi, 0
	syscall
%endmacro

section .text
	global _start

_start: 
	print_int 1337
	exit	
