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
	movq %rsp, %rbp	# Save the position of the stack's top
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
	push $1
	pop d
TESTFOR5:
	push $2
	pop %rax
	cmpq d, %rax
	jb FINFOR5
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
TESTWHILE6:
	push a
	push $2
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jb Vrai7	# If below
	push $0		# False
	jmp Suite7
Vrai7:	push $0xFFFFFFFFFFFFFFFF		# True
Suite7:
	pop %rax
	cmpq $0, %rax
	je FINWHILE6
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
	jmp TESTWHILE6
FINWHILE6:
	incq d
	jmp TESTFOR5
FINFOR5:
	push a
.cfi_startproc
	endbr64
	pop %rdx    	# The value to be displayed
	movq $FormatString1, %rsi   	# "%llu\n"
	movq $0, %rax    	# No floating point arguments
	movq $0, %rdi    	# No floating point arguments
	call printf   	 # Display the value
.cfi_endproc
	push c
.cfi_startproc
	endbr64
	pop %rdx    	# The value to be displayed
	movq $FormatString1, %rsi   	# "%llu\n"
	movq $0, %rax    	# No floating point arguments
	movq $0, %rdi    	# No floating point arguments
	call printf   	 # Display the value
.cfi_endproc
	push d
.cfi_startproc
	endbr64
	pop %rdx    	# The value to be displayed
	movq $FormatString1, %rsi   	# "%llu\n"
	movq $0, %rax    	# No floating point arguments
	movq $0, %rdi    	# No floating point arguments
	call printf   	 # Display the value
.cfi_endproc
	movq %rbp, %rsp		# Restore the position of the stack's top
	ret			# Return from main function
