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
	# Number : 3.14
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $1374389535, (%rsp) 	# Conversion of 3.14 (32 bit high part)
	movl $1074339512, 4(%rsp) 	# Conversion of 3.14 (32 bit low part)
	pop f
	push f
	movsd	(%rsp), %xmm0   	# The value to be displayed
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
nop   	# Align the stack's top on 16 bytes boundary
	add $24, %rsp   	# pop nothing
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
