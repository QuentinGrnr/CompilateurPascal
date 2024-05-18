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
# CaseStatement
	push c1
	push $'a'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS7
	jmp ENDCASE7
CASEVRAIS7:
	push $'a'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE7:
	push $'b'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS8
	jmp ENDCASE8
CASEVRAIS8:
	push $'b'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE8:
	push $'c'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS9
	jmp ENDCASE9
CASEVRAIS9:
	push $'c'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE9:
	push $'d'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS10
	jmp ENDCASE10
CASEVRAIS10:
	push $'d'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE10:
	push $'e'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS11
	jmp ENDCASE11
CASEVRAIS11:
	push $'e'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE11:
	push $'f'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS12
	jmp ENDCASE12
CASEVRAIS12:
	push $'f'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE12:
	push $'g'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS13
	jmp ENDCASE13
CASEVRAIS13:
	push $'g'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE13:
	push $'h'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS14
	jmp ENDCASE14
CASEVRAIS14:
	push $'h'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE14:
	push $'i'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS15
	jmp ENDCASE15
CASEVRAIS15:
	push $'i'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE15:
	push $'j'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS16
	jmp ENDCASE16
CASEVRAIS16:
	push $'j'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE16:
	push $'k'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS17
	jmp ENDCASE17
CASEVRAIS17:
	push $'k'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE17:
	push $'l'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS18
	jmp ENDCASE18
CASEVRAIS18:
	push $'l'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE18:
	push $'m'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS19
	jmp ENDCASE19
CASEVRAIS19:
	push $'m'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE19:
	push $'n'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS20
	jmp ENDCASE20
CASEVRAIS20:
	push $'n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE20:
	push $'o'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS21
	jmp ENDCASE21
CASEVRAIS21:
	push $'o'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE21:
	push $'p'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS22
	jmp ENDCASE22
CASEVRAIS22:
	push $'p'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE22:
	push $'q'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS23
	jmp ENDCASE23
CASEVRAIS23:
	push $'q'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE23:
	push $'r'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS24
	jmp ENDCASE24
CASEVRAIS24:
	push $'r'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE24:
	push $'s'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS25
	jmp ENDCASE25
CASEVRAIS25:
	push $'s'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE25:
	push $'t'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS26
	jmp ENDCASE26
CASEVRAIS26:
	push $'t'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE26:
	push $'u'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS27
	jmp ENDCASE27
CASEVRAIS27:
	push $'u'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE27:
	push $'v'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS28
	jmp ENDCASE28
CASEVRAIS28:
	push $'v'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE28:
	push $'w'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS29
	jmp ENDCASE29
CASEVRAIS29:
	push $'w'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE29:
	push $'x'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS30
	jmp ENDCASE30
CASEVRAIS30:
	push $'x'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE30:
	push $'y'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS31
	jmp ENDCASE31
CASEVRAIS31:
	push $'y'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE31:
	push $'z'
	pop %rax
	pop %rbx
	cmpb %al, %bl
	je CASEVRAIS32
	jmp ENDCASE32
CASEVRAIS32:
	push $'z'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE32:
# CaseStatement
	push $1
	push $1
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	push %rax
	je CASEVRAIS33
	jmp ENDCASE33
CASEVRAIS33:
	push $'1'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE33:
	push $2
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	push %rax
	je CASEVRAIS34
	jmp ENDCASE34
CASEVRAIS34:
	push $'2'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE34:
	push $3
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	push %rax
	je CASEVRAIS35
	jmp ENDCASE35
CASEVRAIS35:
	push $'3'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
ENDCASE35:
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
