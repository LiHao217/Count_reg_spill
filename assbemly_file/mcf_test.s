	.file	"mcf_test.c"
	.text
	.p2align 4,,15
	.globl	getOriginalArcPosition
	.type	getOriginalArcPosition, @function
getOriginalArcPosition:
.LFB40:
	.cfi_startproc
	movq	%rsi, %rax
	ret
	.cfi_endproc
.LFE40:
	.size	getOriginalArcPosition, .-getOriginalArcPosition
	.p2align 4,,15
	.type	arc_compare, @function
arc_compare:
.LFB46:
	.cfi_startproc
	movq	(%rsi), %rdx
	movq	(%rdi), %rcx
	movl	$1, %eax
	movq	56(%rdx), %rsi
	cmpq	%rsi, 56(%rcx)
	jg	.L8
	movl	$-1, %eax
	jl	.L8
	movl	(%rdx), %eax
	cmpl	%eax, (%rcx)
	setge	%al
	movzbl	%al, %eax
	leal	-1(%rax,%rax), %eax
.L8:
	ret
	.cfi_endproc
.LFE46:
	.size	arc_compare, .-arc_compare
	.p2align 4,,15
	.globl	cost_compare
	.type	cost_compare, @function
cost_compare:
.LFB69:
	.cfi_startproc
	movq	(%rsi), %rdx
	movq	(%rdi), %rcx
	movl	$1, %eax
	movq	16(%rdx), %rsi
	cmpq	%rsi, 16(%rcx)
	jl	.L14
	movl	$-1, %eax
	jg	.L14
	movq	(%rcx), %rcx
	movq	(%rdx), %rax
	movl	(%rax), %eax
	cmpl	%eax, (%rcx)
	setg	%al
	movzbl	%al, %eax
	leal	-1(%rax,%rax), %eax
.L14:
	ret
	.cfi_endproc
.LFE69:
	.size	cost_compare, .-cost_compare
	.p2align 4,,15
	.type	markBaskets.constprop.6, @function
markBaskets.constprop.6:
.LFB83:
	.cfi_startproc
	movq	perm_p(%rip), %rcx
	movl	$1, %edx
	movq	(%rcx), %rax
	jmp	.L17
	.p2align 4,,15
.L21:
	movq	%rdx, 24(%rax)
	movq	(%rcx), %rax
	incq	%rdx
	addq	$8, %rax
	movq	%rax, (%rcx)
	cmpq	$61, %rdx
	je	.L20
.L17:
	movq	(%rax), %rax
	cmpq	$0, 24(%rax)
	jns	.L21
.L20:
	ret
	.cfi_endproc
.LFE83:
	.size	markBaskets.constprop.6, .-markBaskets.constprop.6
	.p2align 4,,15
	.type	refreshPositions.constprop.12, @function
refreshPositions.constprop.12:
.LFB78:
	.cfi_startproc
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	cmpq	$0, 400(%rdi)
	movq	584(%rdi), %r9
	js	.L29
	.p2align 4,,15
.L23:
	movq	552(%rdi), %rax
	addq	%rcx, %rax
	movq	48(%rax), %r8
	testq	%r8, %r8
	je	.L26
	movslq	(%r8), %r8
	testl	%r8d, %r8d
	js	.L26
	leaq	(%r8,%r8,8), %r8
	leaq	(%r9,%r8,8), %r8
	movq	%r8, 48(%rax)
.L26:
	movq	64(%rax), %r8
	testq	%r8, %r8
	je	.L27
	movslq	(%r8), %r8
	testl	%r8d, %r8d
	js	.L27
	leaq	(%r8,%r8,8), %r8
	leaq	(%r9,%r8,8), %r8
	movq	%r8, 64(%rax)
.L27:
	movq	56(%rax), %r8
	testq	%r8, %r8
	je	.L28
	movslq	(%r8), %r8
	testl	%r8d, %r8d
	js	.L28
	leaq	(%r8,%r8,8), %r8
	leaq	(%r9,%r8,8), %r8
	movq	%r8, 56(%rax)
.L28:
	incq	%rdx
	addq	$104, %rcx
	cmpq	400(%rdi), %rdx
	jle	.L23
.L29:
	movq	568(%rdi), %r10
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	testq	%rsi, %rsi
	jle	.L25
	.p2align 4,,15
.L24:
	leaq	(%r10,%r8), %rax
	movslq	(%rax), %rdx
	testl	%edx, %edx
	js	.L30
	vmovups	(%rax), %xmm0
	leaq	(%rdx,%rdx,8), %rdx
	leaq	(%r9,%rdx,8), %rdx
	vmovups	%xmm0, (%rdx)
	vmovups	16(%rax), %xmm1
	vmovups	%xmm1, 16(%rdx)
	vmovups	32(%rax), %xmm2
	vmovups	%xmm2, 32(%rdx)
	vmovups	48(%rax), %xmm3
	vmovups	%xmm3, 48(%rdx)
	movq	64(%rax), %rax
	movq	%rax, 64(%rdx)
	movq	568(%rdi), %r10
.L30:
	incq	%rcx
	addq	$72, %r8
	cmpq	%rsi, %rcx
	jne	.L24
.L25:
	leaq	(%rsi,%rsi,8), %rax
	movq	%r9, 568(%rdi)
	movq	%r10, 584(%rdi)
	leaq	(%r9,%rax,8), %rax
	movq	%rax, 576(%rdi)
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE78:
	.size	refreshPositions.constprop.12, .-refreshPositions.constprop.12
	.p2align 4,,15
	.type	switch_arcs.constprop.9, @function
switch_arcs.constprop.9:
.LFB80:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r8, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	cmpq	%r8, (%rdi)
	cmovle	(%rdi), %r15
	testq	%r15, %r15
	jle	.L58
	xorl	%r12d, %r12d
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	jmp	.L49
	.p2align 4,,15
.L50:
	je	.L70
.L53:
	incq	%rbp
	addq	$72, %r12
	cmpq	%rbp, %r15
	je	.L67
.L49:
	movq	(%rsi), %rdi
	addq	%r12, %rdi
	cmpw	$0, 32(%rdi)
	jne	.L53
	movq	56(%rdi), %r11
	cmpq	56(%rdx), %r11
	jge	.L50
	movl	(%rdi), %r13d
.L57:
	vmovups	(%rdx), %xmm2
	movq	8(%rdi), %rbx
	incq	%rax
	movl	$72, %r10d
	movq	16(%rdi), %r14
	movq	24(%rdi), %r8
	vmovups	%xmm2, (%rdi)
	vmovups	16(%rdx), %xmm3
	vmovups	%xmm3, 16(%rdi)
	vmovups	32(%rdx), %xmm4
	vmovups	%xmm4, 32(%rdi)
	vmovups	48(%rdx), %xmm5
	vmovups	%xmm5, 48(%rdi)
	movq	64(%rdx), %r9
	movq	%r9, 64(%rdi)
	movq	128(%rdx), %r9
	cmpq	200(%rdx), %r9
	movl	$144, %edi
	movq	%r14, 16(%rdx)
	movq	%r8, 24(%rdx)
	movq	%rbx, 64(%rdx)
	movq	%rbx, 8(%rdx)
	movq	%r11, 56(%rdx)
	movl	%r13d, (%rdx)
	setle	%r9b
	cmovg	%r10, %rdi
	movzbl	%r9b, %r9d
	addq	$2, %r9
	cmpq	%r9, %rcx
	jl	.L53
	addq	%rdx, %rdi
	vmovq	%r14, %xmm6
	vmovq	%r11, %xmm7
	movl	$1, %r10d
	vpinsrq	$1, %r8, %xmm6, %xmm0
	vpinsrq	$1, %rbx, %xmm7, %xmm1
	cmpq	%r11, 56(%rdi)
	jg	.L56
	jmp	.L53
	.p2align 4,,15
.L71:
	leaq	(%r8,%r8,8), %rdi
	leaq	-72(%rdx,%rdi,8), %rdi
	movq	56(%rdi), %r14
.L55:
	movq	%r9, %r10
	cmpq	%r11, %r14
	jle	.L53
	movq	%r8, %r9
.L56:
	leaq	(%r10,%r10,8), %r8
	movq	16(%rdi), %r10
	leaq	-72(%rdx,%r8,8), %r8
	movq	%r10, 16(%r8)
	movq	24(%rdi), %r10
	movq	%r10, 24(%r8)
	movq	8(%rdi), %r10
	movq	%r10, 8(%r8)
	movq	%r10, 64(%r8)
	movq	56(%rdi), %r10
	movq	%r10, 56(%r8)
	movl	(%rdi), %r10d
	movl	%r10d, (%r8)
	leaq	(%r9,%r9), %r8
	vmovups	%xmm0, 16(%rdi)
	movq	%rbx, 8(%rdi)
	vmovups	%xmm1, 56(%rdi)
	movl	%r13d, (%rdi)
	cmpq	%r8, %rcx
	jle	.L54
	movq	%r9, %r10
	salq	$4, %r10
	addq	%r8, %r10
	salq	$3, %r10
	leaq	-72(%rdx,%r10), %rdi
	movq	56(%rdi), %r14
	cmpq	56(%rdx,%r10), %r14
	jge	.L55
	incq	%r8
.L54:
	cmpq	%r8, %rcx
	jge	.L71
	incq	%rbp
	addq	$72, %r12
	cmpq	%rbp, %r15
	jne	.L49
.L67:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L70:
	.cfi_restore_state
	movl	(%rdi), %r13d
	cmpl	(%rdx), %r13d
	jl	.L57
	jmp	.L53
.L58:
	popq	%rbx
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE80:
	.size	switch_arcs.constprop.9, .-switch_arcs.constprop.9
	.p2align 4,,15
	.type	spec_qsort.constprop.11, @function
spec_qsort.constprop.11:
.LFB79:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rsi, 24(%rsp)
.L73:
	xorl	%eax, %eax
	testb	$7, %r12b
	setne	%al
	addl	%eax, %eax
	movl	%eax, 16(%rsp)
	xorl	%eax, %eax
	testb	$3, %r12b
	setne	%al
	incl	%eax
	cmpq	$6, 24(%rsp)
	movl	%eax, 20(%rsp)
	jbe	.L334
	movq	24(%rsp), %rdx
	movq	%rdx, %rax
	leaq	-8(%r12,%rdx,8), %r14
	shrq	%rax
	leaq	(%r12,%rax,8), %r15
	cmpq	$7, %rdx
	je	.L84
	movq	%r14, %rbx
	movq	%r12, %rbp
	cmpq	$40, %rdx
	ja	.L335
.L85:
	movq	%r15, %rsi
	movq	%rbp, %rdi
	call	*%r13
	movq	%rbx, %rsi
	movq	%r15, %rdi
	testl	%eax, %eax
	js	.L336
	call	*%r13
	testl	%eax, %eax
	jg	.L84
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	*%r13
	testl	%eax, %eax
	cmovs	%rbp, %rbx
	movq	%rbx, %r15
	.p2align 4,,15
.L84:
	movl	16(%rsp), %eax
	testl	%eax, %eax
	jne	.L337
.L159:
	movq	(%r12), %rax
	movq	(%r15), %rsi
	movq	%rsi, (%r12)
	movq	%rax, (%r15)
.L92:
	leaq	8(%r12), %rax
	movq	%rax, 40(%rsp)
	cmpq	%r14, %rax
	ja	.L94
	movq	%rax, %rbx
	movq	%r14, %rbp
	movq	%rax, 32(%rsp)
	xorl	%r15d, %r15d
	.p2align 4,,15
.L95:
	movq	%rbx, 8(%rsp)
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	*%r13
	testl	%eax, %eax
	jle	.L102
	cmpq	%r14, %rbx
	ja	.L101
	movl	%r15d, %eax
	movq	%rbp, %r15
	movl	%eax, %ebp
	jmp	.L103
	.p2align 4,,15
.L105:
	cmpl	$1, 20(%rsp)
	je	.L338
	movzbl	(%r14), %eax
	movzbl	(%r15), %ecx
	movb	%cl, (%r14)
	movb	%al, (%r15)
	movzbl	1(%r15), %ecx
	movzbl	1(%r14), %eax
	movb	%cl, 1(%r14)
	movb	%al, 1(%r15)
	movzbl	2(%r15), %ecx
	movzbl	2(%r14), %eax
	movb	%cl, 2(%r14)
	movb	%al, 2(%r15)
	movzbl	3(%r15), %ecx
	movzbl	3(%r14), %eax
	movb	%cl, 3(%r14)
	movb	%al, 3(%r15)
	movzbl	4(%r15), %ecx
	movzbl	4(%r14), %eax
	movb	%cl, 4(%r14)
	movb	%al, 4(%r15)
	movzbl	5(%r15), %ecx
	movzbl	5(%r14), %eax
	movb	%cl, 5(%r14)
	movb	%al, 5(%r15)
	movzbl	6(%r15), %ecx
	movzbl	6(%r14), %eax
	movb	%cl, 6(%r14)
	movb	%al, 6(%r15)
	movzbl	7(%r15), %ecx
	movzbl	7(%r14), %eax
	movb	%cl, 7(%r14)
	movb	%al, 7(%r15)
	.p2align 4,,15
.L106:
	subq	$8, %r15
	movl	$1, %ebp
.L104:
	subq	$8, %r14
	cmpq	%rbx, %r14
	jb	.L325
