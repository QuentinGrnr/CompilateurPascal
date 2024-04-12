			# This code was produced by the CERI Compiler
	.data
	.align 8
a:	.quad 0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
	movq %rsp, %rbp	# Save the position of the stack's top
	push $1
	pop a
Suite1:
	push $5
	pop %rax
	pop %rbx
	cmpq %rbx, %rax
	jg Suite2
	push a
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
	jmp Suite1
Suite2:
	movq %rbp, %rsp		# Restore the position of the stack's top
	ret			# Return from main function
