			# This code was produced by the CERI Compiler
.data
FormatStringInt:	.string "%llu\n"	# used by printf to display 64-bit unsigned integers
FormatStringDouble:	.string "%f\n"	# used by printf to display double precision floating point numbers
FormatStringCHAR:	.string "%c\n"	# used by printf to display CHARacters
FormatStringTrue:	.string "TRUE\n"	# used by printf to display the boolean value TRUE
FormatStringFalse:	.string "FALSE\n"	# used by printf to display the boolean value FALSE
g:	.byte 0
b:	.quad 0
z:	.quad 0
a:	.quad 0
c:	.quad 0
d:	.quad 0
f:	.double 0.0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
	push $'a'
	pop g
	# Number : 3
	push $3
	# Number : 1
	push $1
	pop %rbx
	pop %rax
	subq	%rbx, %rax	# SUB
	push %rax
	pop a
	# Number : 3.14
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $1374389535, (%rsp) 	# Conversion of 3.14 (32 bit high part)
	movl $1074339512, 4(%rsp) 	# Conversion of 3.14 (32 bit low part)
	# Number : 2.0
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 2 (32 bit high part)
	movl $1073741824, 4(%rsp) 	# Conversion of 2 (32 bit low part)
	fldl	8(%rsp)	
	fldl	(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	fdivrp	%st(0),%st(1)	# %st(0) <- op1 / op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq $8, %rsp
	pop f
	# Number : 35155425555555555555555555555555555555524.14
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $728546790, (%rsp) 	# Conversion of 3.51554e+40 (32 bit high part)
	movl $1213846528, 4(%rsp) 	# Conversion of 3.51554e+40 (32 bit low part)
	# Number : 2.51444444444444444444444446
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $209976179, (%rsp) 	# Conversion of 2.51444 (32 bit high part)
	movl $1074011541, 4(%rsp) 	# Conversion of 2.51444 (32 bit low part)
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	ja Vrai1	# If above
	push $0		# False
	jmp Suite1
Vrai1:	push $0xFFFFFFFFFFFFFFFF		# True
Suite1:
	pop b
	push b
	push $0xFFFFFFFFFFFFFFFF
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jne Vrai2	# If different
	push $0		# False
	jmp Suite2
Vrai2:	push $0xFFFFFFFFFFFFFFFF		# True
Suite2:
	pop z
	push g
	push $'p'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je Vrai4	# If equal
	push $0		# False
	jmp Suite4
Vrai4:	push $0xFFFFFFFFFFFFFFFF		# True
Suite4:
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai3	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite3
displayVrai3:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite3:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push g
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
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
	jne displayVrai7	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite7
displayVrai7:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite7:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push z
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai8	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite8
displayVrai8:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite8:
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
