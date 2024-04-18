			# This code was produced by the CERI Compiler
	.data
	.align 8
a:	.quad 0
b:	.quad 0
c:	.quad 0
z:	.quad 0
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
	push $2
	pop b
	jmp FINIF4
ELSE4:
	push $3
	pop a
	push $4
	pop b
FINIF4:
	push $1
	pop c
TESTFOR5:
	push $2
	pop %rax
	cmpq c, %rax
	jb FINFOR5
	push a
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
	push b
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop b
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
	push b
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop b
	jmp TESTWHILE6
FINWHILE6:
	incq c
	jmp TESTFOR5
FINFOR5:
	movq %rbp, %rsp		# Restore the position of the stack's top
	ret			# Return from main function
