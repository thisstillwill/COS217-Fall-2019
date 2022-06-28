	.cpu generic+fp+simd
	.file	"decomment.c"
	.global	currentLine
	.data
	.align	2
	.type	currentLine, %object
	.size	currentLine, 4
currentLine:
	.word	1
	.comm	lineStart,4,4
	.text
	.align	2
	.global	handleNormalState
	.type	handleNormalState, %function
handleNormalState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 34
	bne	.L2
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 1
	str	w0, [x29,44]
	b	.L3
.L2:
	ldr	w0, [x29,28]
	cmp	w0, 39
	bne	.L4
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 3
	str	w0, [x29,44]
	b	.L3
.L4:
	ldr	w0, [x29,28]
	cmp	w0, 47
	bne	.L5
	mov	w0, 5
	str	w0, [x29,44]
	b	.L3
.L5:
	ldr	w0, [x29,28]
	bl	putchar
	str	wzr, [x29,44]
.L3:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleNormalState, .-handleNormalState
	.align	2
	.global	handleInStringLiteralState
	.type	handleInStringLiteralState, %function
handleInStringLiteralState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 34
	bne	.L8
	ldr	w0, [x29,28]
	bl	putchar
	str	wzr, [x29,44]
	b	.L9
.L8:
	ldr	w0, [x29,28]
	cmp	w0, 92
	bne	.L10
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 2
	str	w0, [x29,44]
	b	.L9
.L10:
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 1
	str	w0, [x29,44]
.L9:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleInStringLiteralState, .-handleInStringLiteralState
	.align	2
	.global	handleStringLiteralBufferState
	.type	handleStringLiteralBufferState, %function
handleStringLiteralBufferState:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 1
	str	w0, [x29,44]
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleStringLiteralBufferState, .-handleStringLiteralBufferState
	.align	2
	.global	handleInCharLiteralState
	.type	handleInCharLiteralState, %function
handleInCharLiteralState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 39
	bne	.L15
	ldr	w0, [x29,28]
	bl	putchar
	str	wzr, [x29,44]
	b	.L16
.L15:
	ldr	w0, [x29,28]
	cmp	w0, 92
	bne	.L17
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 4
	str	w0, [x29,44]
	b	.L16
.L17:
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 3
	str	w0, [x29,44]
.L16:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleInCharLiteralState, .-handleInCharLiteralState
	.align	2
	.global	handleCharLiteralBufferState
	.type	handleCharLiteralBufferState, %function
handleCharLiteralBufferState:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 3
	str	w0, [x29,44]
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleCharLiteralBufferState, .-handleCharLiteralBufferState
	.align	2
	.global	handleWarningInCommentState
	.type	handleWarningInCommentState, %function
handleWarningInCommentState:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 42
	bne	.L22
	mov	w0, 32
	bl	putchar
	adrp	x0, currentLine
	add	x0, x0, :lo12:currentLine
	ldr	w1, [x0]
	adrp	x0, lineStart
	add	x0, x0, :lo12:lineStart
	str	w1, [x0]
	mov	w0, 6
	str	w0, [x29,44]
	b	.L23
.L22:
	ldr	w0, [x29,28]
	cmp	w0, 34
	bne	.L24
	mov	w0, 47
	bl	putchar
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 1
	str	w0, [x29,44]
	b	.L23
.L24:
	ldr	w0, [x29,28]
	cmp	w0, 39
	bne	.L25
	mov	w0, 47
	bl	putchar
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 3
	str	w0, [x29,44]
	b	.L23
.L25:
	ldr	w0, [x29,28]
	cmp	w0, 47
	bne	.L26
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 5
	str	w0, [x29,44]
	b	.L23
.L26:
	mov	w0, 47
	bl	putchar
	ldr	w0, [x29,28]
	bl	putchar
	str	wzr, [x29,44]
.L23:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleWarningInCommentState, .-handleWarningInCommentState
	.align	2
	.global	handleInCommentState
	.type	handleInCommentState, %function
handleInCommentState:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 42
	bne	.L29
	mov	w0, 7
	str	w0, [x29,44]
	b	.L30
