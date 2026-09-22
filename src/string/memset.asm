%ifdef TESTING
	global syslibc_memset
	syslibc_memset:
%else
	global memset
	memset:
%endif

	push	rbp
	mov	rbp, rsp

	xor	r10d, r10d
	mov	rax, rdi

.loop:
	cmp	r10, rdx
	je	.end

	mov	[rdi + r10], esi
	inc	r10
	jmp	.loop

.end:
	leave
	ret
