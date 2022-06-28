	.cpu generic+fp+simd
	.file	"stra.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"pcSrc != ((void *)0)"
	.align	3
.LC1:
	.string	"stra.c"
	.text
	.align	2
	.global	Str_getLength
	.type	Str_getLength, %function
Str_getLength:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x0, [x29,24]
	str	xzr, [x29,40]
	ldr	x0, [x29,24]
	cmp	x0, xzr
	bne	.L2
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2049
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2049
	mov	w2, 16
	bl	__assert_fail
.L2:
	b	.L3
.L4:
	ldr	x0, [x29,40]
	add	x0, x0, 1
	str	x0, [x29,40]
.L3:
	ldr	x1, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L4
	ldr	x0, [x29,40]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE0:
	.size	Str_getLength, .-Str_getLength
	.section	.rodata
	.align	3
.LC2:
	.string	"pcDest != ((void *)0) && pcSrc != ((void *)0)"
	.text
	.align	2
	.global	Str_copy
	.type	Str_copy, %function
Str_copy:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x0, [x29,24]
	str	x1, [x29,16]
	ldr	x0, [x29,24]
	cmp	x0, xzr
	beq	.L7
	ldr	x0, [x29,16]
	cmp	x0, xzr
	bne	.L8
.L7:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2058
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2058
	mov	w2, 29
	bl	__assert_fail
.L8:
	str	xzr, [x29,40]
	b	.L9
.L10:
	ldr	x1, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldr	x2, [x29,16]
	ldr	x1, [x29,40]
	add	x1, x2, x1
	ldrb	w1, [x1]
	strb	w1, [x0]
	ldr	x0, [x29,40]
	add	x0, x0, 1
	str	x0, [x29,40]
.L9:
	ldr	x1, [x29,16]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L10
	ldr	x1, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	strb	wzr, [x0]
	ldr	x0, [x29,24]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1:
	.size	Str_copy, .-Str_copy
	.align	2
	.global	Str_concat
	.type	Str_concat, %function
Str_concat:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x0, [x29,24]
	str	x1, [x29,16]
	ldr	x0, [x29,24]
	bl	Str_getLength
	str	x0, [x29,32]
	ldr	x0, [x29,24]
	cmp	x0, xzr
	beq	.L13
	ldr	x0, [x29,16]
	cmp	x0, xzr
	bne	.L14
.L13:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2068
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2068
	mov	w2, 45
	bl	__assert_fail
.L14:
	str	xzr, [x29,40]
	b	.L15
.L16:
	ldr	x1, [x29,24]
	ldr	x0, [x29,32]
	add	x0, x1, x0
	ldr	x2, [x29,16]
	ldr	x1, [x29,40]
	add	x1, x2, x1
	ldrb	w1, [x1]
	strb	w1, [x0]
	ldr	x0, [x29,32]
	add	x0, x0, 1
	str	x0, [x29,32]
	ldr	x0, [x29,40]
	add	x0, x0, 1
	str	x0, [x29,40]
.L15:
	ldr	x1, [x29,16]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L16
	ldr	x1, [x29,24]
	ldr	x0, [x29,32]
	add	x0, x1, x0
	strb	wzr, [x0]
	ldr	x0, [x29,24]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE2:
	.size	Str_concat, .-Str_concat
	.section	.rodata
	.align	3
.LC3:
	.string	"s1 != ((void *)0) && s2 != ((void *)0)"
	.text
	.align	2
	.global	Str_compare
	.type	Str_compare, %function
Str_compare:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x0, [x29,24]
	str	x1, [x29,16]
	str	xzr, [x29,40]
	ldr	x0, [x29,24]
	cmp	x0, xzr
	beq	.L19
	ldr	x0, [x29,16]
	cmp	x0, xzr
	bne	.L20
.L19:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2077
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2077
	mov	w2, 66
	bl	__assert_fail
.L20:
	ldr	x1, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldr	x2, [x29,16]
	ldr	x0, [x29,40]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bcs	.L21
	mov	w0, -1
	b	.L22
