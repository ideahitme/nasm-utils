%ifndef X86_64_UNIT_TEST_ASSERT_EQUAL
%define X86_64_UNIT_TEST_ASSERT

%include "unit_test/fail.asm"
%include "print/str.asm"
;%include "../print/int.asm"

section .data
	ASSERT_EQUAL_FAIL_MSG db "Values not equal", 10  ; (TODO): interpolate the string 
	ASSERT_EQUAL_FAIL_MSG_LEN equ $-ASSERT_EQUAL_FAIL_MSG
	ASSERT_EQUAL_SUCCESS_MSG db "Values are equal", 10 
	ASSERT_EQUAL_SUCCESS_MSG_LEN equ $-ASSERT_EQUAL_SUCCESS_MSG
	

%macro assert_equal 2
	mov rax, %1
	mov rbx, %2
	cmp rax, rbx
	je %%exit 
	fail ASSERT_EQUAL_FAIL_MSG, ASSERT_EQUAL_FAIL_MSG_LEN
%%exit: 
	;print_int ASSERT_EQUAL_SUCCESS_MSG_LEN	
	print_str ASSERT_EQUAL_SUCCESS_MSG, ASSERT_EQUAL_SUCCESS_MSG_LEN, 0
%endmacro
%endif
