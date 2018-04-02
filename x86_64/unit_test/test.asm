%include "unit_test/fail.asm"
%include "unit_test/assert.asm"

section .data
	FAIL db "Fail!!", 10
	FAIL_LEN equ $-FAIL

section .text
	global _start

_start:
	assert_equal 1, 2 
	mov rax, 60
	mov rdi, 0
	syscall
