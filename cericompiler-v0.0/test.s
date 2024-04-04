			#This code was produced by the CERI Compiler
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
	movq %rsp, %rbp	# Save the position of the stack's top
8
	push $8
1
	push $1
	pop %rbx
	pop %rax
	subq	%rbx, %rax
	push %rax
9
	push $9
	pop %rbx
	pop %rax
	cmp %rbx, %rax
	pop %rbx
	pop %rax
	cmp %rbx, %rax
	jae Vrai
	Faux : push $0
	jmp FinExp
	Vrai : push $1
	FinExp :
	movq %rbp, %rsp		# Restore the position of the stack's top
	ret			# Return from main function
