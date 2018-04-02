%include "print/str.asm"
%ifndef X86_64_UNIT_TEST_FAIL
%define X86_64_UNIT_TEST_FAIL

%macro fail 2
	print_str %1, %2, 2  
	mov rax, 60
	mov rsi, 1 	
	syscall
%endmacro

%endif
