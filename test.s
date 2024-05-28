			# This code was produced by the CERI Compiler
.data
FormatStringInt:	.string "%llu\n"	# used by printf to display 64-bit unsigned integers
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
	fldl 8(%rsp)	
	faddp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	pop intD
#-----------------------DisplayStatement0-----------------------#
	push intD
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	push $9
	push intD
	fldl (%rsp)	
	fildl 8(%rsp)	
	fsubp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	pop intD
#-----------------------AssignementStatement-----------------------#
	push intD
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 10.5 (32 bit high part)
	movl $1076166656, 4(%rsp) 	# Conversion of 10.5 (32 bit low part)
	fldl	(%rsp)	
	fldl	8(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	fsubp	%st(0),%st(1)	# %st(0) <- op1 - op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq	$8, %rsp	# result on stack's top
	pop intD
#-----------------------DisplayStatement0-----------------------#
	push intD
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
