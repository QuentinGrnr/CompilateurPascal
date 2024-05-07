			# This code was produced by the CERI Compiler
.data
FormatString1:	.string "%llu\n"	# used by printf to display 64-bit unsigned integers
TrueString:	.string "TRUE\n"	# used by printf to display the boolean value TRUE
FalseString:	.string "FALSE\n"	# used by printf to display the boolean value FALSE
b:	.quad 0
z:	.quad 0
a:	.quad 0
c:	.quad 0
d:	.quad 0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
	push $8
	push $3
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	je Vrai1	# If equal
	push $0		# False
	jmp Suite1
Vrai1:	push $0xFFFFFFFFFFFFFFFF		# True
Suite1:
	push $4
	push $2
	push $2
	pop %rbx
	pop %rax
	mulq	%rbx
	push %rax	# MUL
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	je Vrai2	# If equal
	push $0		# False
	jmp Suite2
Vrai2:	push $0xFFFFFFFFFFFFFFFF		# True
Suite2:
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# OR
	push %rax
	pop z
	push $5
	push $65
	pop %rbx
	pop %rax
	movq $0, %rdx
	div %rbx
	push %rax	# DIV
	push $2
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	push $7
	push $5
	pop %rbx
	pop %rax
	movq $0, %rdx
	div %rbx
	push %rdx	# MOD
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jb Vrai3	# If below
	push $0		# False
	jmp Suite3
Vrai3:	push $0xFFFFFFFFFFFFFFFF		# True
Suite3:
	pop b
	push $0
	pop a
	push z
	pop %rax
	cmpq $0, %rax
	je ELSE4
	push $1
	pop a
	push $3
	pop c
	jmp FINIF4
ELSE4:
	push $3
	pop a
	push $4
	pop c
FINIF4:
	push a
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
	push c
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop c
TESTWHILE5:
	push a
	push $2
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jb Vrai6	# If below
	push $0		# False
	jmp Suite6
Vrai6:	push $0xFFFFFFFFFFFFFFFF		# True
Suite6:
	pop %rax
	cmpq $0, %rax
	je FINWHILE5
	push a
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
	push c
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop c
	jmp TESTWHILE5
FINWHILE5:
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatString1, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push c
	pop %rsi   	# The value to be displayed
	movq $FormatString1, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push d
	pop %rsi   	# The value to be displayed
	movq $FormatString1, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
