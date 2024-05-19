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
num:	.double 0.0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
	push $'f'
	pop c1
	push $'a'
	pop c2
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
	pop num
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
	pop denum
	push num
	push denum
	fldl	8(%rsp)	
	fldl	(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	fdivrp	%st(0),%st(1)	# %st(0) <- op1 / op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq $8, %rsp
	pop frac
	push $1
	pop a
	push $2
	pop c
TESTWHILE1:
	push frac
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $2576980378, (%rsp) 	# Conversion of 0.1 (32 bit high part)
	movl $1069128089, 4(%rsp) 	# Conversion of 0.1 (32 bit low part)
	fldl	(%rsp)	
	fldl	8(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	 addq $16, %rsp	# 2x pop nothing
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	ja Vrai2	# If above
	push $0		# False
	jmp Suite2
Vrai2:	push $0xFFFFFFFFFFFFFFFF		# True
Suite2:
	pop %rax
	cmpq $0, %rax
	je FINWHILE1
	push c1
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push $'='
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push frac
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push c2
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push $'='
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push denum
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
	fldl	8(%rsp)	
	fldl	(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	faddp	%st(0),%st(1)	# %st(0) <- op1 + op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq $8, %rsp
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
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
	push a
	push $3
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	ja Vrai3	# If above
	push $0		# False
	jmp Suite3
Vrai3:	push $0xFFFFFFFFFFFFFFFF		# True
Suite3:
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai4	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite4
displayVrai4:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite4:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp TESTWHILE1
FINWHILE1:
	push $0
	pop b
DEBUTFOR5:
	push $10
	pop %rbx #	 valeur de l'expression
	cmpq %rbx, b
	jae FINFOR5
	push $10
	pop a
DEBUTFOR6:
	push $1
	pop %rbx #	 valeur de l'expression
	cmpq %rbx, a
	jbe FINFOR6
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push $'*'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push b
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push $'='
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push a
	push b
	pop %rbx
	pop %rax
	mulq	%rbx
	push %rax	# MUL
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	decq a
	jmp DEBUTFOR6
FINFOR6:
	incq b
	jmp DEBUTFOR5
FINFOR5:
#-----------------------CaseStatement7-----------------------#
	push c
	pop %rbx
	push $1
	pop %rax
	cmpq %rax, %rbx
	je CASEVRAIS8
	jmp ENDCASE8
CASEVRAIS8:
	push $1
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED7
ENDCASE8:
	push $2
	pop %rax
	cmpq %rax, %rbx
	je CASEVRAIS9
	jmp ENDCASE9
CASEVRAIS9:
	push $2
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED7
ENDCASE9:
	push $3
	pop %rax
	cmpq %rax, %rbx
	je CASEVRAIS10
	jmp ENDCASE10
CASEVRAIS10:
	push $3
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED7
ENDCASE10:
	push $4
	pop %rax
	cmpq %rax, %rbx
	je CASEVRAIS11
	jmp ENDCASE11
CASEVRAIS11:
	push $4
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED7
ENDCASE11:
CASEFINISHED7:
#-----------------------EndCaseStatement7-----------------------#
#-----------------------CaseStatement12-----------------------#
	push c1
	pop %rbx
	push $'a'
	pop %rax
	cmpb %al, %bl
	je CASEVRAIS13
	jmp ENDCASE13
CASEVRAIS13:
	push $'a'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED12
ENDCASE13:
	push $'b'
	pop %rax
	cmpb %al, %bl
	je CASEVRAIS14
	jmp ENDCASE14
CASEVRAIS14:
	push $'b'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED12
ENDCASE14:
	push $'d'
	pop %rax
	cmpb %al, %bl
	je CASEVRAIS15
	jmp ENDCASE15
CASEVRAIS15:
	push $'d'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED12
ENDCASE15:
	push $'p'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
CASEFINISHED12:
#-----------------------EndCaseStatement12-----------------------#
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