.L29:
	ldr	w0, [x29,28]
	cmp	w0, 10
	bne	.L31
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 6
	str	w0, [x29,44]
	b	.L30
.L31:
	mov	w0, 6
	str	w0, [x29,44]
.L30:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleInCommentState, .-handleInCommentState
	.align	2
	.global	handleWarningOutCommentState
	.type	handleWarningOutCommentState, %function
handleWarningOutCommentState:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	ldr	w0, [x29,28]
	cmp	w0, 47
	bne	.L34
	str	wzr, [x29,44]
	b	.L35
.L34:
	ldr	w0, [x29,28]
	cmp	w0, 42
	bne	.L36
	mov	w0, 7
	str	w0, [x29,44]
	b	.L35
.L36:
	ldr	w0, [x29,28]
	cmp	w0, 10
	bne	.L37
	ldr	w0, [x29,28]
	bl	putchar
	mov	w0, 6
	str	w0, [x29,44]
	b	.L35
.L37:
	mov	w0, 6
	str	w0, [x29,44]
.L35:
	ldr	w0, [x29,44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleWarningOutCommentState, .-handleWarningOutCommentState
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	wzr, [x29,28]
	b	.L40
.L51:
	ldr	w0, [x29,24]
	cmp	w0, 10
	bne	.L41
	adrp	x0, currentLine
	add	x0, x0, :lo12:currentLine
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, currentLine
	add	x0, x0, :lo12:currentLine
	str	w1, [x0]
.L41:
	ldr	w0, [x29,28]
	cmp	w0, 7
	bhi	.L40
	adrp	x1, .L43
	add	x1, x1, :lo12:.L43
	ldr	w2, [x1,w0,uxtw #2]
	adr	x3, .Lrtx43
	add	x2, x3, w2, sxtw #2
	br	x2
.Lrtx43:
	.section	.rodata
	.align	0
	.align	2
.L43:
	.word	(.L42 - .Lrtx43) / 4
	.word	(.L44 - .Lrtx43) / 4
	.word	(.L45 - .Lrtx43) / 4
	.word	(.L46 - .Lrtx43) / 4
	.word	(.L47 - .Lrtx43) / 4
	.word	(.L48 - .Lrtx43) / 4
	.word	(.L49 - .Lrtx43) / 4
	.word	(.L50 - .Lrtx43) / 4
	.text
.L42:
	ldr	w0, [x29,24]
	bl	handleNormalState
	str	w0, [x29,28]
	b	.L40
.L44:
	ldr	w0, [x29,24]
	bl	handleInStringLiteralState
	str	w0, [x29,28]
	b	.L40
.L45:
	ldr	w0, [x29,24]
	bl	handleStringLiteralBufferState
	str	w0, [x29,28]
	b	.L40
.L46:
	ldr	w0, [x29,24]
	bl	handleInCharLiteralState
	str	w0, [x29,28]
	b	.L40
.L47:
	ldr	w0, [x29,24]
	bl	handleCharLiteralBufferState
	str	w0, [x29,28]
	b	.L40
.L48:
	ldr	w0, [x29,24]
	bl	handleWarningInCommentState
	str	w0, [x29,28]
	b	.L40
.L49:
	ldr	w0, [x29,24]
	bl	handleInCommentState
	str	w0, [x29,28]
	b	.L40
.L50:
	ldr	w0, [x29,24]
	bl	handleWarningOutCommentState
	str	w0, [x29,28]
	nop
.L40:
	bl	getchar
	str	w0, [x29,24]
	ldr	w0, [x29,24]
	cmn	w0, #1
	bne	.L51
	ldr	w0, [x29,28]
	cmp	w0, 5
	bne	.L52
	mov	w0, 47
	bl	putchar
.L52:
	ldr	w0, [x29,28]
	cmp	w0, 6
	beq	.L53
	ldr	w0, [x29,28]
	cmp	w0, 7
	bne	.L54
.L53:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x0, [x0]
	adrp	x1, lineStart
	add	x1, x1, :lo12:lineStart
	ldr	w2, [x1]
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	bl	fprintf
	mov	w0, 1
	b	.L55
.L54:
	mov	w0, 0
.L55:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-28)"
	.section	.note.GNU-stack,"",%progbits