.L103:
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	*%r13
	testl	%eax, %eax
	js	.L339
	jne	.L104
	movl	16(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L105
	movq	(%r14), %rax
	movq	(%r15), %rcx
	movq	%rcx, (%r14)
	movq	%rax, (%r15)
	jmp	.L106
	.p2align 4,,15
.L339:
	movl	16(%rsp), %edx
	movq	%r15, %rbp
	testl	%edx, %edx
	je	.L155
	cmpl	$1, 20(%rsp)
	je	.L340
	movzbl	(%rbx), %eax
	movzbl	(%r14), %ecx
	movb	%cl, (%rbx)
	movb	%al, (%r14)
	movzbl	1(%r14), %ecx
	movzbl	1(%rbx), %eax
	movb	%cl, 1(%rbx)
	movb	%al, 1(%r14)
	movzbl	2(%r14), %ecx
	movzbl	2(%rbx), %eax
	movb	%cl, 2(%rbx)
	movb	%al, 2(%r14)
	movzbl	3(%r14), %ecx
	movzbl	3(%rbx), %eax
	movb	%cl, 3(%rbx)
	movb	%al, 3(%r14)
	movzbl	4(%r14), %ecx
	movzbl	4(%rbx), %eax
	movb	%cl, 4(%rbx)
	movb	%al, 4(%r14)
	movzbl	5(%r14), %ecx
	movzbl	5(%rbx), %eax
	movb	%cl, 5(%rbx)
	movb	%al, 5(%r14)
	movzbl	6(%r14), %ecx
	movzbl	6(%rbx), %eax
	movb	%cl, 6(%rbx)
	movb	%al, 6(%r14)
	movzbl	7(%r14), %ecx
	movzbl	7(%rbx), %eax
	movb	%cl, 7(%rbx)
	movb	%al, 7(%r14)
	.p2align 4,,15
.L110:
	addq	$8, %rbx
	subq	$8, %r14
	movl	$1, %r15d
	movq	%rbx, 8(%rsp)
.L112:
	cmpq	%r14, %rbx
	jbe	.L95
.L101:
	movq	24(%rsp), %rax
	leaq	(%r12,%rax,8), %rbx
	testl	%r15d, %r15d
	je	.L96
	movq	32(%rsp), %rax
	movq	8(%rsp), %rsi
	movq	%rbp, %r15
	subq	%rax, %rsi
	subq	%r12, %rax
	cmpq	%rsi, %rax
	movq	%rax, %rcx
	movq	%rbx, %rax
	cmovg	%rsi, %rcx
	subq	%rbp, %rax
	subq	%r14, %r15
	subq	$8, %rax
	cmpq	%r15, %rax
	cmovg	%r15, %rax
	movq	%rax, %rdi
	testq	%rcx, %rcx
	jne	.L341
	testq	%rax, %rax
	jne	.L134
.L141:
	cmpq	$8, %rsi
	ja	.L342
.L136:
	cmpq	$8, %r15
	jbe	.L332
	subq	%r15, %rbx
	shrq	$3, %r15
	movq	%rbx, %r12
	movq	%r15, 24(%rsp)
	jmp	.L73
	.p2align 4,,15
.L155:
	movq	(%rbx), %rax
	movq	(%r14), %rcx
	movq	%rcx, (%rbx)
	movq	%rax, (%r14)
	jmp	.L110
	.p2align 4,,15
.L102:
	jne	.L97
	movl	16(%rsp), %esi
	movq	32(%rsp), %rdx
	testl	%esi, %esi
	je	.L343
	cmpl	$1, 20(%rsp)
	je	.L344
	movzbl	(%rdx), %eax
	movzbl	(%rbx), %ecx
	movl	$1, %r15d
	movb	%cl, (%rdx)
	movb	%al, (%rbx)
	movzbl	1(%rbx), %ecx
	movzbl	1(%rdx), %eax
	movb	%cl, 1(%rdx)
	movb	%al, 1(%rbx)
	movzbl	2(%rbx), %ecx
	movzbl	2(%rdx), %eax
	movb	%cl, 2(%rdx)
	movb	%al, 2(%rbx)
	movzbl	3(%rbx), %ecx
	movzbl	3(%rdx), %eax
	movb	%cl, 3(%rdx)
	movb	%al, 3(%rbx)
	movzbl	4(%rbx), %ecx
	movzbl	4(%rdx), %eax
	movb	%cl, 4(%rdx)
	movb	%al, 4(%rbx)
	movzbl	5(%rbx), %ecx
	movzbl	5(%rdx), %eax
	movb	%cl, 5(%rdx)
	movb	%al, 5(%rbx)
	movzbl	6(%rbx), %ecx
	movzbl	6(%rdx), %eax
	movb	%cl, 6(%rdx)
	movb	%al, 6(%rbx)
	movzbl	7(%rbx), %ecx
	movzbl	7(%rdx), %eax
	movb	%cl, 7(%rdx)
	movb	%al, 7(%rbx)
	addq	$8, 32(%rsp)
	.p2align 4,,15
.L97:
	addq	$8, %rbx
	movq	%rbx, 8(%rsp)
	jmp	.L112
	.p2align 4,,15
.L338:
	movl	(%r14), %eax
	movl	(%r15), %ecx
	movl	%ecx, (%r14)
	movl	%eax, (%r15)
	movl	4(%r15), %ecx
	movl	4(%r14), %eax
	movl	%ecx, 4(%r14)
	movl	%eax, 4(%r15)
	jmp	.L106
.L343:
	movq	(%rdx), %rax
	movq	(%rbx), %rcx
	movq	%rcx, (%rdx)
	movq	%rax, (%rbx)
.L99:
	addq	$8, %rbx
	movl	$1, %r15d
	addq	$8, 32(%rsp)
	movq	%rbx, 8(%rsp)
	jmp	.L112
.L94:
	movq	24(%rsp), %rax
	leaq	(%r12,%rax,8), %rbx
.L96:
	cmpq	%rbx, 40(%rsp)
	jnb	.L332
	movl	16(%rsp), %ebp
	movq	40(%rsp), %r14
.L118:
	movq	%r14, %rsi
	jmp	.L117
	.p2align 4,,15
.L114:
	cmpl	$1, 20(%rsp)
	je	.L345
	movzbl	8(%r15), %eax
	movzbl	(%r15), %ecx
	movb	%al, (%r15)
	movb	%cl, 8(%r15)
	movzbl	9(%r15), %eax
	movzbl	1(%r15), %ecx
	movb	%al, 1(%r15)
	movb	%cl, 9(%r15)
	movzbl	10(%r15), %eax
	movzbl	2(%r15), %ecx
	movb	%al, 2(%r15)
	movb	%cl, 10(%r15)
	movzbl	11(%r15), %eax
	movzbl	3(%r15), %ecx
	movb	%al, 3(%r15)
	movb	%cl, 11(%r15)
	movzbl	12(%r15), %eax
	movzbl	4(%r15), %ecx
	movb	%al, 4(%r15)
	movb	%cl, 12(%r15)
	movzbl	13(%r15), %eax
	movzbl	5(%r15), %ecx
	movb	%al, 5(%r15)
	movb	%cl, 13(%r15)
	movzbl	14(%r15), %eax
	movzbl	6(%r15), %ecx
	movb	%al, 6(%r15)
	movb	%cl, 14(%r15)
	movzbl	15(%r15), %eax
	movzbl	7(%r15), %ecx
	movb	%al, 7(%r15)
	movb	%cl, 15(%r15)
.L115:
	movq	%r15, %rsi
	cmpq	%r15, %r12
	jnb	.L113
.L117:
	leaq	-8(%rsi), %r15
	movq	%r15, %rdi
	call	*%r13
	testl	%eax, %eax
	jle	.L113
	testl	%ebp, %ebp
	jne	.L114
	vmovups	(%r15), %xmm2
	movq	%r15, %rsi
	vpalignr	$8, %xmm2, %xmm2, %xmm0
	vmovups	%xmm0, (%r15)
	cmpq	%r15, %r12
	jb	.L117
.L113:
	addq	$8, %r14
	cmpq	%rbx, %r14
	jb	.L118
.L332:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L340:
	.cfi_restore_state
	movl	(%rbx), %eax
	movl	(%r14), %ecx
	movl	%ecx, (%rbx)
	movl	%eax, (%r14)
	movl	4(%r14), %ecx
	movl	4(%rbx), %eax
	movl	%ecx, 4(%rbx)
	movl	%eax, 4(%r14)
	jmp	.L110
.L342:
	shrq	$3, %rsi
	movq	%r13, %rdx
	movq	%r12, %rdi
	call	spec_qsort.constprop.11
	jmp	.L136
.L341:
	movq	8(%rsp), %r11
	movl	%ecx, %r9d
	movq	%r11, %rax
	subq	%rcx, %rax
	cmpl	$2, 16(%rsp)
	jne	.L346
	cmpl	$1, 20(%rsp)
	movq	%r11, %rdx
	movslq	%ecx, %r8
	je	.L347
	subq	%rcx, %rdx
	leaq	16(%r12), %r10
	addq	$16, %rdx
	cmpq	%rdx, %r12
	setnb	%dl
	cmpq	%r10, %rax
	setnb	%r10b
	orl	%r10d, %edx
	andl	$1, %edx
	je	.L179
	cmpl	$15, %ecx
	jle	.L179
	testl	%ecx, %ecx
	movl	$1, %r9d
	cmovg	%r8, %r9
	xorl	%edx, %edx
	movq	%r9, %rcx
	andq	$-16, %rcx
.L131:
	vmovups	(%r12,%rdx), %xmm0
	vmovups	(%rax,%rdx), %xmm5
	vmovups	%xmm5, (%r12,%rdx)
	vmovups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L131
	movq	%r9, %r10
	movq	%r8, %rcx
	andq	$-16, %r10
	subq	%r10, %rcx
	leaq	(%r12,%r10), %rdx
	addq	%r10, %rax
	cmpq	%r10, %r9
	je	.L133
	movzbl	(%rdx), %r8d
	movzbl	(%rax), %r9d
	movb	%r9b, (%rdx)
	movb	%r8b, (%rax)
	leaq	-1(%rcx), %r8
	testq	%r8, %r8
	jle	.L133
	movzbl	1(%rdx), %r8d
	movzbl	1(%rax), %r9d
	movb	%r9b, 1(%rdx)
	movb	%r8b, 1(%rax)
	cmpq	$2, %rcx
	je	.L133
	movzbl	2(%rdx), %r8d
	movzbl	2(%rax), %r9d
	movb	%r9b, 2(%rdx)
	movb	%r8b, 2(%rax)
	cmpq	$3, %rcx
	je	.L133
	movzbl	3(%rdx), %r8d
	movzbl	3(%rax), %r9d
	movb	%r9b, 3(%rdx)
	movb	%r8b, 3(%rax)
	cmpq	$4, %rcx
	je	.L133
	movzbl	4(%rdx), %r8d
	movzbl	4(%rax), %r9d
	movb	%r9b, 4(%rdx)
	movb	%r8b, 4(%rax)
	cmpq	$5, %rcx
	je	.L133
	movzbl	5(%rdx), %r8d
	movzbl	5(%rax), %r9d
	movb	%r9b, 5(%rdx)
	movb	%r8b, 5(%rax)
	cmpq	$6, %rcx
	je	.L133
	movzbl	6(%rdx), %r8d
	movzbl	6(%rax), %r9d
	movb	%r9b, 6(%rdx)
	movb	%r8b, 6(%rax)
	cmpq	$7, %rcx
	je	.L133
	movzbl	7(%rdx), %r8d
	movzbl	7(%rax), %r9d
	movb	%r9b, 7(%rdx)
	movb	%r8b, 7(%rax)
	cmpq	$8, %rcx
	je	.L133
	movzbl	8(%rdx), %r8d
	movzbl	8(%rax), %r9d
	movb	%r9b, 8(%rdx)
	movb	%r8b, 8(%rax)
	cmpq	$9, %rcx
	je	.L133
	movzbl	9(%rdx), %r8d
	movzbl	9(%rax), %r9d
	movb	%r9b, 9(%rdx)
	movb	%r8b, 9(%rax)
	cmpq	$10, %rcx
	je	.L133
	movzbl	10(%rdx), %r8d
	movzbl	10(%rax), %r9d
	movb	%r9b, 10(%rdx)
	movb	%r8b, 10(%rax)
	cmpq	$11, %rcx
	je	.L133
	movzbl	11(%rdx), %r8d
	movzbl	11(%rax), %r9d
	movb	%r9b, 11(%rdx)
	movb	%r8b, 11(%rax)
	cmpq	$12, %rcx
	je	.L133
	movzbl	12(%rdx), %r8d
	movzbl	12(%rax), %r9d
	movb	%r9b, 12(%rdx)
	movb	%r8b, 12(%rax)
	cmpq	$13, %rcx
	je	.L133
	movzbl	13(%rdx), %r8d
	movzbl	13(%rax), %r9d
	movb	%r9b, 13(%rdx)
	movb	%r8b, 13(%rax)
	cmpq	$14, %rcx
	je	.L133
	movzbl	14(%rdx), %ecx
	movzbl	14(%rax), %r8d
	movb	%r8b, 14(%rdx)
	movb	%cl, 14(%rax)
.L133:
	testq	%rdi, %rdi
	je	.L141
	movq	%rbx, %rax
	movl	%edi, %edx
	subq	%rdi, %rax
.L144:
	movq	8(%rsp), %r9
	leaq	16(%rax), %r8
	movslq	%edx, %rcx
	leaq	16(%r9), %rdi
	cmpq	%rdi, %rax
	setnb	%dil
	cmpq	%r8, %r9
	setnb	%r8b
	orl	%r8d, %edi
	andl	$1, %edi
	je	.L180
	cmpl	$15, %edx
	jle	.L180
	testl	%edx, %edx
	movl	$1, %r8d
	cmovg	%rcx, %r8
	xorl	%edx, %edx
	movq	%r8, %rdi
	andq	$-16, %rdi
.L151:
	vmovups	(%r9,%rdx), %xmm0
	vmovups	(%rax,%rdx), %xmm6
	vmovups	%xmm6, (%r9,%rdx)
	vmovups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rdi, %rdx
	jne	.L151
	movq	8(%rsp), %rdx
	movq	%r8, %rdi
	andq	$-16, %rdi
	subq	%rdi, %rcx
	addq	%rdi, %rax
	addq	%rdi, %rdx
	cmpq	%rdi, %r8
	je	.L141
	movzbl	(%rdx), %edi
	movzbl	(%rax), %r8d
	movb	%r8b, (%rdx)
	movb	%dil, (%rax)
	leaq	-1(%rcx), %rdi
	testq	%rdi, %rdi
	jle	.L141
	movzbl	1(%rdx), %edi
	movzbl	1(%rax), %r8d
	movb	%r8b, 1(%rdx)
	movb	%dil, 1(%rax)
	cmpq	$2, %rcx
	je	.L141
	movzbl	2(%rdx), %edi
	movzbl	2(%rax), %r8d
	movb	%r8b, 2(%rdx)
	movb	%dil, 2(%rax)
	cmpq	$3, %rcx
	je	.L141
	movzbl	3(%rdx), %edi
	movzbl	3(%rax), %r8d
	movb	%r8b, 3(%rdx)
	movb	%dil, 3(%rax)
	cmpq	$4, %rcx
	je	.L141
	movzbl	4(%rdx), %edi
	movzbl	4(%rax), %r8d
	movb	%r8b, 4(%rdx)
	movb	%dil, 4(%rax)
	cmpq	$5, %rcx
	je	.L141
	movzbl	5(%rdx), %edi
	movzbl	5(%rax), %r8d
	movb	%r8b, 5(%rdx)
	movb	%dil, 5(%rax)
	cmpq	$6, %rcx
	je	.L141
	movzbl	6(%rdx), %edi
	movzbl	6(%rax), %r8d
	movb	%r8b, 6(%rdx)
	movb	%dil, 6(%rax)
	cmpq	$7, %rcx
	je	.L141
	movzbl	7(%rdx), %edi
	movzbl	7(%rax), %r8d
	movb	%r8b, 7(%rdx)
	movb	%dil, 7(%rax)
	cmpq	$8, %rcx
	je	.L141
	movzbl	8(%rdx), %edi
	movzbl	8(%rax), %r8d
	movb	%r8b, 8(%rdx)
	movb	%dil, 8(%rax)
	cmpq	$9, %rcx
	je	.L141
	movzbl	9(%rdx), %edi
	movzbl	9(%rax), %r8d
	movb	%r8b, 9(%rdx)
	movb	%dil, 9(%rax)
	cmpq	$10, %rcx
	je	.L141
	movzbl	10(%rdx), %edi
	movzbl	10(%rax), %r8d
	movb	%r8b, 10(%rdx)
	movb	%dil, 10(%rax)
	cmpq	$11, %rcx
	je	.L141
	movzbl	11(%rdx), %edi
	movzbl	11(%rax), %r8d
	movb	%r8b, 11(%rdx)
	movb	%dil, 11(%rax)
	cmpq	$12, %rcx
	je	.L141
	movzbl	12(%rdx), %edi
	movzbl	12(%rax), %r8d
	movb	%r8b, 12(%rdx)
	movb	%dil, 12(%rax)
	cmpq	$13, %rcx
	je	.L141
	movzbl	13(%rdx), %edi
	movzbl	13(%rax), %r8d
	movb	%r8b, 13(%rdx)
	movb	%dil, 13(%rax)
	cmpq	$14, %rcx
	je	.L141
	movzbl	14(%rdx), %ecx
	movzbl	14(%rax), %edi
	movb	%dil, 14(%rdx)
	movb	%cl, 14(%rax)
	jmp	.L141
	.p2align 4,,15
.L134:
	movslq	%eax, %rdx
	movq	%rbx, %rax
	subq	%rdi, %rax
	cmpl	$2, 16(%rsp)
	jne	.L161
	cmpl	$1, 20(%rsp)
	jne	.L144
.L163:
	movq	8(%rsp), %r9
	leaq	16(%rax), %rdi
	shrq	$2, %rdx
	movq	%rdx, %rcx
	cmpq	%rdi, %r9
	leaq	16(%r9), %r8
	setnb	%dil
	cmpq	%r8, %rax
	setnb	%r8b
	orl	%r8d, %edi
	andl	$1, %edi
	je	.L329
	leaq	-4(%rdx), %rdi
	movabsq	$9223372036854775803, %r11
	cmpq	%r11, %rdi
	ja	.L329
	testq	%rdx, %rdx
	movl	$1, %r8d
	cmovg	%rdx, %r8
	xorl	%edx, %edx
	movq	%r8, %rdi
	shrq	$2, %rdi
	salq	$4, %rdi
.L146:
	vmovups	(%r9,%rdx), %xmm0
	vmovups	(%rax,%rdx), %xmm7
	vmovups	%xmm7, (%r9,%rdx)
	vmovups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rdi, %rdx
	jne	.L146
	movq	8(%rsp), %r9
	movq	%r8, %rdx
	andq	$-4, %rdx
	leaq	0(,%rdx,4), %rdi
	subq	%rdx, %rcx
	addq	%rdi, %rax
	addq	%rdi, %r9
	cmpq	%rdx, %r8
	je	.L141
	movl	(%r9), %edx
	movl	(%rax), %edi
	movl	%edi, (%r9)
	movl	%edx, (%rax)
	leaq	-1(%rcx), %rdx
	testq	%rdx, %rdx
	jle	.L141
	movl	4(%r9), %edx
	movl	4(%rax), %edi
	movl	%edi, 4(%r9)
	movl	%edx, 4(%rax)
	cmpq	$2, %rcx
	je	.L141
	movl	8(%r9), %edx
	movl	8(%rax), %ecx
	movl	%ecx, 8(%r9)
	movl	%edx, 8(%rax)
	jmp	.L141
.L336:
	call	*%r13
	testl	%eax, %eax
	js	.L84
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	*%r13
	movq	%rbp, %r15
	testl	%eax, %eax
	movl	16(%rsp), %eax
	cmovs	%rbx, %r15
	testl	%eax, %eax
	je	.L159
.L337:
	cmpl	$1, 20(%rsp)
	je	.L348
	movzbl	(%r12), %eax
	movzbl	(%r15), %esi
	movb	%sil, (%r12)
	movb	%al, (%r15)
	movzbl	1(%r15), %esi
	movzbl	1(%r12), %eax
	movb	%sil, 1(%r12)
	movb	%al, 1(%r15)
	movzbl	2(%r15), %esi
	movzbl	2(%r12), %eax
	movb	%sil, 2(%r12)
	movb	%al, 2(%r15)
	movzbl	3(%r15), %esi
	movzbl	3(%r12), %eax
	movb	%sil, 3(%r12)
	movb	%al, 3(%r15)
	movzbl	4(%r15), %esi
	movzbl	4(%r12), %eax
	movb	%sil, 4(%r12)
	movb	%al, 4(%r15)
	movzbl	5(%r15), %esi
	movzbl	5(%r12), %eax
	movb	%sil, 5(%r12)
	movb	%al, 5(%r15)
	movzbl	6(%r15), %esi
	movzbl	6(%r12), %eax
	movb	%sil, 6(%r12)
	movb	%al, 6(%r15)
	movzbl	7(%r15), %esi
	movzbl	7(%r12), %eax
	movb	%sil, 7(%r12)
	movb	%al, 7(%r15)
	jmp	.L92
.L335:
	movq	%rdx, %rax
	movq	%r12, %rdi
	andq	$-8, %rax
	leaq	(%r12,%rax), %rbp
	leaq	(%r12,%rax,2), %rbx
	movq	%rax, 8(%rsp)
	movq	%rbp, %rsi
	call	*%r13
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	testl	%eax, %eax
	js	.L349
	call	*%r13
	testl	%eax, %eax
	jg	.L87
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	*%r13
	testl	%eax, %eax
	cmovs	%r12, %rbx
	movq	%rbx, %rbp
.L87:
	movq	8(%rsp), %rax
	movq	%r15, %rsi
	leaq	(%r15,%rax), %rbx
	negq	%rax
	movq	%rax, 32(%rsp)
	addq	%r15, %rax
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*%r13
	movq	%rbx, %rsi
	movq	%r15, %rdi
	testl	%eax, %eax
	js	.L350
	call	*%r13
	testl	%eax, %eax
	jg	.L89
	movq	8(%rsp), %r15
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	*%r13
	testl	%eax, %eax
	cmovns	%rbx, %r15
.L89:
	movq	32(%rsp), %rax
	leaq	(%r14,%rax), %rbx
	addq	%rbx, %rax
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*%r13
	movq	%r14, %rsi
	movq	%rbx, %rdi
	testl	%eax, %eax
	js	.L351
	call	*%r13
	testl	%eax, %eax
	jg	.L85
	movq	8(%rsp), %rbx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*%r13
	testl	%eax, %eax
	cmovns	%r14, %rbx
	jmp	.L85
.L346:
	movslq	%ecx, %rdx
	movq	%rax, %rcx
	leaq	16(%r12), %r9
	addq	$16, %rcx
	shrq	$3, %rdx
	cmpq	%rcx, %r12
	movq	%rdx, %r8
	setnb	%cl
	cmpq	%r9, %rax
	setnb	%r9b
	orl	%r9d, %ecx
	andl	$1, %ecx
	je	.L177
	leaq	-3(%rdx), %rcx
	movabsq	$9223372036854775804, %r10
	cmpq	%r10, %rcx
	ja	.L177
	testq	%rdx, %rdx
	movl	$1, %r8d
	cmovg	%rdx, %r8
	xorl	%edx, %edx
	movq	%r8, %rcx
	shrq	%rcx
	salq	$4, %rcx
.L122:
	vmovups	(%r12,%rdx), %xmm0
	vmovups	(%rax,%rdx), %xmm3
	vmovups	%xmm3, (%r12,%rdx)
	vmovups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L122
	movq	%r8, %r9
	andq	$-2, %r9
	leaq	0(,%r9,8), %rdx
	leaq	(%r12,%rdx), %rcx
	addq	%rdx, %rax
	cmpq	%r8, %r9
	je	.L124
	movq	(%rcx), %rdx
	movq	(%rax), %r8
	movq	%r8, (%rcx)
	movq	%rdx, (%rax)
.L124:
	testq	%rdi, %rdi
	je	.L141
	movq	%rbx, %rax
	movslq	%edi, %rdx
	subq	%rdi, %rax
.L161:
	movq	8(%rsp), %r11
	leaq	16(%rax), %rcx
	shrq	$3, %rdx
	movq	%rdx, %rdi
	cmpq	%rcx, %r11
	leaq	16(%r11), %r8
	setnb	%cl
	cmpq	%r8, %rax
	setnb	%r8b
	orl	%r8d, %ecx
	andl	$1, %ecx
	je	.L327
	leaq	-3(%rdx), %rcx
	movabsq	$9223372036854775804, %r10
	cmpq	%r10, %rcx
	ja	.L327
	testq	%rdx, %rdx
	movl	$1, %edi
	movq	%r11, %r8
	cmovg	%rdx, %rdi
	xorl	%edx, %edx
	movq	%rdi, %rcx
	shrq	%rcx
	salq	$4, %rcx
.L139:
	vmovups	(%r8,%rdx), %xmm0
	vmovups	(%rax,%rdx), %xmm4
	vmovups	%xmm4, (%r8,%rdx)
	vmovups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L139
	movq	8(%rsp), %rcx
	movq	%rdi, %r8
	andq	$-2, %r8
	leaq	0(,%r8,8), %rdx
	addq	%rdx, %rax
	addq	%rdx, %rcx
	cmpq	%r8, %rdi
	je	.L141
	movq	(%rcx), %rdx
	movq	(%rax), %rdi
	movq	%rdi, (%rcx)
	movq	%rdx, (%rax)
	jmp	.L141
.L347:
	subq	%rcx, %rdx
	shrq	$2, %r8
	leaq	16(%r12), %rcx
	addq	$16, %rdx
	movq	%r8, %r9
	cmpq	%rdx, %r12
	setnb	%dl
	cmpq	%rcx, %rax
	setnb	%cl
	orl	%ecx, %edx
	andl	$1, %edx
	je	.L178
	leaq	-4(%r8), %rdx
	movabsq	$9223372036854775803, %rcx
	cmpq	%rcx, %rdx
	ja	.L178
	testq	%r8, %r8
	movl	$1, %r9d
	cmovg	%r8, %r9
	xorl	%edx, %edx
	movq	%r9, %rcx
	shrq	$2, %rcx
	salq	$4, %rcx
.L127:
	vmovups	(%r12,%rdx), %xmm0
	vmovups	(%rax,%rdx), %xmm7
	vmovups	%xmm7, (%r12,%rdx)
	vmovups	%xmm0, (%rax,%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L127
	movq	%r9, %rdx
	andq	$-4, %rdx
	leaq	0(,%rdx,4), %rcx
	subq	%rdx, %r8
	leaq	(%r12,%rcx), %r10
	addq	%rcx, %rax
	cmpq	%rdx, %r9
	je	.L129
	movl	(%r10), %edx
	movl	(%rax), %ecx
	movl	%ecx, (%r10)
	movl	%edx, (%rax)
	leaq	-1(%r8), %rdx
	testq	%rdx, %rdx
	jle	.L129
	movl	4(%r10), %edx
	movl	4(%rax), %ecx
	movl	%ecx, 4(%r10)
	movl	%edx, 4(%rax)
	cmpq	$2, %r8
	je	.L129
	movl	8(%r10), %edx
	movl	8(%rax), %ecx
	movl	%ecx, 8(%r10)
	movl	%edx, 8(%rax)
.L129:
	testq	%rdi, %rdi
	je	.L141
	movq	%rbx, %rax
	movslq	%edi, %rdx
	subq	%rdi, %rax
	jmp	.L163
.L349:
	call	*%r13
	testl	%eax, %eax
	js	.L87
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	*%r13
	testl	%eax, %eax
	cmovns	%r12, %rbx
	movq	%rbx, %rbp
	jmp	.L87
.L344:
	movl	(%rdx), %eax
	movl	(%rbx), %ecx
	movl	%ecx, (%rdx)
	movl	%eax, (%rbx)
	movl	4(%rbx), %ecx
	movl	4(%rdx), %eax
	movl	%ecx, 4(%rdx)
	movl	%eax, 4(%rbx)
	jmp	.L99
.L345:
	movl	8(%r15), %eax
	movl	(%r15), %ecx
	movl	%eax, (%r15)
	movl	%ecx, 8(%r15)
	movl	12(%r15), %eax
	movl	4(%r15), %ecx
	movl	%eax, 4(%r15)
	movl	%ecx, 12(%r15)
	jmp	.L115
.L334:
	movq	24(%rsp), %rax
	leaq	8(%r12), %rbx
	leaq	(%r12,%rax,8), %rbp
	cmpq	%rbp, %rbx
	jnb	.L332
	movl	16(%rsp), %r14d
.L83:
	movq	%rbx, %rsi
	jmp	.L82
	.p2align 4,,15
.L79:
	cmpl	$1, 20(%rsp)
	je	.L352
	movzbl	8(%r15), %eax
	movzbl	(%r15), %ecx
	movb	%al, (%r15)
	movb	%cl, 8(%r15)
	movzbl	9(%r15), %eax
	movzbl	1(%r15), %ecx
	movb	%al, 1(%r15)
	movb	%cl, 9(%r15)
	movzbl	10(%r15), %eax
	movzbl	2(%r15), %ecx
	movb	%al, 2(%r15)
	movb	%cl, 10(%r15)
	movzbl	11(%r15), %eax
	movzbl	3(%r15), %ecx
	movb	%al, 3(%r15)
	movb	%cl, 11(%r15)
	movzbl	12(%r15), %eax
	movzbl	4(%r15), %ecx
	movb	%al, 4(%r15)
	movb	%cl, 12(%r15)
	movzbl	13(%r15), %eax
	movzbl	5(%r15), %ecx
	movb	%al, 5(%r15)
	movb	%cl, 13(%r15)
	movzbl	14(%r15), %eax
	movzbl	6(%r15), %ecx
	movb	%al, 6(%r15)
	movb	%cl, 14(%r15)
	movzbl	15(%r15), %eax
	movzbl	7(%r15), %ecx
	movb	%al, 7(%r15)
	movb	%cl, 15(%r15)
.L80:
	movq	%r15, %rsi
	cmpq	%r15, %r12
	jnb	.L78
.L82:
	leaq	-8(%rsi), %r15
	movq	%r15, %rdi
	call	*%r13
	testl	%eax, %eax
	jle	.L78
	testl	%r14d, %r14d
	jne	.L79
	vmovups	(%r15), %xmm1
	movq	%r15, %rsi
	vpalignr	$8, %xmm1, %xmm1, %xmm0
	vmovups	%xmm0, (%r15)
	cmpq	%r15, %r12
	jb	.L82
.L78:
	addq	$8, %rbx
	cmpq	%rbx, %rbp
	ja	.L83
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L352:
	.cfi_restore_state
	movl	8(%r15), %eax
	movl	(%r15), %ecx
	movl	%eax, (%r15)
	movl	%ecx, 8(%r15)
	movl	12(%r15), %eax
	movl	4(%r15), %ecx
	movl	%eax, 4(%r15)
	movl	%ecx, 12(%r15)
	jmp	.L80
.L351:
	call	*%r13
	testl	%eax, %eax
	js	.L85
	movq	8(%rsp), %rbx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	*%r13
	testl	%eax, %eax
	movq	%rbx, %rax
	cmovs	%r14, %rax
	movq	%rax, %rbx
	jmp	.L85
.L350:
	call	*%r13
	testl	%eax, %eax
	js	.L89
	movq	8(%rsp), %r15
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	*%r13
	testl	%eax, %eax
	movq	%r15, %rax
	cmovs	%rbx, %rax
	movq	%rax, %r15
	jmp	.L89
.L177:
	movq	%r12, %rdx
.L121:
	movq	(%rdx), %rcx
	movq	(%rax), %r9
	addq	$8, %rdx
	addq	$8, %rax
	decq	%r8
	movq	%r9, -8(%rdx)
	movq	%rcx, -8(%rax)
	testq	%r8, %r8
	jg	.L121
	jmp	.L124
.L327:
	movq	%r11, %rdx
.L260:
	movq	(%rdx), %rcx
	movq	(%rax), %r8
	addq	$8, %rdx
	addq	$8, %rax
	decq	%rdi
	movq	%r8, -8(%rdx)
	movq	%rcx, -8(%rax)
	testq	%rdi, %rdi
	jg	.L260
	jmp	.L141
.L348:
	movl	(%r12), %eax
	movl	(%r15), %esi
	movl	%esi, (%r12)
	movl	%eax, (%r15)
	movl	4(%r15), %esi
	movl	4(%r12), %eax
	movl	%esi, 4(%r12)
	movl	%eax, 4(%r15)
	jmp	.L92
.L179:
	movslq	%r9d, %rcx
	movq	%r12, %rdx
	addq	%r12, %rcx
.L130:
	movzbl	(%rdx), %r8d
	movzbl	(%rax), %r9d
	incq	%rdx
	incq	%rax
	movb	%r9b, -1(%rdx)
	movb	%r8b, -1(%rax)
	movq	%rcx, %r8
	subq	%rdx, %r8
	testq	%r8, %r8
	jg	.L130
	jmp	.L133
.L180:
	movq	8(%rsp), %rdx
	addq	%rax, %rcx
.L150:
	movzbl	(%rdx), %edi
	movzbl	(%rax), %r8d
	incq	%rdx
	incq	%rax
	movb	%r8b, -1(%rdx)
	movb	%dil, -1(%rax)
	movq	%rcx, %rdi
	subq	%rax, %rdi
	testq	%rdi, %rdi
	jg	.L150
	jmp	.L141
.L329:
	movq	%r9, %rcx
.L261:
	movl	(%rcx), %edi
	movl	(%rax), %r8d
	addq	$4, %rcx
	addq	$4, %rax
	decq	%rdx
	movl	%r8d, -4(%rcx)
	movl	%edi, -4(%rax)
	testq	%rdx, %rdx
	jg	.L261
	jmp	.L141
.L178:
	movq	%r12, %rdx
.L126:
	movl	(%rdx), %ecx
	movl	(%rax), %r8d
	addq	$4, %rdx
	addq	$4, %rax
	decq	%r9
	movl	%r8d, -4(%rdx)
	movl	%ecx, -4(%rax)
	testq	%r9, %r9
	jg	.L126
	jmp	.L129
.L325:
	movl	%ebp, %eax
	movq	%r15, %rbp
	movl	%eax, %r15d
	jmp	.L101
	.cfi_endproc
.LFE79:
	.size	spec_qsort.constprop.11, .-spec_qsort.constprop.11
	.p2align 4,,15
	.type	primal_bea_mpp.constprop.5, @function
primal_bea_mpp.constprop.5:
.LFB84:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%r8d, %r8
	movl	$1, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	(%rdx,%r8,8), %r10
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rdi, 48(%rsp)
	movq	%rsi, 16(%rsp)
	movq	128(%rsp), %r11
	movq	136(%rsp), %rbp
	movq	144(%rsp), %rdi
	jmp	.L354
	.p2align 4,,15
.L356:
	je	.L355
	cmpw	$2, 32(%r12)
	je	.L357
.L355:
	incq	%rax
	cmpq	$61, %rax
	je	.L358
.L354:
	cmpq	%rax, (%r10)
	jl	.L358
	movq	(%rcx,%rax,8), %rsi
	cmpq	$0, 24(%rsi)
	jle	.L355
	movq	(%rsi), %r12
	movq	16(%r12), %r8
	movq	8(%r12), %rsi
	subq	(%r8), %rsi
	movq	24(%r12), %r8
	addq	(%r8), %rsi
	jns	.L356
	cmpw	$1, 32(%r12)
	jne	.L355
.L357:
	incq	%rbx
	incq	%rax
	leaq	(%rcx,%rbx,8), %r8
	movq	(%r8), %r13
	movq	%r12, 0(%r13)
	movq	(%r8), %r12
	movq	%rsi, %r13
	sarq	$63, %r13
	movq	%rsi, 8(%r12)
	movq	(%r8), %r12
	xorq	%r13, %rsi
	movq	%rsi, 16(%r12)
	subq	%r13, 16(%r12)
	movq	(%r8), %rsi
	movq	$0, 24(%rsi)
	cmpq	$61, %rax
	jne	.L354
	.p2align 4,,15
.L358:
	leaq	(%r11,%r11,8), %rax
	movq	%rbx, (%r10)
	movq	%rbp, %rbx
	movq	(%r9), %r8
	salq	$3, %rax
	shrq	%rbx
	leaq	(%rdi,%rdi,8), %r12
	leaq	0(%rbp,%rbp,8), %r11
	movq	%rax, 24(%rsp)
	movq	full_group_end_arc(%rip), %rax
	salq	$3, %r12
	movq	%rbp, %r13
	leaq	-72(%r12), %r14
	salq	$3, %r11
	andq	$-2, %r13
	movq	%r8, (%rsp)
	movq	%rax, 8(%rsp)
	leaq	-1(%rbp), %rax
	movq	%rax, 32(%rsp)
	leaq	-5(%rbx), %rax
	andq	$-4, %rax
	movq	%rax, 40(%rsp)
	addq	$4, %rax
	movq	%rax, 56(%rsp)
.L361:
	.p2align 4,,15
.L360:
	movq	24(%rsp), %rax
	leaq	(%r8,%r14), %rsi
	leaq	(%r8,%r12), %rdi
	addq	%r8, %rax
	cmpq	%r8, 8(%rsp)
	cmova	%rdi, %rsi
	movq	%rsi, %r8
	movq	%rsi, (%r9)
	cmpq	%rax, %rsi
	ja	.L363
	jmp	.L364
	.p2align 4,,15
.L367:
	jle	.L366
	cmpw	$2, %di
	je	.L368
	.p2align 4,,15
.L366:
	addq	%r11, %rax
	cmpq	%r8, %rax
	jnb	.L364
.L363:
	movzwl	32(%rax), %edi
	testw	%di, %di
	jle	.L366
	movq	16(%rax), %r15
	movq	8(%rax), %rsi
	subq	(%r15), %rsi
	movq	24(%rax), %r15
	addq	(%r15), %rsi
	testq	%rsi, %rsi
	jns	.L367
	cmpw	$1, %di
	jne	.L366
.L368:
	movq	(%r10), %rdi
	movq	%rsi, %r8
	sarq	$63, %r8
	incq	%rdi
	movq	%rdi, (%r10)
	movq	(%rcx,%rdi,8), %rdi
	movq	%rax, (%rdi)
	movq	(%r10), %rdi
	addq	%r11, %rax
	movq	(%rcx,%rdi,8), %rdi
	movq	%rsi, 8(%rdi)
	movq	(%r10), %rdi
	xorq	%r8, %rsi
	movq	(%rcx,%rdi,8), %rdi
	movq	%rsi, 16(%rdi)
	subq	%r8, 16(%rdi)
	movq	(%r10), %rsi
	movq	(%rcx,%rsi,8), %rsi
	movq	$0, 24(%rsi)
	movq	(%r9), %r8
	cmpq	%r8, %rax
	jb	.L363
	.p2align 4,,15
.L364:
	cmpq	%r8, 16(%rsp)
	ja	.L369
	movq	48(%rsp), %rax
	movq	%rax, (%r9)
	movq	%rax, %r8
.L369:
	cmpq	%r8, (%rsp)
	je	.L370
	testq	%rbp, %rbp
	jle	.L360
	cmpq	$2, 32(%rsp)
	jbe	.L377
	movq	%rdx, %rax
	xorl	%esi, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	cmpq	$4, %rbx
	ja	.L373
	jmp	.L374
	.p2align 4,,15
.L379:
	movq	%rdi, %rsi
.L373:
	vpaddq	(%rax), %xmm0, %xmm0
	prefetcht0	544(%rax)
	leaq	4(%rsi), %rdi
	addq	$64, %rax
	vpaddq	-48(%rax), %xmm0, %xmm0
	vpaddq	-32(%rax), %xmm0, %xmm0
	vpaddq	-16(%rax), %xmm0, %xmm0
	cmpq	40(%rsp), %rsi
	jne	.L379
	movq	56(%rsp), %rsi
	.p2align 4,,15
.L374:
	incq	%rsi
	vpaddq	(%rax), %xmm0, %xmm0
	addq	$16, %rax
	cmpq	%rsi, %rbx
	ja	.L374
	vpsrldq	$8, %xmm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	movq	%r13, %rsi
	vmovq	%xmm0, %rax
	cmpq	%r13, %rbp
	je	.L375
.L371:
	leaq	0(,%rsi,8), %rdi
	leaq	1(%rsi), %r15
	addq	(%rdx,%rdi), %rax
	cmpq	%r15, %rbp
	jle	.L375
	addq	$2, %rsi
	addq	8(%rdx,%rdi), %rax
	cmpq	%rsi, %rbp
	jle	.L375
	addq	16(%rdx,%rdi), %rax
.L375:
	cmpq	$59, %rax
	jle	.L360
.L370:
	movq	(%r10), %rax
	movq	8(%rcx,%rax,8), %rax
	movq	$-1, 24(%rax)
	movq	(%r10), %rsi
	xorl	%eax, %eax
	testq	%rsi, %rsi
	je	.L400
	movq	%rcx, %rbx
	leaq	8(%rcx), %rdi
	movl	$cost_compare, %edx
	call	spec_qsort.constprop.11
	movq	8(%rbx), %rax
.L400:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L377:
	.cfi_restore_state
	xorl	%eax, %eax
	xorl	%esi, %esi
	jmp	.L371
	.cfi_endproc
.LFE84:
	.size	primal_bea_mpp.constprop.5, .-primal_bea_mpp.constprop.5
	.p2align 4,,15
	.globl	refresh_neighbour_lists
	.type	refresh_neighbour_lists, @function
refresh_neighbour_lists:
.LFB36:
	.cfi_startproc
	movq	552(%rdi), %rax
	movq	560(%rdi), %rdx
	cmpq	%rdx, %rax
	jnb	.L403
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,15
.L404:
	vmovups	%xmm0, 56(%rax)
	addq	$104, %rax
	cmpq	%rax, %rdx
	ja	.L404
.L403:
	cmpq	$0, 424(%rdi)
	movq	568(%rdi), %rax
	jle	.L411
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,15
.L406:
	movq	16(%rax), %rdx
	incq	%rbx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movq	56(%rdx), %rcx
	movq	%rcx, 40(%rax)
	movq	%rax, 56(%rdx)
	movq	24(%rax), %rdx
	movq	64(%rdx), %rcx
	movq	%rcx, 48(%rax)
	movq	%rax, 64(%rdx)
	movq	568(%rbp), %r13
	call	*%r12
	leaq	(%rax,%rax,8), %rax
	leaq	0(%r13,%rax,8), %rax
	cmpq	%rbx, 424(%rbp)
	jg	.L406
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L411:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE36:
	.size	refresh_neighbour_lists, .-refresh_neighbour_lists
	.p2align 4,,15
	.globl	flow_cost
	.type	flow_cost, @function
flow_cost:
.LFB37:
	.cfi_startproc
	cmpq	$0, 424(%rdi)
	movq	568(%rdi), %rax
	jle	.L415
	addq	$32, %rax
	xorl	%edx, %edx
	.p2align 4,,15
.L416:
	xorl	%ecx, %ecx
	cmpw	$2, (%rax)
	sete	%cl
	incq	%rdx
	addq	$72, %rax
	movq	%rcx, -48(%rax)
	movq	424(%rdi), %rcx
	cmpq	%rdx, %rcx
	jg	.L416
	cmpq	$0, 400(%rdi)
	movq	552(%rdi), %rax
	jle	.L417
.L425:
	addq	$152, %rax
	movl	$1, %edx
	.p2align 4,,15
.L418:
	movq	(%rax), %rcx
	movq	32(%rax), %rsi
	incq	%rdx
	addq	$104, %rax
	movq	%rsi, 56(%rcx)
	cmpq	%rdx, 400(%rdi)
	jge	.L418
	movq	424(%rdi), %rcx
.L417:
	movq	528(%rdi), %r8
	vxorps	%xmm2, %xmm2, %xmm2
	movq	568(%rdi), %rax
	vcvtsi2sdq	%r8, %xmm2, %xmm2
	testq	%rcx, %rcx
	jle	.L431
	leaq	(%rcx,%rcx,8), %rdx
	addq	$8, %rax
	xorl	%edi, %edi
	leaq	(%rax,%rdx,8), %rsi
	xorl	%edx, %edx
	jmp	.L424
	.p2align 4,,15
.L421:
	movq	(%rax), %rcx
	jne	.L423
	subq	%r8, %rcx
	incq	%rdi
	addq	%rcx, %rdx
.L420:
	addq	$72, %rax
	cmpq	%rsi, %rax
	je	.L432
.L424:
	cmpq	$0, 48(%rax)
	je	.L420
	movq	8(%rax), %rcx
	movl	96(%rcx), %r9d
	testl	%r9d, %r9d
	jns	.L421
	movq	16(%rax), %rcx
	movl	96(%rcx), %ecx
	testl	%ecx, %ecx
	jg	.L420
	movq	(%rax), %rcx
.L423:
	addq	$72, %rax
	addq	%rcx, %rdx
	cmpq	%rsi, %rax
	jne	.L424
.L432:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rdi, %xmm0, %xmm0
	vcvtsi2sdq	%rdx, %xmm1, %xmm1
	vfmadd132sd	%xmm2, %xmm1, %xmm0
	ret
	.p2align 4,,15
.L415:
	cmpq	$0, 400(%rdi)
	movq	552(%rdi), %rax
	jg	.L425
.L431:
	vxorpd	%xmm0, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE37:
	.size	flow_cost, .-flow_cost
	.p2align 4,,15
	.globl	start
	.type	start, @function
start:
.LFB38:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE38:
	.size	start, .-start
	.p2align 4,,15
	.globl	getArcPosition
	.type	getArcPosition, @function
getArcPosition:
.LFB39:
	.cfi_startproc
	movq	%rsi, %rax
	movq	632(%rdi), %rcx
	cqto
	idivq	624(%rdi)
	movq	640(%rdi), %rdi
	cmpq	%rdx, %rcx
	jge	.L435
	subq	%rcx, %rdx
	imulq	%rdi, %rcx
	leaq	-1(%rdi), %rsi
	imulq	%rdx, %rsi
	movq	%rcx, %rdx
	addq	%rsi, %rdx
	addq	%rdx, %rax
	ret
	.p2align 4,,15
.L435:
	imulq	%rdi, %rdx
	addq	%rdx, %rax
	ret
	.cfi_endproc
.LFE39:
	.size	getArcPosition, .-getArcPosition
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"ORG_COST: %f"
	.text
	.p2align 4,,15
	.globl	flow_org_cost
	.type	flow_org_cost, @function
flow_org_cost:
.LFB41:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	cmpq	$0, 424(%rdi)
	movq	568(%rdi), %rax
	jle	.L439
	addq	$32, %rax
	xorl	%edx, %edx
	.p2align 4,,15
.L440:
	xorl	%ecx, %ecx
	cmpw	$2, (%rax)
	sete	%cl
	incq	%rdx
	addq	$72, %rax
	movq	%rcx, -48(%rax)
	movq	424(%rbx), %rcx
	cmpq	%rdx, %rcx
	jg	.L440
	cmpq	$0, 400(%rbx)
	movq	552(%rbx), %rax
	jle	.L441
.L449:
	addq	$48, %rax
	xorl	%edx, %edx
	.p2align 4,,15
.L442:
	movq	(%rax), %rcx
	movq	32(%rax), %rsi
	incq	%rdx
	addq	$104, %rax
	movq	%rsi, 56(%rcx)
	cmpq	%rdx, 400(%rbx)
	jg	.L442
	movq	424(%rbx), %rcx
.L441:
	movq	528(%rbx), %r8
	vxorps	%xmm0, %xmm0, %xmm0
	movq	568(%rbx), %rax
	vcvtsi2sdq	%r8, %xmm0, %xmm0
	testq	%rcx, %rcx
	jle	.L456
	leaq	(%rcx,%rcx,8), %rdx
	addq	$16, %rax
	xorl	%edi, %edi
	leaq	(%rax,%rdx,8), %rsi
	xorl	%edx, %edx
	jmp	.L448
	.p2align 4,,15
.L445:
	movq	48(%rax), %rcx
	jne	.L447
	subq	%r8, %rcx
	incq	%rdi
	addq	%rcx, %rdx
.L444:
	addq	$72, %rax
	cmpq	%rsi, %rax
	je	.L457
.L448:
	cmpq	$0, 40(%rax)
	je	.L444
	movq	(%rax), %rcx
	movl	96(%rcx), %r9d
	testl	%r9d, %r9d
	jns	.L445
	movq	8(%rax), %rcx
	movl	96(%rcx), %ecx
	testl	%ecx, %ecx
	jg	.L444
	movq	48(%rax), %rcx
.L447:
	addq	$72, %rax
	addq	%rcx, %rdx
	cmpq	%rsi, %rax
	jne	.L448
	.p2align 4,,15
.L457:
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rdi, %xmm2, %xmm2
	vcvtsi2sdq	%rdx, %xmm1, %xmm1
	vfmadd132sd	%xmm2, %xmm1, %xmm0
.L443:
	movl	$.LC1, %edi
	movl	$1, %eax
	vmovsd	%xmm1, 8(%rsp)
	vmovsd	%xmm2, (%rsp)
	call	printf
	vmovsd	(%rsp), %xmm2
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	8(%rsp), %xmm1
	vcvtsi2sdq	528(%rbx), %xmm0, %xmm0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vfmadd132sd	%xmm2, %xmm1, %xmm0
	ret
	.p2align 4,,15
.L439:
	.cfi_restore_state
	cmpq	$0, 400(%rdi)
	movq	552(%rdi), %rax
	jg	.L449
	.p2align 4,,15
.L456:
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	jmp	.L443
	.cfi_endproc
.LFE41:
	.size	flow_org_cost, .-flow_org_cost
	.section	.rodata.str1.1
.LC2:
	.string	"PRIMAL NETWORK SIMPLEX: "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"artificial arc with nonzero flow, node %d (%ld)\n"
	.align 8
.LC4:
	.string	"basis primal infeasible (%ld)\n"
	.text
	.p2align 4,,15
	.globl	primal_feasible
	.type	primal_feasible, @function
primal_feasible:
.LFB42:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	552(%rdi), %rax
	movq	560(%rdi), %r13
	movq	592(%rdi), %r14
	movq	600(%rdi), %r15
	leaq	104(%rax), %rbx
	cmpq	%rbx, %r13
	ja	.L459
	jmp	.L464
	.p2align 4,,15
.L476:
	movq	%rbp, %rcx
	sarq	$63, %rcx
	movq	%rcx, %rax
	xorq	%rbp, %rax
	subq	%rcx, %rax
	cmpq	%rdx, %rax
	jg	.L475
.L462:
	addq	$104, %rbx
	cmpq	%rbx, %r13
	jbe	.L464
.L459:
	movq	48(%rbx), %rax
	prefetcht0	568(%rbx)
	movq	80(%rbx), %rbp
	movq	512(%r12), %rdx
	cmpq	%rax, %r14
	ja	.L461
	cmpq	%rax, %r15
	ja	.L476
.L461:
	movq	%rdx, %rax
	negq	%rax
	cmpq	%rbp, %rax
	jg	.L463
	leaq	-1(%rbp), %rax
	cmpq	%rdx, %rax
	jle	.L462
.L463:
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rsi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movq	$0, 488(%r12)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L475:
	.cfi_restore_state
	movl	$.LC2, %edi
	xorl	%eax, %eax
	prefetcht0	616(%rbx)
	addq	$104, %rbx
	call	printf
	movl	-8(%rbx), %esi
	movq	%rbp, %rdx
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	printf
	cmpq	%rbx, %r13
	ja	.L459
.L464:
	movq	$1, 488(%r12)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	primal_feasible, .-primal_feasible
	.section	.rodata.str1.1
.LC5:
	.string	"DUAL NETWORK SIMPLEX: "
.LC6:
	.string	"basis dual infeasible\n"
	.text
	.p2align 4,,15
	.globl	dual_feasible
	.type	dual_feasible, @function
dual_feasible:
.LFB43:
	.cfi_startproc
	movq	576(%rdi), %rsi
	movq	568(%rdi), %rax
	cmpq	%rax, %rsi
	ja	.L483
	jmp	.L485
	.p2align 4,,15
.L491:
	cmpw	$2, %cx
	jne	.L479
	cmpq	%rdx, 512(%rdi)
	jl	.L484
.L479:
	addq	$72, %rax
	cmpq	%rax, %rsi
	jbe	.L485
.L483:
	movq	16(%rax), %rcx
	movq	8(%rax), %rdx
	subq	(%rcx), %rdx
	movq	24(%rax), %rcx
	addq	(%rcx), %rdx
	movzwl	32(%rax), %ecx
	testw	%cx, %cx
	js	.L479
	cmpw	$1, %cx
	jg	.L491
	movq	512(%rdi), %rcx
	negq	%rcx
	cmpq	%rdx, %rcx
	jle	.L479
.L482:
.L484:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rcx
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC5, %edi
	call	fwrite
	movq	stderr(%rip), %rcx
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC6, %edi
	call	fwrite
	movl	$1, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L485:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE43:
	.size	dual_feasible, .-dual_feasible
	.p2align 4,,15
	.globl	getfree
	.type	getfree, @function
getfree:
.LFB44:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	552(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L493
	call	free
.L493:
	movq	568(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L494
	call	free
.L494:
	movq	592(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L495
	call	free
.L495:
	movq	584(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L496
	call	free
.L496:
	vxorps	%xmm0, %xmm0, %xmm0
	movq	$0, 600(%rbx)
	xorl	%eax, %eax
	vmovups	%xmm0, 552(%rbx)
	vmovups	%xmm0, 568(%rbx)
	vmovups	%xmm0, 584(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE44:
	.size	getfree, .-getfree
	.section	.rodata.str1.1
.LC7:
	.string	"r"
.LC8:
	.string	"%ld %ld"
.LC11:
	.string	"read_min(): not enough memory"
.LC12:
	.string	"%ld %ld %ld"
	.text
	.p2align 4,,15
	.globl	read_min
	.type	read_min, @function
read_min:
.LFB45:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$.LC7, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$296, %rsp
	.cfi_def_cfa_offset 352
	call	fopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L570
	movq	%rax, %rdx
	movl	$200, %esi
	leaq	80(%rsp), %rdi
	call	fgets
	xorl	%eax, %eax
	leaq	64(%rsp), %rcx
	leaq	56(%rsp), %rdx
	movl	$.LC8, %esi
	leaq	80(%rsp), %rdi
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L570
	movq	56(%rsp), %rcx
	movq	64(%rsp), %rax
	movabsq	$2361183241434822607, %rdi
	movq	$4000, 640(%rbx)
	leaq	(%rcx,%rcx), %r15
	leaq	(%r15,%rcx), %r14
	leaq	1(%r15), %r13
	addq	%rax, %r14
	vmovq	%r13, %xmm4
	vpinsrq	$1, %rcx, %xmm4, %xmm0
	leaq	-1(%r14), %rsi
	vmovups	%xmm0, 400(%rbx)
	vmovq	%r14, %xmm5
	vpinsrq	$1, %rax, %xmm5, %xmm0
	movq	%rsi, %rax
	sarq	$63, %rsi
	vmovups	%xmm0, 424(%rbx)
	imulq	%rdi
	movq	%r14, %rax
	sarq	$9, %rdx
	subq	%rsi, %rdx
	leaq	1(%rdx), %rsi
	imulq	%rdi
	movq	%r14, %rax
	movq	%r14, %rdi
	sarq	$63, %rax
	movq	%rsi, 624(%rbx)
	sarq	$9, %rdx
	subq	%rax, %rdx
	movq	%rsi, %rax
	imulq	$4000, %rdx, %rdx
	subq	%rdx, %rdi
	jne	.L573
.L514:
	movq	%rax, 632(%rbx)
	testq	%rax, %rax
	jns	.L515
	movl	$3999, %edx
	.p2align 4,,15
.L516:
	movq	%rdx, %rdi
	decq	%rdx
	addq	%rsi, %rax
	js	.L516
	vmovq	%rax, %xmm6
	vpinsrq	$1, %rdi, %xmm6, %xmm0
	vmovups	%xmm0, 632(%rbx)
.L515:
	cmpq	$15000, %rcx
	jle	.L574
	vmovsd	.LC10(%rip), %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	4999999(%r14), %rdx
	vcvtsi2sdq	%r14, %xmm1, %xmm1
	movq	$28900000, 456(%rbx)
	vmulsd	%xmm2, %xmm1, %xmm1
	vcvttsd2siq	%xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	leaq	5000000(%r14), %rax
	vcvttsd2siq	%xmm0, %rbp
	cmpq	%rbp, %rdx
	cmovge	%rax, %rbp
	movq	%rbp, 416(%rbx)
.L518:
	leaq	1(%rcx), %rdx
	movl	$104, %esi
	movq	%rcx, 40(%rsp)
	leaq	(%rdx,%rdx), %rdi
	movq	%rdx, 32(%rsp)
	call	calloc
	movl	$72, %esi
	movq	%r13, %rdi
	movq	%rax, 552(%rbx)
	movq	%rax, %r12
	call	calloc
	movq	%rbp, %rdi
	movl	$72, %esi
	movq	%rax, 592(%rbx)
	movq	%rax, 24(%rsp)
	call	calloc
	movl	$72, %esi
	movq	%rbp, %rdi
	movq	%rax, 584(%rbx)
	movq	%rax, 16(%rsp)
	call	calloc
	movq	24(%rsp), %r8
	movq	16(%rsp), %r10
	movq	%rax, %rbp
	movq	%rax, 568(%rbx)
	testq	%r8, %r8
	sete	%al
	testq	%r10, %r10
	sete	%sil
	orl	%esi, %eax
	testb	$1, %al
	jne	.L547
	testq	%rbp, %rbp
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rcx
	sete	%al
	testq	%r12, %r12
	sete	%sil
	orl	%esi, %eax
	testb	$1, %al
	jne	.L547
	addq	$2, %r15
	leaq	(%r14,%r14,8), %rax
	imulq	$104, %r15, %r15
	leaq	0(%rbp,%rax,8), %rax
	movq	%rax, 576(%rbx)
	leaq	0(%r13,%r13,8), %rax
	leaq	(%r8,%rax,8), %rax
	addq	%r12, %r15
	movq	%rax, 600(%rbx)
	movq	%r15, 560(%rbx)
	testq	%rcx, %rcx
	jle	.L544
	leaq	104(%r12), %r15
	xorl	%r14d, %r14d
	movl	$1, %r13d
	jmp	.L527
	.p2align 4,,15
.L576:
	movq	640(%rbx), %r10
	subq	%rdi, %rdx
	leaq	-1(%r10), %r11
	imulq	%r10, %rdi
	imulq	%r11, %rdx
	addq	%rdi, %rdx
	addq	%rax, %rdx
.L529:
	leaq	(%rdx,%rdx,8), %rax
	leal	1(%rcx), %edx
	leaq	(%rsi,%rax,8), %rax
	movl	%edx, (%rax)
	movq	408(%rbx), %rdx
	addq	%r13, %rdx
	imulq	$104, %rdx, %rdx
	addq	%r12, %rdx
	movq	%rdx, 16(%rax)
	imulq	$104, 400(%rbx), %rsi
	movq	$15, 8(%rax)
	movq	$15, 64(%rax)
	addq	%r12, %rsi
	movq	%rsi, 24(%rax)
	movq	56(%rdx), %rsi
	movq	%rsi, 40(%rax)
	movq	%rax, 56(%rdx)
	movq	24(%rax), %rdx
	movq	64(%rdx), %rsi
	movq	%rsi, 48(%rax)
	movq	%rax, 64(%rdx)
	leaq	2(%r14), %rax
	movq	632(%rbx), %rdi
	cqto
	idivq	624(%rbx)
	movq	568(%rbx), %rsi
	cmpq	%rdi, %rdx
	jle	.L530
	movq	640(%rbx), %r10
	subq	%rdi, %rdx
	leaq	-1(%r10), %r11
	imulq	%r10, %rdi
	imulq	%r11, %rdx
	addq	%rdi, %rdx
	addq	%rax, %rdx
.L531:
	leaq	(%rdx,%rdx,8), %rax
	addl	$2, %ecx
	leaq	(%rsi,%rax,8), %rax
	movl	%ecx, (%rax)
	movq	%r15, 16(%rax)
	movq	408(%rbx), %rdx
	addq	%r13, %rdx
	imulq	$104, %rdx, %rdx
	addq	%r12, %rdx
	movq	%rdx, 24(%rax)
	cmpq	$10000000, 528(%rbx)
	movl	$10000000, %edx
	cmovge	528(%rbx), %rdx
	addq	$3, %r14
	addq	%rdx, %rdx
	movq	%rdx, 8(%rax)
	movq	%rdx, 64(%rax)
	movq	56(%r15), %rdx
	movq	%rdx, 40(%rax)
	movq	%rax, 56(%r15)
	movq	24(%rax), %rdx
	movq	64(%rdx), %rcx
	movq	%rcx, 48(%rax)
	movq	%rax, 64(%rdx)
	movq	%r14, %rax
	movq	632(%rbx), %rsi
	cqto
	idivq	624(%rbx)
	movq	568(%rbx), %rcx
	cmpq	%rdx, %rsi
	jge	.L532
	movq	640(%rbx), %rdi
	subq	%rsi, %rdx
	leaq	-1(%rdi), %r10
	imulq	%rdi, %rsi
	imulq	%r10, %rdx
	addq	%rsi, %rdx
.L572:
	addq	%rdx, %rax
	incq	%r13
	addq	$104, %r15
	leaq	(%rax,%rax,8), %rax
	leaq	(%rcx,%rax,8), %rbp
	movq	408(%rbx), %rcx
	cmpq	%r13, %rcx
	jl	.L575
.L527:
	movq	8(%rsp), %rdx
	movl	$200, %esi
	leaq	80(%rsp), %rdi
	call	fgets
	xorl	%eax, %eax
	leaq	64(%rsp), %rcx
	leaq	56(%rsp), %rdx
	movl	$.LC8, %esi
	leaq	80(%rsp), %rdi
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L570
	movq	56(%rsp), %rcx
	movq	64(%rsp), %rdx
	cmpq	%rdx, %rcx
	jg	.L570
	movl	%r13d, %eax
	movq	$-1, 80(%r15)
	negl	%eax
	movl	%eax, 96(%r15)
	movq	408(%rbx), %rax
	addq	%r13, %rax
	imulq	$104, %rax, %rax
	addq	%r12, %rax
	movl	%r13d, 96(%rax)
	movq	$1, 80(%rax)
	movl	%ecx, 100(%r15)
	movl	%edx, 100(%rax)
	movl	%r14d, %ecx
	movl	%r14d, 0(%rbp)
	imulq	$104, 400(%rbx), %rax
	movq	%r15, 24(%rbp)
	addq	%r12, %rax
	movq	%rax, 16(%rbp)
	movq	528(%rbx), %rdi
	leaq	15(%rdi), %rdx
	movq	%rdx, 8(%rbp)
	movq	%rdx, 64(%rbp)
	movq	56(%rax), %rdx
	movq	%rdx, 40(%rbp)
	movq	%rbp, 56(%rax)
	movq	24(%rbp), %rax
	movq	64(%rax), %rdx
	movq	%rdx, 48(%rbp)
	movq	%rbp, 64(%rax)
	leaq	1(%r14), %rax
	movq	632(%rbx), %rdi
	cqto
	idivq	624(%rbx)
	movq	568(%rbx), %rsi
	cmpq	%rdi, %rdx
	jg	.L576
	imulq	640(%rbx), %rdx
	addq	%rax, %rdx
	jmp	.L529
.L547:
	movl	$.LC11, %edi
	call	puts
	movq	552(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L522
	call	free
.L522:
	movq	568(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L523
	call	free
.L523:
	movq	592(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L524
	call	free
.L524:
	movq	584(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L525
	call	free
.L525:
	vxorps	%xmm0, %xmm0, %xmm0
	movq	$0, 600(%rbx)
	vmovups	%xmm0, 552(%rbx)
	vmovups	%xmm0, 568(%rbx)
	vmovups	%xmm0, 584(%rbx)
	.p2align 4,,15
.L570:
	movq	$-1, %rax
.L565:
	addq	$296, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L574:
	.cfi_restore_state
	vmovaps	.LC9(%rip), %xmm0
	movq	%r14, 416(%rbx)
	movq	%r14, %rbp
	vmovups	%xmm0, 448(%rbx)
	jmp	.L518
	.p2align 4,,15
.L573:
	leaq	-4000(%rsi,%rdi), %rax
	jmp	.L514
	.p2align 4,,15
.L532:
	imulq	640(%rbx), %rdx
	jmp	.L572
	.p2align 4,,15
.L530:
	imulq	640(%rbx), %rdx
	addq	%rax, %rdx
	jmp	.L531
	.p2align 4,,15
.L575:
	leaq	1(%rcx), %rdx
.L526:
	cmpq	%r13, %rdx
	jne	.L570
	xorl	%r13d, %r13d
	cmpq	$0, 432(%rbx)
	jg	.L535
	jmp	.L540
	.p2align 4,,15
.L577:
	movq	640(%rbx), %rdi
	subq	%rsi, %rdx
	leaq	-1(%rdi), %r8
	imulq	%rdi, %rsi
	imulq	%r8, %rdx
	addq	%rsi, %rdx
.L569:
	addq	%rdx, %rax
	leaq	(%rax,%rax,8), %rax
	leaq	(%rcx,%rax,8), %rbp
	cmpq	%r13, 432(%rbx)
	jle	.L540
.L535:
	movq	8(%rsp), %rdx
	movl	$200, %esi
	leaq	80(%rsp), %rdi
	call	fgets
	xorl	%eax, %eax
	leaq	72(%rsp), %r8
	leaq	64(%rsp), %rcx
	leaq	56(%rsp), %rdx
	movl	$.LC12, %esi
	leaq	80(%rsp), %rdi
	call	__isoc99_sscanf
	cmpl	$3, %eax
	jne	.L570
	movl	%r14d, 0(%rbp)
	movq	56(%rsp), %rax
	addq	408(%rbx), %rax
	incq	%r14
	imulq	$104, 64(%rsp), %rdx
	incq	%r13
	imulq	$104, %rax, %rax
	addq	%r12, %rdx
	addq	%r12, %rax
	vmovq	%rax, %xmm3
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	movq	72(%rsp), %rdx
	vmovups	%xmm0, 16(%rbp)
	movq	%rdx, 64(%rbp)
	movq	%rdx, 8(%rbp)
	movq	56(%rax), %rdx
	movq	%rdx, 40(%rbp)
	movq	%rbp, 56(%rax)
	movq	24(%rbp), %rax
	movq	64(%rax), %rdx
	movq	%rdx, 48(%rbp)
	movq	%rbp, 64(%rax)
	movq	%r14, %rax
	movq	632(%rbx), %rsi
	cqto
	idivq	624(%rbx)
	movq	568(%rbx), %rcx
	cmpq	%rsi, %rdx
	jg	.L577
	imulq	640(%rbx), %rdx
	jmp	.L569
	.p2align 4,,15
.L540:
	movq	8(%rsp), %rdi
	call	fclose
	cmpq	$0, 408(%rbx)
	movb	$0, 200(%rbx)
	movl	$2, %esi
	movl	$1, %edi
	movl	$10000000, %r8d
	jg	.L536
	jmp	.L537
	.p2align 4,,15
.L578:
	leaq	-1(%rcx), %r11
	imulq	%r9, %rcx
	subq	%r9, %rdx
	imulq	%r11, %rdx
	addq	%rdx, %rcx
	addq	%rcx, %rax
.L542:
	cmpq	$10000000, 528(%rbx)
	leaq	(%rax,%rax,8), %rax
	leaq	(%r10,%rax,8), %rdx
	movq	%r8, %rax
	cmovge	528(%rbx), %rax
	negq	%rax
	addq	%rax, %rax
	movq	%rax, 8(%rdx)
	cmpq	$10000000, 528(%rbx)
	movq	%r8, %rax
	cmovge	528(%rbx), %rax
	incq	%rdi
	addq	$3, %rsi
	negq	%rax
	addq	%rax, %rax
	movq	%rax, 64(%rdx)
	cmpq	%rdi, 408(%rbx)
	jl	.L537
.L536:
	movq	%rsi, %rax
	movq	632(%rbx), %r9
	cqto
	movq	568(%rbx), %r10
	movq	640(%rbx), %rcx
	idivq	624(%rbx)
	cmpq	%rdx, %r9
	jl	.L578
	imulq	%rdx, %rcx
	addq	%rcx, %rax
	jmp	.L542
	.p2align 4,,15
.L537:
	xorl	%eax, %eax
	jmp	.L565
.L544:
	xorl	%r14d, %r14d
	movl	$1, %r13d
	jmp	.L526
	.cfi_endproc
.LFE45:
	.size	read_min, .-read_min
	.p2align 4,,15
	.globl	refreshArcPointers
	.type	refreshArcPointers, @function
refreshArcPointers:
.LFB47:
	.cfi_startproc
	cmpq	$0, 400(%rdi)
	js	.L597
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	.p2align 4,,15
.L584:
	movq	552(%rbp), %rbx
	addq	%r13, %rbx
	movq	48(%rbx), %rax
	testq	%rax, %rax
	je	.L581
	movslq	(%rax), %rsi
	testl	%esi, %esi
	js	.L581
	movq	%rbp, %rdi
	call	*%r14
	leaq	(%rax,%rax,8), %rax
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 48(%rbx)
.L581:
	movq	64(%rbx), %rax
	testq	%rax, %rax
	je	.L582
	movslq	(%rax), %rsi
	testl	%esi, %esi
	js	.L582
	movq	%rbp, %rdi
	call	*%r14
	leaq	(%rax,%rax,8), %rax
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 64(%rbx)
.L582:
	movq	56(%rbx), %rax
	testq	%rax, %rax
	je	.L583
	movslq	(%rax), %rsi
	testl	%esi, %esi
	js	.L583
	movq	%rbp, %rdi
	call	*%r14
	leaq	(%rax,%rax,8), %rax
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 56(%rbx)
.L583:
	incq	%r12
	addq	$104, %r13
	cmpq	%r12, 400(%rbp)
	jge	.L584
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L597:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE47:
	.size	refreshArcPointers, .-refreshArcPointers
	.p2align 4,,15
	.globl	refreshPositions
	.type	refreshPositions, @function
refreshPositions:
.LFB48:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	584(%rdi), %r13
	movq	%r13, %rdx
	call	refreshArcPointers
	movq	568(%r15), %rdx
	testq	%r12, %r12
	jle	.L604
	xorl	%ebp, %ebp
	.p2align 4,,15
.L603:
	leaq	0(%rbp,%rbp,8), %rax
	leaq	(%rdx,%rax,8), %rbx
	movslq	(%rbx), %rsi
	testl	%esi, %esi
	js	.L602
	movq	%r15, %rdi
	call	*%r14
	vmovups	(%rbx), %xmm0
	leaq	(%rax,%rax,8), %rax
	leaq	0(%r13,%rax,8), %rax
	vmovups	%xmm0, (%rax)
	vmovups	16(%rbx), %xmm1
	vmovups	%xmm1, 16(%rax)
	vmovups	32(%rbx), %xmm2
	vmovups	%xmm2, 32(%rax)
	vmovups	48(%rbx), %xmm3
	vmovups	%xmm3, 48(%rax)
	movq	64(%rbx), %rdx
	movq	%rdx, 64(%rax)
	movq	568(%r15), %rdx
.L602:
	incq	%rbp
	cmpq	%rbp, %r12
	jne	.L603
.L604:
	leaq	(%r12,%r12,8), %rax
	movq	%r13, 568(%r15)
	movq	%rdx, 584(%r15)
	leaq	0(%r13,%rax,8), %rax
	movq	%rax, 576(%r15)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE48:
	.size	refreshPositions, .-refreshPositions
	.section	.text.unlikely,"ax",@progbits
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.globl	marc_arcs
	.type	marc_arcs, @function
marc_arcs:
.LFB49:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	movq	%rcx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movl	$8, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	malloc
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc
	cmpq	$15000, 408(%rbx)
	movq	%rax, %rbp
	movq	448(%rbx), %rax
	leaq	-1000000(%rax), %rsi
	jle	.L609
	leaq	-4000000(%rax), %rsi
.L609:
	movq	$0, 0(%r13)
	movq	(%r15), %rax
	movq	$0, 0(%rbp)
	movq	%rax, 0(%r13)
	movq	(%r14), %rdx
	movq	%rdx, (%r12)
	testq	%rax, %rax
	jle	.L616
	testq	%rsi, %rsi
	jle	.L616
	movq	424(%rbx), %rdi
	xorl	%eax, %eax
.L612:
	cmpq	%rax, (%r15)
	jle	.L611
	movq	(%rdx,%rax,8), %rcx
	leal	(%rdi,%rax), %r8d
	incq	%rax
	movq	%rax, 0(%rbp)
	movl	%r8d, (%rcx)
	movq	$1, 56(%rcx)
	leaq	(%rdx,%rax,8), %rcx
	cmpq	%rsi, 0(%r13)
	movq	%rcx, (%r12)
	movq	%rsi, %rcx
	cmovle	0(%r13), %rcx
	cmpq	%rcx, %rax
	jge	.L610
	jmp	.L612
	.p2align 4,,15
.L616:
	xorl	%eax, %eax
.L610:
	movq	%rax, 0(%r13)
	movq	$4000, 640(%rbx)
	movq	424(%rbx), %r8
	movq	0(%r13), %r9
	movabsq	$2361183241434822607, %rdi
	addq	%r8, %r9
	decq	%r9
	movq	%r9, %rax
	sarq	$63, %r9
	imulq	%rdi
	sarq	$9, %rdx
	subq	%r9, %rdx
	leaq	1(%rdx), %rcx
	movq	%rcx, 624(%rbx)
	movq	0(%r13), %rsi
	addq	%r8, %rsi
	movq	%rsi, %rax
	imulq	%rdi
	movq	%rsi, %rax
	sarq	$63, %rax
	sarq	$9, %rdx
	subq	%rax, %rdx
	movq	%rcx, %rax
	imulq	$4000, %rdx, %rdx
	subq	%rdx, %rsi
	je	.L613
	leaq	-4000(%rcx,%rsi), %rax
.L613:
	movq	%rax, 632(%rbx)
	testq	%rax, %rax
	jns	.L614
	movl	$4000, %edx
	.p2align 4,,15
.L615:
	decq	%rdx
	addq	%rcx, %rax
	js	.L615
	vmovq	%rax, %xmm1
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	vmovups	%xmm0, 632(%rbx)
.L614:
	movq	%r12, %rdi
	call	free
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	free
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	marc_arcs.cold.14, @function
marc_arcs.cold.14:
.L611:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$0, 0
	ud2
	.cfi_endproc
.LFE49:
	.text
	.size	marc_arcs, .-marc_arcs
	.section	.text.unlikely
	.size	marc_arcs.cold.14, .-marc_arcs.cold.14
.LCOLDE13:
	.text
.LHOTE13:
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"network %s: not enough memory\n"
	.text
	.p2align 4,,15
	.globl	resize_prob
	.type	resize_prob, @function
resize_prob:
.LFB50:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	456(%rdi), %rdx
	movq	%rdi, %rbx
	movq	416(%rdi), %rax
	addq	%rdx, 448(%rdi)
	addq	%rdx, %rax
	movq	%rax, 416(%rdi)
	movq	568(%rdi), %rdi
	leaq	(%rax,%rax,8), %rsi
	salq	$3, %rsi
	call	realloc
	testq	%rax, %rax
	je	.L641
	movq	424(%rbx), %rdx
	movq	552(%rbx), %rsi
	movq	560(%rbx), %rcx
	movq	568(%rbx), %rdi
	movq	%rax, 568(%rbx)
	leaq	(%rdx,%rdx,8), %rdx
	leaq	(%rax,%rdx,8), %rax
	movq	%rax, 576(%rbx)
	leaq	104(%rsi), %rax
	cmpq	%rcx, %rax
	jnb	.L632
	.p2align 4,,15
.L634:
	movq	48(%rax), %rdx
	testq	%rdx, %rdx
	je	.L633
	cmpq	%rsi, 24(%rax)
	je	.L633
	subq	%rdi, %rdx
	addq	568(%rbx), %rdx
	movq	%rdx, 48(%rax)
.L633:
	addq	$104, %rax
	cmpq	%rax, %rcx
	ja	.L634
.L632:
	movq	416(%rbx), %rax
	movq	584(%rbx), %rdi
	leaq	(%rax,%rax,8), %rsi
	salq	$3, %rsi
	call	realloc
	movq	%rax, 584(%rbx)
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L641:
	.cfi_restore_state
	movq	%rbx, %rsi
	movl	$.LC14, %edi
	call	printf
	movq	stdout(%rip), %rdi
	call	fflush
	movq	$-1, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	resize_prob, .-resize_prob
	.p2align 4,,15
	.globl	insert_new_arc
	.type	insert_new_arc, @function
insert_new_arc:
.LFB51:
	.cfi_startproc
	movq	16(%rsp), %r11
	leaq	(%rsi,%rsi,8), %rax
	vmovq	%r9, %xmm2
	vmovq	%rdx, %xmm3
	leaq	(%rdi,%rax,8), %rax
	vpinsrq	$1, %r8, %xmm2, %xmm1
	vpinsrq	$1, %rcx, %xmm3, %xmm0
	incq	%rsi
	vmovups	%xmm0, 16(%rax)
	movq	%r8, 8(%rax)
	vmovups	%xmm1, 56(%rax)
	movl	%r11d, %r10d
	movl	%r11d, (%rax)
	cmpq	$1, %rsi
	je	.L652
	movq	%rsi, %rcx
	shrq	$63, %rcx
	addq	%rsi, %rcx
	sarq	%rcx
	leaq	(%rcx,%rcx,8), %rax
	leaq	-72(%rdi,%rax,8), %rax
	cmpq	56(%rax), %r9
	jg	.L644
	jmp	.L653
	.p2align 4,,15
.L654:
	movq	%rcx, %rdx
	movq	%rcx, %rsi
	shrq	$63, %rdx
	addq	%rcx, %rdx
	sarq	%rdx
	leaq	(%rdx,%rdx,8), %rax
	leaq	-72(%rdi,%rax,8), %rax
	cmpq	%r9, 56(%rax)
	jge	.L652
	movq	%rdx, %rcx
.L644:
	leaq	(%rsi,%rsi,8), %rdx
	movq	16(%rax), %rsi
	leaq	-72(%rdi,%rdx,8), %rdx
	movq	%rsi, 16(%rdx)
	movq	24(%rax), %rsi
	movq	%rsi, 24(%rdx)
	movq	8(%rax), %rsi
	movq	%rsi, 8(%rdx)
	movq	%rsi, 64(%rdx)
	movq	56(%rax), %rsi
	movq	%rsi, 56(%rdx)
	movl	(%rax), %esi
	movl	%esi, (%rdx)
	vmovups	%xmm0, 16(%rax)
	movq	%r8, 8(%rax)
	vmovups	%xmm1, 56(%rax)
	movl	%r10d, (%rax)
	cmpq	$1, %rcx
	jne	.L654
.L652:
	ret
.L653:
	ret
	.cfi_endproc
.LFE51:
	.size	insert_new_arc, .-insert_new_arc
	.p2align 4,,15
	.globl	replace_weaker_arc
	.type	replace_weaker_arc, @function
replace_weaker_arc:
.LFB52:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	vmovq	%rsi, %xmm3
	movq	16(%rsp), %rax
	vpinsrq	$1, %rdx, %xmm3, %xmm0
	movq	128(%rdi), %rdx
	cmpq	200(%rdi), %rdx
	movl	$144, %esi
	vmovq	%r8, %xmm2
	vpinsrq	$1, %rcx, %xmm2, %xmm1
	vmovups	%xmm0, 16(%rdi)
	movq	%rcx, 8(%rdi)
	vmovups	%xmm1, 56(%rdi)
	movl	%eax, %ebx
	movl	%eax, (%rdi)
	movl	$72, %eax
	cmovle	%rsi, %rax
	setle	%sil
	movzbl	%sil, %esi
	addq	$2, %rsi
	cmpq	%rsi, %r9
	jl	.L664
	addq	%rdi, %rax
	cmpq	56(%rax), %r8
	jge	.L664
	movl	$1, %r10d
	jmp	.L661
	.p2align 4,,15
.L666:
	leaq	(%rdx,%rdx,8), %rax
	leaq	-72(%rdi,%rax,8), %rax
	movq	56(%rax), %r11
.L660:
	movq	%rsi, %r10
	cmpq	%r11, %r8
	jge	.L664
	movq	%rdx, %rsi
.L661:
	leaq	(%r10,%r10,8), %rdx
	movq	16(%rax), %r10
	leaq	-72(%rdi,%rdx,8), %rdx
	movq	%r10, 16(%rdx)
	movq	24(%rax), %r10
	movq	%r10, 24(%rdx)
	movq	8(%rax), %r10
	movq	%r10, 8(%rdx)
	movq	%r10, 64(%rdx)
	movq	56(%rax), %r10
	movq	%r10, 56(%rdx)
	movl	(%rax), %r10d
	movl	%r10d, (%rdx)
	leaq	(%rsi,%rsi), %rdx
	vmovups	%xmm0, 16(%rax)
	movq	%rcx, 8(%rax)
	vmovups	%xmm1, 56(%rax)
	movl	%ebx, (%rax)
	cmpq	%rdx, %r9
	jle	.L659
	movq	%rsi, %r10
	salq	$4, %r10
	addq	%rdx, %r10
	salq	$3, %r10
	leaq	-72(%rdi,%r10), %rax
	movq	56(%rax), %r11
	cmpq	56(%rdi,%r10), %r11
	jge	.L660
	incq	%rdx
.L659:
	cmpq	%r9, %rdx
	jle	.L666
.L664:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	replace_weaker_arc, .-replace_weaker_arc
	.p2align 4,,15
	.globl	calculate_max_redcost
	.type	calculate_max_redcost, @function
calculate_max_redcost:
.LFB53:
	.cfi_startproc
	movq	$0, (%rsi)
	testq	%rcx, %rcx
	jle	.L673
	leaq	(%rdx,%rcx,8), %rdi
	xorl	%ecx, %ecx
	.p2align 4,,15
.L670:
	movq	(%rdx), %rax
	movq	(%rax), %rax
	movq	56(%rax), %rax
	cmpq	%rcx, %rax
	jle	.L669
	movq	%rax, (%rsi)
	movq	%rax, %rcx
.L669:
	addq	$8, %rdx
	cmpq	%rdx, %rdi
	jne	.L670
.L673:
	ret
	.cfi_endproc
.LFE53:
	.size	calculate_max_redcost, .-calculate_max_redcost
	.p2align 4,,15
	.globl	switch_arcs
	.type	switch_arcs, @function
switch_arcs:
.LFB54:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	cmpq	$0, 64(%rsp)
	movq	%rsi, -24(%rsp)
	movq	%rdx, -16(%rsp)
	jle	.L686
	movslq	%r8d, %rdx
	movq	$0, -32(%rsp)
	movq	$0, -40(%rsp)
	.p2align 4,,15
.L685:
	leaq	0(,%rdx,8), %r15
	movq	-24(%rsp), %rax
	movq	56(%rsp), %rbx
	cmpq	%rbx, (%rax,%r15)
	movq	%rax, %rbx
	movq	56(%rsp), %rax
	cmovle	(%rbx,%r15), %rax
	testq	%rax, %rax
	jle	.L676
	addq	-16(%rsp), %r15
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	jmp	.L684
	.p2align 4,,15
.L678:
	je	.L695
.L677:
	incq	%rbx
	addq	$72, %rbp
	cmpq	%rbx, %rax
	je	.L676
.L684:
	movq	(%r15), %rsi
	addq	%rbp, %rsi
	cmpw	$0, 32(%rsi)
	jne	.L677
	movq	56(%rsi), %r12
	cmpq	56(%rcx), %r12
	jge	.L678
	movl	(%rsi), %r14d
.L679:
	vmovups	(%rcx), %xmm2
	movq	8(%rsi), %r13
	movl	$72, %r10d
	movq	16(%rsi), %r11
	movq	24(%rsi), %rdi
	incq	-32(%rsp)
	vmovups	%xmm2, (%rsi)
	vmovups	16(%rcx), %xmm3
	vmovups	%xmm3, 16(%rsi)
	vmovups	32(%rcx), %xmm4
	vmovups	%xmm4, 32(%rsi)
	vmovups	48(%rcx), %xmm5
	vmovups	%xmm5, 48(%rsi)
	movq	64(%rcx), %r8
	movq	%r8, 64(%rsi)
	movq	128(%rcx), %r8
	cmpq	200(%rcx), %r8
	movl	$144, %esi
	movq	%r11, 16(%rcx)
	movq	%rdi, 24(%rcx)
	movq	%r13, 64(%rcx)
	movq	%r13, 8(%rcx)
	movq	%r12, 56(%rcx)
	movl	%r14d, (%rcx)
	cmovg	%r10, %rsi
	setle	%r10b
	movzbl	%r10b, %r10d
	addq	$2, %r10
	cmpq	%r10, %r9
	jl	.L677
	addq	%rcx, %rsi
	cmpq	56(%rsi), %r12
	jge	.L677
	vmovq	%r11, %xmm6
	vmovq	%r12, %xmm7
	movl	$1, %r8d
	vpinsrq	$1, %rdi, %xmm6, %xmm0
	vpinsrq	$1, %r13, %xmm7, %xmm1
	jmp	.L683
	.p2align 4,,15
.L696:
	leaq	(%rdi,%rdi,8), %rsi
	leaq	-72(%rcx,%rsi,8), %rsi
	movq	56(%rsi), %r11
.L682:
	movq	%r10, %r8
	cmpq	%r11, %r12
	jge	.L677
	movq	%rdi, %r10
.L683:
	leaq	(%r8,%r8,8), %rdi
	movq	16(%rsi), %r8
	leaq	-72(%rcx,%rdi,8), %rdi
	movq	%r8, 16(%rdi)
	movq	24(%rsi), %r8
	movq	%r8, 24(%rdi)
	movq	8(%rsi), %r8
	movq	%r8, 8(%rdi)
	movq	%r8, 64(%rdi)
	movq	56(%rsi), %r8
	movq	%r8, 56(%rdi)
	movl	(%rsi), %r8d
	movl	%r8d, (%rdi)
	leaq	(%r10,%r10), %rdi
	vmovups	%xmm0, 16(%rsi)
	movq	%r13, 8(%rsi)
	vmovups	%xmm1, 56(%rsi)
	movl	%r14d, (%rsi)
	cmpq	%rdi, %r9
	jle	.L681
	movq	%r10, %r8
	salq	$4, %r8
	addq	%rdi, %r8
	salq	$3, %r8
	leaq	-72(%rcx,%r8), %rsi
	movq	56(%rsi), %r11
	cmpq	56(%rcx,%r8), %r11
	jge	.L682
	incq	%rdi
.L681:
	cmpq	%rdi, %r9
	jge	.L696
	incq	%rbx
	addq	$72, %rbp
	cmpq	%rbx, %rax
	jne	.L684
	.p2align 4,,15
.L676:
	leaq	1(%rdx), %rax
	incq	-40(%rsp)
	cqto
	movq	-40(%rsp), %rbx
	idivq	64(%rsp)
	cmpq	%rbx, 64(%rsp)
	jne	.L685
	movq	-32(%rsp), %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L695:
	.cfi_restore_state
	movl	(%rsi), %r14d
	cmpl	(%rcx), %r14d
	jge	.L677
	jmp	.L679
.L686:
	movq	$0, -32(%rsp)
	movq	-32(%rsp), %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE54:
	.size	switch_arcs, .-switch_arcs
	.p2align 4,,15
	.globl	price_out_impl
	.type	price_out_impl, @function
price_out_impl:
.LFB55:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movq	528(%rdi), %rbx
	movl	$8, %edi
	movq	$0, 152(%rsp)
	call	malloc
	movl	$8, %edi
	movq	%rax, 8(%rsp)
	call	malloc
	movl	$8, %edi
	movq	%rax, %r15
	call	malloc
	movl	$8, %edi
	movq	%rax, 104(%rsp)
	call	malloc
	movq	408(%rbp), %rdi
	movq	%rax, 56(%rsp)
	movq	456(%rbp), %rcx
	movq	424(%rbp), %rax
	movq	416(%rbp), %rdx
	movq	%rdi, 48(%rsp)
	addq	%rax, %rcx
	cmpq	$15000, %rdi
	jg	.L698
	cmpq	%rcx, %rdx
	jge	.L764
	movq	%rdi, %rcx
	movq	$0, 120(%rsp)
	movq	$1000, 64(%rsp)
	imulq	%rdi, %rcx
	sarq	%rcx
	addq	%rcx, %rax
	cmpq	%rdx, %rax
	jle	.L699
	movq	%rbp, %rdi
	call	resize_prob
	testq	%rax, %rax
	jne	.L706
	movq	552(%rbp), %rax
	movq	560(%rbp), %rdx
	vxorps	%xmm0, %xmm0, %xmm0
	cmpq	%rdx, %rax
	jnb	.L705
	.p2align 4,,15
.L702:
	vmovups	%xmm0, 56(%rax)
	addq	$104, %rax
	cmpq	%rax, %rdx
	ja	.L702
.L705:
	xorl	%edx, %edx
	cmpq	$0, 424(%rbp)
	movq	568(%rbp), %rax
	movl	$72, %ecx
	jle	.L704
	.p2align 4,,15
.L703:
	movq	16(%rax), %rsi
	incq	%rdx
	movq	56(%rsi), %rdi
	movq	%rdi, 40(%rax)
	movq	%rax, 56(%rsi)
	movq	24(%rax), %rsi
	movq	64(%rsi), %rdi
	movq	%rdi, 48(%rax)
	movq	%rax, 64(%rsi)
	movq	568(%rbp), %rax
	addq	%rcx, %rax
	addq	$72, %rcx
	cmpq	%rdx, 424(%rbp)
	jg	.L703
.L704:
	movq	408(%rbp), %rax
	movl	$1000, %edx
	movq	$1, 120(%rsp)
	cmpq	$15001, %rax
	movq	%rax, 48(%rsp)
	movl	$2000, %eax
	cmovl	%rdx, %rax
	movq	%rax, 64(%rsp)
	jmp	.L699
	.p2align 4,,15
.L698:
	cmpq	%rcx, %rdx
	jl	.L840
	movq	$0, 120(%rsp)
	movq	$2000, 64(%rsp)
.L699:
	movq	584(%rbp), %rdi
	movq	%rdi, 128(%rsp)
	testq	%rdi, %rdi
	je	.L706
	movq	416(%rbp), %rsi
	movq	$0, (%r15)
	movq	448(%rbp), %rax
	movq	576(%rbp), %r12
	movq	%rsi, 40(%rsp)
	movq	56(%rsp), %rsi
	movq	%rax, %r14
	movq	%rax, 16(%rsp)
	movq	%rdi, (%rsi)
	movq	8(%rsp), %rdi
	movl	$8, %esi
	movq	$0, (%rdi)
	movq	%rax, %rdi
	call	calloc
	movq	104(%rsp), %rdi
	movq	%rax, (%rdi)
	testq	%r14, %r14
	jle	.L710
	movq	%r12, (%rax)
	cmpq	$1, %r14
	je	.L710
	leaq	72(%r12), %rdx
	leaq	0(,%r14,8), %rsi
	movl	$8, %eax
	.p2align 4,,15
.L711:
	movq	(%rdi), %rcx
	movq	%rdx, (%rcx,%rax)
	addq	$8, %rax
	addq	$72, %rdx
	cmpq	%rax, %rsi
	jne	.L711
.L710:
	movq	48(%rsp), %rax
	movq	568(%rbp), %r13
	testq	%rax, %rax
	jle	.L712
	xorl	%r10d, %r10d
	jmp	.L839
	.p2align 4,,15
.L841:
	incq	%r10
	addq	$216, %r13
	cmpq	%r10, %rax
	je	.L712
.L839:
	cmpw	$-1, 104(%r13)
	je	.L841
	leaq	-15(%rbx), %rax
	addq	$248, %r13
	movq	$0, 24(%rsp)
	movq	$0, 72(%rsp)
	movw	$1, 38(%rsp)
	movq	$-1, 96(%rsp)
	xorl	%r9d, %r9d
	movq	%rax, 112(%rsp)
	movq	%rbp, 136(%rsp)
	.p2align 4,,15
.L731:
	movq	%r10, %rax
	cqto
	idivq	64(%rsp)
	cmpw	$0, 38(%rsp)
	je	.L842
.L715:
	cmpw	$-1, -144(%r13)
	prefetcht0	72(%r13)
	je	.L718
	movl	$1, %edi
	movl	$16, %esi
	movq	%r10, 88(%rsp)
	movq	%r9, 80(%rsp)
	call	calloc
	leaq	-176(%r13), %rdx
	movq	24(%rsp), %rdi
	movq	%rdx, (%rax)
	movq	%rax, 24(%rsp)
	incq	96(%rsp)
	movq	88(%rsp), %r10
	movq	80(%rsp), %r9
	movq	%rdi, 8(%rax)
.L718:
	cmpw	$-1, -216(%r13)
	prefetcht0	0(%r13)
	je	.L843
	movq	24(%rsp), %rbx
	movq	-224(%r13), %r14
	prefetcht0	-8(%r13)
	movq	8(%rbx), %rbx
	movslq	100(%r14), %rax
	subq	-184(%r13), %rax
	addq	112(%rsp), %rax
	testq	%rbx, %rbx
	je	.L720
	movq	%r13, %r11
	movq	%rax, %r13
	jmp	.L730
	.p2align 4,,15
.L723:
	movq	8(%rbx), %rbx
	movq	%rbp, %r9
	testq	%rbx, %rbx
	je	.L844
.L730:
	movq	(%rbx), %rcx
	leaq	1(%r9), %rbp
	movq	16(%rcx), %rsi
	movslq	100(%rsi), %rdx
	addq	64(%rcx), %rdx
	cmpq	%r13, %rdx
	jg	.L723
	movl	$30, %r8d
	subq	(%rsi), %r8
	addq	(%r14), %r8
	jns	.L723
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	cmpq	%rdi, 16(%rsp)
	jg	.L845
	movq	(%r15), %rdx
	cmpq	%r8, 56(%r12)
	jg	.L846
	movq	56(%rsp), %rax
	leaq	1(%rdx), %rcx
	leaq	(%rdx,%rdx,8), %rdx
	vmovq	%rsi, %xmm1
	salq	$3, %rdx
	movq	%rcx, (%r15)
	vpinsrq	$1, %r14, %xmm1, %xmm0
	leal	-1(%rbp), %ecx
	incq	72(%rsp)
	addq	(%rax), %rdx
	vmovups	%xmm0, 16(%rdx)
	movq	$30, 64(%rdx)
	movq	$30, 8(%rdx)
	movq	%r8, 56(%rdx)
	movl	%ecx, (%rdx)
	movq	(%r15), %rdx
.L726:
	cmpq	%rdx, 40(%rsp)
	jne	.L723
	movq	$0, (%r15)
	movq	8(%rbx), %rbx
	movq	%rbp, %r9
	testq	%rbx, %rbx
	jne	.L730
	.p2align 4,,15
.L844:
	movq	%r11, %r13
.L720:
	incq	%r10
	addq	$216, %r13
	cmpq	%r10, 48(%rsp)
	jg	.L731
	cmpw	$0, 38(%rsp)
	movq	72(%rsp), %rax
	movq	136(%rsp), %rbp
	movq	%rax, (%r15)
	jne	.L732
	movq	16(%rsp), %rbx
	movq	40(%rsp), %r13
	movq	56(%rsp), %r14
	.p2align 4,,15
.L733:
	movq	%r13, %r8
	movq	%rbx, %rcx
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	switch_arcs.constprop.9
	testq	%rax, %rax
	jne	.L733
.L732:
	movq	24(%rsp), %rax
	movq	8(%rax), %rbx
	movq	%rax, %rdi
	testq	%rbx, %rbx
	jne	.L735
	jmp	.L847
	.p2align 4,,15
.L774:
	movq	%rax, %rbx
.L735:
	call	free
	movq	8(%rbx), %rax
	movq	%rbx, %rdi
	testq	%rax, %rax
	jne	.L774
.L734:
	movq	%rbx, %rdi
	call	free
	movq	8(%rsp), %rbx
	movl	$arc_compare, %edx
	movq	104(%rsp), %r14
	movq	(%rbx), %rsi
	movq	(%r14), %rdi
	call	spec_qsort.constprop.11
	movq	%r14, %rcx
	movq	%rbx, %rdx
	leaq	152(%rsp), %rsi
	movq	%rbp, %rdi
	call	marc_arcs
	movq	(%r14), %rdi
	call	free
	movq	(%rbx), %rax
	testq	%rax, %rax
	je	.L741
	cmpq	$0, 120(%rsp)
	movq	576(%rbp), %rcx
	leaq	(%rax,%rax,8), %rax
	leaq	(%rcx,%rax,8), %rsi
	jne	.L739
	movq	128(%rsp), %rdi
	cmpq	%rsi, %rcx
	jne	.L740
	jmp	.L741
	.p2align 4,,15
.L746:
	addq	$72, %rcx
	cmpq	%rcx, %rsi
	je	.L741
.L740:
	cmpq	$1, 56(%rcx)
	jne	.L746
	movq	16(%rcx), %rax
	movq	$0, 56(%rcx)
	movw	$1, 32(%rcx)
	movq	56(%rax), %rdx
	movq	%rdx, 40(%rcx)
	movq	%rcx, 56(%rax)
	movq	24(%rcx), %rax
	movq	64(%rax), %rdx
	movq	%rdx, 48(%rcx)
	movq	%rcx, 64(%rax)
	movslq	(%rcx), %rax
	movq	632(%rbp), %r8
	cqto
	idivq	624(%rbp)
	cmpq	%r8, %rdx
	jle	.L747
	movq	640(%rbp), %r9
	subq	%r8, %rdx
	leaq	-1(%r9), %r10
	imulq	%r9, %r8
	imulq	%r10, %rdx
	addq	%r8, %rdx
	addq	%rax, %rdx
.L748:
	vmovups	(%rcx), %xmm5
	leaq	(%rdx,%rdx,8), %rax
	addq	$72, %rcx
	leaq	(%rdi,%rax,8), %rax
	vmovups	%xmm5, (%rax)
	vmovups	-56(%rcx), %xmm1
	vmovups	%xmm1, 16(%rax)
	vmovups	-40(%rcx), %xmm2
	vmovups	%xmm2, 32(%rax)
	vmovups	-24(%rcx), %xmm3
	vmovups	%xmm3, 48(%rax)
	movq	-8(%rcx), %rdx
	movq	%rdx, 64(%rax)
	cmpq	%rcx, %rsi
	jne	.L740
	.p2align 4,,15
.L741:
	movq	152(%rsp), %rbx
	xorl	%edi, %edi
	xorl	%esi, %esi
	vmovups	440(%rbp), %xmm3
	cmpq	$0, 400(%rbp)
	movq	424(%rbp), %r9
	movq	584(%rbp), %r8
	vmovq	%rbx, %xmm2
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	vpaddq	440(%rbp), %xmm0, %xmm1
	vpsubq	%xmm0, %xmm3, %xmm0
	vshufpd	$2, %xmm0, %xmm1, %xmm0
	vmovups	%xmm0, 440(%rbp)
	jns	.L737
	jmp	.L738
	.p2align 4,,15
.L848:
	subq	%r11, %rdx
	leaq	-1(%r12), %r10
	imulq	%rdx, %r10
	movq	%r11, %rdx
	imulq	%r12, %rdx
	addq	%r10, %rdx
	addq	%rax, %rdx
.L753:
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%r8,%rax,8), %rax
	movq	%rax, 48(%rcx)
.L751:
	movq	64(%rcx), %rax
	testq	%rax, %rax
	je	.L754
	movslq	(%rax), %rax
	testl	%eax, %eax
	js	.L754
	cqto
	movq	632(%rbp), %r11
	movq	640(%rbp), %r12
	idivq	624(%rbp)
	cmpq	%r11, %rdx
	jle	.L755
	subq	%r11, %rdx
	leaq	-1(%r12), %r10
	imulq	%rdx, %r10
	movq	%r11, %rdx
	imulq	%r12, %rdx
	addq	%r10, %rdx
	addq	%rax, %rdx
.L756:
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%r8,%rax,8), %rax
	movq	%rax, 64(%rcx)
.L754:
	movq	56(%rcx), %rax
	testq	%rax, %rax
	je	.L757
	movslq	(%rax), %rax
	testl	%eax, %eax
	js	.L757
	cqto
	movq	632(%rbp), %r11
	movq	640(%rbp), %r12
	idivq	624(%rbp)
	cmpq	%r11, %rdx
	jle	.L758
	subq	%r11, %rdx
	leaq	-1(%r12), %r10
	imulq	%rdx, %r10
	movq	%r11, %rdx
	imulq	%r12, %rdx
	addq	%r10, %rdx
	addq	%rax, %rdx
.L759:
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%r8,%rax,8), %rax
	movq	%rax, 56(%rcx)
.L757:
	incq	%rsi
	addq	$104, %rdi
	cmpq	400(%rbp), %rsi
	jg	.L738
.L737:
	movq	552(%rbp), %rcx
	addq	%rdi, %rcx
	movq	48(%rcx), %rax
	testq	%rax, %rax
	je	.L751
	movslq	(%rax), %rax
	testl	%eax, %eax
	js	.L751
	cqto
	movq	632(%rbp), %r11
	movq	640(%rbp), %r12
	idivq	624(%rbp)
	cmpq	%r11, %rdx
	jg	.L848
	imulq	%r12, %rdx
	addq	%rax, %rdx
	jmp	.L753
.L840:
	movq	%rdi, %rcx
	movq	$0, 120(%rsp)
	movq	$2000, 64(%rsp)
	imulq	%rdi, %rcx
	sarq	%rcx
	addq	%rcx, %rax
	cmpq	%rdx, %rax
	jle	.L699
	movq	%rbp, %rdi
	call	resize_prob
	testq	%rax, %rax
	jne	.L706
	movq	552(%rbp), %rax
	movq	560(%rbp), %rdx
	vxorps	%xmm0, %xmm0, %xmm0
	cmpq	%rdx, %rax
	jnb	.L709
	.p2align 4,,15
.L707:
	vmovups	%xmm0, 56(%rax)
	addq	$104, %rax
	cmpq	%rax, %rdx
	ja	.L707
.L709:
	xorl	%edx, %edx
	cmpq	$0, 424(%rbp)
	movq	568(%rbp), %rax
	movl	$72, %ecx
	jle	.L704
	.p2align 4,,15
.L708:
	movq	16(%rax), %rsi
	incq	%rdx
	movq	56(%rsi), %rdi
	movq	%rdi, 40(%rax)
	movq	%rax, 56(%rsi)
	movq	24(%rax), %rsi
	movq	64(%rsi), %rdi
	movq	%rdi, 48(%rax)
	movq	%rax, 64(%rsi)
	movq	568(%rbp), %rax
	addq	%rcx, %rax
	addq	$72, %rcx
	cmpq	%rdx, 424(%rbp)
	jg	.L708
	jmp	.L704
.L764:
	movq	$0, 120(%rsp)
	movq	$1000, 64(%rsp)
	jmp	.L699
	.p2align 4,,15
.L842:
	testq	%rdx, %rdx
	jne	.L715
	movq	72(%rsp), %rax
	movq	40(%rsp), %r8
	movq	%r12, %rdx
	movq	%r15, %rdi
	movq	16(%rsp), %rcx
	movq	56(%rsp), %rsi
	movq	%r10, 88(%rsp)
	movq	%r9, 80(%rsp)
	movq	%rax, (%r15)
	call	switch_arcs.constprop.9
	movq	$0, (%r15)
	movq	$0, 72(%rsp)
	movq	88(%rsp), %r10
	movq	80(%rsp), %r9
	jmp	.L715
	.p2align 4,,15
.L846:
	movq	56(%rsp), %rax
	vmovups	(%r12), %xmm6
	leaq	(%rdx,%rdx,8), %rdx
	movq	%r11, 88(%rsp)
	salq	$3, %rdx
	movq	%r10, 80(%rsp)
	incq	72(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 232
	movq	%r12, %rdi
	addq	(%rax), %rdx
	vmovups	%xmm6, (%rdx)
	vmovups	16(%r12), %xmm7
	vmovups	%xmm7, 16(%rdx)
	vmovups	32(%r12), %xmm1
	vmovups	%xmm1, 32(%rdx)
	vmovups	48(%r12), %xmm6
	vmovups	%xmm6, 48(%rdx)
	movq	64(%r12), %rcx
	movq	%rcx, 64(%rdx)
	pushq	%r9
	.cfi_def_cfa_offset 240
	movq	32(%rsp), %r9
	movl	$30, %ecx
	movq	%r14, %rdx
	incq	(%r15)
	call	replace_weaker_arc
	popq	%rax
	.cfi_def_cfa_offset 232
	popq	%rcx
	.cfi_def_cfa_offset 224
	movq	(%r15), %rdx
	movq	80(%rsp), %r10
	movq	88(%rsp), %r11
	movw	$0, 38(%rsp)
	jmp	.L726
	.p2align 4,,15
.L845:
	leaq	(%rdi,%rdi,8), %rdx
	vmovq	%rsi, %xmm7
	leal	-1(%rbp), %r9d
	vpinsrq	$1, %r14, %xmm7, %xmm0
	leaq	(%r12,%rdx,8), %rdx
	incq	%rdi
	vmovups	%xmm0, 16(%rdx)
	movq	$30, 64(%rdx)
	movq	$30, 8(%rdx)
	movq	%r8, 56(%rdx)
	movl	%r9d, (%rdx)
	cmpq	$1, %rdi
	je	.L727
	movq	%rdi, %rsi
	shrq	$63, %rsi
	addq	%rdi, %rsi
	sarq	%rsi
	leaq	(%rsi,%rsi,8), %rdx
	leaq	-72(%r12,%rdx,8), %rdx
	cmpq	56(%rdx), %r8
	jg	.L728
	jmp	.L727
	.p2align 4,,15
.L849:
	movq	%rsi, %rax
	movq	%rsi, %rdi
	shrq	$63, %rax
	addq	%rsi, %rax
	sarq	%rax
	leaq	(%rax,%rax,8), %rdx
	leaq	-72(%r12,%rdx,8), %rdx
	cmpq	56(%rdx), %r8
	jle	.L727
	movq	%rax, %rsi
.L728:
	movq	16(%rdx), %rcx
	leaq	(%rdi,%rdi,8), %rax
	leaq	-72(%r12,%rax,8), %rax
	movq	%rcx, 16(%rax)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%rax)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%rax)
	movq	%rcx, 64(%rax)
	movq	56(%rdx), %rcx
	movq	%rcx, 56(%rax)
	movl	(%rdx), %ecx
	movl	%ecx, (%rax)
	vmovups	%xmm0, 16(%rdx)
	movq	$30, 8(%rdx)
	movq	$30, 64(%rdx)
	movq	%r8, 56(%rdx)
	movl	%r9d, (%rdx)
	cmpq	$1, %rsi
	jne	.L849
.L727:
	movq	8(%rsp), %rax
	movq	(%r15), %rdx
	incq	(%rax)
	jmp	.L726
	.p2align 4,,15
.L843:
	addq	96(%rsp), %r9
	jmp	.L720
	.p2align 4,,15
.L755:
	imulq	%r12, %rdx
	addq	%rax, %rdx
	jmp	.L756
	.p2align 4,,15
.L758:
	imulq	%r12, %rdx
	addq	%rax, %rdx
	jmp	.L759
	.p2align 4,,15
.L738:
	movq	568(%rbp), %rdx
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	testq	%r9, %r9
	jg	.L749
	jmp	.L750
	.p2align 4,,15
.L851:
	subq	%r11, %rdx
	imulq	%rbx, %r11
	leaq	-1(%rbx), %rdi
	imulq	%rdx, %rdi
	leaq	(%rdi,%r11), %rdx
	addq	%rax, %rdx
.L762:
	vmovups	(%r10), %xmm2
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%r8,%rax,8), %rax
	vmovups	%xmm2, (%rax)
	vmovups	16(%r10), %xmm3
	vmovups	%xmm3, 16(%rax)
	vmovups	32(%r10), %xmm4
	vmovups	%xmm4, 32(%rax)
	vmovups	48(%r10), %xmm5
	vmovups	%xmm5, 48(%rax)
	movq	64(%r10), %rdx
	movq	%rdx, 64(%rax)
	movq	568(%rbp), %rdx
.L760:
	incq	%rcx
	addq	$72, %rsi
	cmpq	%rcx, %r9
	je	.L850
.L749:
	leaq	(%rdx,%rsi), %r10
	movslq	(%r10), %rax
	testl	%eax, %eax
	js	.L760
	cqto
	movq	632(%rbp), %r11
	movq	640(%rbp), %rbx
	idivq	624(%rbp)
	cmpq	%r11, %rdx
	jg	.L851
	imulq	%rbx, %rdx
	addq	%rax, %rdx
	jmp	.L762
	.p2align 4,,15
.L850:
	movq	152(%rsp), %rbx
.L750:
	movq	424(%rbp), %rax
	movq	8(%rsp), %rdi
	movq	%r8, 568(%rbp)
	movq	%rdx, 584(%rbp)
	addq	%rbx, %rax
	movq	%rax, 424(%rbp)
	leaq	(%rax,%rax,8), %rax
	leaq	(%r8,%rax,8), %rax
	movq	%rax, 576(%rbp)
	call	free
	movq	%r15, %rdi
	call	free
	movq	104(%rsp), %rdi
	call	free
	movq	56(%rsp), %rdi
	call	free
.L836:
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L747:
	.cfi_restore_state
	imulq	640(%rbp), %rdx
	addq	%rax, %rdx
	jmp	.L748
.L739:
	cmpq	%rsi, %rcx
	je	.L741
	movq	128(%rsp), %rdi
	jmp	.L745
	.p2align 4,,15
.L742:
	addq	$72, %rcx
	cmpq	%rcx, %rsi
	je	.L741
.L745:
	cmpq	$1, 56(%rcx)
	prefetcht0	344(%rcx)
	jne	.L742
	movslq	(%rcx), %rax
	movq	$0, 56(%rcx)
	movw	$1, 32(%rcx)
	movq	632(%rbp), %r8
	prefetchw	320(%rcx)
	prefetcht0	288(%rcx)
	cqto
	idivq	624(%rbp)
	cmpq	%r8, %rdx
	jle	.L743
	movq	640(%rbp), %r9
	subq	%r8, %rdx
	leaq	-1(%r9), %r10
	imulq	%r9, %r8
	imulq	%r10, %rdx
	addq	%r8, %rdx
	addq	%rax, %rdx
.L744:
	vmovups	(%rcx), %xmm4
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rdi,%rax,8), %rax
	vmovups	%xmm4, (%rax)
	vmovups	16(%rcx), %xmm5
	vmovups	%xmm5, 16(%rax)
	vmovups	32(%rcx), %xmm1
	vmovups	%xmm1, 32(%rax)
	vmovups	48(%rcx), %xmm4
	vmovups	%xmm4, 48(%rax)
	movq	64(%rcx), %rdx
	movq	%rdx, 64(%rax)
	jmp	.L742
.L743:
	imulq	640(%rbp), %rdx
	addq	%rax, %rdx
	jmp	.L744
	.p2align 4,,15
.L712:
	movq	$0, (%r15)
	movq	$0, 24(%rsp)
	jmp	.L732
.L847:
	movq	%rax, %rbx
	jmp	.L734
.L706:
	movq	$-1, %rbx
	jmp	.L836
	.cfi_endproc
.LFE55:
	.size	price_out_impl, .-price_out_impl
	.p2align 4,,15
	.globl	suspend_impl
	.type	suspend_impl, @function
suspend_impl:
.LFB56:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %r11
	movabsq	$2361183241434822607, %rcx
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	424(%rdi), %r10
	movq	$4000, 640(%rdi)
	movq	%rdx, %rbp
	leaq	-1(%r10), %rdi
	movq	%rdi, %rax
	sarq	$63, %rdi
	imulq	%rcx
	movq	%r10, %rax
	sarq	$9, %rdx
	subq	%rdi, %rdx
	leaq	1(%rdx), %rdi
	imulq	%rcx
	movq	%r10, %rax
	sarq	$63, %rax
	movq	%rdi, %rcx
	movq	%rdi, 624(%r11)
	sarq	$9, %rdx
	subq	%rax, %rdx
	imulq	$4000, %rdx, %rdx
	subq	%r10, %rdx
	leaq	4000(%rdx), %rax
	subq	%rax, %rcx
	movq	%rcx, 632(%r11)
	jns	.L872
	movl	$3999, %eax
	.p2align 4,,15
.L854:
	addq	%rdi, %rcx
	movq	%rax, %r8
	leaq	-1(%rax), %rax
	js	.L854
	vmovq	%rcx, %xmm2
	vpinsrq	$1, %r8, %xmm2, %xmm0
	vmovups	%xmm0, 632(%r11)
.L853:
	movq	440(%r11), %rbx
	testq	%rbp, %rbp
	jne	.L855
	movq	%r10, %r9
	movq	$-2, %r12
	subq	%rbx, %r9
	movq	%r9, %rbx
	cmpq	%r9, %r10
	jg	.L856
	.p2align 4,,15
.L865:
	xorl	%ebx, %ebx
.L887:
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L891:
	.cfi_restore_state
	movl	$-1, (%rax)
	movq	424(%r11), %r10
	incq	%r9
	incq	%rbp
	cmpq	%r10, %r9
	jge	.L889
.L863:
	movq	624(%r11), %rdi
	movq	632(%r11), %rcx
	movq	640(%r11), %r8
.L856:
	movq	%r9, %rax
	movq	568(%r11), %r10
	cqto
	idivq	%rdi
	cmpq	%rcx, %rdx
	jle	.L858
	subq	%rcx, %rdx
	imulq	%r8, %rcx
	leaq	-1(%r8), %rdi
	imulq	%rdi, %rdx
	addq	%rcx, %rdx
	addq	%rax, %rdx
.L859:
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%r10,%rax,8), %rax
	movzwl	32(%rax), %ecx
	cmpw	$1, %cx
	je	.L890
	movq	%r12, %rdx
	testw	%cx, %cx
	jne	.L861
	movq	16(%rax), %rcx
	cmpq	%rax, 48(%rcx)
	je	.L861
	movq	24(%rax), %rdx
	movq	%rax, 48(%rdx)
	movq	%r12, %rdx
.L861:
	cmpq	%rsi, %rdx
	jg	.L891
	movl	%ebx, %edx
	incq	%r9
	incq	%rbx
	movl	%edx, (%rax)
	movq	424(%r11), %r10
	cmpq	%r9, %r10
	jg	.L863
	movq	%rbp, %rbx
.L855:
	testq	%rbx, %rbx
	je	.L865
.L864:
	movq	%r10, %rdi
	movabsq	$2361183241434822607, %rsi
	vmovups	440(%r11), %xmm4
	vmovq	%rbx, %xmm3
	subq	%rbx, %rdi
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	movq	$4000, 640(%r11)
	leaq	-1(%rdi), %rcx
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rsi
	movq	%rdi, %rax
	sarq	$9, %rdx
	subq	%rcx, %rdx
	vpsubq	%xmm0, %xmm4, %xmm1
	vpaddq	%xmm4, %xmm0, %xmm0
	leaq	1(%rdx), %rcx
	imulq	%rsi
	movq	%rdi, %rax
	vshufpd	$2, %xmm0, %xmm1, %xmm0
	sarq	$63, %rax
	vmovups	%xmm0, 440(%r11)
	movq	%rcx, 624(%r11)
	sarq	$9, %rdx
	subq	%rax, %rdx
	movq	%rcx, %rax
	imulq	$4000, %rdx, %rdx
	subq	%rdx, %rdi
	je	.L866
	leaq	-4000(%rcx,%rdi), %rax
.L866:
	movq	%rax, 632(%r11)
	testq	%rax, %rax
	jns	.L867
	movl	$3999, %edx
	.p2align 4,,15
.L868:
	movq	%rdx, %rsi
	decq	%rdx
	addq	%rcx, %rax
	js	.L868
	vmovq	%rax, %xmm5
	vpinsrq	$1, %rsi, %xmm5, %xmm0
	vmovups	%xmm0, 632(%r11)
.L867:
	movq	%r10, %rsi
	movq	%r11, %rdi
	call	refreshPositions.constprop.12
	leaq	(%rbx,%rbx,8), %rax
	movq	424(%r11), %rcx
	salq	$3, %rax
	movq	560(%r11), %rdx
	subq	%rax, 576(%r11)
	movq	552(%r11), %rax
	subq	%rbx, %rcx
	movq	%rcx, 424(%r11)
	cmpq	%rdx, %rax
	jnb	.L869
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,15
.L870:
	vmovups	%xmm0, 56(%rax)
	addq	$104, %rax
	cmpq	%rax, %rdx
	ja	.L870
	movq	424(%r11), %rcx
.L869:
	movq	568(%r11), %rax
	testq	%rcx, %rcx
	jle	.L887
	movl	$72, %ecx
	xorl	%edx, %edx
	.p2align 4,,15
.L871:
	movq	16(%rax), %rsi
	incq	%rdx
	movq	56(%rsi), %rdi
	movq	%rdi, 40(%rax)
	movq	%rax, 56(%rsi)
	movq	24(%rax), %rsi
	movq	64(%rsi), %rdi
	movq	%rdi, 48(%rax)
	movq	%rax, 64(%rsi)
	movq	568(%r11), %rax
	addq	%rcx, %rax
	addq	$72, %rcx
	cmpq	424(%r11), %rdx
	jl	.L871
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L858:
	.cfi_restore_state
	imulq	%r8, %rdx
	addq	%rax, %rdx
	jmp	.L859
	.p2align 4,,15
.L890:
	movq	16(%rax), %rcx
	movq	8(%rax), %rdx
	subq	(%rcx), %rdx
	movq	24(%rax), %rcx
	addq	(%rcx), %rdx
	jmp	.L861
	.p2align 4,,15
.L889:
	movq	%rbp, %rbx
	jmp	.L864
	.p2align 4,,15
.L872:
	movl	$4000, %r8d
	jmp	.L853
	.cfi_endproc
.LFE56:
	.size	suspend_impl, .-suspend_impl
	.p2align 4,,15
	.globl	primal_start_artificial
	.type	primal_start_artificial, @function
primal_start_artificial:
.LFB57:
	.cfi_startproc
	movq	552(%rdi), %rcx
	leaq	104(%rcx), %rax
	movq	$0, 48(%rcx)
	movq	$0, 24(%rcx)
	movq	%rax, 16(%rcx)
	movq	$0, 32(%rcx)
	movq	$0, 40(%rcx)
	movq	400(%rdi), %rsi
	movl	$0, 8(%rcx)
	movq	$-100000000, (%rcx)
	movq	$0, 80(%rcx)
	leaq	1(%rsi), %rdx
	movq	%rdx, 88(%rcx)
	movq	568(%rdi), %rsi
	movq	424(%rdi), %r8
	leaq	1472(%rsi), %rdx
	xorl	%esi, %esi
	testq	%r8, %r8
	jle	.L899
	.p2align 4,,15
.L896:
	cmpw	$-1, -1440(%rdx)
	prefetcht0	(%rdx)
	je	.L897
	movw	$1, -1440(%rdx)
	movq	424(%rdi), %r8
	incq	%rsi
	addq	$72, %rdx
	cmpq	%rsi, %r8
	jg	.L896
.L899:
	movq	400(%rdi), %r9
	movq	592(%rdi), %rdx
	xorl	%esi, %esi
	testq	%r9, %r9
	jle	.L895
	.p2align 4,,15
.L900:
	leaq	-104(%rax), %r9
	leaq	104(%rax), %r8
	movq	%rdx, 48(%rax)
	movq	%rcx, 24(%rax)
	movq	$0, 16(%rax)
	movq	%r8, 32(%rax)
	incq	%rsi
	addq	$72, %rdx
	movq	%r9, 40(%rax)
	movq	$1, 88(%rax)
	movq	$100000000, -64(%rdx)
	movw	$0, -40(%rdx)
	movl	$1, 8(%rax)
	movq	$0, (%rax)
	movq	%rax, -56(%rdx)
	movq	%rcx, -48(%rdx)
	movl	$-2, -72(%rdx)
	movq	$0, 80(%rax)
	movq	%r8, %rax
	movq	400(%rdi), %r9
	cmpq	%rsi, %r9
	jg	.L900
.L895:
	imulq	$104, %r9, %r9
	xorl	%eax, %eax
	movq	$0, 32(%rcx,%r9)
	movq	$0, 144(%rcx)
	ret
	.p2align 4,,15
.L897:
	incq	%rsi
	addq	$72, %rdx
	cmpq	%rsi, %r8
	jg	.L896
	jmp	.L899
	.cfi_endproc
.LFE57:
	.size	primal_start_artificial, .-primal_start_artificial
	.section	.rodata.str1.1
.LC15:
	.string	"w"
.LC16:
	.string	"()\n"
.LC17:
	.string	"***\n"
.LC18:
	.string	"%d\n"
	.text
	.p2align 4,,15
	.globl	write_circulations
	.type	write_circulations, @function
write_circulations:
.LFB58:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	440(%rsi), %rax
	movq	576(%rsi), %r12
	movl	$.LC15, %esi
	leaq	(%rax,%rax,8), %rax
	salq	$3, %rax
	subq	%rax, %r12
	call	fopen
	testq	%rax, %rax
	je	.L936
	movq	%rax, %rbp
	movq	560(%r13), %rdx
	movq	552(%r13), %rax
	cmpq	%rdx, %rax
	jnb	.L906
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,15
.L907:
	vmovups	%xmm0, 56(%rax)
	addq	$104, %rax
	cmpq	%rax, %rdx
	ja	.L907
.L906:
	xorl	%ecx, %ecx
	cmpq	$0, 424(%r13)
	movq	568(%r13), %rax
	jg	.L908
	jmp	.L909
	.p2align 4,,15
.L938:
	movq	640(%r13), %r8
	subq	%rsi, %rdx
	leaq	-1(%r8), %r9
	imulq	%r8, %rsi
	imulq	%r9, %rdx
	addq	%rsi, %rdx
.L935:
	addq	%rdx, %rax
	leaq	(%rax,%rax,8), %rax
	leaq	(%rdi,%rax,8), %rax
	cmpq	%rcx, 424(%r13)
	jle	.L909
.L908:
	movq	16(%rax), %rdx
	incq	%rcx
	movq	56(%rdx), %rsi
	movq	%rsi, 40(%rax)
	movq	%rax, 56(%rdx)
	movq	24(%rax), %rdx
	movq	64(%rdx), %rsi
	movq	%rsi, 48(%rax)
	movq	%rax, 64(%rdx)
	movq	%rcx, %rax
	movq	632(%r13), %rsi
	cqto
	idivq	624(%r13)
	movq	568(%r13), %rdi
	cmpq	%rsi, %rdx
	jg	.L938
	imulq	640(%r13), %rdx
	jmp	.L935
.L909:
	imulq	$104, 400(%r13), %rax
	addq	552(%r13), %rax
	movq	56(%rax), %r14
	testq	%r14, %r14
	jne	.L919
	jmp	.L912
	.p2align 4,,15
.L913:
	movq	40(%r14), %r14
	testq	%r14, %r14
	je	.L912
.L919:
	cmpq	$0, 56(%r14)
	je	.L913
	movq	%rbp, %rcx
	movl	$3, %edx
	movl	$1, %esi
	movl	$.LC16, %edi
	movq	%r14, %rbx
	call	fwrite
	cmpq	%rbx, %r12
	jbe	.L939
	.p2align 4,,15
.L914:
	movq	24(%rbx), %rax
	movl	$.LC18, %esi
	movq	%rbp, %rdi
	movl	96(%rax), %edx
	xorl	%eax, %eax
	negl	%edx
	call	fprintf
	imulq	$104, 408(%r13), %rax
	addq	24(%rbx), %rax
	movq	56(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L918
	jmp	.L915
	.p2align 4,,15
.L940:
	movq	40(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L915
.L918:
	cmpq	$0, 56(%rbx)
	je	.L940
	movq	24(%rbx), %rax
	movl	96(%rax), %eax
	testl	%eax, %eax
	je	.L913
	cmpq	%rbx, %r12
	ja	.L914
.L939:
	movq	%rbp, %rcx
	movl	$4, %edx
	movl	$1, %esi
	movl	$.LC17, %edi
	call	fwrite
	jmp	.L914
.L912:
	movq	%rbp, %rdi
	call	fclose
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L915:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	fclose
.L936:
	popq	%rbx
	.cfi_def_cfa_offset 40
	movq	$-1, %rax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE58:
	.size	write_circulations, .-write_circulations
	.section	.rodata.str1.1
.LC19:
	.string	"%.0f\n"
	.text
	.p2align 4,,15
	.globl	write_objective_value
	.type	write_objective_value, @function
write_objective_value:
.LFB59:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbp
	movl	$.LC15, %esi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	fopen
	testq	%rax, %rax
	je	.L943
	movq	%rax, %rbx
	movq	%rbp, %rdi
	call	flow_cost
	movl	$.LC19, %esi
	movq	%rbx, %rdi
	movl	$1, %eax
	call	fprintf
	movq	%rbx, %rdi
	call	fclose
	xorl	%eax, %eax
.L944:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L943:
	.cfi_restore_state
	movq	$-1, %rax
	jmp	.L944
	.cfi_endproc
.LFE59:
	.size	write_objective_value, .-write_objective_value
	.p2align 4,,15
	.globl	update_tree
	.type	update_tree, @function
update_tree:
.LFB60:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	88(%rsp), %rax
	movq	80(%rsp), %r13
	movq	%rcx, -16(%rsp)
	movq	56(%rsp), %r11
	movq	64(%rsp), %rcx
	movq	72(%rsp), %r12
	movq	%rax, %r10
	movq	16(%r13), %rbp
	sarq	$63, %r10
	movq	%r10, %rbx
	xorq	%rax, %rbx
	subq	%r10, %rbx
	cmpq	%r9, %rbp
	jne	.L979
	testq	%rax, %rax
	js	.L947
.L979:
	testq	%rax, %rax
	jle	.L980
	cmpq	%r8, %rbp
	je	.L947
.L980:
	negq	%rbx
.L947:
.L950:
	addq	%rbx, (%r11)
	movq	%r11, %rax
	movq	16(%rax), %r10
	testq	%r10, %r10
	je	.L951
	.p2align 4,,15
.L952:
	addq	%rbx, (%r10)
	movq	%r10, %rax
	movq	16(%rax), %r10
	testq	%r10, %r10
	jne	.L952
.L951:
	cmpq	%r11, %rax
	je	.L953
	.p2align 4,,15
.L1003:
	movq	32(%rax), %r10
	testq	%r10, %r10
	jne	.L952
	movq	24(%rax), %rax
	cmpq	%rax, %r11
	jne	.L1003
.L953:
	movq	88(%r11), %r14
	movq	24(%r8), %r10
	movq	%r9, %r11
	movq	%r14, %rbx
	cmpq	%rcx, %r8
	jne	.L955
	jmp	.L965
	.p2align 4,,15
.L963:
	movq	80(%r8), %rax
	subq	%rdx, %rax
.L964:
	movq	88(%r8), %rbp
	movq	48(%r8), %r15
	vmovq	-16(%rsp), %xmm1
	vpinsrq	$1, %rbx, %xmm1, %xmm0
	movq	%r14, %rbx
	movl	%esi, 8(%r8)
	movq	%r13, 48(%r8)
	movq	%r11, %rsi
	vmovups	%xmm0, 80(%r8)
	movq	%rax, -16(%rsp)
	movq	%r8, %r11
	subq	%rbp, %rbx
	movq	%r15, %r13
	movq	24(%r10), %rbp
	cmpq	%r10, %rcx
	je	.L965
	movq	%r10, %r8
	movq	%rbp, %r10
.L955:
	movq	32(%r8), %rax
	movq	40(%r8), %rbp
	testq	%rax, %rax
	je	.L959
	movq	%rbp, 40(%rax)
	movq	40(%r8), %rbp
	movq	32(%r8), %rax
.L959:
	testq	%rbp, %rbp
	je	.L960
	movq	%rax, 32(%rbp)
.L961:
	movq	%r11, 24(%r8)
	movq	16(%r11), %rax
	movq	%rax, 32(%r8)
	testq	%rax, %rax
	je	.L962
	movq	%r8, 40(%rax)
.L962:
	movq	%r8, 16(%r11)
	movl	8(%r8), %eax
	xorl	%r11d, %r11d
	movq	$0, 40(%r8)
	testl	%eax, %eax
	sete	%r11b
	cmpq	%rdi, %r11
	jne	.L963
	movq	80(%r8), %rax
	addq	%rdx, %rax
	jmp	.L964
	.p2align 4,,15
.L960:
	movq	%rax, 16(%r10)
	jmp	.L961
	.p2align 4,,15
.L965:
	cmpq	96(%rsp), %rdx
	jg	.L1007
	cmpq	%r12, %rcx
	je	.L976
	.p2align 4,,15
.L966:
	subq	%r14, 88(%rcx)
	movq	24(%rcx), %rcx
	cmpq	%rcx, %r12
	jne	.L966
.L976:
	cmpq	%r12, %r9
	je	.L1004
	.p2align 4,,15
.L967:
	addq	%r14, 88(%r9)
	movq	24(%r9), %r9
	cmpq	%r9, %r12
	jne	.L967
.L1004:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L969:
	.cfi_restore_state
	movq	80(%rcx), %rax
	movslq	8(%rcx), %r8
	subq	%r14, 88(%rcx)
	leaq	(%rax,%rdx), %rsi
	subq	%rdx, %rax
	cmpq	%rdi, %r8
	cmovne	%rsi, %rax
	movq	%rax, 80(%rcx)
	movq	24(%rcx), %rcx
.L1007:
	cmpq	%r12, %rcx
	jne	.L969
	cmpq	%r12, %r9
	je	.L1004
	.p2align 4,,15
.L970:
	movq	80(%r9), %rax
	movslq	8(%r9), %rsi
	addq	%r14, 88(%r9)
	leaq	(%rdx,%rax), %rcx
	subq	%rdx, %rax
	cmpq	%rsi, %rdi
	cmove	%rcx, %rax
	movq	%rax, 80(%r9)
	movq	24(%r9), %r9
	cmpq	%r9, %r12
	jne	.L970
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE60:
	.size	update_tree, .-update_tree
	.p2align 4,,15
	.globl	primal_iminus
	.type	primal_iminus, @function
primal_iminus:
.LFB61:
	.cfi_startproc
	xorl	%eax, %eax
	cmpq	%rcx, %rdx
	je	.L1009
	movl	$1, %r10d
	jmp	.L1018
	.p2align 4,,15
.L1027:
	movl	8(%rdx), %r11d
	testl	%r11d, %r11d
	je	.L1011
	movq	80(%rdx), %r9
	cmpq	%r9, (%rdi)
	jle	.L1025
	movq	%r9, (%rdi)
	movq	%rdx, %rax
	movq	$0, (%rsi)
.L1025:
	movq	24(%rdx), %rdx
.L1014:
	cmpq	%rdx, %rcx
	je	.L1009
.L1018:
	movq	88(%rcx), %r11
	cmpq	%r11, 88(%rdx)
	jl	.L1027
	movl	8(%rcx), %r9d
	testl	%r9d, %r9d
	jne	.L1015
	movq	80(%rcx), %r9
	cmpq	%r9, (%rdi)
	jl	.L1026
	movq	%r9, (%rdi)
	movq	%rcx, %rax
	movq	$1, (%rsi)
.L1026:
	movq	24(%rcx), %rcx
	cmpq	%rdx, %rcx
	jne	.L1018
.L1009:
	movq	%rdx, (%r8)
	ret
	.p2align 4,,15
.L1015:
	movq	24(%rcx), %r9
	cmpq	$0, 24(%r9)
	je	.L1023
	movq	%r10, %r11
	subq	80(%rcx), %r11
	cmpq	%r11, (%rdi)
	jl	.L1023
	movq	%r11, (%rdi)
	movq	%rcx, %rax
	movq	$1, (%rsi)
	movq	24(%rcx), %rcx
	jmp	.L1014
	.p2align 4,,15
.L1011:
	movq	24(%rdx), %r9
	cmpq	$0, 24(%r9)
	je	.L1021
	movq	%r10, %r11
	subq	80(%rdx), %r11
	cmpq	%r11, (%rdi)
	jle	.L1021
	movq	%r11, (%rdi)
	movq	%rdx, %rax
	movq	$0, (%rsi)
	movq	24(%rdx), %rdx
	jmp	.L1014
	.p2align 4,,15
.L1023:
	movq	%r9, %rcx
	jmp	.L1014
	.p2align 4,,15
.L1021:
	movq	%r9, %rdx
	jmp	.L1014
	.cfi_endproc
.LFE61:
	.size	primal_iminus, .-primal_iminus
	.p2align 4,,15
	.type	master.constprop.4, @function
master.constprop.4:
.LFB85:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%edx, %edx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$32568, %rsp
	.cfi_def_cfa_offset 32624
	movq	568(%rdi), %rax
	vmovddup	basket(%rip), %xmm2
	vmovaps	.LC20(%rip), %xmm0
	vmovaps	.LC21(%rip), %xmm3
	leaq	72(%rsp), %rcx
	vmovaps	.LC22(%rip), %xmm7
	vmovaps	.LC23(%rip), %xmm6
	vmovaps	.LC24(%rip), %xmm5
	movq	576(%rdi), %rsi
	movq	%rax, 56(%rsp)
	movq	%rax, 8(%rsp)
	movq	basket_sizes(%rip), %rax
	movq	$0, (%rax)
.L1029:
	vpsllq	$5, %xmm0, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm1
	vpaddq	%xmm6, %xmm0, %xmm4
	leaq	64(%rcx), %rax
	vmovups	%xmm1, (%rcx)
	vpaddq	%xmm3, %xmm0, %xmm1
	vpsllq	$5, %xmm4, %xmm4
	addq	$4, %rdx
	vpsllq	$5, %xmm1, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm1
	vpaddq	%xmm2, %xmm4, %xmm4
	prefetchw	400(%rcx)
	vmovups	%xmm1, 16(%rcx)
	vpaddq	%xmm7, %xmm0, %xmm1
	vmovups	%xmm4, 32(%rcx)
	vpaddq	%xmm5, %xmm0, %xmm0
	vpsllq	$5, %xmm1, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm1
	vmovups	%xmm1, 48(%rcx)
	movq	%rax, %rcx
	cmpq	$2028, %rdx
	jne	.L1029
	jmp	.L1030
	.p2align 4,,15
.L1044:
	movl	$2029, %edx
.L1030:
	vpsllq	$5, %xmm0, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm1
	addq	$16, %rax
	vpaddq	%xmm3, %xmm0, %xmm0
	vmovups	%xmm1, -16(%rax)
	cmpq	$2028, %rdx
	je	.L1044
	cmpq	$0, opt(%rip)
	jne	.L1066
	movq	%rdi, %r12
	leaq	72(%rsp), %r15
	movq	%rsi, %r14
.L1043:
	subq	$8, %rsp
	.cfi_def_cfa_offset 32632
	pushq	640(%r12)
	.cfi_def_cfa_offset 32640
	movq	basket_sizes(%rip), %rdx
	xorl	%r8d, %r8d
	pushq	$1
	.cfi_def_cfa_offset 32648
	movq	%r14, %rsi
	pushq	$0
	.cfi_def_cfa_offset 32656
	movq	40(%rsp), %rdi
	movq	opt_basket(%rip), %rbx
	leaq	88(%rsp), %r9
	leaq	96(%rsp), %rcx
	call	primal_bea_mpp.constprop.5
	addq	$32, %rsp
	.cfi_def_cfa_offset 32624
	movq	%rax, (%rbx)
	movq	perm_p(%rip), %rax
	movq	%r15, (%rax)
	movq	opt_basket(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1032
	movq	8(%rax), %r13
	movq	(%rax), %rbp
	call	markBaskets.constprop.6
	testq	%r13, %r13
	je	.L1032
	incq	608(%r12)
	movq	16(%rbp), %rbx
	movq	24(%rbp), %r9
	testq	%r13, %r13
	jle	.L1033
	movq	%rbx, %rax
	movq	%r9, %rbx
	movq	%rax, %r9
.L1033:
	movq	%r9, %rcx
	leaq	48(%rsp), %r8
	movq	%rbx, %rdx
	leaq	40(%rsp), %rsi
	leaq	32(%rsp), %rdi
	movq	%r9, 16(%rsp)
	movq	$1, 32(%rsp)
	call	primal_iminus
	movq	16(%rsp), %r9
	testq	%rax, %rax
	je	.L1068
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1040
	movq	%rbx, %rdx
	movq	%r9, %rbx
	movq	%rdx, %r9
.L1040:
	movslq	8(%rax), %rcx
	movq	32(%rsp), %r10
	xorl	%r11d, %r11d
	movq	%rbx, %r8
	movq	48(%rax), %rsi
	movq	24(%rax), %rdx
	cmpq	%rcx, %rdi
	movl	$1, %ecx
	sete	%r11b
	subq	%r10, %rcx
	movq	%rsi, 16(%rsp)
	incl	%r11d
	testq	%r13, %r13
	cmovle	%r10, %rcx
	xorl	%esi, %esi
	cmpq	%rbx, 16(%rbp)
	movl	%r11d, 28(%rsp)
	movl	%r11d, 24(%rsp)
	pushq	512(%r12)
	.cfi_def_cfa_offset 32632
	pushq	%r13
	.cfi_def_cfa_offset 32640
	pushq	%rbp
	.cfi_def_cfa_offset 32648
	pushq	72(%rsp)
	.cfi_def_cfa_offset 32656
	pushq	%rdx
	.cfi_def_cfa_offset 32664
	movq	%r10, %rdx
	sete	%sil
	testq	%rdi, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 32672
	sete	%dil
	movzbl	%dil, %edi
	call	update_tree
	movq	64(%rsp), %rax
	movw	$0, 32(%rbp)
	movl	76(%rsp), %r11d
	addq	$48, %rsp
	.cfi_def_cfa_offset 32624
	movw	%r11w, 32(%rax)
	movq	opt(%rip), %rax
.L1036:
	testq	%rax, %rax
	je	.L1043
.L1066:
	addq	$32568, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L1032:
	.cfi_restore_state
	movq	$1, opt(%rip)
	jmp	.L1066
	.p2align 4,,15
.L1068:
	incq	616(%r12)
	xorl	%eax, %eax
	cmpw	$2, 32(%rbp)
	setne	%al
	incl	%eax
	cmpq	$0, 32(%rsp)
	movw	%ax, 32(%rbp)
	movq	opt(%rip), %rax
	je	.L1036
	movq	48(%rsp), %rdx
	cmpq	%rdx, %rbx
	je	.L1039
	.p2align 4,,15
.L1037:
	movl	8(%rbx), %edi
	xorl	%ecx, %ecx
	testl	%edi, %edi
	sete	%cl
	movq	%rcx, 80(%rbx)
	movq	24(%rbx), %rbx
	cmpq	%rbx, %rdx
	jne	.L1037
.L1039:
	cmpq	%rdx, %r9
	je	.L1036
	.p2align 4,,15
.L1038:
	movl	8(%r9), %esi
	xorl	%ecx, %ecx
	testl	%esi, %esi
	setne	%cl
	movq	%rcx, 80(%r9)
	movq	24(%r9), %r9
	cmpq	%r9, %rdx
	jne	.L1038
	jmp	.L1036
	.cfi_endproc
.LFE85:
	.size	master.constprop.4, .-master.constprop.4
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"active arcs                : %ld\n"
	.align 8
.LC26:
	.string	"simplex iterations         : %ld\n"
	.align 8
.LC27:
	.string	"objective value            : %0.0f\n"
	.section	.rodata.str1.1
.LC28:
	.string	"not enough memory, exit(-1)"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"erased arcs                : %ld\n"
	.align 8
.LC30:
	.string	"new implicit arcs          : %ld\n"
	.align 8
.LC31:
	.string	"checksum                   : %0.0f\n"
	.text
	.p2align 4,,15
	.globl	global_opt
	.type	global_opt, @function
global_opt:
.LFB34:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	$-1, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,15
.L1075:
	movq	net+424(%rip), %rsi
	movl	$.LC25, %edi
	xorl	%eax, %eax
	call	printf
	movl	$8, %esi
	movl	$1, %edi
	call	calloc
	movl	$8, %esi
	movl	$1, %edi
	movq	%rax, perm_p(%rip)
	call	calloc
	movl	$8, %esi
	movl	$1, %edi
	movq	%rax, opt_basket(%rip)
	call	calloc
	movl	$32, %esi
	movl	$4261, %edi
	movq	%rax, basket_sizes(%rip)
	call	calloc
	movl	$net, %edi
	movq	%rax, basket(%rip)
	movq	net+632(%rip), %rax
	imulq	net+640(%rip), %rax
	leaq	(%rax,%rax,8), %rdx
	movq	net+568(%rip), %rax
	leaq	(%rax,%rdx,8), %rax
	movq	%rax, full_group_end_arc(%rip)
	call	master.constprop.4
	movl	$net, %edi
	call	primal_feasible
	movl	$net, %edi
	call	dual_feasible
	movq	perm_p(%rip), %rdi
	movq	$0, opt(%rip)
	call	free
	movq	opt_basket(%rip), %rdi
	call	free
	movq	basket_sizes(%rip), %rdi
	call	free
	movq	basket(%rip), %rdi
	call	free
	movq	net+608(%rip), %rsi
	movl	$.LC26, %edi
	xorl	%eax, %eax
	call	printf
	movl	$net, %edi
	call	flow_cost
	movl	$.LC27, %edi
	movl	$1, %eax
	call	printf
	cmpq	$0, net+440(%rip)
	je	.L1070
	xorl	%edx, %edx
	movq	%rbp, %rsi
	movl	$net, %edi
	call	suspend_impl
	testq	%rax, %rax
	js	.L1074
	jne	.L1080
.L1072:
	movl	$net, %edi
	call	price_out_impl
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L1081
	movl	$net, %edi
	call	flow_cost
	movl	$.LC31, %edi
	movl	$1, %eax
	vmovsd	%xmm0, net+536(%rip)
	call	printf
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L1070:
	.cfi_restore_state
	movq	net+424(%rip), %rsi
	movl	$net, %edi
	call	refreshPositions.constprop.12
	jmp	.L1072
	.p2align 4,,15
.L1081:
	movq	%rax, %rsi
	movl	$.LC30, %edi
	xorl	%eax, %eax
	call	printf
	testq	%rbx, %rbx
	jns	.L1075
.L1074:
	movl	$.LC28, %edi
	call	puts
	movl	$-1, %edi
	call	exit
	.p2align 4,,15
.L1080:
	movq	%rax, %rsi
	movl	$.LC29, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L1072
	.cfi_endproc
.LFE34:
	.size	global_opt, .-global_opt
	.section	.rodata.str1.1
.LC32:
	.string	"\nMCF SPEC CPU version 1.11"
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"Copyright (c) 1998-2000 Zuse Institut Berlin (ZIB)"
	.align 8
.LC34:
	.string	"Copyright (c) 2000-2002 Andreas Loebel & ZIB"
	.align 8
.LC35:
	.string	"Copyright (c) 2003-2005 Andreas Loebel"
	.align 8
.LC36:
	.string	"Copyright (c) 2006-2010 Dres. Loebel, Borndoerfer & Weider GbR (LBW)"
	.section	.rodata.str1.1
.LC37:
	.string	"mcf.%d.out"
.LC38:
	.string	"read error, exit"
	.section	.rodata.str1.8
	.align 8
.LC39:
	.string	"nodes                      : %ld\n"
	.section	.rodata.str1.1
.LC40:
	.string	"done"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB35:
	.cfi_startproc
	cmpl	$1, %edi
	jle	.L1088
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	movl	$.LC32, %edi
	subq	$88, %rsp
	.cfi_def_cfa_offset 112
	movq	%rsi, %rbp
	call	puts
	movl	$.LC33, %edi
	call	puts
	movl	$.LC34, %edi
	call	puts
	movl	$.LC35, %edi
	call	puts
	movl	$.LC36, %edi
	call	puts
	movl	$10, %edi
	call	putchar
	movl	$net, %edx
	xorl	%eax, %eax
	movl	$81, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	$10000000, net+528(%rip)
	movq	%rdx, %rdi
	movq	8(%rbp), %rsi
	call	strcpy
	cmpl	$3, %ebx
	je	.L1094
	movabsq	$32780217678717805, %rax
	movq	%rax, (%rsp)
.L1085:
	movl	$net, %edi
	call	read_min
	testq	%rax, %rax
	jne	.L1095
	movq	net+408(%rip), %rsi
	movl	$.LC39, %edi
	xorl	%eax, %eax
	call	printf
	movl	$net, %edi
	call	primal_start_artificial
	call	global_opt
	movq	%rsp, %rdi
	movl	$net, %esi
	call	write_objective_value
	movl	$net, %edi
	testq	%rax, %rax
	jne	.L1096
	call	getfree
	movl	$.LC40, %edi
	call	puts
	xorl	%eax, %eax
.L1089:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L1094:
	.cfi_restore_state
	movq	16(%rbp), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movl	$.LC37, %esi
	movq	%rsp, %rdi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	sprintf
	jmp	.L1085
.L1088:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	orl	$-1, %eax
	ret
.L1095:
	.cfi_def_cfa_offset 112
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movl	$.LC38, %edi
	call	puts
	movl	$net, %edi
	call	getfree
	orl	$-1, %eax
	jmp	.L1089
.L1096:
	call	getfree
	orl	$-1, %eax
	jmp	.L1089
	.cfi_endproc
.LFE35:
	.size	main, .-main
	.text
	.p2align 4,,15
	.globl	primal_update_flow
	.type	primal_update_flow, @function
primal_update_flow:
.LFB62:
	.cfi_startproc
	cmpq	%rdx, %rdi
	je	.L1105
	.p2align 4,,15
.L1099:
	movl	8(%rdi), %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	sete	%al
	movq	%rax, 80(%rdi)
	movq	24(%rdi), %rdi
	cmpq	%rdi, %rdx
	jne	.L1099
	cmpq	%rsi, %rdx
	je	.L1106
	.p2align 4,,15
.L1101:
	movl	8(%rsi), %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	setne	%al
	movq	%rax, 80(%rsi)
	movq	24(%rsi), %rsi
.L1105:
	cmpq	%rsi, %rdx
	jne	.L1101
.L1106:
	ret
	.cfi_endproc
.LFE62:
	.size	primal_update_flow, .-primal_update_flow
	.p2align 4,,15
	.globl	markBaskets
	.type	markBaskets, @function
markBaskets:
.LFB63:
	.cfi_startproc
	movq	perm_p(%rip), %rsi
	xorl	%r8d, %r8d
	movl	$1, %r11d
	.p2align 4,,15
.L1114:
	movq	(%rsi), %rax
	movq	(%rax), %rcx
	cmpq	$0, 24(%rcx)
	js	.L1125
	cmpq	$1, %rdi
	jle	.L1116
	xorl	%r8d, %r8d
.L1109:
	movl	$1, %eax
	jmp	.L1112
	.p2align 4,,15
.L1127:
	movq	16(%rcx), %r9
	cmpq	%r9, 16(%rdx)
	jl	.L1111
	jg	.L1118
	movq	(%rcx), %r9
	movq	(%rdx), %r10
	movl	(%r10), %r10d
	cmpl	(%r9), %r10d
	cmovle	%rdx, %rcx
	cmovle	%rax, %r8
.L1111:
	incq	%rax
	cmpq	%rax, %rdi
	jle	.L1126
.L1112:
	movq	(%rsi,%rax,8), %rdx
	movq	(%rdx), %rdx
	cmpq	$0, 24(%rdx)
	js	.L1111
	testq	%rcx, %rcx
	jne	.L1127
.L1118:
	movq	%rax, %r8
	incq	%rax
	movq	%rdx, %rcx
	cmpq	%rax, %rdi
	jg	.L1112
.L1126:
	testq	%rcx, %rcx
	je	.L1124
	leaq	(%rsi,%r8,8), %rax
.L1110:
	movq	%r11, 24(%rcx)
	incq	%r11
	addq	$8, (%rax)
	cmpq	$61, %r11
	jne	.L1114
.L1124:
	ret
	.p2align 4,,15
.L1125:
	cmpq	$1, %rdi
	jle	.L1128
	xorl	%ecx, %ecx
	jmp	.L1109
.L1116:
	movq	%rsi, %rax
	xorl	%r8d, %r8d
	jmp	.L1110
.L1128:
	ret
	.cfi_endproc
.LFE63:
	.size	markBaskets, .-markBaskets
	.p2align 4,,15
	.globl	worker
	.type	worker, @function
worker:
.LFB64:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r9d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$32600, %rsp
	.cfi_def_cfa_offset 32656
	movq	576(%rdi), %rax
	movq	568(%rdi), %rbx
	movq	%rdi, 72(%rsp)
	movl	%esi, 92(%rsp)
	movq	%rax, 32(%rsp)
	movslq	%esi, %rax
	movq	%rbx, 24(%rsp)
	movq	%rax, 80(%rsp)
	leaq	0(,%rax,8), %rbx
	movq	basket_sizes(%rip), %rax
	movq	$0, (%rax,%rbx)
	movl	$4000, %eax
	cltd
	idivl	%r9d
	leal	261(%rax), %ecx
	leal	61(%rax), %edi
	imull	%esi, %ecx
	incl	%ecx
	cmpl	$1, %edi
	jle	.L1135
	movslq	%edi, %rdi
	movslq	%ecx, %rcx
	movq	basket(%rip), %rsi
	decq	%rdi
	cmpl	$-59, %eax
	je	.L1166
	movq	%rdi, %r8
	leaq	1(%rcx), %rax
	vmovq	%rcx, %xmm5
	vmovq	%rsi, %xmm6
	shrq	%r8
	vpinsrq	$1, %rax, %xmm5, %xmm0
	vpunpcklqdq	%xmm6, %xmm6, %xmm2
	cmpq	$4, %r8
	jbe	.L1167
	leaq	-5(%r8), %r10
	xorl	%r11d, %r11d
	leaq	104(%rsp), %rax
	vmovaps	.LC21(%rip), %xmm3
	andq	$-4, %r10
	vmovaps	.LC22(%rip), %xmm7
	vmovaps	.LC23(%rip), %xmm6
	leaq	4(%r10), %rdx
	vmovaps	.LC24(%rip), %xmm5
	jmp	.L1134
	.p2align 4,,15
.L1168:
	movq	%rbp, %r11
.L1134:
	vpsllq	$5, %xmm0, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm1
	vpaddq	%xmm6, %xmm0, %xmm4
	prefetchw	400(%rax)
	vmovups	%xmm1, (%rax)
	vpaddq	%xmm3, %xmm0, %xmm1
	vpsllq	$5, %xmm4, %xmm4
	vpaddq	%xmm2, %xmm4, %xmm4
	vpsllq	$5, %xmm1, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm1
	vmovups	%xmm4, 32(%rax)
	leaq	4(%r11), %rbp
	vmovups	%xmm1, 16(%rax)
	vpaddq	%xmm7, %xmm0, %xmm1
	addq	$64, %rax
	vpaddq	%xmm5, %xmm0, %xmm0
	vpsllq	$5, %xmm1, %xmm1
	vpaddq	%xmm2, %xmm1, %xmm1
	vmovups	%xmm1, -16(%rax)
	cmpq	%r10, %r11
	jne	.L1168
	.p2align 4,,15
.L1136:
	vpsllq	$5, %xmm0, %xmm1
	incq	%rdx
	vpaddq	%xmm2, %xmm1, %xmm1
	addq	$16, %rax
	vmovups	%xmm1, -16(%rax)
	vpaddq	%xmm3, %xmm0, %xmm0
	cmpq	%rdx, %r8
	ja	.L1136
	movq	%rdi, %rdx
	andq	$-2, %rdx
	leaq	1(%rdx), %rax
	addq	%rdx, %rcx
	cmpq	%rdi, %rdx
	je	.L1135
.L1132:
	salq	$5, %rcx
	addq	%rsi, %rcx
	movq	%rcx, 96(%rsp,%rax,8)
.L1135:
	movslq	%r9d, %rbp
	movq	opt(%rip), %rsi
	leaq	0(%rbp,%rbp,8), %rax
	movq	24(%rsp), %r15
	salq	$3, %rax
	movq	%rax, 64(%rsp)
	leaq	-1(%rbp), %rax
	movq	%rax, 48(%rsp)
	movq	%rbp, %rax
	shrq	%rax
	movq	%rax, (%rsp)
	subq	$5, %rax
	andq	$-4, %rax
	addq	$8, %rax
	movq	%rax, 56(%rsp)
	movq	%rbp, %rax
	andq	$-2, %rax
	movq	%rax, 40(%rsp)
	.p2align 4,,15
.L1196:
	testq	%rsi, %rsi
	jne	.L1198
.L1202:
	movq	opt_basket(%rip), %rax
	movq	basket_sizes(%rip), %r8
	movq	%rax, 16(%rsp)
	movq	full_group_end_arc(%rip), %rax
	movq	%rax, 8(%rsp)
.L1164:
	movq	72(%rsp), %rax
	xorl	%ecx, %ecx
	movl	$1, %r10d
	movq	80(%rsp), %rdi
	addq	608(%rax), %rdi
	movq	640(%rax), %r11
	movq	%rdi, %rax
	leaq	(%r8,%rbx), %rdi
	cqto
	idivq	%rbp
	movq	16(%rsp), %rax
	leaq	(%rax,%rbx), %r12
	jmp	.L1138
	.p2align 4,,15
.L1140:
	je	.L1139
	cmpw	$2, 32(%rsi)
	je	.L1141
.L1139:
	incq	%r10
	cmpq	$61, %r10
	je	.L1142
.L1138:
	cmpq	%r10, (%rdi)
	jl	.L1142
	movq	96(%rsp,%r10,8), %rax
	cmpq	$0, 24(%rax)
	jle	.L1139
	movq	(%rax), %rsi
	movq	16(%rsi), %r9
	movq	8(%rsi), %rax
	subq	(%r9), %rax
	movq	24(%rsi), %r9
	addq	(%r9), %rax
	jns	.L1140
	cmpw	$1, 32(%rsi)
	jne	.L1139
.L1141:
	incq	%rcx
	incq	%r10
	leaq	96(%rsp,%rcx,8), %r9
	movq	(%r9), %r13
	movq	%rsi, 0(%r13)
	movq	(%r9), %rsi
	movq	%rax, %r13
	sarq	$63, %r13
	movq	%rax, 8(%rsi)
	movq	(%r9), %rsi
	xorq	%r13, %rax
	movq	%rax, 16(%rsi)
	subq	%r13, 16(%rsi)
	movq	(%r9), %rax
	movq	$0, 24(%rax)
	cmpq	$61, %r10
	jne	.L1138
	.p2align 4,,15
.L1142:
	leaq	(%r11,%r11,8), %r9
	leaq	(%rdx,%rdx,8), %r10
	movq	%rcx, (%rdi)
	movq	%r15, %rax
	salq	$3, %r9
	salq	$3, %r10
	leaq	-72(%r9), %r11
.L1145:
	.p2align 4,,15
.L1144:
	cmpq	%rax, 8(%rsp)
	leaq	(%rax,%r11), %rdx
	leaq	(%rax,%r9), %r13
	leaq	(%rax,%r10), %rsi
	movq	%rdx, %rax
	cmova	%r13, %rax
	cmpq	%rax, %rsi
	jb	.L1152
	jmp	.L1148
	.p2align 4,,15
.L1150:
	jle	.L1149
	cmpw	$2, %r13w
	je	.L1151
	.p2align 4,,15
.L1149:
	addq	64(%rsp), %rsi
	cmpq	%rax, %rsi
	jnb	.L1148
.L1152:
	movzwl	32(%rsi), %r13d
	testw	%r13w, %r13w
	jle	.L1149
	movq	16(%rsi), %r14
	movq	8(%rsi), %rdx
	subq	(%r14), %rdx
	movq	24(%rsi), %r14
	addq	(%r14), %rdx
	testq	%rdx, %rdx
	jns	.L1150
	cmpw	$1, %r13w
	jne	.L1149
.L1151:
	incq	%rcx
	movq	%rdx, %r13
	movq	%rcx, (%rdi)
	movq	96(%rsp,%rcx,8), %rcx
	sarq	$63, %r13
	movq	%rsi, (%rcx)
	movq	(%rdi), %rcx
	addq	64(%rsp), %rsi
	movq	96(%rsp,%rcx,8), %rcx
	movq	%rdx, 8(%rcx)
	movq	(%rdi), %rcx
	xorq	%r13, %rdx
	movq	96(%rsp,%rcx,8), %rcx
	movq	%rdx, 16(%rcx)
	subq	%r13, 16(%rcx)
	movq	(%rdi), %rdx
	movq	96(%rsp,%rdx,8), %rdx
	movq	$0, 24(%rdx)
	movq	(%rdi), %rcx
	cmpq	%rax, %rsi
	jb	.L1152
	.p2align 4,,15
.L1148:
	cmpq	%rax, 32(%rsp)
	cmovbe	24(%rsp), %rax
	cmpq	%r15, %rax
	je	.L1154
	testq	%rbp, %rbp
	jle	.L1144
	cmpq	$2, 48(%rsp)
	jbe	.L1169
	cmpq	$4, (%rsp)
	movq	%r8, %rdx
	jbe	.L1170
	movl	$4, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	jmp	.L1157
	.p2align 4,,15
.L1171:
	movq	%r13, %rsi
.L1157:
	vpaddq	(%rdx), %xmm0, %xmm0
	prefetcht0	544(%rdx)
	leaq	4(%rsi), %r13
	addq	$64, %rdx
	vpaddq	-48(%rdx), %xmm0, %xmm0
	vpaddq	-32(%rdx), %xmm0, %xmm0
	vpaddq	-16(%rdx), %xmm0, %xmm0
	cmpq	56(%rsp), %r13
	jne	.L1171
	.p2align 4,,15
.L1158:
	vpaddq	(%rdx), %xmm0, %xmm0
	incq	%rsi
	addq	$16, %rdx
	cmpq	(%rsp), %rsi
	jb	.L1158
	movq	40(%rsp), %rsi
	vpsrldq	$8, %xmm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rdx
	cmpq	%rsi, %rbp
	je	.L1159
.L1155:
	leaq	0(,%rsi,8), %r13
	leaq	1(%rsi), %r14
	addq	(%r8,%r13), %rdx
	cmpq	%rbp, %r14
	jge	.L1159
	addq	$2, %rsi
	addq	8(%r8,%r13), %rdx
	cmpq	%rsi, %rbp
	jle	.L1159
	addq	16(%r8,%r13), %rdx
.L1159:
	cmpq	$59, %rdx
	jle	.L1144
	movq	%rax, %r15
.L1154:
	movq	104(%rsp,%rcx,8), %rax
	movq	$-1, 24(%rax)
	movq	(%rdi), %rsi
	testq	%rsi, %rsi
	je	.L1160
	leaq	104(%rsp), %r13
	movl	$cost_compare, %edx
	movq	%r13, %rdi
	call	spec_qsort.constprop.11
	movq	104(%rsp), %rax
	cmpl	$1, 92(%rsp)
	movq	opt(%rip), %rsi
	movq	%rax, (%r12)
	movq	perm_p(%rip), %rax
	movq	%r13, (%rax,%rbx)
	jne	.L1196
.L1161:
	movq	%rbp, %rdi
	movq	%rsi, 8(%rsp)
	call	markBaskets
	movq	8(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L1202
.L1198:
	addq	$32600, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L1169:
	.cfi_restore_state
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.L1155
	.p2align 4,,15
.L1170:
	xorl	%esi, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	jmp	.L1158
	.p2align 4,,15
.L1160:
	cmpl	$1, 92(%rsp)
	movq	perm_p(%rip), %rax
	leaq	104(%rsp), %rdx
	movq	$0, (%r12)
	movq	%rdx, (%rax,%rbx)
	jne	.L1164
	jmp	.L1161
.L1166:
	movl	$1, %eax
	jmp	.L1132
.L1167:
	xorl	%edx, %edx
	leaq	104(%rsp), %rax
	vmovaps	.LC21(%rip), %xmm3
	jmp	.L1136
	.cfi_endproc
.LFE64:
	.size	worker, .-worker
	.p2align 4,,15
	.globl	master
	.type	master, @function
master:
.LFB65:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$32584, %rsp
	.cfi_def_cfa_offset 32640
	movq	568(%rdi), %rax
	movq	576(%rdi), %rbx
	movq	%rax, 72(%rsp)
	movq	%rax, (%rsp)
	movq	basket_sizes(%rip), %rax
	movq	%rbx, 8(%rsp)
	movq	$0, (%rax)
	movl	$4000, %eax
	cltd
	idivl	%esi
	leal	61(%rax), %ecx
	cmpl	$1, %ecx
	jle	.L1210
	movslq	%ecx, %rcx
	movq	basket(%rip), %rdx
	leaq	-1(%rcx), %r8
	cmpl	$-59, %eax
	je	.L1231
	movq	%r8, %r9
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm5, %xmm5, %xmm2
	shrq	%r9
	cmpq	$4, %r9
	jbe	.L1232
	leaq	-5(%r9), %r10
	xorl	%r11d, %r11d
	leaq	88(%rsp), %rax
	vmovaps	.LC20(%rip), %xmm1
	andq	$-4, %r10
	vmovaps	.LC21(%rip), %xmm3
	vmovaps	.LC22(%rip), %xmm7
	leaq	4(%r10), %rcx
	vmovaps	.LC23(%rip), %xmm6
	vmovaps	.LC24(%rip), %xmm5
	jmp	.L1209
.L1233:
	movq	%rbx, %r11
.L1209:
	vpsllq	$5, %xmm1, %xmm0
	vpaddq	%xmm2, %xmm0, %xmm0
	vpaddq	%xmm6, %xmm1, %xmm4
	prefetchw	400(%rax)
	vmovups	%xmm0, (%rax)
	vpaddq	%xmm3, %xmm1, %xmm0
	vpsllq	$5, %xmm4, %xmm4
	vpaddq	%xmm2, %xmm4, %xmm4
	vpsllq	$5, %xmm0, %xmm0
	vpaddq	%xmm2, %xmm0, %xmm0
	vmovups	%xmm4, 32(%rax)
	leaq	4(%r11), %rbx
	vmovups	%xmm0, 16(%rax)
	vpaddq	%xmm7, %xmm1, %xmm0
	addq	$64, %rax
	vpaddq	%xmm5, %xmm1, %xmm1
	vpsllq	$5, %xmm0, %xmm0
	vpaddq	%xmm2, %xmm0, %xmm0
	vmovups	%xmm0, -16(%rax)
	cmpq	%r10, %r11
	jne	.L1233
	.p2align 4,,15
.L1211:
	vpsllq	$5, %xmm1, %xmm0
	incq	%rcx
	vpaddq	%xmm2, %xmm0, %xmm0
	addq	$16, %rax
	vmovups	%xmm0, -16(%rax)
	vpaddq	%xmm3, %xmm1, %xmm1
	cmpq	%r9, %rcx
	jb	.L1211
	movq	%r8, %rax
	andq	$-2, %rax
	leaq	1(%rax), %rcx
	cmpq	%rax, %r8
	je	.L1210
.L1207:
	movq	%rcx, %rax
	salq	$5, %rax
	addq	%rdx, %rax
	movq	%rax, 80(%rsp,%rcx,8)
.L1210:
	cmpq	$0, opt(%rip)
	movslq	%esi, %rbx
	jne	.L1260
	leaq	0(,%rbx,8), %rax
	movl	%esi, 28(%rsp)
	movq	%rdi, %rbp
	leaq	88(%rsp), %r15
	movq	%rax, 16(%rsp)
.L1229:
	subq	$8, %rsp
	.cfi_def_cfa_offset 32648
	pushq	640(%rbp)
	.cfi_def_cfa_offset 32656
	xorl	%r8d, %r8d
	pushq	%rbx
	.cfi_def_cfa_offset 32664
	movq	608(%rbp), %rax
	movq	opt_basket(%rip), %r12
	cqto
	idivq	%rbx
	pushq	%rdx
	.cfi_def_cfa_offset 32672
	movq	basket_sizes(%rip), %rdx
	movq	40(%rsp), %rsi
	movq	32(%rsp), %rdi
	leaq	104(%rsp), %r9
	leaq	112(%rsp), %rcx
	call	primal_bea_mpp.constprop.5
	addq	$32, %rsp
	.cfi_def_cfa_offset 32640
	movq	%rax, (%r12)
	movq	perm_p(%rip), %rax
	movq	%r15, (%rax)
	testq	%rbx, %rbx
	jle	.L1213
	movq	opt_basket(%rip), %rax
	xorl	%ecx, %ecx
	movq	16(%rsp), %rsi
	addq	%rax, %rsi
	jmp	.L1217
	.p2align 4,,15
.L1214:
	testq	%rdx, %rdx
	je	.L1215
	movq	16(%rcx), %rdi
	cmpq	%rdi, 16(%rdx)
	jl	.L1215
	jg	.L1235
	movq	(%rcx), %rdi
	movq	(%rdx), %r8
	movl	(%rdi), %edi
	cmpl	%edi, (%r8)
	cmovle	%rdx, %rcx
.L1215:
	addq	$8, %rax
	cmpq	%rax, %rsi
	je	.L1263
.L1217:
	movq	(%rax), %rdx
	testq	%rcx, %rcx
	jne	.L1214
.L1230:
	testq	%rdx, %rdx
	je	.L1264
.L1235:
	addq	$8, %rax
	movq	%rdx, %rcx
	cmpq	%rax, %rsi
	jne	.L1217
.L1263:
	cmpl	$1, 28(%rsp)
	movq	8(%rcx), %r9
	movq	(%rcx), %r14
	je	.L1265
.L1218:
	testq	%r9, %r9
	je	.L1213
	incq	608(%rbp)
	movq	16(%r14), %r12
	movq	24(%r14), %r13
	testq	%r9, %r9
	jle	.L1219
	movq	%r12, %rax
	movq	%r13, %r12
	movq	%rax, %r13
.L1219:
	leaq	64(%rsp), %r8
	movq	%r13, %rcx
	movq	%r12, %rdx
	leaq	56(%rsp), %rsi
	leaq	48(%rsp), %rdi
	movq	%r9, 32(%rsp)
	movq	$1, 48(%rsp)
	call	primal_iminus
	movq	32(%rsp), %r9
	testq	%rax, %rax
	je	.L1266
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L1226
	movq	%r12, %rdx
	movq	%r13, %r12
	movq	%rdx, %r13
.L1226:
	movslq	8(%rax), %rdx
	xorl	%r11d, %r11d
	movq	48(%rax), %rsi
	movl	$1, %ecx
	movq	24(%rax), %r8
	cmpq	%rdx, %rdi
	movq	48(%rsp), %rdx
	movq	%rsi, 32(%rsp)
	sete	%r11b
	incl	%r11d
	movl	%r11d, 44(%rsp)
	movl	%r11d, 40(%rsp)
	subq	%rdx, %rcx
	testq	%r9, %r9
	cmovle	%rdx, %rcx
	xorl	%esi, %esi
	cmpq	%r12, 16(%r14)
	pushq	512(%rbp)
	.cfi_def_cfa_offset 32648
	pushq	%r9
	.cfi_def_cfa_offset 32656
	movq	%r13, %r9
	pushq	%r14
	.cfi_def_cfa_offset 32664
	pushq	88(%rsp)
	.cfi_def_cfa_offset 32672
	pushq	%r8
	.cfi_def_cfa_offset 32680
	movq	%r12, %r8
	pushq	%rax
	.cfi_def_cfa_offset 32688
	sete	%sil
	testq	%rdi, %rdi
	sete	%dil
	movzbl	%dil, %edi
	call	update_tree
	movq	80(%rsp), %rax
	movw	$0, 32(%r14)
	movl	92(%rsp), %r11d
	addq	$48, %rsp
	.cfi_def_cfa_offset 32640
	movw	%r11w, 32(%rax)
	movq	opt(%rip), %rax
.L1222:
	testq	%rax, %rax
	je	.L1229
.L1260:
	addq	$32584, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L1264:
	.cfi_restore_state
	addq	$8, %rax
	cmpq	%rax, %rsi
	je	.L1213
	movq	(%rax), %rdx
	jmp	.L1230
	.p2align 4,,15
.L1213:
	movq	$1, opt(%rip)
	jmp	.L1260
	.p2align 4,,15
.L1265:
	movq	%r9, 32(%rsp)
	call	markBaskets.constprop.6
	movq	32(%rsp), %r9
	jmp	.L1218
	.p2align 4,,15
.L1266:
	incq	616(%rbp)
	xorl	%eax, %eax
	cmpw	$2, 32(%r14)
	setne	%al
	incl	%eax
	cmpq	$0, 48(%rsp)
	movw	%ax, 32(%r14)
	movq	opt(%rip), %rax
	je	.L1222
	movq	64(%rsp), %rdx
	cmpq	%r12, %rdx
	je	.L1262
	.p2align 4,,15
.L1223:
	movl	8(%r12), %edi
	xorl	%ecx, %ecx
	testl	%edi, %edi
	sete	%cl
	movq	%rcx, 80(%r12)
	movq	24(%r12), %r12
	cmpq	%r12, %rdx
	jne	.L1223
	cmpq	%r13, %rdx
	je	.L1222
	.p2align 4,,15
.L1224:
	movl	8(%r13), %esi
	xorl	%ecx, %ecx
	testl	%esi, %esi
	setne	%cl
	movq	%rcx, 80(%r13)
	movq	24(%r13), %r13
.L1262:
	cmpq	%r13, %rdx
	jne	.L1224
	jmp	.L1222
.L1231:
	movl	$1, %ecx
	jmp	.L1207
.L1232:
	xorl	%ecx, %ecx
	leaq	88(%rsp), %rax
	vmovaps	.LC20(%rip), %xmm1
	vmovaps	.LC21(%rip), %xmm3
	jmp	.L1211
	.cfi_endproc
.LFE65:
	.size	master, .-master
	.p2align 4,,15
	.globl	primal_net_simplex
	.type	primal_net_simplex, @function
primal_net_simplex:
.LFB66:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$8, %esi
	movq	%rdi, %rbx
	movl	$1, %edi
	call	calloc
	movl	$8, %esi
	movl	$1, %edi
	movq	%rax, perm_p(%rip)
	call	calloc
	movl	$8, %esi
	movl	$1, %edi
	movq	%rax, opt_basket(%rip)
	call	calloc
	movl	$32, %esi
	movl	$4261, %edi
	movq	%rax, basket_sizes(%rip)
	call	calloc
	movq	%rbx, %rdi
	movq	%rax, basket(%rip)
	movq	632(%rbx), %rax
	imulq	640(%rbx), %rax
	leaq	(%rax,%rax,8), %rdx
	movq	568(%rbx), %rax
	leaq	(%rax,%rdx,8), %rax
	movq	%rax, full_group_end_arc(%rip)
	call	master.constprop.4
	movq	%rbx, %rdi
	call	primal_feasible
	movq	%rbx, %rdi
	call	dual_feasible
	movq	perm_p(%rip), %rdi
	movq	$0, opt(%rip)
	call	free
	movq	opt_basket(%rip), %rdi
	call	free
	movq	basket_sizes(%rip), %rdi
	call	free
	movq	basket(%rip), %rdi
	call	free
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	primal_net_simplex, .-primal_net_simplex
	.p2align 4,,15
	.globl	set_static_vars
	.type	set_static_vars, @function
set_static_vars:
.LFB67:
	.cfi_startproc
	movq	632(%rdi), %rax
	imulq	640(%rdi), %rax
	leaq	(%rax,%rax,8), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, full_group_end_arc(%rip)
	ret
	.cfi_endproc
.LFE67:
	.size	set_static_vars, .-set_static_vars
	.p2align 4,,15
	.globl	bea_is_dual_infeasible
	.type	bea_is_dual_infeasible, @function
bea_is_dual_infeasible:
.LFB68:
	.cfi_startproc
	testq	%rsi, %rsi
	js	.L1275
	je	.L1273
	xorl	%eax, %eax
	cmpw	$2, 32(%rdi)
	sete	%al
	ret
	.p2align 4,,15
.L1275:
	xorl	%eax, %eax
	cmpw	$1, 32(%rdi)
	sete	%al
	ret
	.p2align 4,,15
.L1273:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE68:
	.size	bea_is_dual_infeasible, .-bea_is_dual_infeasible
	.p2align 4,,15
	.globl	primal_bea_mpp
	.type	primal_bea_mpp, @function
primal_bea_mpp:
.LFB70:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%r9d, %r9
	xorl	%r11d, %r11d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	(%rcx,%r9,8), %r9
	movl	$1, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rsi, 48(%rsp)
	movq	%rdx, 16(%rsp)
	movq	128(%rsp), %rbp
	movq	136(%rsp), %rdi
	movq	144(%rsp), %rbx
	movq	152(%rsp), %rsi
	jmp	.L1277
	.p2align 4,,15
.L1279:
	je	.L1278
	cmpw	$2, 32(%r12)
	je	.L1280
.L1278:
	incq	%rax
	cmpq	$61, %rax
	je	.L1281
.L1277:
	cmpq	%rax, (%r9)
	jl	.L1281
	movq	(%r8,%rax,8), %rdx
	cmpq	$0, 24(%rdx)
	jle	.L1278
	movq	(%rdx), %r12
	movq	16(%r12), %r10
	movq	8(%r12), %rdx
	subq	(%r10), %rdx
	movq	24(%r12), %r10
	addq	(%r10), %rdx
	jns	.L1279
	cmpw	$1, 32(%r12)
	jne	.L1278
.L1280:
	incq	%r11
	incq	%rax
	leaq	(%r8,%r11,8), %r10
	movq	(%r10), %r13
	movq	%r12, 0(%r13)
	movq	(%r10), %r12
	movq	%rdx, %r13
	sarq	$63, %r13
	movq	%rdx, 8(%r12)
	movq	(%r10), %r12
	xorq	%r13, %rdx
	movq	%rdx, 16(%r12)
	subq	%r13, 16(%r12)
	movq	(%r10), %rdx
	movq	$0, 24(%rdx)
	cmpq	$61, %rax
	jne	.L1277
	.p2align 4,,15
.L1281:
	leaq	(%rdi,%rdi,8), %rax
	movq	%r11, (%r9)
	movq	%rbx, %r11
	movq	0(%rbp), %rdx
	salq	$3, %rax
	shrq	%r11
	leaq	(%rsi,%rsi,8), %r12
	leaq	(%rbx,%rbx,8), %r10
	movq	%rax, 24(%rsp)
	movq	full_group_end_arc(%rip), %rax
	salq	$3, %r12
	movq	%rbx, %r13
	leaq	-72(%r12), %r14
	salq	$3, %r10
	andq	$-2, %r13
	movq	%rdx, 8(%rsp)
	movq	%rdx, %rdi
	movq	%rax, (%rsp)
	leaq	-1(%rbx), %rax
	movq	%rax, 32(%rsp)
	leaq	-5(%r11), %rax
	andq	$-4, %rax
	movq	%rax, 40(%rsp)
	addq	$4, %rax
	movq	%rax, 56(%rsp)
.L1284:
	.p2align 4,,15
.L1283:
	movq	24(%rsp), %rax
	leaq	(%rdi,%r14), %rdx
	leaq	(%rdi,%r12), %rsi
	addq	%rdi, %rax
	cmpq	%rdi, (%rsp)
	movq	%rdx, %rdi
	cmova	%rsi, %rdi
	movq	%rdi, 0(%rbp)
	cmpq	%rax, %rdi
	ja	.L1286
	jmp	.L1287
	.p2align 4,,15
.L1290:
	jle	.L1289
	cmpw	$2, %si
	je	.L1291
	.p2align 4,,15
.L1289:
	addq	%r10, %rax
	cmpq	%rdi, %rax
	jnb	.L1287
.L1286:
	movzwl	32(%rax), %esi
	testw	%si, %si
	jle	.L1289
	movq	16(%rax), %r15
	movq	8(%rax), %rdx
	subq	(%r15), %rdx
	movq	24(%rax), %r15
	addq	(%r15), %rdx
	testq	%rdx, %rdx
	jns	.L1290
	cmpw	$1, %si
	jne	.L1289
.L1291:
	movq	(%r9), %rdi
	leaq	1(%rdi), %rsi
	movq	%rdx, %rdi
	movq	%rsi, (%r9)
	movq	(%r8,%rsi,8), %rsi
	sarq	$63, %rdi
	movq	%rax, (%rsi)
	movq	(%r9), %rsi
	addq	%r10, %rax
	movq	(%r8,%rsi,8), %rsi
	movq	%rdx, 8(%rsi)
	movq	(%r9), %rsi
	xorq	%rdi, %rdx
	movq	(%r8,%rsi,8), %rsi
	movq	%rdx, 16(%rsi)
	subq	%rdi, 16(%rsi)
	movq	(%r9), %rdx
	movq	(%r8,%rdx,8), %rdx
	movq	$0, 24(%rdx)
	movq	0(%rbp), %rdi
	cmpq	%rdi, %rax
	jb	.L1286
	.p2align 4,,15
.L1287:
	cmpq	16(%rsp), %rdi
	jb	.L1292
	movq	48(%rsp), %rax
	movq	%rax, 0(%rbp)
	movq	%rax, %rdi
.L1292:
	cmpq	%rdi, 8(%rsp)
	je	.L1293
	testq	%rbx, %rbx
	jle	.L1283
	cmpq	$2, 32(%rsp)
	jbe	.L1300
	movq	%rcx, %rax
	xorl	%edx, %edx
	vxorps	%xmm0, %xmm0, %xmm0
	cmpq	$4, %r11
	ja	.L1296
	jmp	.L1297
	.p2align 4,,15
.L1302:
	movq	%rsi, %rdx
.L1296:
	vpaddq	(%rax), %xmm0, %xmm0
	prefetcht0	544(%rax)
	leaq	4(%rdx), %rsi
	addq	$64, %rax
	vpaddq	-48(%rax), %xmm0, %xmm0
	vpaddq	-32(%rax), %xmm0, %xmm0
	vpaddq	-16(%rax), %xmm0, %xmm0
	cmpq	40(%rsp), %rdx
	jne	.L1302
	movq	56(%rsp), %rdx
	.p2align 4,,15
.L1297:
	incq	%rdx
	vpaddq	(%rax), %xmm0, %xmm0
	addq	$16, %rax
	cmpq	%rdx, %r11
	ja	.L1297
	vpsrldq	$8, %xmm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	movq	%r13, %rdx
	vmovq	%xmm0, %rax
	cmpq	%r13, %rbx
	je	.L1298
.L1294:
	leaq	0(,%rdx,8), %rsi
	leaq	1(%rdx), %r15
	addq	(%rcx,%rsi), %rax
	cmpq	%r15, %rbx
	jle	.L1298
	addq	$2, %rdx
	addq	8(%rcx,%rsi), %rax
	cmpq	%rdx, %rbx
	jle	.L1298
	addq	16(%rcx,%rsi), %rax
.L1298:
	cmpq	$59, %rax
	jle	.L1283
.L1293:
	movq	(%r9), %rax
	movq	8(%r8,%rax,8), %rax
	movq	$-1, 24(%rax)
	movq	(%r9), %rsi
	xorl	%eax, %eax
	testq	%rsi, %rsi
	je	.L1323
	movq	%r8, %rbx
	leaq	8(%r8), %rdi
	movl	$cost_compare, %edx
	call	spec_qsort.constprop.11
	movq	8(%rbx), %rax
.L1323:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1300:
	.cfi_restore_state
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L1294
	.cfi_endproc
.LFE70:
	.size	primal_bea_mpp, .-primal_bea_mpp
	.p2align 4,,15
	.globl	spec_qsort
	.type	spec_qsort, @function
spec_qsort:
.LFB73:
	.cfi_startproc
.L1326:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$1, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	movslq	%edx, %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r13
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	testl	%edx, %edx
	movq	%rdx, 16(%rsp)
	movl	%edx, 116(%rsp)
	movq	%rcx, %rdx
	movq	%rcx, 200(%rsp)
	cmovle	%rax, %rcx
	movq	%rsi, 64(%rsp)
	movq	%rcx, %rdi
	movq	%rcx, 128(%rsp)
	movl	$2, (%rsp)
	andq	$-16, %rdi
	movq	%rdi, %rcx
	movq	%rdi, 144(%rsp)
	movq	%rdi, 136(%rsp)
	movq	%rdx, %rdi
	subq	%rcx, %rdi
	movq	%rdx, %rcx
	movq	%rdi, 32(%rsp)
	movq	%rdx, %rdi
	shrq	$2, %rdi
	movq	%rdi, %rdx
	movq	%rdi, 120(%rsp)
	cmove	%rax, %rdx
	movq	%rdx, %rbx
	movq	%rdx, 168(%rsp)
	shrq	$2, %rdx
	salq	$4, %rdx
	andq	$-4, %rbx
	movq	%rdx, 160(%rsp)
	movq	%rdi, %rdx
	movq	%rbx, 176(%rsp)
	subq	%rbx, %rdx
	shrq	$3, %rcx
	cmovne	%rcx, %rax
	movq	%rcx, 48(%rsp)
	movq	%rdx, 192(%rsp)
	leaq	0(,%rbx,4), %rdx
	movq	%rax, %rcx
	movq	%rax, 80(%rsp)
	shrq	%rax
	movq	%rdx, 184(%rsp)
	salq	$4, %rax
	andq	$-2, %rcx
	movq	%rax, 104(%rsp)
	leaq	0(,%rcx,8), %rax
	movq	%rcx, 88(%rsp)
	movq	%rax, 96(%rsp)
	movq	16(%rsp), %rax
	orq	%r13, %rax
	testb	$7, %al
	je	.L2105
.L1327:
	movl	$2, 112(%rsp)
	testb	$3, %al
	je	.L2106
.L1328:
	cmpq	$6, 64(%rsp)
	jbe	.L2107
.L1329:
	movq	64(%rsp), %rax
	movq	16(%rsp), %rdi
	movq	%rax, %rdx
	leaq	-1(%rax), %rcx
	shrq	%rdx
	imulq	%rdi, %rcx
	imulq	%rdi, %rdx
	leaq	0(%r13,%rcx), %r15
	leaq	0(%r13,%rdx), %r14
	cmpq	$7, %rax
	je	.L1355
	movq	%r15, %rbx
	movq	%r13, %rbp
	cmpq	$40, %rax
	ja	.L2108
.L1356:
	movq	%r14, %rsi
	movq	%rbp, %rdi
	call	*%r12
	movq	%rbx, %rsi
	movq	%r14, %rdi
	testl	%eax, %eax
	js	.L2109
	call	*%r12
	testl	%eax, %eax
	jg	.L1355
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	*%r12
	testl	%eax, %eax
	cmovs	%rbp, %rbx
	movq	%rbx, %r14
	.p2align 4,,15
.L1355:
	movl	(%rsp), %ebp
	testl	%ebp, %ebp
	jne	.L1363
	movq	0(%r13), %rax
	movq	(%r14), %rsi
	movq	%rsi, 0(%r13)
	movq	%rax, (%r14)
.L1364:
	movq	16(%rsp), %rax
	addq	%r13, %rax
	movq	%rax, 72(%rsp)
	cmpq	%rax, %r15
	jb	.L1383
	movq	%rax, %rbx
	movq	%rax, 56(%rsp)
	movq	32(%rsp), %rax
	movq	%r15, %r14
	movl	$0, 8(%rsp)
	decq	%rax
	movq	%rax, 152(%rsp)
	.p2align 4,,15
.L1384:
	movq	%rbx, 24(%rsp)
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	*%r12
	testl	%eax, %eax
	jle	.L1408
	cmpq	%r14, %rbx
	ja	.L2097
	movq	32(%rsp), %rax
	movq	16(%rsp), %rbp
	subq	$2, %rax
	negq	%rbp
	movq	%rax, 40(%rsp)
	jmp	.L1409
	.p2align 4,,15
.L2111:
	movq	(%r14), %rax
	movq	(%r15), %rsi
	movq	%rsi, (%r14)
	movq	%rax, (%r15)
.L1412:
	addq	%rbp, %r15
	movl	$1, 8(%rsp)
.L1410:
	addq	%rbp, %r14
	cmpq	%r14, %rbx
	ja	.L2097
.L1409:
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	*%r12
	testl	%eax, %eax
	js	.L2110
	jne	.L1410
	movl	(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L2111
	movl	112(%rsp), %r8d
	testl	%r8d, %r8d
	jne	.L1413
	movl	(%r14), %eax
	movl	(%r15), %esi
	movl	%esi, (%r14)
	movl	%eax, (%r15)
	jmp	.L1412
	.p2align 4,,15
.L2110:
	movl	(%rsp), %edx
	testl	%edx, %edx
	jne	.L2112
	movq	(%rbx), %rax
	movq	(%r14), %rsi
	movq	%rsi, (%rbx)
	movq	%rax, (%r14)
.L1433:
	addq	%rbp, %r14
	movl	$1, 8(%rsp)
	addq	16(%rsp), %rbx
	movq	%rbx, 24(%rsp)
.L1452:
	cmpq	%r14, %rbx
	jbe	.L1384
.L2097:
	movq	64(%rsp), %rbp
	imulq	16(%rsp), %rbp
	movq	%r15, %rax
	movq	%r14, %r15
	movq	%rax, %r14
	movl	8(%rsp), %eax
	addq	%r13, %rbp
	testl	%eax, %eax
	je	.L2113
	movq	56(%rsp), %rcx
	movq	24(%rsp), %rax
	movq	%rbp, %rsi
	movq	%r14, %rbx
	subq	%rcx, %rax
	subq	%r13, %rcx
	cmpq	%rax, %rcx
	movq	%rcx, %rdx
	cmovg	%rax, %rdx
	subq	%r14, %rsi
	subq	16(%rsp), %rsi
	subq	%r15, %rbx
	cmpq	%rbx, %rsi
	cmovg	%rbx, %rsi
	testq	%rdx, %rdx
	jne	.L2114
	testq	%rsi, %rsi
	jne	.L1492
.L1499:
	cmpq	%rax, 16(%rsp)
	jb	.L2115
.L1494:
	movq	16(%rsp), %rcx
	cmpq	%rbx, %rcx
	jnb	.L2103
	movq	%rbx, %rax
	xorl	%edx, %edx
	subq	%rbx, %rbp
	movl	$2, (%rsp)
	divq	%rcx
	movq	%rbp, %r13
	movq	%rax, 64(%rsp)
	movq	%rcx, %rax
	orq	%r13, %rax
	testb	$7, %al
	jne	.L1327
.L2105:
	xorl	%ecx, %ecx
	cmpq	$8, 16(%rsp)
	movl	$2, 112(%rsp)
	setne	%cl
	movl	%ecx, (%rsp)
	testb	$3, %al
	jne	.L1328
.L2106:
	xorl	%eax, %eax
	cmpq	$4, 16(%rsp)
	setne	%al
	cmpq	$6, 64(%rsp)
	movl	%eax, 112(%rsp)
	ja	.L1329
.L2107:
	movq	16(%rsp), %rcx
	movq	64(%rsp), %rax
	leaq	0(%r13,%rcx), %rdx
	imulq	%rcx, %rax
	movq	32(%rsp), %rcx
	movq	%rdx, 8(%rsp)
	addq	%r13, %rax
	decq	%rcx
	movq	%rax, 40(%rsp)
	movq	%rcx, 56(%rsp)
	cmpq	%rax, %rdx
	jnb	.L2103
	movl	(%rsp), %r14d
	movq	%r13, (%rsp)
.L1330:
	movq	8(%rsp), %rax
	cmpq	%rax, (%rsp)
	jnb	.L1354
	movq	16(%rsp), %rcx
	movq	%rax, %r13
	movq	%rax, %r15
	movl	$16, %eax
	movq	%r13, %rbx
	movq	%rcx, %rbp
	subq	%rcx, %rax
	negq	%rbp
	movq	%rax, 24(%rsp)
	jmp	.L1352
	.p2align 4,,15
.L2116:
	movq	(%rbx), %rax
	movq	0(%r13), %rdx
	movq	%rdx, (%rbx)
	movq	%rax, 0(%r13)
.L1333:
	movq	%r13, %r15
	subq	16(%rsp), %rbx
	cmpq	(%rsp), %r13
	jbe	.L1354
.L1352:
	leaq	(%r15,%rbp), %r13
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	*%r12
	testl	%eax, %eax
	jle	.L1354
	testl	%r14d, %r14d
	je	.L2116
	movl	112(%rsp), %eax
	testl	%eax, %eax
	jne	.L1334
	movl	(%rbx), %eax
	movl	0(%r13), %edx
	movq	%r13, %r15
	movl	%edx, (%rbx)
	movl	%eax, 0(%r13)
	subq	16(%rsp), %rbx
	cmpq	(%rsp), %r13
	ja	.L1352
.L1354:
	movq	16(%rsp), %rdx
	addq	%rdx, 8(%rsp)
	movq	8(%rsp), %rax
	cmpq	40(%rsp), %rax
	jb	.L1330
.L2103:
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,15
.L1413:
	.cfi_restore_state
	leaq	16(%r14), %rax
	leaq	16(%r15), %rsi
	cmpq	%rax, %r15
	setnb	%al
	cmpq	%rsi, %r14
	setnb	%sil
	orl	%esi, %eax
	cmpl	$1, (%rsp)
	je	.L2117
	cmpl	$1, 112(%rsp)
	je	.L2118
	testb	$1, %al
	je	.L1543
	cmpl	$15, 116(%rsp)
	jle	.L1543
	movq	144(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1427:
	vmovups	(%r14,%rax), %xmm0
	vmovups	(%r15,%rax), %xmm2
	vmovups	%xmm2, (%r14,%rax)
	vmovups	%xmm0, (%r15,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1427
	movq	136(%rsp), %rcx
	leaq	(%r14,%rcx), %rsi
	leaq	(%r15,%rcx), %rax
	cmpq	%rcx, 128(%rsp)
	je	.L1412
	cmpq	$0, 152(%rsp)
	movzbl	(%rsi), %edi
	movzbl	(%rax), %r8d
	movb	%r8b, (%rsi)
	movb	%dil, (%rax)
	jle	.L1412
	cmpq	$0, 40(%rsp)
	movzbl	1(%rsi), %edi
	movzbl	1(%rax), %r8d
	movb	%r8b, 1(%rsi)
	movb	%dil, 1(%rax)
	je	.L1412
	movzbl	2(%rsi), %edi
	movzbl	2(%rax), %r8d
	movq	32(%rsp), %rcx
	movb	%r8b, 2(%rsi)
	movb	%dil, 2(%rax)
	cmpq	$3, %rcx
	je	.L1412
	movzbl	3(%rsi), %edi
	movzbl	3(%rax), %r8d
	movb	%r8b, 3(%rsi)
	movb	%dil, 3(%rax)
	cmpq	$4, %rcx
	je	.L1412
	movzbl	4(%rsi), %edi
	movzbl	4(%rax), %r8d
	movb	%r8b, 4(%rsi)
	movb	%dil, 4(%rax)
	cmpq	$5, %rcx
	je	.L1412
	movzbl	5(%rsi), %edi
	movzbl	5(%rax), %r8d
	movb	%r8b, 5(%rsi)
	movb	%dil, 5(%rax)
	cmpq	$6, %rcx
	je	.L1412
	movzbl	6(%rsi), %edi
	movzbl	6(%rax), %r8d
	movb	%r8b, 6(%rsi)
	movb	%dil, 6(%rax)
	cmpq	$7, %rcx
	je	.L1412
	movzbl	7(%rsi), %edi
	movzbl	7(%rax), %r8d
	movb	%r8b, 7(%rsi)
	movb	%dil, 7(%rax)
	cmpq	$8, %rcx
	je	.L1412
	movzbl	8(%rsi), %edi
	movzbl	8(%rax), %r8d
	movb	%r8b, 8(%rsi)
	movb	%dil, 8(%rax)
	cmpq	$9, %rcx
	je	.L1412
	movzbl	9(%rsi), %edi
	movzbl	9(%rax), %r8d
	movb	%r8b, 9(%rsi)
	movb	%dil, 9(%rax)
	cmpq	$10, %rcx
	je	.L1412
	movzbl	10(%rsi), %edi
	movzbl	10(%rax), %r8d
	movb	%r8b, 10(%rsi)
	movb	%dil, 10(%rax)
	cmpq	$11, %rcx
	je	.L1412
	movzbl	11(%rsi), %edi
	movzbl	11(%rax), %r8d
	movb	%r8b, 11(%rsi)
	movb	%dil, 11(%rax)
	cmpq	$12, %rcx
	je	.L1412
	movzbl	12(%rsi), %edi
	movzbl	12(%rax), %r8d
	movb	%r8b, 12(%rsi)
	movb	%dil, 12(%rax)
	cmpq	$13, %rcx
	je	.L1412
	movzbl	13(%rsi), %edi
	movzbl	13(%rax), %r8d
	movb	%r8b, 13(%rsi)
	movb	%dil, 13(%rax)
	cmpq	$14, %rcx
	je	.L1412
	movzbl	14(%rsi), %edi
	movzbl	14(%rax), %r8d
	movb	%r8b, 14(%rsi)
	movb	%dil, 14(%rax)
	jmp	.L1412
	.p2align 4,,15
.L2112:
	movl	112(%rsp), %edi
	testl	%edi, %edi
	jne	.L1434
	movl	(%rbx), %eax
	movl	(%r14), %esi
	movl	%esi, (%rbx)
	movl	%eax, (%r14)
	jmp	.L1433
	.p2align 4,,15
.L2117:
	testb	$1, %al
	je	.L1541
	movq	48(%rsp), %rax
	movabsq	$9223372036854775804, %rcx
	subq	$3, %rax
	cmpq	%rcx, %rax
	ja	.L1541
	movq	104(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1416:
	vmovups	(%r14,%rax), %xmm0
	vmovups	(%r15,%rax), %xmm1
	vmovups	%xmm1, (%r14,%rax)
	vmovups	%xmm0, (%r15,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1416
	movq	96(%rsp), %rax
	movq	88(%rsp), %rdx
	leaq	(%r14,%rax), %rsi
	addq	%r15, %rax
	cmpq	%rdx, 80(%rsp)
	je	.L1412
	movq	(%rsi), %rdi
	movq	(%rax), %r8
	movq	%r8, (%rsi)
	movq	%rdi, (%rax)
	jmp	.L1412
	.p2align 4,,15
.L1408:
	jne	.L1386
	movl	(%rsp), %r11d
	testl	%r11d, %r11d
	jne	.L1387
	movq	56(%rsp), %rcx
	movq	(%rbx), %rsi
	movq	(%rcx), %rax
	movq	%rsi, (%rcx)
	movq	%rax, (%rbx)
.L1388:
	movq	16(%rsp), %rdx
	movl	$1, 8(%rsp)
	addq	%rdx, 56(%rsp)
.L1386:
	addq	16(%rsp), %rbx
	movq	%rbx, 24(%rsp)
	jmp	.L1452
	.p2align 4,,15
.L2118:
	testb	$1, %al
	je	.L1542
	movq	120(%rsp), %rax
	movabsq	$9223372036854775803, %rcx
	subq	$4, %rax
	cmpq	%rcx, %rax
	ja	.L1542
	movq	160(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1421:
	vmovups	(%r14,%rax), %xmm0
	vmovups	(%r15,%rax), %xmm3
	vmovups	%xmm3, (%r14,%rax)
	vmovups	%xmm0, (%r15,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1421
	movq	184(%rsp), %rax
	movq	176(%rsp), %rcx
	leaq	(%r14,%rax), %rsi
	addq	%r15, %rax
	cmpq	%rcx, 168(%rsp)
	je	.L1412
	movl	(%rsi), %edi
	movl	(%rax), %r8d
	movq	192(%rsp), %rcx
	movl	%r8d, (%rsi)
	movl	%edi, (%rax)
	leaq	-1(%rcx), %rdi
	testq	%rdi, %rdi
	jle	.L1412
	movl	4(%rsi), %edi
	movl	4(%rax), %r8d
	movl	%r8d, 4(%rsi)
	movl	%edi, 4(%rax)
	cmpq	$2, %rcx
	je	.L1412
	movl	8(%rsi), %edi
	movl	8(%rax), %r8d
	movl	%r8d, 8(%rsi)
	movl	%edi, 8(%rax)
	jmp	.L1412
	.p2align 4,,15
.L1434:
	leaq	16(%rbx), %rax
	leaq	16(%r14), %rsi
	cmpq	%rax, %r14
	setnb	%al
	cmpq	%rsi, %rbx
	setnb	%sil
	orl	%esi, %eax
	cmpl	$1, (%rsp)
	je	.L2119
	cmpl	$1, 112(%rsp)
	je	.L2120
	testb	$1, %al
	je	.L1546
	cmpl	$15, 116(%rsp)
	jle	.L1546
	movq	144(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1448:
	vmovups	(%rbx,%rax), %xmm0
	vmovups	(%r14,%rax), %xmm5
	vmovups	%xmm5, (%rbx,%rax)
	vmovups	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1448
	movq	136(%rsp), %rcx
	leaq	(%rbx,%rcx), %rsi
	leaq	(%r14,%rcx), %rax
	cmpq	%rcx, 128(%rsp)
	je	.L1433
	cmpq	$0, 152(%rsp)
	movzbl	(%rsi), %edi
	movzbl	(%rax), %r8d
	movb	%r8b, (%rsi)
	movb	%dil, (%rax)
	jle	.L1433
	movzbl	1(%rsi), %edi
	movzbl	1(%rax), %r8d
	movq	32(%rsp), %rdx
	movb	%r8b, 1(%rsi)
	movb	%dil, 1(%rax)
	cmpq	$2, %rdx
	je	.L1433
	movzbl	2(%rsi), %edi
	movzbl	2(%rax), %r8d
	movb	%r8b, 2(%rsi)
	movb	%dil, 2(%rax)
	cmpq	$3, %rdx
	je	.L1433
	movzbl	3(%rsi), %edi
	movzbl	3(%rax), %r8d
	movb	%r8b, 3(%rsi)
	movb	%dil, 3(%rax)
	cmpq	$4, %rdx
	je	.L1433
	movzbl	4(%rsi), %edi
	movzbl	4(%rax), %r8d
	movb	%r8b, 4(%rsi)
	movb	%dil, 4(%rax)
	cmpq	$5, %rdx
	je	.L1433
	movzbl	5(%rsi), %edi
	movzbl	5(%rax), %r8d
	movb	%r8b, 5(%rsi)
	movb	%dil, 5(%rax)
	cmpq	$6, %rdx
	je	.L1433
	movzbl	6(%rsi), %edi
	movzbl	6(%rax), %r8d
	movb	%r8b, 6(%rsi)
	movb	%dil, 6(%rax)
	cmpq	$7, %rdx
	je	.L1433
	movzbl	7(%rsi), %edi
	movzbl	7(%rax), %r8d
	movb	%r8b, 7(%rsi)
	movb	%dil, 7(%rax)
	cmpq	$8, %rdx
	je	.L1433
	movzbl	8(%rsi), %edi
	movzbl	8(%rax), %r8d
	movb	%r8b, 8(%rsi)
	movb	%dil, 8(%rax)
	cmpq	$9, %rdx
	je	.L1433
	movzbl	9(%rsi), %edi
	movzbl	9(%rax), %r8d
	movb	%r8b, 9(%rsi)
	movb	%dil, 9(%rax)
	cmpq	$10, %rdx
	je	.L1433
	movzbl	10(%rsi), %edi
	movzbl	10(%rax), %r8d
	movb	%r8b, 10(%rsi)
	movb	%dil, 10(%rax)
	cmpq	$11, %rdx
	je	.L1433
	movzbl	11(%rsi), %edi
	movzbl	11(%rax), %r8d
	movb	%r8b, 11(%rsi)
	movb	%dil, 11(%rax)
	cmpq	$12, %rdx
	je	.L1433
	movzbl	12(%rsi), %edi
	movzbl	12(%rax), %r8d
	movb	%r8b, 12(%rsi)
	movb	%dil, 12(%rax)
	cmpq	$13, %rdx
	je	.L1433
	movzbl	13(%rsi), %edi
	movzbl	13(%rax), %r8d
	movb	%r8b, 13(%rsi)
	movb	%dil, 13(%rax)
	cmpq	$14, %rdx
	je	.L1433
	movzbl	14(%rsi), %edi
	movzbl	14(%rax), %r8d
	movb	%r8b, 14(%rsi)
	movb	%dil, 14(%rax)
	jmp	.L1433
.L1387:
	movl	112(%rsp), %r10d
	testl	%r10d, %r10d
	jne	.L1389
	movq	56(%rsp), %rdx
	movl	(%rbx), %esi
	movl	(%rdx), %eax
	movl	%esi, (%rdx)
	movl	%eax, (%rbx)
	jmp	.L1388
.L2119:
	testb	$1, %al
	je	.L1544
	movq	48(%rsp), %rax
	movabsq	$9223372036854775804, %rcx
	subq	$3, %rax
	cmpq	%rcx, %rax
	ja	.L1544
	movq	104(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1437:
	vmovups	(%rbx,%rax), %xmm0
	vmovups	(%r14,%rax), %xmm4
	vmovups	%xmm4, (%rbx,%rax)
	vmovups	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1437
	movq	96(%rsp), %rax
	movq	88(%rsp), %rcx
	leaq	(%rbx,%rax), %rsi
	addq	%r14, %rax
	cmpq	%rcx, 80(%rsp)
	je	.L1433
	movq	(%rsi), %rdi
	movq	(%rax), %r8
	movq	%r8, (%rsi)
	movq	%rdi, (%rax)
	jmp	.L1433
.L1541:
	movq	48(%rsp), %rdi
	movq	%r15, %rsi
	movq	%r14, %rax
	.p2align 4,,15
.L1415:
	movq	(%rax), %rdx
	movq	(%rsi), %rcx
	addq	$8, %rax
	addq	$8, %rsi
	decq	%rdi
	movq	%rcx, -8(%rax)
	movq	%rdx, -8(%rsi)
	testq	%rdi, %rdi
	jg	.L1415
	jmp	.L1412
.L1383:
	movq	64(%rsp), %rbp
	imulq	16(%rsp), %rbp
	leaq	0(%r13,%rbp), %rax
	movq	%rax, 24(%rsp)
	movq	%rax, %rcx
.L1385:
	movq	32(%rsp), %rax
	decq	%rax
	movq	%rax, 40(%rsp)
	cmpq	%rcx, 72(%rsp)
	jnb	.L2103
	movq	16(%rsp), %rbx
	movq	%r13, 8(%rsp)
.L1474:
	movq	72(%rsp), %r15
	cmpq	%r15, 8(%rsp)
	jnb	.L1476
	movl	$16, %eax
	movq	%rbx, %r14
	subq	%rbx, %rax
	negq	%r14
	movq	%rax, 16(%rsp)
	jmp	.L1473
	.p2align 4,,15
.L2121:
	movq	(%r15), %rax
	movq	(%r15,%r14), %rcx
	movq	%rcx, (%r15)
	movq	%rax, (%r15,%r14)
.L1454:
	movq	%r13, %r15
	cmpq	%r13, 8(%rsp)
	jnb	.L1476
.L1473:
	movq	%r15, %r13
	movq	%r15, %rbp
	movq	%r15, %rsi
	subq	%rbx, %r13
	movq	%r13, %rdi
	call	*%r12
	testl	%eax, %eax
	jle	.L1476
	movl	(%rsp), %esi
	testl	%esi, %esi
	je	.L2121
	movl	112(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.L1455
	movl	(%r15), %eax
	movl	(%r15,%r14), %ecx
	movl	%ecx, (%r15)
	movl	%eax, (%r15,%r14)
	movq	%r13, %r15
	cmpq	%r13, 8(%rsp)
	jb	.L1473
.L1476:
	addq	%rbx, 72(%rsp)
	movq	72(%rsp), %rax
	cmpq	24(%rsp), %rax
	jb	.L1474
	jmp	.L2103
.L1363:
	movl	112(%rsp), %ebx
	testl	%ebx, %ebx
	jne	.L1365
	movl	0(%r13), %eax
	movl	(%r14), %esi
	movl	%esi, 0(%r13)
	movl	%eax, (%r14)
	jmp	.L1364
.L1543:
	movq	200(%rsp), %rcx
	movq	%r15, %rsi
	movq	%r14, %rax
	leaq	(%r14,%rcx), %r9
	.p2align 4,,15
.L1426:
	movzbl	(%rax), %edx
	movzbl	(%rsi), %ecx
	incq	%rax
	incq	%rsi
	movb	%cl, -1(%rax)
	movb	%dl, -1(%rsi)
	movq	%r9, %rdx
	subq	%rax, %rdx
	testq	%rdx, %rdx
	jg	.L1426
	jmp	.L1412
.L2120:
	testb	$1, %al
	je	.L1545
	movq	120(%rsp), %rax
	movabsq	$9223372036854775803, %rcx
	subq	$4, %rax
	cmpq	%rcx, %rax
	ja	.L1545
	movq	160(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1442:
	vmovups	(%rbx,%rax), %xmm0
	vmovups	(%r14,%rax), %xmm7
	vmovups	%xmm7, (%rbx,%rax)
	vmovups	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1442
	movq	184(%rsp), %rax
	movq	176(%rsp), %rcx
	leaq	(%rbx,%rax), %rsi
	addq	%r14, %rax
	cmpq	%rcx, 168(%rsp)
	je	.L1433
	movl	(%rsi), %edi
	movl	(%rax), %r8d
	movq	192(%rsp), %rdx
	movl	%r8d, (%rsi)
	movl	%edi, (%rax)
	leaq	-1(%rdx), %rdi
	testq	%rdi, %rdi
	jle	.L1433
	movl	4(%rsi), %edi
	movl	4(%rax), %r8d
	movl	%r8d, 4(%rsi)
	movl	%edi, 4(%rax)
	cmpq	$2, %rdx
	je	.L1433
	movl	8(%rsi), %edi
	movl	8(%rax), %r8d
	movl	%r8d, 8(%rsi)
	movl	%edi, 8(%rax)
	jmp	.L1433
.L1542:
	movq	120(%rsp), %rdi
	movq	%r15, %rsi
	movq	%r14, %rax
	.p2align 4,,15
.L1420:
	movl	(%rax), %edx
	movl	(%rsi), %ecx
	addq	$4, %rax
	addq	$4, %rsi
	decq	%rdi
	movl	%ecx, -4(%rax)
	movl	%edx, -4(%rsi)
	testq	%rdi, %rdi
	jg	.L1420
	jmp	.L1412
.L2115:
	movq	16(%rsp), %rdi
	xorl	%edx, %edx
	movq	%r12, %rcx
	divq	%rdi
	movq	%rdi, %rdx
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	spec_qsort
	jmp	.L1494
.L2114:
	movq	24(%rsp), %r11
	movslq	%edx, %rdi
	movq	%r11, %rcx
	subq	%rdx, %rcx
	cmpl	$2, (%rsp)
	jne	.L2122
	cmpl	$2, 112(%rsp)
	jne	.L2123
	movq	%r11, %r8
	leaq	16(%r13), %r9
	movslq	%edx, %r10
	subq	%rdx, %r8
	addq	$16, %r8
	cmpq	%r8, %r13
	setnb	%r8b
	cmpq	%r9, %rcx
	setnb	%r9b
	orl	%r9d, %r8d
	andl	$1, %r8d
	je	.L1552
	cmpl	$15, %edx
	jle	.L1552
	testl	%edx, %edx
	movl	$1, %edi
	cmovg	%r10, %rdi
	xorl	%edx, %edx
	movq	%rdi, %r8
	andq	$-16, %r8
.L1489:
	vmovups	0(%r13,%rdx), %xmm0
	vmovups	(%rcx,%rdx), %xmm5
	vmovups	%xmm5, 0(%r13,%rdx)
	vmovups	%xmm0, (%rcx,%rdx)
	addq	$16, %rdx
	cmpq	%r8, %rdx
	jne	.L1489
	movq	%rdi, %r8
	andq	$-16, %r8
	subq	%r8, %r10
	leaq	0(%r13,%r8), %rdx
	addq	%r8, %rcx
	cmpq	%r8, %rdi
	je	.L1491
	movzbl	(%rdx), %edi
	movzbl	(%rcx), %r8d
	movb	%r8b, (%rdx)
	movb	%dil, (%rcx)
	leaq	-1(%r10), %rdi
	testq	%rdi, %rdi
	jle	.L1491
	movzbl	1(%rdx), %edi
	movzbl	1(%rcx), %r8d
	movb	%r8b, 1(%rdx)
	movb	%dil, 1(%rcx)
	cmpq	$2, %r10
	je	.L1491
	movzbl	2(%rdx), %edi
	movzbl	2(%rcx), %r8d
	movb	%r8b, 2(%rdx)
	movb	%dil, 2(%rcx)
	cmpq	$3, %r10
	je	.L1491
	movzbl	3(%rdx), %edi
	movzbl	3(%rcx), %r8d
	movb	%r8b, 3(%rdx)
	movb	%dil, 3(%rcx)
	cmpq	$4, %r10
	je	.L1491
	movzbl	4(%rdx), %edi
	movzbl	4(%rcx), %r8d
	movb	%r8b, 4(%rdx)
	movb	%dil, 4(%rcx)
	cmpq	$5, %r10
	je	.L1491
	movzbl	5(%rdx), %edi
	movzbl	5(%rcx), %r8d
	movb	%r8b, 5(%rdx)
	movb	%dil, 5(%rcx)
	cmpq	$6, %r10
	je	.L1491
	movzbl	6(%rdx), %edi
	movzbl	6(%rcx), %r8d
	movb	%r8b, 6(%rdx)
	movb	%dil, 6(%rcx)
	cmpq	$7, %r10
	je	.L1491
	movzbl	7(%rdx), %edi
	movzbl	7(%rcx), %r8d
	movb	%r8b, 7(%rdx)
	movb	%dil, 7(%rcx)
	cmpq	$8, %r10
	je	.L1491
	movzbl	8(%rdx), %edi
	movzbl	8(%rcx), %r8d
	movb	%r8b, 8(%rdx)
	movb	%dil, 8(%rcx)
	cmpq	$9, %r10
	je	.L1491
	movzbl	9(%rdx), %edi
	movzbl	9(%rcx), %r8d
	movb	%r8b, 9(%rdx)
	movb	%dil, 9(%rcx)
	cmpq	$10, %r10
	je	.L1491
	movzbl	10(%rdx), %edi
	movzbl	10(%rcx), %r8d
	movb	%r8b, 10(%rdx)
	movb	%dil, 10(%rcx)
	cmpq	$11, %r10
	je	.L1491
	movzbl	11(%rdx), %edi
	movzbl	11(%rcx), %r8d
	movb	%r8b, 11(%rdx)
	movb	%dil, 11(%rcx)
	cmpq	$12, %r10
	je	.L1491
	movzbl	12(%rdx), %edi
	movzbl	12(%rcx), %r8d
	movb	%r8b, 12(%rdx)
	movb	%dil, 12(%rcx)
	cmpq	$13, %r10
	je	.L1491
	movzbl	13(%rdx), %edi
	movzbl	13(%rcx), %r8d
	movb	%r8b, 13(%rdx)
	movb	%dil, 13(%rcx)
	cmpq	$14, %r10
	je	.L1491
	movzbl	14(%rdx), %edi
	movzbl	14(%rcx), %r8d
	movb	%r8b, 14(%rdx)
	movb	%dil, 14(%rcx)
.L1491:
	testq	%rsi, %rsi
	je	.L1499
	movq	%rbp, %rdx
	movl	%esi, %ecx
	subq	%rsi, %rdx
.L1502:
	movq	24(%rsp), %r9
	leaq	16(%rdx), %rdi
	movslq	%ecx, %r8
	leaq	16(%r9), %rsi
	cmpq	%rsi, %rdx
	setnb	%sil
	cmpq	%rdi, %r9
	setnb	%dil
	orl	%edi, %esi
	andl	$1, %esi
	je	.L1553
	cmpl	$15, %ecx
	jle	.L1553
	testl	%ecx, %ecx
	movl	$1, %edi
	cmovg	%r8, %rdi
	xorl	%ecx, %ecx
	movq	%rdi, %rsi
	andq	$-16, %rsi
.L1509:
	vmovups	(%r9,%rcx), %xmm0
	vmovups	(%rdx,%rcx), %xmm6
	vmovups	%xmm6, (%r9,%rcx)
	vmovups	%xmm0, (%rdx,%rcx)
	addq	$16, %rcx
	cmpq	%rsi, %rcx
	jne	.L1509
	movq	24(%rsp), %rcx
	movq	%rdi, %rsi
	andq	$-16, %rsi
	subq	%rsi, %r8
	addq	%rsi, %rdx
	addq	%rsi, %rcx
	cmpq	%rsi, %rdi
	je	.L1499
	movzbl	(%rcx), %esi
	movzbl	(%rdx), %edi
	movb	%dil, (%rcx)
	movb	%sil, (%rdx)
	leaq	-1(%r8), %rsi
	testq	%rsi, %rsi
	jle	.L1499
	movzbl	1(%rcx), %esi
	movzbl	1(%rdx), %edi
	movb	%dil, 1(%rcx)
	movb	%sil, 1(%rdx)
	cmpq	$2, %r8
	je	.L1499
	movzbl	2(%rcx), %esi
	movzbl	2(%rdx), %edi
	movb	%dil, 2(%rcx)
	movb	%sil, 2(%rdx)
	cmpq	$3, %r8
	je	.L1499
	movzbl	3(%rcx), %esi
	movzbl	3(%rdx), %edi
	movb	%dil, 3(%rcx)
	movb	%sil, 3(%rdx)
	cmpq	$4, %r8
	je	.L1499
	movzbl	4(%rcx), %esi
	movzbl	4(%rdx), %edi
	movb	%dil, 4(%rcx)
	movb	%sil, 4(%rdx)
	cmpq	$5, %r8
	je	.L1499
	movzbl	5(%rcx), %esi
	movzbl	5(%rdx), %edi
	movb	%dil, 5(%rcx)
	movb	%sil, 5(%rdx)
	cmpq	$6, %r8
	je	.L1499
	movzbl	6(%rcx), %esi
	movzbl	6(%rdx), %edi
	movb	%dil, 6(%rcx)
	movb	%sil, 6(%rdx)
	cmpq	$7, %r8
	je	.L1499
	movzbl	7(%rcx), %esi
	movzbl	7(%rdx), %edi
	movb	%dil, 7(%rcx)
	movb	%sil, 7(%rdx)
	cmpq	$8, %r8
	je	.L1499
	movzbl	8(%rcx), %esi
	movzbl	8(%rdx), %edi
	movb	%dil, 8(%rcx)
	movb	%sil, 8(%rdx)
	cmpq	$9, %r8
	je	.L1499
	movzbl	9(%rcx), %esi
	movzbl	9(%rdx), %edi
	movb	%dil, 9(%rcx)
	movb	%sil, 9(%rdx)
	cmpq	$10, %r8
	je	.L1499
	movzbl	10(%rcx), %esi
	movzbl	10(%rdx), %edi
	movb	%dil, 10(%rcx)
	movb	%sil, 10(%rdx)
	cmpq	$11, %r8
	je	.L1499
	movzbl	11(%rcx), %esi
	movzbl	11(%rdx), %edi
	movb	%dil, 11(%rcx)
	movb	%sil, 11(%rdx)
	cmpq	$12, %r8
	je	.L1499
	movzbl	12(%rcx), %esi
	movzbl	12(%rdx), %edi
	movb	%dil, 12(%rcx)
	movb	%sil, 12(%rdx)
	cmpq	$13, %r8
	je	.L1499
	movzbl	13(%rcx), %esi
	movzbl	13(%rdx), %edi
	movb	%dil, 13(%rcx)
	movb	%sil, 13(%rdx)
	cmpq	$14, %r8
	je	.L1499
	movzbl	14(%rcx), %esi
	movzbl	14(%rdx), %edi
	movb	%dil, 14(%rcx)
	movb	%sil, 14(%rdx)
	jmp	.L1499
	.p2align 4,,15
.L1492:
	movq	%rbp, %rdx
	movslq	%esi, %rcx
	subq	%rsi, %rdx
	cmpl	$2, (%rsp)
	jne	.L1516
	cmpl	$2, 112(%rsp)
	je	.L1502
.L1518:
	movq	24(%rsp), %r9
	shrq	$2, %rcx
	leaq	16(%rdx), %r8
	movq	%rcx, %rsi
	leaq	16(%r9), %rdi
	cmpq	%rdi, %rdx
	setnb	%dil
	cmpq	%r8, %r9
	setnb	%r8b
	orl	%r8d, %edi
	andl	$1, %edi
	je	.L2101
	leaq	-4(%rcx), %r8
	movabsq	$9223372036854775803, %rdi
	cmpq	%rdi, %r8
	ja	.L2101
	testq	%rcx, %rcx
	movl	$1, %r8d
	cmovg	%rcx, %r8
	xorl	%ecx, %ecx
	movq	%r8, %rdi
	shrq	$2, %rdi
	salq	$4, %rdi
.L1504:
	vmovups	(%r9,%rcx), %xmm0
	vmovups	(%rdx,%rcx), %xmm4
	vmovups	%xmm4, (%r9,%rcx)
	vmovups	%xmm0, (%rdx,%rcx)
	addq	$16, %rcx
	cmpq	%rdi, %rcx
	jne	.L1504
	movq	24(%rsp), %rcx
	movq	%r8, %rdi
	andq	$-4, %rdi
	leaq	0(,%rdi,4), %r9
	subq	%rdi, %rsi
	addq	%r9, %rdx
	addq	%r9, %rcx
	cmpq	%rdi, %r8
	je	.L1499
	movl	(%rcx), %edi
	movl	(%rdx), %r8d
	movl	%r8d, (%rcx)
	movl	%edi, (%rdx)
	leaq	-1(%rsi), %rdi
	testq	%rdi, %rdi
	jle	.L1499
	movl	4(%rcx), %edi
	movl	4(%rdx), %r8d
	movl	%r8d, 4(%rcx)
	movl	%edi, 4(%rdx)
	cmpq	$2, %rsi
	je	.L1499
	movl	8(%rcx), %esi
	movl	8(%rdx), %edi
	movl	%edi, 8(%rcx)
	movl	%esi, 8(%rdx)
	jmp	.L1499
.L2109:
	call	*%r12
	testl	%eax, %eax
	js	.L1355
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	*%r12
	movq	%rbp, %r14
	testl	%eax, %eax
	cmovs	%rbx, %r14
	jmp	.L1355
.L1389:
	movq	56(%rsp), %rdx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rdx
	leaq	16(%rdx), %rsi
	setnb	%al
	cmpq	%rsi, %rbx
	setnb	%sil
	orl	%esi, %eax
	cmpl	$1, (%rsp)
	je	.L2124
	cmpl	$1, 112(%rsp)
	je	.L2125
	testb	$1, %al
	je	.L1540
	cmpl	$15, 116(%rsp)
	jle	.L1540
	movq	144(%rsp), %rcx
	xorl	%eax, %eax
.L1403:
	vmovups	(%rdx,%rax), %xmm0
	vmovups	(%rbx,%rax), %xmm5
	vmovups	%xmm5, (%rdx,%rax)
	vmovups	%xmm0, (%rbx,%rax)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L1403
	movq	136(%rsp), %rcx
	movq	56(%rsp), %rsi
	leaq	(%rbx,%rcx), %rax
	addq	%rcx, %rsi
	cmpq	%rcx, 128(%rsp)
	je	.L1388
	cmpq	$0, 152(%rsp)
	movzbl	(%rsi), %edi
	movzbl	(%rax), %r8d
	movb	%r8b, (%rsi)
	movb	%dil, (%rax)
	jle	.L1388
	movzbl	1(%rsi), %edi
	movzbl	1(%rax), %r8d
	movq	32(%rsp), %rdx
	movb	%r8b, 1(%rsi)
	movb	%dil, 1(%rax)
	cmpq	$2, %rdx
	je	.L1388
	movzbl	2(%rsi), %edi
	movzbl	2(%rax), %r8d
	movb	%r8b, 2(%rsi)
	movb	%dil, 2(%rax)
	cmpq	$3, %rdx
	je	.L1388
	movzbl	3(%rsi), %edi
	movzbl	3(%rax), %r8d
	movb	%r8b, 3(%rsi)
	movb	%dil, 3(%rax)
	cmpq	$4, %rdx
	je	.L1388
	movzbl	4(%rsi), %edi
	movzbl	4(%rax), %r8d
	movb	%r8b, 4(%rsi)
	movb	%dil, 4(%rax)
	cmpq	$5, %rdx
	je	.L1388
	movzbl	5(%rsi), %edi
	movzbl	5(%rax), %r8d
	movb	%r8b, 5(%rsi)
	movb	%dil, 5(%rax)
	cmpq	$6, %rdx
	je	.L1388
	movzbl	6(%rsi), %edi
	movzbl	6(%rax), %r8d
	movb	%r8b, 6(%rsi)
	movb	%dil, 6(%rax)
	cmpq	$7, %rdx
	je	.L1388
	movzbl	7(%rsi), %edi
	movzbl	7(%rax), %r8d
	movb	%r8b, 7(%rsi)
	movb	%dil, 7(%rax)
	cmpq	$8, %rdx
	je	.L1388
	movzbl	8(%rsi), %edi
	movzbl	8(%rax), %r8d
	movb	%r8b, 8(%rsi)
	movb	%dil, 8(%rax)
	cmpq	$9, %rdx
	je	.L1388
	movzbl	9(%rsi), %edi
	movzbl	9(%rax), %r8d
	movb	%r8b, 9(%rsi)
	movb	%dil, 9(%rax)
	cmpq	$10, %rdx
	je	.L1388
	movzbl	10(%rsi), %edi
	movzbl	10(%rax), %r8d
	movb	%r8b, 10(%rsi)
	movb	%dil, 10(%rax)
	cmpq	$11, %rdx
	je	.L1388
	movzbl	11(%rsi), %edi
	movzbl	11(%rax), %r8d
	movb	%r8b, 11(%rsi)
	movb	%dil, 11(%rax)
	cmpq	$12, %rdx
	je	.L1388
	movzbl	12(%rsi), %edi
	movzbl	12(%rax), %r8d
	movb	%r8b, 12(%rsi)
	movb	%dil, 12(%rax)
	cmpq	$13, %rdx
	je	.L1388
	movzbl	13(%rsi), %edi
	movzbl	13(%rax), %r8d
	movb	%r8b, 13(%rsi)
	movb	%dil, 13(%rax)
	cmpq	$14, %rdx
	je	.L1388
	movzbl	14(%rsi), %edi
	movzbl	14(%rax), %r8d
	movb	%r8b, 14(%rsi)
	movb	%dil, 14(%rax)
	jmp	.L1388
	.p2align 4,,15
.L1365:
	leaq	16(%r13), %rax
	leaq	16(%r14), %rsi
	cmpq	%rax, %r14
	setnb	%al
	cmpq	%rsi, %r13
	setnb	%sil
	orl	%esi, %eax
	cmpl	$1, (%rsp)
	je	.L2126
	cmpl	$1, 112(%rsp)
	je	.L2127
	testb	$1, %al
	je	.L1537
	cmpl	$15, 116(%rsp)
	jle	.L1537
	movq	144(%rsp), %rdx
	xorl	%eax, %eax
.L1379:
	vmovups	0(%r13,%rax), %xmm0
	vmovups	(%r14,%rax), %xmm7
	vmovups	%xmm7, 0(%r13,%rax)
	vmovups	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1379
	movq	136(%rsp), %rcx
	leaq	0(%r13,%rcx), %rax
	leaq	(%r14,%rcx), %rdx
	cmpq	%rcx, 128(%rsp)
	je	.L1364
	movzbl	(%rax), %esi
	movzbl	(%rdx), %edi
	movq	32(%rsp), %rcx
	movb	%dil, (%rax)
	movb	%sil, (%rdx)
	leaq	-1(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.L1364
	movzbl	1(%rax), %esi
	movzbl	1(%rdx), %edi
	movb	%dil, 1(%rax)
	movb	%sil, 1(%rdx)
	cmpq	$2, %rcx
	je	.L1364
	movzbl	2(%rax), %esi
	movzbl	2(%rdx), %edi
	movb	%dil, 2(%rax)
	movb	%sil, 2(%rdx)
	cmpq	$3, %rcx
	je	.L1364
	movzbl	3(%rax), %esi
	movzbl	3(%rdx), %edi
	movb	%dil, 3(%rax)
	movb	%sil, 3(%rdx)
	cmpq	$4, %rcx
	je	.L1364
	movzbl	4(%rax), %esi
	movzbl	4(%rdx), %edi
	movb	%dil, 4(%rax)
	movb	%sil, 4(%rdx)
	cmpq	$5, %rcx
	je	.L1364
	movzbl	5(%rax), %esi
	movzbl	5(%rdx), %edi
	movb	%dil, 5(%rax)
	movb	%sil, 5(%rdx)
	cmpq	$6, %rcx
	je	.L1364
	movzbl	6(%rax), %esi
	movzbl	6(%rdx), %edi
	movb	%dil, 6(%rax)
	movb	%sil, 6(%rdx)
	cmpq	$7, %rcx
	je	.L1364
	movzbl	7(%rax), %esi
	movzbl	7(%rdx), %edi
	movb	%dil, 7(%rax)
	movb	%sil, 7(%rdx)
	cmpq	$8, %rcx
	je	.L1364
	movzbl	8(%rax), %esi
	movzbl	8(%rdx), %edi
	movb	%dil, 8(%rax)
	movb	%sil, 8(%rdx)
	cmpq	$9, %rcx
	je	.L1364
	movzbl	9(%rax), %esi
	movzbl	9(%rdx), %edi
	movb	%dil, 9(%rax)
	movb	%sil, 9(%rdx)
	cmpq	$10, %rcx
	je	.L1364
	movzbl	10(%rax), %esi
	movzbl	10(%rdx), %edi
	movb	%dil, 10(%rax)
	movb	%sil, 10(%rdx)
	cmpq	$11, %rcx
	je	.L1364
	movzbl	11(%rax), %esi
	movzbl	11(%rdx), %edi
	movb	%dil, 11(%rax)
	movb	%sil, 11(%rdx)
	cmpq	$12, %rcx
	je	.L1364
	movzbl	12(%rax), %esi
	movzbl	12(%rdx), %edi
	movb	%dil, 12(%rax)
	movb	%sil, 12(%rdx)
	cmpq	$13, %rcx
	je	.L1364
	movzbl	13(%rax), %esi
	movzbl	13(%rdx), %edi
	movb	%dil, 13(%rax)
	movb	%sil, 13(%rdx)
	cmpq	$14, %rcx
	je	.L1364
	movzbl	14(%rax), %esi
	movzbl	14(%rdx), %edi
	movb	%dil, 14(%rax)
	movb	%sil, 14(%rdx)
	jmp	.L1364
	.p2align 4,,15
.L2108:
	shrq	$3, %rax
	imulq	%rdi, %rax
	movq	%r13, %rdi
	leaq	0(%r13,%rax), %rbp
	leaq	0(%r13,%rax,2), %rbx
	movq	%rax, 8(%rsp)
	movq	%rbp, %rsi
	call	*%r12
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	testl	%eax, %eax
	js	.L2128
	call	*%r12
	testl	%eax, %eax
	jg	.L1358
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	*%r12
	testl	%eax, %eax
	cmovs	%r13, %rbx
	movq	%rbx, %rbp
.L1358:
	movq	8(%rsp), %rax
	movq	%r14, %rsi
	leaq	(%r14,%rax), %rbx
	negq	%rax
	movq	%rax, 24(%rsp)
	addq	%r14, %rax
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*%r12
	movq	%rbx, %rsi
	movq	%r14, %rdi
	testl	%eax, %eax
	js	.L2129
	call	*%r12
	testl	%eax, %eax
	jg	.L1360
	movq	8(%rsp), %r14
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	*%r12
	testl	%eax, %eax
	cmovns	%rbx, %r14
.L1360:
	movq	24(%rsp), %rax
	leaq	(%r15,%rax), %rbx
	addq	%rbx, %rax
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	*%r12
	movq	%r15, %rsi
	movq	%rbx, %rdi
	testl	%eax, %eax
	js	.L2130
	call	*%r12
	testl	%eax, %eax
	jg	.L1356
	movq	8(%rsp), %rbx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*%r12
	testl	%eax, %eax
	cmovns	%r15, %rbx
	jmp	.L1356
.L2122:
	movslq	%edx, %r8
	movq	%rcx, %rdx
	leaq	16(%r13), %r9
	addq	$16, %rdx
	shrq	$3, %r8
	cmpq	%rdx, %r13
	movq	%r8, %rdi
	setnb	%dl
	cmpq	%r9, %rcx
	setnb	%r9b
	orl	%r9d, %edx
	andl	$1, %edx
	je	.L1550
	leaq	-3(%r8), %rdx
	movabsq	$9223372036854775804, %r11
	cmpq	%r11, %rdx
	ja	.L1550
	testq	%r8, %r8
	movl	$1, %edx
	cmovle	%rdx, %r8
	xorl	%edx, %edx
	movq	%r8, %rdi
	shrq	%rdi
	salq	$4, %rdi
.L1480:
	vmovups	0(%r13,%rdx), %xmm0
	vmovups	(%rcx,%rdx), %xmm6
	vmovups	%xmm6, 0(%r13,%rdx)
	vmovups	%xmm0, (%rcx,%rdx)
	addq	$16, %rdx
	cmpq	%rdi, %rdx
	jne	.L1480
	movq	%r8, %rdx
	andq	$-2, %rdx
	leaq	0(,%rdx,8), %r9
	leaq	0(%r13,%r9), %rdi
	addq	%rcx, %r9
	cmpq	%rdx, %r8
	je	.L1482
	movq	(%rdi), %rdx
	movq	(%r9), %rcx
	movq	%rcx, (%rdi)
	movq	%rdx, (%r9)
.L1482:
	testq	%rsi, %rsi
	je	.L1499
	movq	%rbp, %rdx
	movl	%esi, %ecx
	subq	%rsi, %rdx
.L1516:
	movq	24(%rsp), %r11
	movslq	%ecx, %rsi
	leaq	16(%rdx), %r8
	shrq	$3, %rsi
	movq	%rsi, %rcx
	leaq	16(%r11), %rdi
	cmpq	%rdi, %rdx
	setnb	%dil
	cmpq	%r8, %r11
	setnb	%r8b
	orl	%r8d, %edi
	andl	$1, %edi
	je	.L2099
	leaq	-3(%rsi), %rdi
	movabsq	$9223372036854775804, %r10
	cmpq	%r10, %rdi
	ja	.L2099
	testq	%rsi, %rsi
	movl	$1, %ecx
	movq	%r11, %r8
	cmovle	%rcx, %rsi
	xorl	%ecx, %ecx
	movq	%rsi, %rdi
	shrq	%rdi
	salq	$4, %rdi
.L1497:
	vmovups	(%r8,%rcx), %xmm0
	vmovups	(%rdx,%rcx), %xmm4
	vmovups	%xmm4, (%r8,%rcx)
	vmovups	%xmm0, (%rdx,%rcx)
	addq	$16, %rcx
	cmpq	%rdi, %rcx
	jne	.L1497
	movq	24(%rsp), %rdi
	movq	%rsi, %r8
	andq	$-2, %r8
	leaq	0(,%r8,8), %rcx
	addq	%rcx, %rdx
	addq	%rcx, %rdi
	cmpq	%r8, %rsi
	je	.L1499
	movq	(%rdi), %rcx
	movq	(%rdx), %rsi
	movq	%rsi, (%rdi)
	movq	%rcx, (%rdx)
	jmp	.L1499
.L2123:
	subq	%rdx, %r11
	movslq	%edx, %r10
	leaq	16(%r13), %r8
	movq	%r11, %rdx
	shrq	$2, %r10
	addq	$16, %rdx
	movq	%r10, %rdi
	cmpq	%rdx, %r13
	setnb	%dl
	cmpq	%r8, %rcx
	setnb	%r8b
	orl	%r8d, %edx
	andl	$1, %edx
	je	.L1551
	leaq	-4(%r10), %r8
	movabsq	$9223372036854775803, %rdx
	cmpq	%rdx, %r8
	ja	.L1551
	testq	%r10, %r10
	movl	$1, %edi
	cmovg	%r10, %rdi
	xorl	%edx, %edx
	movq	%rdi, %r8
	shrq	$2, %r8
	salq	$4, %r8
.L1485:
	vmovups	0(%r13,%rdx), %xmm0
	vmovups	(%rcx,%rdx), %xmm5
	vmovups	%xmm5, 0(%r13,%rdx)
	vmovups	%xmm0, (%rcx,%rdx)
	addq	$16, %rdx
	cmpq	%r8, %rdx
	jne	.L1485
	movq	%rdi, %r8
	andq	$-4, %r8
	leaq	0(,%r8,4), %r9
	subq	%r8, %r10
	leaq	0(%r13,%r9), %rdx
	addq	%r9, %rcx
	cmpq	%r8, %rdi
	je	.L1487
	movl	(%rdx), %edi
	movl	(%rcx), %r8d
	movl	%r8d, (%rdx)
	movl	%edi, (%rcx)
	leaq	-1(%r10), %rdi
	testq	%rdi, %rdi
	jle	.L1487
	movl	4(%rdx), %edi
	movl	4(%rcx), %r8d
	movl	%r8d, 4(%rdx)
	movl	%edi, 4(%rcx)
	cmpq	$2, %r10
	je	.L1487
	movl	8(%rdx), %edi
	movl	8(%rcx), %r8d
	movl	%r8d, 8(%rdx)
	movl	%edi, 8(%rcx)
.L1487:
	testq	%rsi, %rsi
	je	.L1499
	movq	%rbp, %rdx
	movslq	%esi, %rcx
	subq	%rsi, %rdx
	jmp	.L1518
.L2126:
	testb	$1, %al
	je	.L1535
	movq	48(%rsp), %rax
	movabsq	$9223372036854775804, %rdi
	subq	$3, %rax
	cmpq	%rdi, %rax
	ja	.L1535
	movq	104(%rsp), %rdx
	xorl	%eax, %eax
.L1368:
	vmovups	0(%r13,%rax), %xmm0
	vmovups	(%r14,%rax), %xmm6
	vmovups	%xmm6, 0(%r13,%rax)
	vmovups	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1368
	movq	96(%rsp), %rdi
	leaq	0(%r13,%rdi), %rax
	leaq	(%r14,%rdi), %rdx
	movq	88(%rsp), %rdi
	cmpq	%rdi, 80(%rsp)
	je	.L1364
	movq	(%rax), %rsi
	movq	(%rdx), %rdi
	movq	%rdi, (%rax)
	movq	%rsi, (%rdx)
	jmp	.L1364
.L2128:
	call	*%r12
	testl	%eax, %eax
	js	.L1358
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	*%r12
	testl	%eax, %eax
	cmovns	%r13, %rbx
	movq	%rbx, %rbp
	jmp	.L1358
.L2125:
	testb	$1, %al
	je	.L1539
	movq	120(%rsp), %rax
	movabsq	$9223372036854775803, %rdi
	subq	$4, %rax
	cmpq	%rdi, %rax
	ja	.L1539
	xorl	%eax, %eax
.L1397:
	vmovups	(%rdx,%rax), %xmm0
	vmovups	(%rbx,%rax), %xmm6
	vmovups	%xmm6, (%rdx,%rax)
	vmovups	%xmm0, (%rbx,%rax)
	addq	$16, %rax
	cmpq	160(%rsp), %rax
	jne	.L1397
	movq	184(%rsp), %rax
	movq	56(%rsp), %rsi
	movq	176(%rsp), %rcx
	addq	%rax, %rsi
	addq	%rbx, %rax
	cmpq	%rcx, 168(%rsp)
	je	.L1388
	movl	(%rsi), %edi
	movl	(%rax), %r8d
	movq	192(%rsp), %rdx
	movl	%r8d, (%rsi)
	movl	%edi, (%rax)
	leaq	-1(%rdx), %rdi
	testq	%rdi, %rdi
	jle	.L1388
	movl	4(%rsi), %edi
	movl	4(%rax), %r8d
	movl	%r8d, 4(%rsi)
	movl	%edi, 4(%rax)
	cmpq	$2, %rdx
	je	.L1388
	movl	8(%rsi), %edi
	movl	8(%rax), %r8d
	movl	%r8d, 8(%rsi)
	movl	%edi, 8(%rax)
	jmp	.L1388
	.p2align 4,,15
.L1455:
	cmpq	$0, 16(%rsp)
	leaq	16(%r15), %rsi
	setle	%al
	cmpq	%rsi, %r13
	setnb	%sil
	orl	%esi, %eax
	cmpl	$1, (%rsp)
	je	.L2131
	cmpl	$1, 112(%rsp)
	je	.L2132
	testb	$1, %al
	je	.L1549
	cmpl	$15, 116(%rsp)
	jle	.L1549
	movq	144(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1469:
	vmovups	(%r15,%rax), %xmm0
	vmovups	0(%r13,%rax), %xmm5
	vmovups	%xmm5, (%r15,%rax)
	vmovups	%xmm0, 0(%r13,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1469
	movq	136(%rsp), %rdx
	addq	%rdx, %r15
	leaq	0(%r13,%rdx), %rax
	cmpq	%rdx, 128(%rsp)
	je	.L1454
	cmpq	$0, 40(%rsp)
	movzbl	(%r15), %ecx
	movzbl	(%rax), %esi
	movb	%sil, (%r15)
	movb	%cl, (%rax)
	jle	.L1454
	movzbl	1(%r15), %ecx
	movzbl	1(%rax), %esi
	movq	32(%rsp), %rdx
	movb	%sil, 1(%r15)
	movb	%cl, 1(%rax)
	cmpq	$2, %rdx
	je	.L1454
	movzbl	2(%r15), %ecx
	movzbl	2(%rax), %esi
	movb	%sil, 2(%r15)
	movb	%cl, 2(%rax)
	cmpq	$3, %rdx
	je	.L1454
	movzbl	3(%r15), %ecx
	movzbl	3(%rax), %esi
	movb	%sil, 3(%r15)
	movb	%cl, 3(%rax)
	cmpq	$4, %rdx
	je	.L1454
	movzbl	4(%r15), %ecx
	movzbl	4(%rax), %esi
	movb	%sil, 4(%r15)
	movb	%cl, 4(%rax)
	cmpq	$5, %rdx
	je	.L1454
	movzbl	5(%r15), %ecx
	movzbl	5(%rax), %esi
	movb	%sil, 5(%r15)
	movb	%cl, 5(%rax)
	cmpq	$6, %rdx
	je	.L1454
	movzbl	6(%r15), %ecx
	movzbl	6(%rax), %esi
	movb	%sil, 6(%r15)
	movb	%cl, 6(%rax)
	cmpq	$7, %rdx
	je	.L1454
	movzbl	7(%r15), %ecx
	movzbl	7(%rax), %esi
	movb	%sil, 7(%r15)
	movb	%cl, 7(%rax)
	cmpq	$8, %rdx
	je	.L1454
	movzbl	8(%r15), %ecx
	movzbl	8(%rax), %esi
	movb	%sil, 8(%r15)
	movb	%cl, 8(%rax)
	cmpq	$9, %rdx
	je	.L1454
	movzbl	9(%r15), %ecx
	movzbl	9(%rax), %esi
	movb	%sil, 9(%r15)
	movb	%cl, 9(%rax)
	cmpq	$10, %rdx
	je	.L1454
	movzbl	10(%r15), %ecx
	movzbl	10(%rax), %esi
	movb	%sil, 10(%r15)
	movb	%cl, 10(%rax)
	cmpq	$11, %rdx
	je	.L1454
	movzbl	11(%r15), %ecx
	movzbl	11(%rax), %esi
	movb	%sil, 11(%r15)
	movb	%cl, 11(%rax)
	cmpq	$12, %rdx
	je	.L1454
	movzbl	12(%r15), %ecx
	movzbl	12(%rax), %esi
	movb	%sil, 12(%r15)
	movb	%cl, 12(%rax)
	cmpq	$13, %rdx
	je	.L1454
	movzbl	13(%r15), %ecx
	movzbl	13(%rax), %esi
	movb	%sil, 13(%r15)
	movb	%cl, 13(%rax)
	cmpq	$14, %rdx
	je	.L1454
	movzbl	14(%r15), %ecx
	movzbl	14(%rax), %esi
	movb	%sil, 14(%r15)
	movb	%cl, 14(%rax)
	jmp	.L1454
.L2131:
	testb	$1, %al
	je	.L1547
	movq	48(%rsp), %rax
	movabsq	$9223372036854775804, %rcx
	subq	$3, %rax
	cmpq	%rcx, %rax
	ja	.L1547
	movq	104(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1458:
	vmovups	(%r15,%rax), %xmm0
	vmovups	0(%r13,%rax), %xmm7
	vmovups	%xmm7, (%r15,%rax)
	vmovups	%xmm0, 0(%r13,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1458
	movq	96(%rsp), %rax
	movq	88(%rsp), %rdx
	addq	%rax, %r15
	addq	%r13, %rax
	cmpq	%rdx, 80(%rsp)
	je	.L1454
	movq	(%r15), %rcx
	movq	(%rax), %rsi
	movq	%rsi, (%r15)
	movq	%rcx, (%rax)
	jmp	.L1454
.L2132:
	testb	$1, %al
	je	.L1548
	movq	120(%rsp), %rax
	movabsq	$9223372036854775803, %rdi
	subq	$4, %rax
	cmpq	%rdi, %rax
	ja	.L1548
	movq	160(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1463:
	vmovups	(%r15,%rax), %xmm0
	vmovups	0(%r13,%rax), %xmm7
	vmovups	%xmm7, (%r15,%rax)
	vmovups	%xmm0, 0(%r13,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1463
	movq	184(%rsp), %rax
	movq	176(%rsp), %rdi
	addq	%rax, %r15
	addq	%r13, %rax
	cmpq	%rdi, 168(%rsp)
	je	.L1454
	movl	(%r15), %ecx
	movl	(%rax), %esi
	movq	192(%rsp), %rdi
	movl	%esi, (%r15)
	movl	%ecx, (%rax)
	leaq	-1(%rdi), %rcx
	testq	%rcx, %rcx
	jle	.L1454
	movl	4(%r15), %ecx
	movl	4(%rax), %esi
	movl	%esi, 4(%r15)
	movl	%ecx, 4(%rax)
	cmpq	$2, %rdi
	je	.L1454
	movl	8(%r15), %ecx
	movl	8(%rax), %esi
	movl	%esi, 8(%r15)
	movl	%ecx, 8(%rax)
	jmp	.L1454
.L1544:
	movq	48(%rsp), %rsi
	movq	24(%rsp), %rdx
	movq	%r14, %rax
	.p2align 4,,15
.L1436:
	movq	(%rdx), %rcx
	movq	(%rax), %rdi
	addq	$8, %rdx
	addq	$8, %rax
	decq	%rsi
	movq	%rdi, -8(%rdx)
	movq	%rcx, -8(%rax)
	testq	%rsi, %rsi
	jg	.L1436
	jmp	.L1433
.L1546:
	movq	200(%rsp), %rdi
	movq	24(%rsp), %rdx
	movq	%r14, %rax
	leaq	(%rdi,%rbx), %r8
.L1447:
	movzbl	(%rdx), %ecx
	movzbl	(%rax), %esi
	incq	%rdx
	incq	%rax
	movb	%sil, -1(%rdx)
	movb	%cl, -1(%rax)
	movq	%r8, %rcx
	subq	%rdx, %rcx
	testq	%rcx, %rcx
	jg	.L1447
	jmp	.L1433
.L2124:
	testb	$1, %al
	je	.L1538
	movq	48(%rsp), %rax
	movabsq	$9223372036854775804, %rcx
	subq	$3, %rax
	cmpq	%rcx, %rax
	ja	.L1538
	movq	104(%rsp), %rcx
	xorl	%eax, %eax
.L1392:
	vmovups	(%rdx,%rax), %xmm0
	vmovups	(%rbx,%rax), %xmm7
	vmovups	%xmm7, (%rdx,%rax)
	vmovups	%xmm0, (%rbx,%rax)
	addq	$16, %rax
	cmpq	%rcx, %rax
	jne	.L1392
	movq	96(%rsp), %rax
	movq	56(%rsp), %rsi
	movq	88(%rsp), %rcx
	addq	%rax, %rsi
	addq	%rbx, %rax
	cmpq	%rcx, 80(%rsp)
	je	.L1388
	movq	(%rsi), %rdi
	movq	(%rax), %r8
	movq	%r8, (%rsi)
	movq	%rdi, (%rax)
	jmp	.L1388
	.p2align 4,,15
.L1334:
	leaq	16(%rbx), %rax
	cmpq	%rax, %r13
	setnb	%al
	cmpq	$0, 24(%rsp)
	setle	%sil
	orl	%esi, %eax
	cmpl	$1, %r14d
	je	.L2133
	cmpl	$1, 112(%rsp)
	je	.L2134
	testb	$1, %al
	je	.L1525
	cmpl	$15, 116(%rsp)
	jle	.L1525
	movq	144(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1348:
	vmovups	(%r15,%rax), %xmm0
	vmovups	0(%r13,%rax), %xmm6
	vmovups	%xmm6, (%r15,%rax)
	vmovups	%xmm0, 0(%r13,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1348
	movq	136(%rsp), %rcx
	leaq	(%r15,%rcx), %rdx
	leaq	0(%r13,%rcx), %rax
	cmpq	%rcx, 128(%rsp)
	je	.L1333
	cmpq	$0, 56(%rsp)
	movzbl	(%rdx), %esi
	movzbl	(%rax), %edi
	movb	%dil, (%rdx)
	movb	%sil, (%rax)
	jle	.L1333
	movzbl	1(%rdx), %esi
	movzbl	1(%rax), %edi
	movq	32(%rsp), %rcx
	movb	%dil, 1(%rdx)
	movb	%sil, 1(%rax)
	cmpq	$2, %rcx
	je	.L1333
	movzbl	2(%rdx), %esi
	movzbl	2(%rax), %edi
	movb	%dil, 2(%rdx)
	movb	%sil, 2(%rax)
	cmpq	$3, %rcx
	je	.L1333
	movzbl	3(%rdx), %esi
	movzbl	3(%rax), %edi
	movb	%dil, 3(%rdx)
	movb	%sil, 3(%rax)
	cmpq	$4, %rcx
	je	.L1333
	movzbl	4(%rdx), %esi
	movzbl	4(%rax), %edi
	movb	%dil, 4(%rdx)
	movb	%sil, 4(%rax)
	cmpq	$5, %rcx
	je	.L1333
	movzbl	5(%rdx), %esi
	movzbl	5(%rax), %edi
	movb	%dil, 5(%rdx)
	movb	%sil, 5(%rax)
	cmpq	$6, %rcx
	je	.L1333
	movzbl	6(%rdx), %esi
	movzbl	6(%rax), %edi
	movb	%dil, 6(%rdx)
	movb	%sil, 6(%rax)
	cmpq	$7, %rcx
	je	.L1333
	movzbl	7(%rdx), %esi
	movzbl	7(%rax), %edi
	movb	%dil, 7(%rdx)
	movb	%sil, 7(%rax)
	cmpq	$8, %rcx
	je	.L1333
	movzbl	8(%rdx), %esi
	movzbl	8(%rax), %edi
	movb	%dil, 8(%rdx)
	movb	%sil, 8(%rax)
	cmpq	$9, %rcx
	je	.L1333
	movzbl	9(%rdx), %esi
	movzbl	9(%rax), %edi
	movb	%dil, 9(%rdx)
	movb	%sil, 9(%rax)
	cmpq	$10, %rcx
	je	.L1333
	movzbl	10(%rdx), %esi
	movzbl	10(%rax), %edi
	movb	%dil, 10(%rdx)
	movb	%sil, 10(%rax)
	cmpq	$11, %rcx
	je	.L1333
	movzbl	11(%rdx), %esi
	movzbl	11(%rax), %edi
	movb	%dil, 11(%rdx)
	movb	%sil, 11(%rax)
	cmpq	$12, %rcx
	je	.L1333
	movzbl	12(%rdx), %esi
	movzbl	12(%rax), %edi
	movb	%dil, 12(%rdx)
	movb	%sil, 12(%rax)
	cmpq	$13, %rcx
	je	.L1333
	movzbl	13(%rdx), %esi
	movzbl	13(%rax), %edi
	movb	%dil, 13(%rdx)
	movb	%sil, 13(%rax)
	cmpq	$14, %rcx
	je	.L1333
	movzbl	14(%rdx), %esi
	movzbl	14(%rax), %edi
	movb	%dil, 14(%rdx)
	movb	%sil, 14(%rax)
	jmp	.L1333
.L2133:
	testb	$1, %al
	je	.L1523
	movq	48(%rsp), %rax
	movabsq	$9223372036854775804, %rcx
	subq	$3, %rax
	cmpq	%rcx, %rax
	ja	.L1523
	movq	104(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1337:
	vmovups	(%r15,%rax), %xmm0
	vmovups	0(%r13,%rax), %xmm6
	vmovups	%xmm6, (%r15,%rax)
	vmovups	%xmm0, 0(%r13,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1337
	movq	96(%rsp), %rax
	movq	88(%rsp), %rdi
	leaq	(%r15,%rax), %rdx
	addq	%r13, %rax
	cmpq	%rdi, 80(%rsp)
	je	.L1333
	movq	(%rdx), %rsi
	movq	(%rax), %rdi
	movq	%rdi, (%rdx)
	movq	%rsi, (%rax)
	jmp	.L1333
.L2134:
	testb	$1, %al
	je	.L1524
	movq	120(%rsp), %rax
	movabsq	$9223372036854775803, %rcx
	subq	$4, %rax
	cmpq	%rcx, %rax
	ja	.L1524
	movq	160(%rsp), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L1342:
	vmovups	(%r15,%rax), %xmm0
	vmovups	0(%r13,%rax), %xmm4
	vmovups	%xmm4, (%r15,%rax)
	vmovups	%xmm0, 0(%r13,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L1342
	movq	184(%rsp), %rax
	movq	176(%rsp), %rdi
	leaq	(%r15,%rax), %rdx
	addq	%r13, %rax
	cmpq	%rdi, 168(%rsp)
	je	.L1333
	movl	(%rdx), %esi
	movl	(%rax), %edi
	movq	192(%rsp), %rcx
	movl	%edi, (%rdx)
	movl	%esi, (%rax)
	leaq	-1(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.L1333
	movl	4(%rdx), %esi
	movl	4(%rax), %edi
	movl	%edi, 4(%rdx)
	movl	%esi, 4(%rax)
	cmpq	$2, %rcx
	je	.L1333
	movl	8(%rdx), %esi
	movl	8(%rax), %edi
	movl	%edi, 8(%rdx)
	movl	%esi, 8(%rax)
	jmp	.L1333
.L1523:
	movq	48(%rsp), %rsi
	movq	%r13, %rax
.L1336:
	movq	(%r15), %rdx
	movq	(%rax), %rcx
	addq	$8, %r15
	addq	$8, %rax
	decq	%rsi
	movq	%rcx, -8(%r15)
	movq	%rdx, -8(%rax)
	testq	%rsi, %rsi
	jg	.L1336
	jmp	.L1333
.L2130:
	call	*%r12
	testl	%eax, %eax
	js	.L1356
	movq	8(%rsp), %rbx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*%r12
	testl	%eax, %eax
	movq	%rbx, %rax
	cmovs	%r15, %rax
	movq	%rax, %rbx
	jmp	.L1356
.L2129:
	call	*%r12
	testl	%eax, %eax
	js	.L1360
	movq	8(%rsp), %r14
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	*%r12
	testl	%eax, %eax
	movq	%r14, %rax
	cmovs	%rbx, %rax
	movq	%rax, %r14
	jmp	.L1360
.L1545:
	movq	120(%rsp), %rsi
	movq	24(%rsp), %rdx
	movq	%r14, %rax
.L1441:
	movl	(%rdx), %ecx
	movl	(%rax), %edi
	addq	$4, %rdx
	addq	$4, %rax
	decq	%rsi
	movl	%edi, -4(%rdx)
	movl	%ecx, -4(%rax)
	testq	%rsi, %rsi
	jg	.L1441
	jmp	.L1433
.L1547:
	movq	48(%rsp), %rsi
	movq	%r13, %rax
.L1457:
	movq	0(%rbp), %rdx
	movq	(%rax), %rcx
	addq	$8, %rbp
	addq	$8, %rax
	decq	%rsi
	movq	%rcx, -8(%rbp)
	movq	%rdx, -8(%rax)
	testq	%rsi, %rsi
	jg	.L1457
	jmp	.L1454
.L1549:
	movq	200(%rsp), %rdx
	movq	%r13, %rax
	leaq	(%rdx,%r15), %r9
.L1468:
	movzbl	0(%rbp), %edx
	movzbl	(%rax), %ecx
	incq	%rbp
	incq	%rax
	movb	%cl, -1(%rbp)
	movb	%dl, -1(%rax)
	movq	%r9, %rdx
	subq	%rbp, %rdx
	testq	%rdx, %rdx
	jg	.L1468
	jmp	.L1454
.L1525:
	movq	200(%rsp), %rdx
	movq	%r13, %rax
	leaq	0(%r13,%rdx), %r9
.L1347:
	movzbl	(%r15), %edx
	movzbl	(%rax), %ecx
	incq	%r15
	incq	%rax
	movb	%cl, -1(%r15)
	movb	%dl, -1(%rax)
	movq	%r9, %rdx
	subq	%rax, %rdx
	testq	%rdx, %rdx
	jg	.L1347
	jmp	.L1333
.L1550:
	movq	%r13, %rdx
.L1479:
	movq	(%rdx), %r8
	movq	(%rcx), %r9
	addq	$8, %rdx
	addq	$8, %rcx
	decq	%rdi
	movq	%r9, -8(%rdx)
	movq	%r8, -8(%rcx)
	testq	%rdi, %rdi
	jg	.L1479
	jmp	.L1482
.L2099:
	movq	%r11, %rsi
.L1876:
	movq	(%rsi), %rdi
	movq	(%rdx), %r8
	addq	$8, %rsi
	addq	$8, %rdx
	decq	%rcx
	movq	%r8, -8(%rsi)
	movq	%rdi, -8(%rdx)
	testq	%rcx, %rcx
	jg	.L1876
	jmp	.L1499
.L1548:
	movq	120(%rsp), %rsi
	movq	%r13, %rax
.L1462:
	movl	0(%rbp), %edx
	movl	(%rax), %ecx
	addq	$4, %rbp
	addq	$4, %rax
	decq	%rsi
	movl	%ecx, -4(%rbp)
	movl	%edx, -4(%rax)
	testq	%rsi, %rsi
	jg	.L1462
	jmp	.L1454
.L1524:
	movq	120(%rsp), %rsi
	movq	%r13, %rax
.L1341:
	movl	(%r15), %edx
	movl	(%rax), %ecx
	addq	$4, %r15
	addq	$4, %rax
	decq	%rsi
	movl	%ecx, -4(%r15)
	movl	%edx, -4(%rax)
	testq	%rsi, %rsi
	jg	.L1341
	jmp	.L1333
.L2127:
	testb	$1, %al
	je	.L1536
	movq	120(%rsp), %rax
	leaq	-4(%rax), %rsi
	movabsq	$9223372036854775803, %rax
	cmpq	%rax, %rsi
	ja	.L1536
	xorl	%eax, %eax
.L1373:
	vmovups	0(%r13,%rax), %xmm0
	vmovups	(%r14,%rax), %xmm4
	vmovups	%xmm4, 0(%r13,%rax)
	vmovups	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpq	160(%rsp), %rax
	jne	.L1373
	movq	184(%rsp), %rdx
	movq	176(%rsp), %rdi
	leaq	0(%r13,%rdx), %rax
	addq	%r14, %rdx
	cmpq	%rdi, 168(%rsp)
	je	.L1364
	movl	(%rax), %esi
	movl	(%rdx), %edi
	movq	192(%rsp), %rcx
	movl	%edi, (%rax)
	movl	%esi, (%rdx)
	leaq	-1(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.L1364
	movl	4(%rax), %esi
	movl	4(%rdx), %edi
	movl	%edi, 4(%rax)
	movl	%esi, 4(%rdx)
	cmpq	$2, %rcx
	je	.L1364
	movl	8(%rax), %esi
	movl	8(%rdx), %edi
	movl	%edi, 8(%rax)
	movl	%esi, 8(%rdx)
	jmp	.L1364
.L1552:
	movq	%r13, %rdx
	addq	%r13, %rdi
.L1488:
	movzbl	(%rdx), %r8d
	movzbl	(%rcx), %r9d
	incq	%rdx
	incq	%rcx
	movb	%r9b, -1(%rdx)
	movb	%r8b, -1(%rcx)
	movq	%rdi, %r8
	subq	%rdx, %r8
	testq	%r8, %r8
	jg	.L1488
	jmp	.L1491
.L1553:
	movq	24(%rsp), %rsi
	leaq	(%rsi,%r8), %rcx
.L1508:
	movzbl	(%rsi), %edi
	movzbl	(%rdx), %r8d
	incq	%rsi
	incq	%rdx
	movb	%r8b, -1(%rsi)
	movb	%dil, -1(%rdx)
	movq	%rcx, %rdi
	subq	%rsi, %rdi
	testq	%rdi, %rdi
	jg	.L1508
	jmp	.L1499
.L1535:
	movq	48(%rsp), %rsi
	movq	%r13, %rax
.L1367:
	movq	(%rax), %rdx
	movq	(%r14), %rcx
	addq	$8, %rax
	addq	$8, %r14
	decq	%rsi
	movq	%rcx, -8(%rax)
	movq	%rdx, -8(%r14)
	testq	%rsi, %rsi
	jg	.L1367
	jmp	.L1364
.L2101:
	movq	%r9, %rsi
.L1877:
	movl	(%rsi), %edi
	movl	(%rdx), %r8d
	addq	$4, %rsi
	addq	$4, %rdx
	decq	%rcx
	movl	%r8d, -4(%rsi)
	movl	%edi, -4(%rdx)
	testq	%rcx, %rcx
	jg	.L1877
	jmp	.L1499
.L1540:
	movq	56(%rsp), %rdi
	movq	200(%rsp), %rdx
	movq	%rdi, %rax
	leaq	(%rdi,%rdx), %rsi
	movq	%rbx, %rdx
.L1402:
	movzbl	(%rax), %ecx
	movzbl	(%rdx), %edi
	incq	%rax
	incq	%rdx
	movb	%dil, -1(%rax)
	movb	%cl, -1(%rdx)
	movq	%rsi, %rcx
	subq	%rax, %rcx
	testq	%rcx, %rcx
	jg	.L1402
	jmp	.L1388
.L1551:
	movq	%r13, %rdx
.L1484:
	movl	(%rdx), %r8d
	movl	(%rcx), %r9d
	addq	$4, %rdx
	addq	$4, %rcx
	decq	%rdi
	movl	%r9d, -4(%rdx)
	movl	%r8d, -4(%rcx)
	testq	%rdi, %rdi
	jg	.L1484
	jmp	.L1487
.L1538:
	movq	56(%rsp), %rax
	movq	48(%rsp), %rsi
	movq	%rbx, %rdx
.L1391:
	movq	(%rax), %rcx
	movq	(%rdx), %rdi
	addq	$8, %rax
	addq	$8, %rdx
	decq	%rsi
	movq	%rdi, -8(%rax)
	movq	%rcx, -8(%rdx)
	testq	%rsi, %rsi
	jg	.L1391
	jmp	.L1388
.L1537:
	movq	200(%rsp), %rdx
	movq	%r13, %rax
	leaq	0(%r13,%rdx), %rsi
.L1378:
	movzbl	(%rax), %edx
	movzbl	(%r14), %ecx
	incq	%rax
	incq	%r14
	movb	%cl, -1(%rax)
	movb	%dl, -1(%r14)
	movq	%rsi, %rdx
	subq	%rax, %rdx
	testq	%rdx, %rdx
	jg	.L1378
	jmp	.L1364
.L1539:
	movq	56(%rsp), %rax
	movq	120(%rsp), %rsi
	movq	%rbx, %rdx
.L1396:
	movl	(%rax), %ecx
	movl	(%rdx), %edi
	addq	$4, %rax
	addq	$4, %rdx
	decq	%rsi
	movl	%edi, -4(%rax)
	movl	%ecx, -4(%rdx)
	testq	%rsi, %rsi
	jg	.L1396
	jmp	.L1388
.L2113:
	movq	%rbp, 24(%rsp)
	movq	%rbp, %rcx
	jmp	.L1385
.L1536:
	movq	120(%rsp), %rsi
	movq	%r13, %rax
.L1372:
	movl	(%rax), %edx
	movl	(%r14), %ecx
	addq	$4, %rax
	addq	$4, %r14
	decq	%rsi
	movl	%ecx, -4(%rax)
	movl	%edx, -4(%r14)
	testq	%rsi, %rsi
	jg	.L1372
	jmp	.L1364
	.cfi_endproc
.LFE73:
	.size	spec_qsort, .-spec_qsort
	.local	full_group_end_arc
	.comm	full_group_end_arc,8,8
	.local	basket
	.comm	basket,8,8
	.local	opt
	.comm	opt,8,8
	.local	basket_sizes
	.comm	basket_sizes,8,8
	.local	perm_p
	.comm	perm_p,8,8
	.local	opt_basket
	.comm	opt_basket,8,8
	.comm	net,648,32
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC9:
	.quad	0
	.quad	2000000
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC10:
	.long	0
	.long	1072955392
	.section	.rodata.cst16
	.align 16
.LC20:
	.quad	1
	.quad	2
	.align 16
.LC21:
	.quad	2
	.quad	2
	.align 16
.LC22:
	.quad	6
	.quad	6
	.align 16
.LC23:
	.quad	4
	.quad	4
	.align 16
.LC24:
	.quad	8
	.quad	8
	.ident	"GCC: (GNU) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
