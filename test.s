			# This code was produced by the CERI Compiler
.data
FormatStringSignedInt:	.string "%lld\n"	# used by printf to display 64-bit unsigned integers
FormatStringDouble:	.string "%f\n"	# used by printf to display double precision floating point numbers
FormatStringCHAR:	.string "%c\n"	# used by printf to display CHARacters
FormatStringTrue:	.string "TRUE\n"	# used by printf to display the boolean value TRUE
FormatStringFalse:	.string "FALSE\n"	# used by printf to display the boolean value FALSE
a:	.quad 0
b:	.quad 0
c:	.quad 0
c1:	.byte 0
c2:	.byte 0
denum:	.double 0.0
frac:	.double 0.0
intD:	.double 0.0
num:	.double 0.0
test:	.quad 0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1.5 (32 bit high part)
	movl $1073217536, 4(%rsp) 	# Conversion of 1.5 (32 bit low part)
	push $1
	fildl (%rsp)	
	fldl	8(%rsp)
	faddp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	pop intD
#-----------------------CaseStatement1-----------------------#
	push intD
	movsd %xmm0, (%rsp)	
	pop %rbx
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1.5 (32 bit high part)
	movl $1073217536, 4(%rsp) 	# Conversion of 1.5 (32 bit low part)
	movsd %xmm0, (%rsp)
	addq $8, %rsp
	movsd %xmm1, (%rsp)
	addq $8, %rsp
	ucomisd %xmm0, %xmm1
	je CASEVRAIS2
	jmp ENDCASE2
CASEVRAIS2:
#-----------------------DisplayStatement2-----------------------#
	push $1
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED1
ENDCASE2:
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 2.5 (32 bit high part)
	movl $1074003968, 4(%rsp) 	# Conversion of 2.5 (32 bit low part)
	movsd %xmm0, (%rsp)
	addq $8, %rsp
	movsd %xmm1, (%rsp)
	addq $8, %rsp
	ucomisd %xmm0, %xmm1
	je CASEVRAIS3
	jmp ENDCASE3
CASEVRAIS3:
#-----------------------DisplayStatement3-----------------------#
	push $2
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED1
ENDCASE3:
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3.5 (32 bit high part)
	movl $1074528256, 4(%rsp) 	# Conversion of 3.5 (32 bit low part)
	movsd %xmm0, (%rsp)
	addq $8, %rsp
	movsd %xmm1, (%rsp)
	addq $8, %rsp
	ucomisd %xmm0, %xmm1
	je CASEVRAIS4
	jmp ENDCASE4
CASEVRAIS4:
#-----------------------DisplayStatement4-----------------------#
	push $3
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED1
ENDCASE4:
#-----------------------DisplayStatement4-----------------------#
	push $4
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
CASEFINISHED1:
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
