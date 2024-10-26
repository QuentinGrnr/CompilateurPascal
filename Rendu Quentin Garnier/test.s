			# This code was produced by the CERI Compiler
.data
FormatStringSignedInt:	.string "%lld\n"	# used by printf to display 64-bit unsigned integers
FormatStringDouble:	.string "%f\n"	# used by printf to display double precision floating point numbers
FormatStringCHAR:	.string "%c\n"	# used by printf to display CHARacters
FormatStringTrue:	.string "TRUE\n"	# used by printf to display the boolean value TRUE
FormatStringFalse:	.string "FALSE\n"	# used by printf to display the boolean value FALSE
FormatStringString:	.string "%s\n"	# used by printf to display strings
a:	.quad 0
b:	.quad 0
c:	.quad 0
c1:	.byte 0
c2:	.byte 0
denum:	.double 0.0
frac:	.double 0.0
intD:	.double 0.0
num:	.double 0.0
boolVal:	.quad 0
text:	.string ""
	.text		# The following lines contain the program
	.globl main	# The main function must be visible from outside
main:			# The main function body :
.cfi_startproc
endbr64
	pushq %rbp 	# Save the position of the stack's top
#-----------------------DisplayStatement0-----------------------#
	mov $15, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $72, %al
	movb %al, 1(%rbx)
	movb $101, %al
	movb %al, 2(%rbx)
	movb $108, %al
	movb %al, 3(%rbx)
	movb $108, %al
	movb %al, 4(%rbx)
	movb $111, %al
	movb %al, 5(%rbx)
	movb $32, %al
	movb %al, 6(%rbx)
	movb $87, %al
	movb %al, 7(%rbx)
	movb $111, %al
	movb %al, 8(%rbx)
	movb $114, %al
	movb %al, 9(%rbx)
	movb $108, %al
	movb %al, 10(%rbx)
	movb $100, %al
	movb %al, 11(%rbx)
	movb $33, %al
	movb %al, 12(%rbx)
	movb $34, %al
	movb %al, 13(%rbx)
	movb $0, %al
	movb %al, 14(%rbx)
	movb $0, %al
	movb %al, 14(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	push $'f'
	pop c1
#-----------------------AssignementStatement-----------------------#
	push $'a'
	pop c2
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
	pop num
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
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
#-----------------------AssignementStatement-----------------------#
	push $1
	pop a
#-----------------------AssignementStatement-----------------------#
	push $2
	pop c
#-----------------------DisplayStatement0-----------------------#
	mov $21, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $84, %al
	movb %al, 1(%rbx)
	movb $101, %al
	movb %al, 2(%rbx)
	movb $115, %al
	movb %al, 3(%rbx)
	movb $116, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $100, %al
	movb %al, 6(%rbx)
	movb $101, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $98, %al
	movb %al, 9(%rbx)
	movb $111, %al
	movb %al, 10(%rbx)
	movb $111, %al
	movb %al, 11(%rbx)
	movb $108, %al
	movb %al, 12(%rbx)
	movb $101, %al
	movb %al, 13(%rbx)
	movb $101, %al
	movb %al, 14(%rbx)
	movb $110, %al
	movb %al, 15(%rbx)
	movb $115, %al
	movb %al, 16(%rbx)
	movb $32, %al
	movb %al, 17(%rbx)
	movb $58, %al
	movb %al, 18(%rbx)
	movb $34, %al
	movb %al, 19(%rbx)
	movb $0, %al
	movb %al, 20(%rbx)
	movb $0, %al
	movb %al, 20(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement0-----------------------#
	mov $45, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $33, %al
	movb %al, 1(%rbx)
	movb $40, %al
	movb %al, 2(%rbx)
	movb $40, %al
	movb %al, 3(%rbx)
	movb $97, %al
	movb %al, 4(%rbx)
	movb $62, %al
	movb %al, 5(%rbx)
	movb $51, %al
	movb %al, 6(%rbx)
	movb $41, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $124, %al
	movb %al, 9(%rbx)
	movb $124, %al
	movb %al, 10(%rbx)
	movb $32, %al
	movb %al, 11(%rbx)
	movb $40, %al
	movb %al, 12(%rbx)
	movb $99, %al
	movb %al, 13(%rbx)
	movb $61, %al
	movb %al, 14(%rbx)
	movb $61, %al
	movb %al, 15(%rbx)
	movb $50, %al
	movb %al, 16(%rbx)
	movb $41, %al
	movb %al, 17(%rbx)
	movb $41, %al
	movb %al, 18(%rbx)
	movb $32, %al
	movb %al, 19(%rbx)
	movb $112, %al
	movb %al, 20(%rbx)
	movb $111, %al
	movb %al, 21(%rbx)
	movb $117, %al
	movb %al, 22(%rbx)
	movb $114, %al
	movb %al, 23(%rbx)
	movb $32, %al
	movb %al, 24(%rbx)
	movb $97, %al
	movb %al, 25(%rbx)
	movb $32, %al
	movb %al, 26(%rbx)
	movb $61, %al
	movb %al, 27(%rbx)
	movb $49, %al
	movb %al, 28(%rbx)
	movb $32, %al
	movb %al, 29(%rbx)
	movb $101, %al
	movb %al, 30(%rbx)
	movb $116, %al
	movb %al, 31(%rbx)
	movb $32, %al
	movb %al, 32(%rbx)
	movb $99, %al
	movb %al, 33(%rbx)
	movb $61, %al
	movb %al, 34(%rbx)
	movb $50, %al
	movb %al, 35(%rbx)
	movb $32, %al
	movb %al, 36(%rbx)
	movb $100, %al
	movb %al, 37(%rbx)
	movb $111, %al
	movb %al, 38(%rbx)
	movb $110, %al
	movb %al, 39(%rbx)
	movb $110, %al
	movb %al, 40(%rbx)
	movb $101, %al
	movb %al, 41(%rbx)
	movb $32, %al
	movb %al, 42(%rbx)
	movb $34, %al
	movb %al, 43(%rbx)
	movb $0, %al
	movb %al, 44(%rbx)
	movb $0, %al
	movb %al, 44(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
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
	popq %rbx
	popq %rax
	addq	%rbx, %rax	# OR
	push %rax
	pop %rax
	xorq $0xFFFFFFFFFFFFFFFF, %rax
	push %rax
	pop boolVal
#-----------------------DisplayStatement2-----------------------#
	push boolVal
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai3	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite3
displayVrai3:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite3:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement3-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement3-----------------------#
	mov $40, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $116, %al
	movb %al, 1(%rbx)
	movb $101, %al
	movb %al, 2(%rbx)
	movb $115, %al
	movb %al, 3(%rbx)
	movb $116, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $83, %al
	movb %al, 6(%rbx)
	movb $116, %al
	movb %al, 7(%rbx)
	movb $97, %al
	movb %al, 8(%rbx)
	movb $116, %al
	movb %al, 9(%rbx)
	movb $101, %al
	movb %al, 10(%rbx)
	movb $109, %al
	movb %al, 11(%rbx)
	movb $101, %al
	movb %al, 12(%rbx)
	movb $110, %al
	movb %al, 13(%rbx)
	movb $116, %al
	movb %al, 14(%rbx)
	movb $115, %al
	movb %al, 15(%rbx)
	movb $32, %al
	movb %al, 16(%rbx)
	movb $105, %al
	movb %al, 17(%rbx)
	movb $109, %al
	movb %al, 18(%rbx)
	movb $98, %al
	movb %al, 19(%rbx)
	movb $114, %al
	movb %al, 20(%rbx)
	movb $105, %al
	movb %al, 21(%rbx)
	movb $113, %al
	movb %al, 22(%rbx)
	movb $117, %al
	movb %al, 23(%rbx)
	movb $-61, %al
	movb %al, 24(%rbx)
	movb $-87, %al
	movb %al, 25(%rbx)
	movb $115, %al
	movb %al, 26(%rbx)
	movb $32, %al
	movb %al, 27(%rbx)
	movb $99, %al
	movb %al, 28(%rbx)
	movb $111, %al
	movb %al, 29(%rbx)
	movb $109, %al
	movb %al, 30(%rbx)
	movb $112, %al
	movb %al, 31(%rbx)
	movb $108, %al
	movb %al, 32(%rbx)
	movb $101, %al
	movb %al, 33(%rbx)
	movb $120, %al
	movb %al, 34(%rbx)
	movb $101, %al
	movb %al, 35(%rbx)
	movb $32, %al
	movb %al, 36(%rbx)
	movb $58, %al
	movb %al, 37(%rbx)
	movb $34, %al
	movb %al, 38(%rbx)
	movb $0, %al
	movb %al, 39(%rbx)
	movb $0, %al
	movb %al, 39(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement3-----------------------#
	mov $71, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $73, %al
	movb %al, 1(%rbx)
	movb $102, %al
	movb %al, 2(%rbx)
	movb $32, %al
	movb %al, 3(%rbx)
	movb $97, %al
	movb %al, 4(%rbx)
	movb $62, %al
	movb %al, 5(%rbx)
	movb $51, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $101, %al
	movb %al, 8(%rbx)
	movb $116, %al
	movb %al, 9(%rbx)
	movb $32, %al
	movb %al, 10(%rbx)
	movb $99, %al
	movb %al, 11(%rbx)
	movb $61, %al
	movb %al, 12(%rbx)
	movb $61, %al
	movb %al, 13(%rbx)
	movb $50, %al
	movb %al, 14(%rbx)
	movb $32, %al
	movb %al, 15(%rbx)
	movb $97, %al
	movb %al, 16(%rbx)
	movb $108, %al
	movb %al, 17(%rbx)
	movb $111, %al
	movb %al, 18(%rbx)
	movb $114, %al
	movb %al, 19(%rbx)
	movb $115, %al
	movb %al, 20(%rbx)
	movb $32, %al
	movb %al, 21(%rbx)
	movb $97, %al
	movb %al, 22(%rbx)
	movb $102, %al
	movb %al, 23(%rbx)
	movb $102, %al
	movb %al, 24(%rbx)
	movb $105, %al
	movb %al, 25(%rbx)
	movb $99, %al
	movb %al, 26(%rbx)
	movb $104, %al
	movb %al, 27(%rbx)
	movb $101, %al
	movb %al, 28(%rbx)
	movb $114, %al
	movb %al, 29(%rbx)
	movb $32, %al
	movb %al, 30(%rbx)
	movb $97, %al
	movb %al, 31(%rbx)
	movb $62, %al
	movb %al, 32(%rbx)
	movb $51, %al
	movb %al, 33(%rbx)
	movb $32, %al
	movb %al, 34(%rbx)
	movb $101, %al
	movb %al, 35(%rbx)
	movb $116, %al
	movb %al, 36(%rbx)
	movb $32, %al
	movb %al, 37(%rbx)
	movb $99, %al
	movb %al, 38(%rbx)
	movb $61, %al
	movb %al, 39(%rbx)
	movb $61, %al
	movb %al, 40(%rbx)
	movb $50, %al
	movb %al, 41(%rbx)
	movb $32, %al
	movb %al, 42(%rbx)
	movb $115, %al
	movb %al, 43(%rbx)
	movb $105, %al
	movb %al, 44(%rbx)
	movb $110, %al
	movb %al, 45(%rbx)
	movb $111, %al
	movb %al, 46(%rbx)
	movb $110, %al
	movb %al, 47(%rbx)
	movb $32, %al
	movb %al, 48(%rbx)
	movb $97, %al
	movb %al, 49(%rbx)
	movb $102, %al
	movb %al, 50(%rbx)
	movb $102, %al
	movb %al, 51(%rbx)
	movb $105, %al
	movb %al, 52(%rbx)
	movb $99, %al
	movb %al, 53(%rbx)
	movb $104, %al
	movb %al, 54(%rbx)
	movb $101, %al
	movb %al, 55(%rbx)
	movb $114, %al
	movb %al, 56(%rbx)
	movb $32, %al
	movb %al, 57(%rbx)
	movb $97, %al
	movb %al, 58(%rbx)
	movb $62, %al
	movb %al, 59(%rbx)
	movb $51, %al
	movb %al, 60(%rbx)
	movb $32, %al
	movb %al, 61(%rbx)
	movb $101, %al
	movb %al, 62(%rbx)
	movb $116, %al
	movb %al, 63(%rbx)
	movb $32, %al
	movb %al, 64(%rbx)
	movb $99, %al
	movb %al, 65(%rbx)
	movb $33, %al
	movb %al, 66(%rbx)
	movb $61, %al
	movb %al, 67(%rbx)
	movb $50, %al
	movb %al, 68(%rbx)
	movb $34, %al
	movb %al, 69(%rbx)
	movb $0, %al
	movb %al, 70(%rbx)
	movb $0, %al
	movb %al, 70(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------IfStatement4-----------------------#
	push a
	push $3
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	ja Vrai5	# If above
	push $0		# False
	jmp Suite5
Vrai5:	push $0xFFFFFFFFFFFFFFFF		# True
Suite5:
	pop %rax
	cmpq $0, %rax
	je ELSE4
#-----------------------BlockStatement5-----------------------#
#-----------------------IfStatement6-----------------------#
	push c
	push $2
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	je Vrai7	# If equal
	push $0		# False
	jmp Suite7
Vrai7:	push $0xFFFFFFFFFFFFFFFF		# True
Suite7:
	pop %rax
	cmpq $0, %rax
	je ELSE6
#-----------------------DisplayStatement7-----------------------#
	mov $14, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $97, %al
	movb %al, 1(%rbx)
	movb $62, %al
	movb %al, 2(%rbx)
	movb $51, %al
	movb %al, 3(%rbx)
	movb $32, %al
	movb %al, 4(%rbx)
	movb $101, %al
	movb %al, 5(%rbx)
	movb $116, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $99, %al
	movb %al, 8(%rbx)
	movb $61, %al
	movb %al, 9(%rbx)
	movb $61, %al
	movb %al, 10(%rbx)
	movb $50, %al
	movb %al, 11(%rbx)
	movb $34, %al
	movb %al, 12(%rbx)
	movb $0, %al
	movb %al, 13(%rbx)
	movb $0, %al
	movb %al, 13(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp FINIF6
ELSE6:
#-----------------------DisplayStatement7-----------------------#
	mov $14, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $97, %al
	movb %al, 1(%rbx)
	movb $62, %al
	movb %al, 2(%rbx)
	movb $51, %al
	movb %al, 3(%rbx)
	movb $32, %al
	movb %al, 4(%rbx)
	movb $101, %al
	movb %al, 5(%rbx)
	movb $116, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $99, %al
	movb %al, 8(%rbx)
	movb $33, %al
	movb %al, 9(%rbx)
	movb $61, %al
	movb %al, 10(%rbx)
	movb $50, %al
	movb %al, 11(%rbx)
	movb $34, %al
	movb %al, 12(%rbx)
	movb $0, %al
	movb %al, 13(%rbx)
	movb $0, %al
	movb %al, 13(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
FINIF6:
	jmp FINIF4
ELSE4:
#-----------------------BlockStatement7-----------------------#
#-----------------------IfStatement8-----------------------#
	push c
	push $2
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	je Vrai9	# If equal
	push $0		# False
	jmp Suite9
Vrai9:	push $0xFFFFFFFFFFFFFFFF		# True
Suite9:
	pop %rax
	cmpq $0, %rax
	je ELSE8
#-----------------------DisplayStatement9-----------------------#
	mov $15, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $97, %al
	movb %al, 1(%rbx)
	movb $60, %al
	movb %al, 2(%rbx)
	movb $61, %al
	movb %al, 3(%rbx)
	movb $51, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $101, %al
	movb %al, 6(%rbx)
	movb $116, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $99, %al
	movb %al, 9(%rbx)
	movb $61, %al
	movb %al, 10(%rbx)
	movb $61, %al
	movb %al, 11(%rbx)
	movb $50, %al
	movb %al, 12(%rbx)
	movb $34, %al
	movb %al, 13(%rbx)
	movb $0, %al
	movb %al, 14(%rbx)
	movb $0, %al
	movb %al, 14(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	jmp FINIF8
ELSE8:
#-----------------------DisplayStatement9-----------------------#
	mov $15, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $97, %al
	movb %al, 1(%rbx)
	movb $60, %al
	movb %al, 2(%rbx)
	movb $61, %al
	movb %al, 3(%rbx)
	movb $51, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $101, %al
	movb %al, 6(%rbx)
	movb $116, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $99, %al
	movb %al, 9(%rbx)
	movb $33, %al
	movb %al, 10(%rbx)
	movb $61, %al
	movb %al, 11(%rbx)
	movb $50, %al
	movb %al, 12(%rbx)
	movb $34, %al
	movb %al, 13(%rbx)
	movb $0, %al
	movb %al, 14(%rbx)
	movb $0, %al
	movb %al, 14(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
FINIF8:
FINIF4:
#-----------------------DisplayStatement9-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement9-----------------------#
	mov $28, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $84, %al
	movb %al, 1(%rbx)
	movb $101, %al
	movb %al, 2(%rbx)
	movb $115, %al
	movb %al, 3(%rbx)
	movb $116, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $100, %al
	movb %al, 6(%rbx)
	movb $101, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $108, %al
	movb %al, 9(%rbx)
	movb $97, %al
	movb %al, 10(%rbx)
	movb $32, %al
	movb %al, 11(%rbx)
	movb $98, %al
	movb %al, 12(%rbx)
	movb $111, %al
	movb %al, 13(%rbx)
	movb $117, %al
	movb %al, 14(%rbx)
	movb $99, %al
	movb %al, 15(%rbx)
	movb $108, %al
	movb %al, 16(%rbx)
	movb $101, %al
	movb %al, 17(%rbx)
	movb $32, %al
	movb %al, 18(%rbx)
	movb $119, %al
	movb %al, 19(%rbx)
	movb $104, %al
	movb %al, 20(%rbx)
	movb $105, %al
	movb %al, 21(%rbx)
	movb $108, %al
	movb %al, 22(%rbx)
	movb $101, %al
	movb %al, 23(%rbx)
	movb $32, %al
	movb %al, 24(%rbx)
	movb $58, %al
	movb %al, 25(%rbx)
	movb $34, %al
	movb %al, 26(%rbx)
	movb $0, %al
	movb %al, 27(%rbx)
	movb $0, %al
	movb %al, 27(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement9-----------------------#
	mov $41, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $65, %al
	movb %al, 1(%rbx)
	movb $102, %al
	movb %al, 2(%rbx)
	movb $102, %al
	movb %al, 3(%rbx)
	movb $105, %al
	movb %al, 4(%rbx)
	movb $99, %al
	movb %al, 5(%rbx)
	movb $104, %al
	movb %al, 6(%rbx)
	movb $101, %al
	movb %al, 7(%rbx)
	movb $114, %al
	movb %al, 8(%rbx)
	movb $32, %al
	movb %al, 9(%rbx)
	movb $108, %al
	movb %al, 10(%rbx)
	movb $101, %al
	movb %al, 11(%rbx)
	movb $115, %al
	movb %al, 12(%rbx)
	movb $32, %al
	movb %al, 13(%rbx)
	movb $101, %al
	movb %al, 14(%rbx)
	movb $110, %al
	movb %al, 15(%rbx)
	movb $116, %al
	movb %al, 16(%rbx)
	movb $105, %al
	movb %al, 17(%rbx)
	movb $101, %al
	movb %al, 18(%rbx)
	movb $114, %al
	movb %al, 19(%rbx)
	movb $115, %al
	movb %al, 20(%rbx)
	movb $32, %al
	movb %al, 21(%rbx)
	movb $100, %al
	movb %al, 22(%rbx)
	movb $101, %al
	movb %al, 23(%rbx)
	movb $32, %al
	movb %al, 24(%rbx)
	movb $49, %al
	movb %al, 25(%rbx)
	movb $32, %al
	movb %al, 26(%rbx)
	movb $-61, %al
	movb %al, 27(%rbx)
	movb $-96, %al
	movb %al, 28(%rbx)
	movb $32, %al
	movb %al, 29(%rbx)
	movb $49, %al
	movb %al, 30(%rbx)
	movb $48, %al
	movb %al, 31(%rbx)
	movb $32, %al
	movb %al, 32(%rbx)
	movb $50, %al
	movb %al, 33(%rbx)
	movb $32, %al
	movb %al, 34(%rbx)
	movb $102, %al
	movb %al, 35(%rbx)
	movb $111, %al
	movb %al, 36(%rbx)
	movb $105, %al
	movb %al, 37(%rbx)
	movb $115, %al
	movb %al, 38(%rbx)
	movb $34, %al
	movb %al, 39(%rbx)
	movb $0, %al
	movb %al, 40(%rbx)
	movb $0, %al
	movb %al, 40(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	push $1
	pop a
#-----------------------WhileStatement10-----------------------#
TESTWHILE10:
	push a
	push $10
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jbe Vrai11	# If below or equal
	push $0		# False
	jmp Suite11
Vrai11:	push $0xFFFFFFFFFFFFFFFF		# True
Suite11:
	pop %rax
	cmpq $0, %rax
	je FINWHILE10
#-----------------------BlockStatement11-----------------------#
#-----------------------AssignementStatement-----------------------#
	push $1
	pop b
#-----------------------WhileStatement12-----------------------#
TESTWHILE12:
	push b
	push $2
	pop %rax
	pop %rbx
	cmpq %rax, %rbx
	jbe Vrai13	# If below or equal
	push $0		# False
	jmp Suite13
Vrai13:	push $0xFFFFFFFFFFFFFFFF		# True
Suite13:
	pop %rax
	cmpq $0, %rax
	je FINWHILE12
#-----------------------BlockStatement13-----------------------#
#-----------------------DisplayStatement13-----------------------#
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	push b
	push $1
	popq %rbx
	popq %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop b
	jmp TESTWHILE12
FINWHILE12:
#-----------------------AssignementStatement-----------------------#
	push a
	push $1
	popq %rbx
	popq %rax
	addq	%rbx, %rax	# ADD
	push %rax
	pop a
	jmp TESTWHILE10
FINWHILE10:
#-----------------------DisplayStatement13-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement13-----------------------#
	mov $26, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $84, %al
	movb %al, 1(%rbx)
	movb $101, %al
	movb %al, 2(%rbx)
	movb $115, %al
	movb %al, 3(%rbx)
	movb $116, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $100, %al
	movb %al, 6(%rbx)
	movb $101, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $108, %al
	movb %al, 9(%rbx)
	movb $97, %al
	movb %al, 10(%rbx)
	movb $32, %al
	movb %al, 11(%rbx)
	movb $98, %al
	movb %al, 12(%rbx)
	movb $111, %al
	movb %al, 13(%rbx)
	movb $117, %al
	movb %al, 14(%rbx)
	movb $99, %al
	movb %al, 15(%rbx)
	movb $108, %al
	movb %al, 16(%rbx)
	movb $101, %al
	movb %al, 17(%rbx)
	movb $32, %al
	movb %al, 18(%rbx)
	movb $102, %al
	movb %al, 19(%rbx)
	movb $111, %al
	movb %al, 20(%rbx)
	movb $114, %al
	movb %al, 21(%rbx)
	movb $32, %al
	movb %al, 22(%rbx)
	movb $58, %al
	movb %al, 23(%rbx)
	movb $34, %al
	movb %al, 24(%rbx)
	movb $0, %al
	movb %al, 25(%rbx)
	movb $0, %al
	movb %al, 25(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement13-----------------------#
	mov $41, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $65, %al
	movb %al, 1(%rbx)
	movb $102, %al
	movb %al, 2(%rbx)
	movb $102, %al
	movb %al, 3(%rbx)
	movb $105, %al
	movb %al, 4(%rbx)
	movb $99, %al
	movb %al, 5(%rbx)
	movb $104, %al
	movb %al, 6(%rbx)
	movb $101, %al
	movb %al, 7(%rbx)
	movb $114, %al
	movb %al, 8(%rbx)
	movb $32, %al
	movb %al, 9(%rbx)
	movb $108, %al
	movb %al, 10(%rbx)
	movb $101, %al
	movb %al, 11(%rbx)
	movb $115, %al
	movb %al, 12(%rbx)
	movb $32, %al
	movb %al, 13(%rbx)
	movb $101, %al
	movb %al, 14(%rbx)
	movb $110, %al
	movb %al, 15(%rbx)
	movb $116, %al
	movb %al, 16(%rbx)
	movb $105, %al
	movb %al, 17(%rbx)
	movb $101, %al
	movb %al, 18(%rbx)
	movb $114, %al
	movb %al, 19(%rbx)
	movb $115, %al
	movb %al, 20(%rbx)
	movb $32, %al
	movb %al, 21(%rbx)
	movb $100, %al
	movb %al, 22(%rbx)
	movb $101, %al
	movb %al, 23(%rbx)
	movb $32, %al
	movb %al, 24(%rbx)
	movb $49, %al
	movb %al, 25(%rbx)
	movb $32, %al
	movb %al, 26(%rbx)
	movb $-61, %al
	movb %al, 27(%rbx)
	movb $-96, %al
	movb %al, 28(%rbx)
	movb $32, %al
	movb %al, 29(%rbx)
	movb $49, %al
	movb %al, 30(%rbx)
	movb $48, %al
	movb %al, 31(%rbx)
	movb $32, %al
	movb %al, 32(%rbx)
	movb $50, %al
	movb %al, 33(%rbx)
	movb $32, %al
	movb %al, 34(%rbx)
	movb $102, %al
	movb %al, 35(%rbx)
	movb $111, %al
	movb %al, 36(%rbx)
	movb $105, %al
	movb %al, 37(%rbx)
	movb $115, %al
	movb %al, 38(%rbx)
	movb $34, %al
	movb %al, 39(%rbx)
	movb $0, %al
	movb %al, 40(%rbx)
	movb $0, %al
	movb %al, 40(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------ForStatement14-----------------------#
#-----------------------AssignementStatement-----------------------#
	push $1
	pop a
DEBUTFOR14:
	push $10
	pop %rbx #	 valeur de l'expression
	cmpq %rbx, a
	jae FINFOR14
#-----------------------BlockStatement14-----------------------#
#-----------------------ForStatement15-----------------------#
#-----------------------AssignementStatement-----------------------#
	push $3
	pop b
DEBUTFOR15:
	push $2
	pop %rbx #	 valeur de l'expression
	cmpq %rbx, b
	jbe FINFOR15
#-----------------------BlockStatement15-----------------------#
#-----------------------DisplayStatement15-----------------------#
	push a
	pop %rsi   	# The value to be displayed
	movq $FormatStringSignedInt, %rdi   	# "%llu\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	decq b
	jmp DEBUTFOR15
FINFOR15:
	incq a
	jmp DEBUTFOR14
FINFOR14:
#-----------------------DisplayStatement15-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement15-----------------------#
	mov $73, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $84, %al
	movb %al, 1(%rbx)
	movb $101, %al
	movb %al, 2(%rbx)
	movb $115, %al
	movb %al, 3(%rbx)
	movb $116, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $100, %al
	movb %al, 6(%rbx)
	movb $117, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $99, %al
	movb %al, 9(%rbx)
	movb $97, %al
	movb %al, 10(%rbx)
	movb $115, %al
	movb %al, 11(%rbx)
	movb $101, %al
	movb %al, 12(%rbx)
	movb $32, %al
	movb %al, 13(%rbx)
	movb $115, %al
	movb %al, 14(%rbx)
	movb $117, %al
	movb %al, 15(%rbx)
	movb $114, %al
	movb %al, 16(%rbx)
	movb $32, %al
	movb %al, 17(%rbx)
	movb $102, %al
	movb %al, 18(%rbx)
	movb $108, %al
	movb %al, 19(%rbx)
	movb $111, %al
	movb %al, 20(%rbx)
	movb $97, %al
	movb %al, 21(%rbx)
	movb $116, %al
	movb %al, 22(%rbx)
	movb $32, %al
	movb %al, 23(%rbx)
	movb $58, %al
	movb %al, 24(%rbx)
	movb $32, %al
	movb %al, 25(%rbx)
	movb $40, %al
	movb %al, 26(%rbx)
	movb $102, %al
	movb %al, 27(%rbx)
	movb $111, %al
	movb %al, 28(%rbx)
	movb $110, %al
	movb %al, 29(%rbx)
	movb $99, %al
	movb %al, 30(%rbx)
	movb $116, %al
	movb %al, 31(%rbx)
	movb $105, %al
	movb %al, 32(%rbx)
	movb $111, %al
	movb %al, 33(%rbx)
	movb $110, %al
	movb %al, 34(%rbx)
	movb $110, %al
	movb %al, 35(%rbx)
	movb $101, %al
	movb %al, 36(%rbx)
	movb $32, %al
	movb %al, 37(%rbx)
	movb $97, %al
	movb %al, 38(%rbx)
	movb $118, %al
	movb %al, 39(%rbx)
	movb $101, %al
	movb %al, 40(%rbx)
	movb $99, %al
	movb %al, 41(%rbx)
	movb $32, %al
	movb %al, 42(%rbx)
	movb $116, %al
	movb %al, 43(%rbx)
	movb $111, %al
	movb %al, 44(%rbx)
	movb $117, %al
	movb %al, 45(%rbx)
	movb $116, %al
	movb %al, 46(%rbx)
	movb $32, %al
	movb %al, 47(%rbx)
	movb $108, %al
	movb %al, 48(%rbx)
	movb $101, %al
	movb %al, 49(%rbx)
	movb $115, %al
	movb %al, 50(%rbx)
	movb $32, %al
	movb %al, 51(%rbx)
	movb $116, %al
	movb %al, 52(%rbx)
	movb $121, %al
	movb %al, 53(%rbx)
	movb $112, %al
	movb %al, 54(%rbx)
	movb $101, %al
	movb %al, 55(%rbx)
	movb $115, %al
	movb %al, 56(%rbx)
	movb $32, %al
	movb %al, 57(%rbx)
	movb $100, %al
	movb %al, 58(%rbx)
	movb $101, %al
	movb %al, 59(%rbx)
	movb $32, %al
	movb %al, 60(%rbx)
	movb $118, %al
	movb %al, 61(%rbx)
	movb $97, %al
	movb %al, 62(%rbx)
	movb $114, %al
	movb %al, 63(%rbx)
	movb $105, %al
	movb %al, 64(%rbx)
	movb $97, %al
	movb %al, 65(%rbx)
	movb $98, %al
	movb %al, 66(%rbx)
	movb $108, %al
	movb %al, 67(%rbx)
	movb $101, %al
	movb %al, 68(%rbx)
	movb $115, %al
	movb %al, 69(%rbx)
	movb $41, %al
	movb %al, 70(%rbx)
	movb $34, %al
	movb %al, 71(%rbx)
	movb $0, %al
	movb %al, 72(%rbx)
	movb $0, %al
	movb %al, 72(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement15-----------------------#
	mov $37, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $65, %al
	movb %al, 1(%rbx)
	movb $102, %al
	movb %al, 2(%rbx)
	movb $102, %al
	movb %al, 3(%rbx)
	movb $105, %al
	movb %al, 4(%rbx)
	movb $99, %al
	movb %al, 5(%rbx)
	movb $104, %al
	movb %al, 6(%rbx)
	movb $101, %al
	movb %al, 7(%rbx)
	movb $114, %al
	movb %al, 8(%rbx)
	movb $32, %al
	movb %al, 9(%rbx)
	movb $108, %al
	movb %al, 10(%rbx)
	movb $101, %al
	movb %al, 11(%rbx)
	movb $32, %al
	movb %al, 12(%rbx)
	movb $99, %al
	movb %al, 13(%rbx)
	movb $97, %al
	movb %al, 14(%rbx)
	movb $115, %al
	movb %al, 15(%rbx)
	movb $32, %al
	movb %al, 16(%rbx)
	movb $100, %al
	movb %al, 17(%rbx)
	movb $101, %al
	movb %al, 18(%rbx)
	movb $32, %al
	movb %al, 19(%rbx)
	movb $49, %al
	movb %al, 20(%rbx)
	movb $46, %al
	movb %al, 21(%rbx)
	movb $48, %al
	movb %al, 22(%rbx)
	movb $44, %al
	movb %al, 23(%rbx)
	movb $32, %al
	movb %al, 24(%rbx)
	movb $50, %al
	movb %al, 25(%rbx)
	movb $46, %al
	movb %al, 26(%rbx)
	movb $48, %al
	movb %al, 27(%rbx)
	movb $32, %al
	movb %al, 28(%rbx)
	movb $101, %al
	movb %al, 29(%rbx)
	movb $116, %al
	movb %al, 30(%rbx)
	movb $32, %al
	movb %al, 31(%rbx)
	movb $51, %al
	movb %al, 32(%rbx)
	movb $46, %al
	movb %al, 33(%rbx)
	movb $48, %al
	movb %al, 34(%rbx)
	movb $34, %al
	movb %al, 35(%rbx)
	movb $0, %al
	movb %al, 36(%rbx)
	movb $0, %al
	movb %al, 36(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 2 (32 bit high part)
	movl $1073741824, 4(%rsp) 	# Conversion of 2 (32 bit low part)
	pop intD
#-----------------------CaseStatement16-----------------------#
	push intD
	fldl (%rsp)
	addq $8, %rsp
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
	fldl (%rsp)
	fucomip %st(1), %st(0)
	je CASEVRAIS17
	addq $8, %rsp
	jmp ENDCASE17
CASEVRAIS17:
	addq $8, %rsp
#-----------------------DisplayStatement17-----------------------#
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 1 (32 bit high part)
	movl $1072693248, 4(%rsp) 	# Conversion of 1 (32 bit low part)
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED16
ENDCASE17:
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 2 (32 bit high part)
	movl $1073741824, 4(%rsp) 	# Conversion of 2 (32 bit low part)
	fldl (%rsp)
	fucomip %st(1), %st(0)
	je CASEVRAIS18
	addq $8, %rsp
	jmp ENDCASE18
CASEVRAIS18:
	addq $8, %rsp
#-----------------------DisplayStatement18-----------------------#
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 2 (32 bit high part)
	movl $1073741824, 4(%rsp) 	# Conversion of 2 (32 bit low part)
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED16
ENDCASE18:
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	fldl (%rsp)
	fucomip %st(1), %st(0)
	je CASEVRAIS19
	addq $8, %rsp
	jmp ENDCASE19
CASEVRAIS19:
	addq $8, %rsp
#-----------------------DisplayStatement19-----------------------#
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 3 (32 bit high part)
	movl $1074266112, 4(%rsp) 	# Conversion of 3 (32 bit low part)
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
	jmp CASEFINISHED16
ENDCASE19:
#-----------------------DisplayStatement19-----------------------#
	mov $8, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $65, %al
	movb %al, 1(%rbx)
	movb $117, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $114, %al
	movb %al, 4(%rbx)
	movb $101, %al
	movb %al, 5(%rbx)
	movb $34, %al
	movb %al, 6(%rbx)
	movb $0, %al
	movb %al, 7(%rbx)
	movb $0, %al
	movb %al, 7(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
CASEFINISHED16:
#-----------------------DisplayStatement19-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement19-----------------------#
	mov $59, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $97, %al
	movb %al, 1(%rbx)
	movb $115, %al
	movb %al, 2(%rbx)
	movb $115, %al
	movb %al, 3(%rbx)
	movb $105, %al
	movb %al, 4(%rbx)
	movb $103, %al
	movb %al, 5(%rbx)
	movb $110, %al
	movb %al, 6(%rbx)
	movb $97, %al
	movb %al, 7(%rbx)
	movb $116, %al
	movb %al, 8(%rbx)
	movb $105, %al
	movb %al, 9(%rbx)
	movb $111, %al
	movb %al, 10(%rbx)
	movb $110, %al
	movb %al, 11(%rbx)
	movb $32, %al
	movb %al, 12(%rbx)
	movb $100, %al
	movb %al, 13(%rbx)
	movb $39, %al
	movb %al, 14(%rbx)
	movb $117, %al
	movb %al, 15(%rbx)
	movb $110, %al
	movb %al, 16(%rbx)
	movb $32, %al
	movb %al, 17(%rbx)
	movb $98, %al
	movb %al, 18(%rbx)
	movb $111, %al
	movb %al, 19(%rbx)
	movb $111, %al
	movb %al, 20(%rbx)
	movb $108, %al
	movb %al, 21(%rbx)
	movb $101, %al
	movb %al, 22(%rbx)
	movb $110, %al
	movb %al, 23(%rbx)
	movb $32, %al
	movb %al, 24(%rbx)
	movb $-61, %al
	movb %al, 25(%rbx)
	movb $-96, %al
	movb %al, 26(%rbx)
	movb $32, %al
	movb %al, 27(%rbx)
	movb $84, %al
	movb %al, 28(%rbx)
	movb $82, %al
	movb %al, 29(%rbx)
	movb $85, %al
	movb %al, 30(%rbx)
	movb $69, %al
	movb %al, 31(%rbx)
	movb $32, %al
	movb %al, 32(%rbx)
	movb $40, %al
	movb %al, 33(%rbx)
	movb $112, %al
	movb %al, 34(%rbx)
	movb $111, %al
	movb %al, 35(%rbx)
	movb $115, %al
	movb %al, 36(%rbx)
	movb $115, %al
	movb %al, 37(%rbx)
	movb $105, %al
	movb %al, 38(%rbx)
	movb $98, %al
	movb %al, 39(%rbx)
	movb $108, %al
	movb %al, 40(%rbx)
	movb $101, %al
	movb %al, 41(%rbx)
	movb $32, %al
	movb %al, 42(%rbx)
	movb $97, %al
	movb %al, 43(%rbx)
	movb $32, %al
	movb %al, 44(%rbx)
	movb $70, %al
	movb %al, 45(%rbx)
	movb $65, %al
	movb %al, 46(%rbx)
	movb $76, %al
	movb %al, 47(%rbx)
	movb $83, %al
	movb %al, 48(%rbx)
	movb $69, %al
	movb %al, 49(%rbx)
	movb $32, %al
	movb %al, 50(%rbx)
	movb $97, %al
	movb %al, 51(%rbx)
	movb $117, %al
	movb %al, 52(%rbx)
	movb $115, %al
	movb %al, 53(%rbx)
	movb $115, %al
	movb %al, 54(%rbx)
	movb $105, %al
	movb %al, 55(%rbx)
	movb $41, %al
	movb %al, 56(%rbx)
	movb $34, %al
	movb %al, 57(%rbx)
	movb $0, %al
	movb %al, 58(%rbx)
	movb $0, %al
	movb %al, 58(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	push $0xFFFFFFFFFFFFFFFF
	pop boolVal
#-----------------------DisplayStatement19-----------------------#
	push boolVal
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai20	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite20
displayVrai20:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite20:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	mov $35, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $84, %al
	movb %al, 1(%rbx)
	movb $101, %al
	movb %al, 2(%rbx)
	movb $115, %al
	movb %al, 3(%rbx)
	movb $116, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $100, %al
	movb %al, 6(%rbx)
	movb $39, %al
	movb %al, 7(%rbx)
	movb $111, %al
	movb %al, 8(%rbx)
	movb $112, %al
	movb %al, 9(%rbx)
	movb $101, %al
	movb %al, 10(%rbx)
	movb $114, %al
	movb %al, 11(%rbx)
	movb $97, %al
	movb %al, 12(%rbx)
	movb $116, %al
	movb %al, 13(%rbx)
	movb $105, %al
	movb %al, 14(%rbx)
	movb $111, %al
	movb %al, 15(%rbx)
	movb $110, %al
	movb %al, 16(%rbx)
	movb $32, %al
	movb %al, 17(%rbx)
	movb $100, %al
	movb %al, 18(%rbx)
	movb $101, %al
	movb %al, 19(%rbx)
	movb $32, %al
	movb %al, 20(%rbx)
	movb $105, %al
	movb %al, 21(%rbx)
	movb $110, %al
	movb %al, 22(%rbx)
	movb $116, %al
	movb %al, 23(%rbx)
	movb $32, %al
	movb %al, 24(%rbx)
	movb $101, %al
	movb %al, 25(%rbx)
	movb $116, %al
	movb %al, 26(%rbx)
	movb $32, %al
	movb %al, 27(%rbx)
	movb $102, %al
	movb %al, 28(%rbx)
	movb $108, %al
	movb %al, 29(%rbx)
	movb $111, %al
	movb %al, 30(%rbx)
	movb $97, %al
	movb %al, 31(%rbx)
	movb $116, %al
	movb %al, 32(%rbx)
	movb $34, %al
	movb %al, 33(%rbx)
	movb $0, %al
	movb %al, 34(%rbx)
	movb $0, %al
	movb %al, 34(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	push $1
	pop a
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 2.5 (32 bit high part)
	movl $1074003968, 4(%rsp) 	# Conversion of 2.5 (32 bit low part)
	pop intD
#-----------------------DisplayStatement20-----------------------#
	mov $23, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $111, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $32, %al
	movb %al, 3(%rbx)
	movb $97, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $97, %al
	movb %al, 6(%rbx)
	movb $61, %al
	movb %al, 7(%rbx)
	movb $49, %al
	movb %al, 8(%rbx)
	movb $32, %al
	movb %al, 9(%rbx)
	movb $101, %al
	movb %al, 10(%rbx)
	movb $116, %al
	movb %al, 11(%rbx)
	movb $32, %al
	movb %al, 12(%rbx)
	movb $105, %al
	movb %al, 13(%rbx)
	movb $110, %al
	movb %al, 14(%rbx)
	movb $116, %al
	movb %al, 15(%rbx)
	movb $68, %al
	movb %al, 16(%rbx)
	movb $61, %al
	movb %al, 17(%rbx)
	movb $50, %al
	movb %al, 18(%rbx)
	movb $46, %al
	movb %al, 19(%rbx)
	movb $53, %al
	movb %al, 20(%rbx)
	movb $34, %al
	movb %al, 21(%rbx)
	movb $0, %al
	movb %al, 22(%rbx)
	movb $0, %al
	movb %al, 22(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	mov $11, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $105, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $68, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $43, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $97, %al
	movb %al, 8(%rbx)
	movb $34, %al
	movb %al, 9(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	push intD
	push a
	fildl (%rsp)	
	fldl	8(%rsp)
	faddp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	mov $11, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $105, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $68, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $45, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $97, %al
	movb %al, 8(%rbx)
	movb $34, %al
	movb %al, 9(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	push intD
	push a
	fildl (%rsp)	
	fldl	8(%rsp)
	fsubp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	mov $11, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $105, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $68, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $42, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $97, %al
	movb %al, 8(%rbx)
	movb $34, %al
	movb %al, 9(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	push intD
	push a
	fildl (%rsp)	
	fldl	8(%rsp)
	fmulp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	mov $11, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $105, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $68, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $47, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $97, %al
	movb %al, 8(%rbx)
	movb $34, %al
	movb %al, 9(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	push intD
	push a
	fildl (%rsp)	
	fldl	8(%rsp)
	fdivp	%st(0),%st(1)
	fstpl 8(%rsp)
	addq $8, %rsp
	movsd	(%rsp), %xmm0   	# L'adresse de la valeur dans le registre xmm0
	subq $16 , %rsp   	# Allocate 16 bytes on stack's top
	movsd %xmm0, 8(%rsp)   	# Store the value on the stack
	movq $FormatStringDouble, %rdi   	# "%f\n"
	add $24, %rsp   	# pop nothing
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	push $'\n'
	pop %rsi   	# The value to be displayed
	movq $FormatStringCHAR, %rdi   	# "%c\n"
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	mov $35, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $67, %al
	movb %al, 1(%rbx)
	movb $111, %al
	movb %al, 2(%rbx)
	movb $109, %al
	movb %al, 3(%rbx)
	movb $112, %al
	movb %al, 4(%rbx)
	movb $97, %al
	movb %al, 5(%rbx)
	movb $114, %al
	movb %al, 6(%rbx)
	movb $97, %al
	movb %al, 7(%rbx)
	movb $105, %al
	movb %al, 8(%rbx)
	movb $115, %al
	movb %al, 9(%rbx)
	movb $111, %al
	movb %al, 10(%rbx)
	movb $110, %al
	movb %al, 11(%rbx)
	movb $32, %al
	movb %al, 12(%rbx)
	movb $100, %al
	movb %al, 13(%rbx)
	movb $39, %al
	movb %al, 14(%rbx)
	movb $101, %al
	movb %al, 15(%rbx)
	movb $110, %al
	movb %al, 16(%rbx)
	movb $116, %al
	movb %al, 17(%rbx)
	movb $105, %al
	movb %al, 18(%rbx)
	movb $101, %al
	movb %al, 19(%rbx)
	movb $114, %al
	movb %al, 20(%rbx)
	movb $32, %al
	movb %al, 21(%rbx)
	movb $101, %al
	movb %al, 22(%rbx)
	movb $116, %al
	movb %al, 23(%rbx)
	movb $32, %al
	movb %al, 24(%rbx)
	movb $100, %al
	movb %al, 25(%rbx)
	movb $101, %al
	movb %al, 26(%rbx)
	movb $32, %al
	movb %al, 27(%rbx)
	movb $102, %al
	movb %al, 28(%rbx)
	movb $108, %al
	movb %al, 29(%rbx)
	movb $111, %al
	movb %al, 30(%rbx)
	movb $97, %al
	movb %al, 31(%rbx)
	movb $116, %al
	movb %al, 32(%rbx)
	movb $34, %al
	movb %al, 33(%rbx)
	movb $0, %al
	movb %al, 34(%rbx)
	movb $0, %al
	movb %al, 34(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------AssignementStatement-----------------------#
	push $1
	pop a
#-----------------------AssignementStatement-----------------------#
	subq $8, %rsp
	movl $0, (%rsp) 	# Conversion of 2.5 (32 bit high part)
	movl $1074003968, 4(%rsp) 	# Conversion of 2.5 (32 bit low part)
	pop intD
#-----------------------DisplayStatement20-----------------------#
	mov $23, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $111, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $32, %al
	movb %al, 3(%rbx)
	movb $97, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $97, %al
	movb %al, 6(%rbx)
	movb $61, %al
	movb %al, 7(%rbx)
	movb $49, %al
	movb %al, 8(%rbx)
	movb $32, %al
	movb %al, 9(%rbx)
	movb $101, %al
	movb %al, 10(%rbx)
	movb $116, %al
	movb %al, 11(%rbx)
	movb $32, %al
	movb %al, 12(%rbx)
	movb $105, %al
	movb %al, 13(%rbx)
	movb $110, %al
	movb %al, 14(%rbx)
	movb $116, %al
	movb %al, 15(%rbx)
	movb $68, %al
	movb %al, 16(%rbx)
	movb $61, %al
	movb %al, 17(%rbx)
	movb $50, %al
	movb %al, 18(%rbx)
	movb $46, %al
	movb %al, 19(%rbx)
	movb $53, %al
	movb %al, 20(%rbx)
	movb $34, %al
	movb %al, 21(%rbx)
	movb $0, %al
	movb %al, 22(%rbx)
	movb $0, %al
	movb %al, 22(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	mov $11, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $105, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $68, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $62, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $97, %al
	movb %al, 8(%rbx)
	movb $34, %al
	movb %al, 9(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement20-----------------------#
	push intD
	push a
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	ja Vrai21	# If above
	push $0		# False
	jmp Suite21
Vrai21:	push $0xFFFFFFFFFFFFFFFF		# True
Suite21:
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai22	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite22
displayVrai22:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite22:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement22-----------------------#
	mov $11, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $105, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $68, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $60, %al
	movb %al, 6(%rbx)
	movb $32, %al
	movb %al, 7(%rbx)
	movb $97, %al
	movb %al, 8(%rbx)
	movb $34, %al
	movb %al, 9(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	movb $0, %al
	movb %al, 10(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement22-----------------------#
	push intD
	push a
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	jb Vrai23	# If below
	push $0		# False
	jmp Suite23
Vrai23:	push $0xFFFFFFFFFFFFFFFF		# True
Suite23:
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai24	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite24
displayVrai24:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite24:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement24-----------------------#
	mov $12, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $105, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $68, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $62, %al
	movb %al, 6(%rbx)
	movb $61, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $97, %al
	movb %al, 9(%rbx)
	movb $34, %al
	movb %al, 10(%rbx)
	movb $0, %al
	movb %al, 11(%rbx)
	movb $0, %al
	movb %al, 11(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement24-----------------------#
	push intD
	push a
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	jae Vrai25	# If above or equal
	push $0		# False
	jmp Suite25
Vrai25:	push $0xFFFFFFFFFFFFFFFF		# True
Suite25:
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai26	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite26
displayVrai26:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite26:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement26-----------------------#
	mov $12, %rdi
	call malloc
	mov %rax, %rbx
	movb $34, %al
	movb %al, 0(%rbx)
	movb $105, %al
	movb %al, 1(%rbx)
	movb $110, %al
	movb %al, 2(%rbx)
	movb $116, %al
	movb %al, 3(%rbx)
	movb $68, %al
	movb %al, 4(%rbx)
	movb $32, %al
	movb %al, 5(%rbx)
	movb $60, %al
	movb %al, 6(%rbx)
	movb $61, %al
	movb %al, 7(%rbx)
	movb $32, %al
	movb %al, 8(%rbx)
	movb $97, %al
	movb %al, 9(%rbx)
	movb $34, %al
	movb %al, 10(%rbx)
	movb $0, %al
	movb %al, 11(%rbx)
	movb $0, %al
	movb %al, 11(%rbx)
	push %rbx
	pop %rsi   	# The address of the string to be displayed
	movq $FormatStringString, %rdi   	# "%s\n"
	xorl %eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
#-----------------------DisplayStatement26-----------------------#
	push intD
	push a
	fildl (%rsp)	
	fldl 8(%rsp)	
	addq $16, %rsp
	fcomip %st(1)
	faddp %st(1)	# pop nothing
	jbe Vrai27	# If below or equal
	push $0		# False
	jmp Suite27
Vrai27:	push $0xFFFFFFFFFFFFFFFF		# True
Suite27:
	pop %rsi   	# The value to be displayed
	cmpq $0, %rsi   	# Compare with 0
	jne displayVrai28	# If not equal to 0
	movq $FormatStringFalse, %rdi   	# "FALSE\n"
	jmp Suite28
displayVrai28:	movq $FormatStringTrue, %rdi   	# "TRUE\n"
Suite28:
	xorl	%eax, %eax    	# No floating point arguments
	call printf@PLT   	 # Display the value
	popq %rbp		# Restore the position of the stack's top
	ret			# Return from main function
.cfi_endproc
