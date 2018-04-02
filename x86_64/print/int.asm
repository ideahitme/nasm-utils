%include "str.asm"

section .bss
	printData resb 100
	printDataPtr resb 8
; macro to print integer to stdout 
%macro print_int 1 
	mov rax, %1
	mov rbx, NEWLINE
	mov rcx, printData
	mov [rcx], rbx
	inc rcx
	mov [printDataPtr], rcx ; printData: \n......

%%div_ten: 
	mov rdx, 0
	mov rbx, 10
	div rbx
	push rax
	add rdx, '0'
	mov rcx, [printDataPtr]
	mov [rcx], rdx
	inc rcx
	mov [printDataPtr], rcx	
	pop rax
	cmp rax, 0
	jne %%div_ten

%%print_reverse:
	mov rcx, [printDataPtr]
	print_str rcx, 1, 1
	mov rcx, [printDataPtr] ; something is wrong here 
	dec rcx
	mov [printDataPtr], rcx
	cmp rcx, printData
	jge %%print_reverse
%endmacro 

