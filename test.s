			# This code was produced by the CERI Compiler
.data
FormatStringSignedInt:	.string "%lld\n"	# used by printf to display 64-bit unsigned integers
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
intD:	.double 0.0
num:	.double 0.0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
#-----------------------BlockStatement0-----------------------#
#-----------------------AssignementStatement-----------------------#
	push $1
	pop a
#-----------------------AssignementStatement-----------------------#
	push $2
	push $3
	popq %rbx
	popq %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop b
#-----------------------AssignementStatement-----------------------#
	push $'x'
	pop c1
#-----------------------AssignementStatement-----------------------#
	push $'y'
	pop c2
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $1374389535, (%rsp) 	# Conversion of 3.14 (32 bit high part)
	movl $1074339512, 4(%rsp) 	# Conversion of 3.14 (32 bit low part)
	pop num
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $2061584302, (%rsp) 	# Conversion of 2.71 (32 bit high part)
	movl $1074114068, 4(%rsp) 	# Conversion of 2.71 (32 bit low part)
	pop denum
#-----------------------AssignementStatement-----------------------#
	push num
	push denum
	fldl	(%rsp)	
	fldl	8(%rsp)
	fdivp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	pop frac
#-----------------------DisplayStatement0-----------------------#
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement0-----------------------#
	push b
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement0-----------------------#
	push c1
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement0-----------------------#
	push c2
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement0-----------------------#
	push num
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement0-----------------------#
	push denum
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement0-----------------------#
	push frac
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------IfStatement1-----------------------#
	push a
	push b
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jb Vrai2	# If below
	push $0		# False
	jmp Suite2
Vrai2:	push $0xFFFFFFFFFFFFFFFF		# True
Suite2:
	pop %rax
	cmpq $0, %rax
	je ELSE1
#-----------------------DisplayStatement2-----------------------#
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp FINIF1
ELSE1:
#-----------------------DisplayStatement2-----------------------#
	push b
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
FINIF1:
#-----------------------WhileStatement3-----------------------#
TESTWHILE3:
	push a
	push b
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jb Vrai4	# If below
	push $0		# False
	jmp Suite4
Vrai4:	push $0xFFFFFFFFFFFFFFFF		# True
Suite4:
	pop %rax
	cmpq $0, %rax
	je FINWHILE3
#-----------------------BlockStatement4-----------------------#
#-----------------------AssignementStatement-----------------------#
	push a
	push $1
	popq %rbx
	popq %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
#-----------------------DisplayStatement4-----------------------#
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp TESTWHILE3
FINWHILE3:
#-----------------------ForStatement5-----------------------#
#-----------------------AssignementStatement-----------------------#
	push $0
	pop a
DEBUTFOR5:
	push $5
	pop %rbx #	 valeur de l'expression
	cmpq %rbx, a
	jae FINFOR5
#-----------------------BlockStatement5-----------------------#
#-----------------------AssignementStatement-----------------------#
	push b
	push a
	popq %rbx
	popq %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop b
#-----------------------DisplayStatement5-----------------------#
	push b
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	incq a
	jmp DEBUTFOR5
FINFOR5:
#-----------------------BlockStatement5-----------------------#
#-----------------------AssignementStatement-----------------------#
	push num
	push frac
	fldl	(%rsp)	
	fldl	8(%rsp)
	faddp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	pop num
#-----------------------AssignementStatement-----------------------#
	push denum
	push frac
	fldl	(%rsp)	
	fldl	8(%rsp)
	fsubp 	%st(0),%st(1)
	fstpl 8(%rsp)
	addq	$8, %rsp	# result on stack's top
	pop denum
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
#-----------------------CaseStatement6-----------------------#
	push intD
	fldl (%rsp)
	addq $8, %rsp
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1.5 (32 bit high part)
	movl $1073217536, 4(%rsp) 	# Conversion of 1.5 (32 bit low part)
	fldl (%rsp)
	fucomip %st(1), %st(0)
	je CASEVRAIS7
	addq $8, %rsp
	jmp ENDCASE7
CASEVRAIS7:
	addq $8, %rsp
#-----------------------DisplayStatement7-----------------------#
	push $1
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED6
ENDCASE7:
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 2.5 (32 bit high part)
	movl $1074003968, 4(%rsp) 	# Conversion of 2.5 (32 bit low part)
	fldl (%rsp)
	fucomip %st(1), %st(0)
	je CASEVRAIS8
	addq $8, %rsp
	jmp ENDCASE8
CASEVRAIS8:
	addq $8, %rsp
#-----------------------DisplayStatement8-----------------------#
	push $2
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED6
ENDCASE8:
#-----------------------DisplayStatement8-----------------------#
	push $4
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
CASEFINISHED6:
#-----------------------CaseStatement9-----------------------#
	push intD
	fldl (%rsp)
	addq $8, %rsp
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1.5 (32 bit high part)
	movl $1073217536, 4(%rsp) 	# Conversion of 1.5 (32 bit low part)
	fldl (%rsp)
	fucomip %st(1), %st(0)
	je CASEVRAIS10
	addq $8, %rsp
	jmp ENDCASE10
CASEVRAIS10:
	addq $8, %rsp
#-----------------------DisplayStatement10-----------------------#
	push $1
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED9
ENDCASE10:
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 2.5 (32 bit high part)
	movl $1074003968, 4(%rsp) 	# Conversion of 2.5 (32 bit low part)
	fldl (%rsp)
	fucomip %st(1), %st(0)
	je CASEVRAIS11
	addq $8, %rsp
	jmp ENDCASE11
CASEVRAIS11:
	addq $8, %rsp
#-----------------------DisplayStatement11-----------------------#
	push $2
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED9
ENDCASE11:
#-----------------------DisplayStatement11-----------------------#
	push $4
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
CASEFINISHED9:
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
