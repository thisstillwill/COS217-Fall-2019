	.cpu generic+fp+simd
	.file	"strp.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"pcSrc != ((void *)0)"
	.align	3
.LC1:
	.string	"strp.c"
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
	ldr	x0, [x29,24]
	cmp	x0, xzr
	bne	.L2
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2049
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2049
	mov	w2, 17
	bl	__assert_fail
.L2:
	ldr	x0, [x29,24]
	str	x0, [x29,40]
	b	.L3
.L4:
	ldr	x0, [x29,40]
	add	x0, x0, 1
	str	x0, [x29,40]
.L3:
	ldr	x0, [x29,40]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L4
	ldr	x1, [x29,40]
	ldr	x0, [x29,24]
	sub	x0, x1, x0
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
	adrp	x2, __PRETTY_FUNCTION__.2059
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2059
	mov	w2, 32
	bl	__assert_fail
.L8:
	ldr	x0, [x29,16]
	str	x0, [x29,32]
	b	.L9
.L10:
	ldr	x1, [x29,32]
	ldr	x0, [x29,16]
	sub	x0, x1, x0
	str	x0, [x29,40]
	ldr	x1, [x29,24]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldr	x1, [x29,32]
	ldrb	w1, [x1]
	strb	w1, [x0]
	ldr	x0, [x29,32]
	add	x0, x0, 1
	str	x0, [x29,32]
.L9:
	ldr	x0, [x29,32]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L10
	ldr	x0, [x29,16]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L11
	ldr	x0, [x29,24]
	strb	wzr, [x0]
	b	.L12
.L11:
	ldr	x0, [x29,40]
	add	x0, x0, 1
	ldr	x1, [x29,24]
	add	x0, x1, x0
	strb	wzr, [x0]
.L12:
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
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x0, [x29,24]
	str	x1, [x29,16]
	ldr	x0, [x29,24]
	bl	Str_getLength
	str	x0, [x29,40]
	ldr	x0, [x29,24]
	cmp	x0, xzr
	beq	.L15
	ldr	x0, [x29,16]
	cmp	x0, xzr
	bne	.L16
.L15:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2070
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2070
	mov	w2, 55
	bl	__assert_fail
.L16:
	ldr	x0, [x29,16]
	str	x0, [x29,56]
	b	.L17
.L18:
	ldr	x1, [x29,56]
	ldr	x0, [x29,16]
	sub	x0, x1, x0
	str	x0, [x29,48]
	ldr	x1, [x29,40]
	ldr	x0, [x29,48]
	add	x0, x1, x0
	ldr	x1, [x29,24]
	add	x0, x1, x0
	ldr	x1, [x29,56]
	ldrb	w1, [x1]
	strb	w1, [x0]
	ldr	x0, [x29,56]
	add	x0, x0, 1
	str	x0, [x29,56]
.L17:
	ldr	x0, [x29,56]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L18
	ldr	x0, [x29,24]
	ldrb	w0, [x0]
	cmp	w0, wzr
	beq	.L19
	ldr	x1, [x29,40]
	ldr	x0, [x29,48]
	add	x0, x1, x0
	add	x0, x0, 1
	ldr	x1, [x29,24]
	add	x0, x1, x0
	strb	wzr, [x0]
.L19:
	ldr	x0, [x29,24]
	ldp	x29, x30, [sp], 64
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
	ldr	x0, [x29,16]
	str	x0, [x29,40]
	ldr	x0, [x29,24]
	cmp	x0, xzr
	beq	.L22
	ldr	x0, [x29,16]
	cmp	x0, xzr
	bne	.L23
.L22:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2080
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2080
	mov	w2, 78
	bl	__assert_fail
.L23:
	ldr	x1, [x29,40]
	ldr	x0, [x29,16]
	sub	x0, x1, x0
	str	x0, [x29,32]
	ldr	x1, [x29,24]
	ldr	x0, [x29,32]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldr	x2, [x29,16]
	ldr	x0, [x29,32]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bcs	.L24
	mov	w0, -1
	b	.L25
.L24:
	ldr	x1, [x29,24]
	ldr	x0, [x29,32]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldr	x2, [x29,16]
	ldr	x0, [x29,32]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bls	.L26
	mov	w0, 1
	b	.L25
