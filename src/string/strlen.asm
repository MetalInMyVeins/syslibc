%ifdef TESTING
	global syslibc_strlen
	syslibc_strlen:
%else
	global strlen
	strlen:
%endif

	push	rbp
	mov	rbp, rsp

	mov	sil, byte [rdi]
	xor	eax, eax

.loop:
	cmp	sil, 0
	je	.end
	inc	rax
	inc	rdi
	mov	sil, byte [rdi]
	jmp	.loop

.end:
	leave
	ret
