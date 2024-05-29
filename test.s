			# This code was produced by the CERI Compiler
.data
FormatStringSignedInt:	.string "%lld\n"	# used by printf to display 64-bit unsigned integers
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
	fldl	8(%rsp)
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
	fldl	8(%rsp)
	fsubp 	%st(0),%st(1)
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
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1.5 (32 bit high part)
	movl $1073217536, 4(%rsp) 	# Conversion of 1.5 (32 bit low part)
	push $2
	fildl (%rsp)	
	fldl	8(%rsp)
	fmulp	%st(0),%st(1)	# %st(0) <- op1 * op2 ; %st(1)=null
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
	push $3
	push $2
	pop %rbx
	pop %rax
	movq $0, %rdx
	div %rbx
	push %rax	# DIV
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
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	push $2
	fildl (%rsp)	
	fldl	8(%rsp)
	fdivp	%st(0),%st(1)
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
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	push $3
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	je Vrai1	# If equal
	push $0		# False
	jmp Suite1
Vrai1:	push $0xFFFFFFFFFFFFFFFF		# True
Suite1:
	pop test
#-----------------------DisplayStatement1-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai2	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite2
displayVrai2:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite2:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	push $3
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	jne Vrai3	# If different
	push $0		# False
	jmp Suite3
Vrai3:	push $0xFFFFFFFFFFFFFFFF		# True
Suite3:
	pop test
#-----------------------DisplayStatement3-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai4	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite4
displayVrai4:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite4:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	push $3
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	jb Vrai5	# If below
	push $0		# False
	jmp Suite5
Vrai5:	push $0xFFFFFFFFFFFFFFFF		# True
Suite5:
	pop test
#-----------------------DisplayStatement5-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai6	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite6
displayVrai6:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite6:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	push $3
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	jbe Vrai7	# If below or equal
	push $0		# False
	jmp Suite7
Vrai7:	push $0xFFFFFFFFFFFFFFFF		# True
Suite7:
	pop test
#-----------------------DisplayStatement7-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai8	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite8
displayVrai8:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite8:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	push $3
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	ja Vrai9	# If above
	push $0		# False
	jmp Suite9
Vrai9:	push $0xFFFFFFFFFFFFFFFF		# True
Suite9:
	pop test
#-----------------------DisplayStatement9-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai10	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite10
displayVrai10:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite10:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	push $3
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	jae Vrai11	# If above or equal
	push $0		# False
	jmp Suite11
Vrai11:	push $0xFFFFFFFFFFFFFFFF		# True
Suite11:
	pop test
#-----------------------DisplayStatement11-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai12	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite12
displayVrai12:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite12:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3.5 (32 bit high part)
	movl $1074528256, 4(%rsp) 	# Conversion of 3.5 (32 bit low part)
	fldl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	jb Vrai13	# If below
	push $0		# False
	jmp Suite13
Vrai13:	push $0xFFFFFFFFFFFFFFFF		# True
Suite13:
	pop test
#-----------------------DisplayStatement13-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai14	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite14
displayVrai14:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite14:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 8 (32 bit high part)
	movl $1075838976, 4(%rsp) 	# Conversion of 8 (32 bit low part)
	fldl	(%rsp)	
	fldl	8(%rsp)
	fsubp 	%st(0),%st(1)
	fstpl 8(%rsp)
	addq	$8, %rsp	# result on stack's top
	pop num
#-----------------------AssignementStatement-----------------------#
	push num
	push $0
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	ja Vrai15	# If above
	push $0		# False
	jmp Suite15
Vrai15:	push $0xFFFFFFFFFFFFFFFF		# True
Suite15:
	pop test
#-----------------------DisplayStatement15-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai16	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite16
displayVrai16:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite16:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
