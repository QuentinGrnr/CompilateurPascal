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
	# Number : 3.14
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $1374389535, (%rsp) 	# Conversion of 3.14 (32 bit high part)
	movl $1074339512, 4(%rsp) 	# Conversion of 3.14 (32 bit low part)
	fldl	(%rsp)	
	fldl	8(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	 addq $16, %rsp	# 2x pop nothing
	fcomip %st(1)		# compare op1 and op2 -> %RFLAGS and pop
	faddp %st(1)	# pop nothing
	jne Vrai1	# If different
	push $0		# False
	jmp Suite1
Vrai1:	push $0xFFFFFFFFFFFFFFFF		# True
Suite1:
	pop b
	push f
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	push b
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai3	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite3
displayVrai3:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite3:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