.L26:
	ldr	x1, [x29,24]
	ldr	x0, [x29,32]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldr	x2, [x29,16]
	ldr	x0, [x29,32]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bne	.L27
	ldr	x1, [x29,24]
	ldr	x0, [x29,32]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	beq	.L27
	ldr	x1, [x29,16]
	ldr	x0, [x29,32]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	beq	.L27
	ldr	x0, [x29,40]
	add	x0, x0, 1
	str	x0, [x29,40]
	b	.L23
.L27:
	mov	w0, 0
.L25:
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
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x0, [x29,24]
	str	x1, [x29,16]
	ldr	x0, [x29,24]
	cmp	x0, xzr
	beq	.L29
	ldr	x0, [x29,16]
	cmp	x0, xzr
	bne	.L30
.L29:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, __PRETTY_FUNCTION__.2092
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2092
	mov	w2, 109
	bl	__assert_fail
.L30:
	ldr	x0, [x29,16]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L31
	ldr	x0, [x29,24]
	b	.L32
.L31:
	ldr	x0, [x29,24]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L33
	mov	x0, 0
	b	.L32
.L33:
	ldr	x0, [x29,24]
	str	x0, [x29,72]
	b	.L34
.L40:
	ldr	x1, [x29,72]
	ldr	x0, [x29,24]
	sub	x0, x1, x0
	str	x0, [x29,48]
	ldr	x0, [x29,16]
	ldrb	w1, [x0]
	ldr	x2, [x29,24]
	ldr	x0, [x29,48]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	bne	.L35
	ldr	x0, [x29,48]
	add	x0, x0, 1
	str	x0, [x29,56]
	ldr	x0, [x29,16]
	add	x0, x0, 1
	str	x0, [x29,64]
	b	.L36
.L39:
	ldr	x1, [x29,64]
	ldr	x0, [x29,16]
	sub	x0, x1, x0
	str	x0, [x29,40]
	ldr	x1, [x29,16]
	ldr	x0, [x29,40]
	add	x0, x1, x0
	ldrb	w1, [x0]
	ldr	x2, [x29,24]
	ldr	x0, [x29,56]
	add	x0, x2, x0
	ldrb	w0, [x0]
	cmp	w1, w0
	beq	.L37
	b	.L38
.L37:
	ldr	x0, [x29,56]
	add	x0, x0, 1
	str	x0, [x29,56]
	ldr	x0, [x29,64]
	add	x0, x0, 1
	str	x0, [x29,64]
.L36:
	ldr	x0, [x29,64]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L39
.L38:
	ldr	x1, [x29,64]
	ldr	x0, [x29,16]
	sub	x0, x1, x0
	ldr	x1, [x29,16]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L35
	ldr	x1, [x29,24]
	ldr	x0, [x29,48]
	add	x0, x1, x0
	str	x0, [x29,32]
	ldr	x0, [x29,32]
	b	.L32
.L35:
	ldr	x0, [x29,72]
	add	x0, x0, 1
	str	x0, [x29,72]
.L34:
	ldr	x0, [x29,72]
	ldrb	w0, [x0]
	cmp	w0, wzr
	bne	.L40
	mov	x0, 0
.L32:
	ldp	x29, x30, [sp], 80
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
	.type	__PRETTY_FUNCTION__.2059, %object
	.size	__PRETTY_FUNCTION__.2059, 9
__PRETTY_FUNCTION__.2059:
	.string	"Str_copy"
	.align	3
	.type	__PRETTY_FUNCTION__.2070, %object
	.size	__PRETTY_FUNCTION__.2070, 11
__PRETTY_FUNCTION__.2070:
	.string	"Str_concat"
	.align	3
	.type	__PRETTY_FUNCTION__.2080, %object
	.size	__PRETTY_FUNCTION__.2080, 12
__PRETTY_FUNCTION__.2080:
	.string	"Str_compare"
	.align	3
	.type	__PRETTY_FUNCTION__.2092, %object
	.size	__PRETTY_FUNCTION__.2092, 11
__PRETTY_FUNCTION__.2092:
	.string	"Str_search"
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-28)"
	.section	.note.GNU-stack,"",%progbits
