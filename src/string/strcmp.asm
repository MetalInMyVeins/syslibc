global strcmp
extern memcmp
extern strlen

strcmp:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	[rbp - 24], rdi
	mov	[rbp - 32], rsi
	call	strlen
	mov	[rbp - 8], rax

	mov	rdi, [rbp - 32]
	call	strlen
	mov	[rbp - 16], rax

	cmp	[rbp - 8], rax
	jle	.1lessequ2
	jmp	.2less1

.1lessequ2:
	mov	rdi, [rbp - 24]
	mov	rsi, [rbp - 32]
	mov	rdx, [rbp - 8]
	call	memcmp
	jmp	.end

.2less1:
	mov	rdi, [rbp - 24]
	mov	rsi, [rbp - 32]
	mov	rdx, rax
	call	memcmp
	jmp	.end

.end:
	leave
	ret
