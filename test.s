			# This code was produced by the CERI Compiler
.data
FormatStringInt:	.string "%llu\n"	# used by printf to display 64-bit unsigned integers
FormatStringDouble:	.string "%f\n"	# used by printf to display double precision floating point numbers
FormatStringChar:	.string "%c\n"	# used by printf to display characters
FormatStringTrue:	.string "TRUE\n"	# used by printf to display the boolean value TRUE
FormatStringFalse:	.string "FALSE\n"	# used by printf to display the boolean value FALSE
b:	.quad 0
z:	.quad 0
a:	.quad 0
c:	.quad 0
d:	.quad 0
f:	.double 0.0
g:	.byte 0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
	subq $8, %rsp
	movl $1374389535, (%rsp)
	movl $1074339512, 4(%rsp)
	pop f
	push f
	pop %rsi   	# The value to be displayed
	movq $FormatStringDouble, %rdi   	# "%f\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
