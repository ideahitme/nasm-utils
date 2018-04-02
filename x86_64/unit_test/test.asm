%include "fail.asm"

section .data
	FAIL db "Fail!!", 10
	FAIL_LEN equ $-FAIL

section .text
	global _start

_start:
	fail FAIL, FAIL_LEN 