.L21:
	ldr	x1, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldr	x2, [x29,16]
	ldr	x0, [x29,40]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bls	.L23
	mov	w0, 1
	b	.L22
.L23:
	ldr	x1, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldr	x2, [x29,16]
	ldr	x0, [x29,40]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bne	.L24
	ldr	x1, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	beq	.L24
	ldr	x1, [x29,16]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	beq	.L24
	ldr	x0, [x29,40]
	add	x0, x0, 1
	str	x0, [x29,40]
	b	.L20
.L24:
	mov	w0, 0
.L22:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3:
	.size	Str_compare, .-Str_compare
	.section	.rodata
	.align	3
.LC4:
	.string	"haystack != ((void *)0) && needle != ((void *)0)"
	.text
	.align	2
	.global	Str_search
	.type	Str_search, %function
Str_search:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x0, [x29,24]
	str	x1, [x29,16]
	ldr	x0, [x29,24]
	cmp	x0, xzr
	beq	.L26
	ldr	x0, [x29,16]
	cmp	x0, xzr
	bne	.L27
.L26:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2087
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2087
	mov	w2, 92
	bl	__assert_fail
.L27:
	ldr	x0, [x29,16]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L28
	ldr	x0, [x29,24]
	b	.L29
.L28:
	ldr	x0, [x29,24]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L30
	mov	x0, 0
	b	.L29
.L30:
	str	xzr, [x29,56]
	b	.L31
.L37:
	ldr	x0, [x29,16]
	ldrb	w1, [x0]
	ldr	x2, [x29,24]
	ldr	x0, [x29,56]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bne	.L32
	ldr	x0, [x29,56]
	add	x0, x0, 1
	str	x0, [x29,40]
	mov	x0, 1
	str	x0, [x29,48]
	b	.L33
.L36:
	ldr	x1, [x29,16]
	ldr	x0, [x29,48]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldr	x2, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	beq	.L34
	b	.L35
.L34:
	ldr	x0, [x29,40]
	add	x0, x0, 1
	str	x0, [x29,40]
	ldr	x0, [x29,48]
	add	x0, x0, 1
	str	x0, [x29,48]
.L33:
	ldr	x1, [x29,16]
	ldr	x0, [x29,48]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L36
.L35:
	ldr	x1, [x29,16]
	ldr	x0, [x29,48]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L32
	ldr	x1, [x29,24]
	ldr	x0, [x29,56]
	add	x0, x1, x0
	str	x0, [x29,32]
	ldr	x0, [x29,32]
	b	.L29
.L32:
	ldr	x0, [x29,56]
	add	x0, x0, 1
	str	x0, [x29,56]
.L31:
	ldr	x1, [x29,24]
	ldr	x0, [x29,56]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L37
	mov	x0, 0
.L29:
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE4:
	.size	Str_search, .-Str_search
	.section	.rodata
	.align	3
	.type	__PRETTY_FUNCTION__.2049, %object
	.size	__PRETTY_FUNCTION__.2049, 14
__PRETTY_FUNCTION__.2049:
	.string	"Str_getLength"
	.align	3
	.type	__PRETTY_FUNCTION__.2058, %object
	.size	__PRETTY_FUNCTION__.2058, 9
__PRETTY_FUNCTION__.2058:
	.string	"Str_copy"
	.align	3
	.type	__PRETTY_FUNCTION__.2068, %object
	.size	__PRETTY_FUNCTION__.2068, 11
__PRETTY_FUNCTION__.2068:
	.string	"Str_concat"
	.align	3
	.type	__PRETTY_FUNCTION__.2077, %object
	.size	__PRETTY_FUNCTION__.2077, 12
__PRETTY_FUNCTION__.2077:
	.string	"Str_compare"
	.align	3
	.type	__PRETTY_FUNCTION__.2087, %object
	.size	__PRETTY_FUNCTION__.2087, 11
__PRETTY_FUNCTION__.2087:
	.string	"Str_search"
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-28)"
	.section	.note.GNU-stack,"",%progbits
