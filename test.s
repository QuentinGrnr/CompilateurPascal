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
test:	.quad 0
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
#-----------------------AssignementStatement0-----------------------#
	push $'f'
	pop c1
#-----------------------AssignementStatement0-----------------------#
	push $'a'
	pop c2
#-----------------------AssignementStatement0-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
	pop num
#-----------------------AssignementStatement0-----------------------#
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
	pop denum
#-----------------------AssignementStatement0-----------------------#
	push num
	push denum
	fldl	8(%rsp)	
	fldl	(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	fdivrp	%st(0),%st(1)	# %st(0) <- op1 / op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq $8, %rsp
	pop frac
#-----------------------AssignementStatement0-----------------------#
	push $1
	pop a
#-----------------------AssignementStatement0-----------------------#
	push $2
	pop c
#-----------------------AssignementStatement0-----------------------#
	push a
	push $3
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	ja Vrai1	# If above
	push $0		# False
	jmp Suite1
Vrai1:	push $0xFFFFFFFFFFFFFFFF		# True
Suite1:
	push c
	push $2
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
	pop %rax
	xorq $0xFFFFFFFFFFFFFFFF, %rax
	push %rax
	pop test
#-----------------------DisplayStatement2-----------------------#
	push test
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai3	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite3
displayVrai3:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite3:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------WhileStatement4-----------------------#
TESTWHILE4:
	push frac
	subq $8, %rsp 	 # allocate 8 bytes on stack's top
	movl $2576980378, (%rsp) 	# Conversion of 0.1 (32 bit high part)
	movl $1069128089, 4(%rsp) 	# Conversion of 0.1 (32 bit low part)
	fldl	(%rsp)	
	fldl	8(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	 addq $16, %rsp	# 2x pop nothing
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	ja Vrai5	# If above
	push $0		# False
	jmp Suite5
Vrai5:	push $0xFFFFFFFFFFFFFFFF		# True
Suite5:
	pop %rax
	cmpq $0, %rax
	je FINWHILE4
#-----------------------BlockStatement5-----------------------#
#-----------------------DisplayStatement5-----------------------#
	push c1
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement5-----------------------#
	push $'='
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement5-----------------------#
	push frac
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement5-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement5-----------------------#
	push c2
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement5-----------------------#
	push $'='
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement5-----------------------#
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement5-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement5-----------------------#
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
#-----------------------AssignementStatement5-----------------------#
	push num
	push denum
	fldl	8(%rsp)	
	fldl	(%rsp)	# first operand -> %st(0) ; second operand -> %st(1)
	fdivrp	%st(0),%st(1)	# %st(0) <- op1 / op2 ; %st(1)=null
	fstpl 8(%rsp)
	addq $8, %rsp
	pop frac
#-----------------------AssignementStatement5-----------------------#
	push a
	push $1
	pop %rbx
	pop %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
#-----------------------DisplayStatement5-----------------------#
	push a
	push $3
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	ja Vrai6	# If above
	push $0		# False
	jmp Suite6
Vrai6:	push $0xFFFFFFFFFFFFFFFF		# True
Suite6:
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai7	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite7
displayVrai7:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite7:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement7-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp TESTWHILE4
FINWHILE4:
#-----------------------ForStatement8-----------------------#
#-----------------------AssignementStatement8-----------------------#
	push $0
	pop b
DEBUTFOR8:
	push $10
	pop %rbx #	 valeur de l'expression
	cmpq %rbx, b
	jae FINFOR8
#-----------------------ForStatement9-----------------------#
#-----------------------AssignementStatement9-----------------------#
	push $10
	pop a
DEBUTFOR9:
	push $1
	pop %rbx #	 valeur de l'expression
	cmpq %rbx, a
	jbe FINFOR9
#-----------------------BlockStatement9-----------------------#
#-----------------------DisplayStatement9-----------------------#
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement9-----------------------#
	push $'*'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement9-----------------------#
	push b
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement9-----------------------#
	push $'='
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement9-----------------------#
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
#-----------------------DisplayStatement9-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	decq a
	jmp DEBUTFOR9
FINFOR9:
	incq b
	jmp DEBUTFOR8
FINFOR8:
#-----------------------CaseStatement10-----------------------#
	push $2
	pop %rbx
	push $1
	pop %rax
	cmpq %rax, %rbx
	je CASEVRAIS11
	jmp ENDCASE11
CASEVRAIS11:
#-----------------------DisplayStatement11-----------------------#
	push $1
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED10
ENDCASE11:
	push $2
	pop %rax
	cmpq %rax, %rbx
	je CASEVRAIS12
	jmp ENDCASE12
CASEVRAIS12:
#-----------------------DisplayStatement12-----------------------#
	push $2
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED10
ENDCASE12:
	push $3
	pop %rax
	cmpq %rax, %rbx
	je CASEVRAIS13
	jmp ENDCASE13
CASEVRAIS13:
#-----------------------DisplayStatement13-----------------------#
	push $3
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED10
ENDCASE13:
	push $4
	pop %rax
	cmpq %rax, %rbx
	je CASEVRAIS14
	jmp ENDCASE14
CASEVRAIS14:
#-----------------------DisplayStatement14-----------------------#
	push $4
	pop %rsi   	# The value to be displayed
	movq $FormatStringInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED10
ENDCASE14:
CASEFINISHED10:
#-----------------------CaseStatement15-----------------------#
	push c1
	pop %rbx
	push $'a'
	pop %rax
	cmpb %al, %bl
	je CASEVRAIS16
	jmp ENDCASE16
CASEVRAIS16:
#-----------------------DisplayStatement16-----------------------#
	push $'a'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED15
ENDCASE16:
	push $'b'
	pop %rax
	cmpb %al, %bl
	je CASEVRAIS17
	jmp ENDCASE17
CASEVRAIS17:
#-----------------------DisplayStatement17-----------------------#
	push $'b'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED15
ENDCASE17:
	push $'d'
	pop %rax
	cmpb %al, %bl
	je CASEVRAIS18
	jmp ENDCASE18
CASEVRAIS18:
#-----------------------DisplayStatement18-----------------------#
	push $'d'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED15
ENDCASE18:
#-----------------------DisplayStatement18-----------------------#
	push $'p'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
CASEFINISHED15:
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
