			# This code was produced by the CERI Compiler
.data
FormatStringInt:	.string "%llu\n"	# used by printf to display 64-bit unsigned integers
FormatStringDouble:	.string "%f\n"	# used by printf to display double precision floating point numbers
FormatStringCHAR:	.string "%c\n"	# used by printf to display CHARacters
FormatStringTrue:	.string "TRUE\n"	# used by printf to display the boolean value TRUE
FormatStringFalse:	.string "FALSE\n"	# used by printf to display the boolean value FALSE
a:	.quad 0
b:	.quad 0
c1:	.byte 0
c2:	.byte 0
denum:	.double 0.0
frac:	.double 0.0
num:	.double 0.0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
	# Number : 1
	push $1
	pop a
	# Number : 2
	push $2
	# Number : 3
	push $3
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop b
	push $'x'
	pop c1
	push $'y'
	pop c2
	# Number : 3.14
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $1374389535, (%rsp) 	# Conversion of 3.14 (32 bit high part)
	movl $1074339512, 4(%rsp) 	# Conversion of 3.14 (32 bit low part)
	pop num
	# Number : 2.71
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $2061584302, (%rsp) 	# Conversion of 2.71 (32 bit high part)
	movl $1074114068, 4(%rsp) 	# Conversion of 2.71 (32 bit low part)
	pop denum
	push num
	push denum
	fldl	8(%rsp)	
	fldl	(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	fdivrp	%st(0),%st(1)	# %st(0) <- op1 / op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq $8, %rsp
	pop frac
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push b
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push c1
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push c2
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push num
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	push denum
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	push frac
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	push a
	push b
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jb Vrai9	# If below
	push $0		# False
	jmp Suite9
Vrai9:	push $0xFFFFFFFFFFFFFFFF		# True
Suite9:
	pop %rax
	cmpq $0, %rax
	je ELSE8
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp FINIF8
ELSE8:
	push b
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
FINIF8:
TESTWHILE12:
	push a
	push b
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jb Vrai13	# If below
	push $0		# False
	jmp Suite13
Vrai13:	push $0xFFFFFFFFFFFFFFFF		# True
Suite13:
	pop %rax
	cmpq $0, %rax
	je FINWHILE12
	push a
	# Number : 1
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp TESTWHILE12
FINWHILE12:
	# Number : 0
	push $0
	pop a
DEBUTFOR15:
	# Number : 5
	push $5
	pop %rbx #	 valeur de l'expression
	cmpq %rbx, a
	jae FINFOR15
	push b
	push a
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop b
	push b
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	incq a
	jmp DEBUTFOR15
FINFOR15:
	push num
	push frac
	fldl	8(%rsp)	
	fldl	(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	faddp	%st(0),%st(1)	# %st(0) <- op1 + op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq $8, %rsp
	pop num
	push denum
	push frac
	fldl	(%rsp)	
	fldl	8(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	fsubp	%st(0),%st(1)	# %st(0) <- op1 - op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq	$8, %rsp	# result on stack's top
	pop denum
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
