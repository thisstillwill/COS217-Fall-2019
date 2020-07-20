	.cpu generic+fp+simd
	.file	"teststr.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"      Test at line %d failed.\n"
	.text
	.align	2
	.type	assure, %function
assure:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	str	w1, [x29,24]
	ldr	w0, [x29,28]
	cmp	w0, wzr
	bne	.L1
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	ldr	w1, [x29,24]
	bl	printf
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
.L1:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE0:
	.size	assure, .-assure
	.align	2
	.type	setCpuTimeLimit, %function
setCpuTimeLimit:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	mov	x0, 60
	str	x0, [x29,16]
	mov	x0, 60
	str	x0, [x29,24]
	add	x1, x29, 16
	mov	w0, 0
	bl	setrlimit
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1:
	.size	setCpuTimeLimit, .-setCpuTimeLimit
	.section	.rodata
	.align	3
.LC1:
	.string	"pcStr != ((void *)0)"
	.align	3
.LC2:
	.string	"teststr.c"
	.align	3
.LC3:
	.string	"iSize > 0"
	.text
	.align	2
	.type	randomString, %function
randomString:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x19, [sp,16]
	.cfi_offset 19, -48
	str	x0, [x29,40]
	str	w1, [x29,36]
	ldr	x0, [x29,40]
	cmp	x0, xzr
	bne	.L5
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	adrp	x2, __PRETTY_FUNCTION__.2654
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2654
	mov	w2, 66
	bl	__assert_fail
.L5:
	ldr	w0, [x29,36]
	cmp	w0, wzr
	bgt	.L6
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	adrp	x2, __PRETTY_FUNCTION__.2654
	add	x3, x2, :lo12:__PRETTY_FUNCTION__.2654
	mov	w2, 67
	bl	__assert_fail
.L6:
	str	wzr, [x29,60]
	b	.L7
.L8:
	ldrsw	x0, [x29,60]
	ldr	x1, [x29,40]
	add	x19, x1, x0
	bl	rand
	uxtb	w0, w0
	and	w0, w0, 127
	uxtb	w0, w0
	strb	w0, [x19]
	ldr	w0, [x29,60]
	add	w0, w0, 1
	str	w0, [x29,60]
.L7:
	ldr	w0, [x29,36]
	sub	w1, w0, #1
	ldr	w0, [x29,60]
	cmp	w1, w0
	bgt	.L8
	ldrsw	x0, [x29,36]
	sub	x0, x0, #1
	ldr	x1, [x29,40]
	add	x0, x1, x0
	strb	wzr, [x0]
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE2:
	.size	randomString, .-randomString
	.section	.rodata
	.align	3
.LC4:
	.string	"Testing Str_getLength()"
	.align	3
.LC5:
	.string	"   Boundary Tests"
	.align	3
.LC6:
	.string	"   Statement Tests"
	.align	3
.LC7:
	.string	"   Stress Tests"
	.text
	.align	2
	.type	testGetLength, %function
testGetLength:
.LFB3:
	.cfi_startproc
	sub	sp, sp, #1056
	.cfi_def_cfa_offset 1056
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 1072
	.cfi_offset 29, -1072
	.cfi_offset 30, -1064
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	strb	wzr, [x29,1040]
	mov	w0, 115
	strb	w0, [x29,1041]
	add	x0, x29, 1040
	bl	Str_getLength
	str	x0, [x29,1056]
	add	x0, x29, 1040
	bl	strlen
	str	x0, [x29,1048]
	ldr	x1, [x29,1056]
	ldr	x0, [x29,1048]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 92
	bl	assure
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	add	x0, x29, 1032
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 1032
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 1032
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 1032
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 1032
	strb	wzr, [x0,4]
	add	x0, x29, 1032
	strb	wzr, [x0,5]
	add	x0, x29, 1032
	bl	Str_getLength
	str	x0, [x29,1056]
	add	x0, x29, 1032
	bl	strlen
	str	x0, [x29,1048]
	ldr	x1, [x29,1056]
	ldr	x0, [x29,1048]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 102
	bl	assure
	add	x0, x29, 1024
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 1024
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 1024
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 1024
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 1024
	strb	wzr, [x0,4]
	add	x0, x29, 1024
	mov	w1, 115
	strb	w1, [x0,5]
	add	x0, x29, 1024
	bl	Str_getLength
	str	x0, [x29,1056]
	add	x0, x29, 1024
	bl	strlen
	str	x0, [x29,1048]
	ldr	x1, [x29,1056]
	ldr	x0, [x29,1048]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 109
	bl	assure
	mov	w0, 71
	strb	w0, [x29,1016]
	mov	w0, 101
	strb	w0, [x29,1017]
	mov	w0, 104
	strb	w0, [x29,1018]
	mov	w0, 114
	strb	w0, [x29,1019]
	mov	w0, 105
	strb	w0, [x29,1020]
	mov	w0, 103
	strb	w0, [x29,1021]
	strb	wzr, [x29,1022]
	mov	w0, 115
	strb	w0, [x29,1023]
	add	x0, x29, 1016
	bl	Str_getLength
	str	x0, [x29,1056]
	add	x0, x29, 1016
	bl	strlen
	str	x0, [x29,1048]
	ldr	x1, [x29,1056]
	ldr	x0, [x29,1048]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 116
	bl	assure
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	str	wzr, [x29,1068]
	b	.L10
.L11:
	add	x0, x29, 16
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 16
	bl	Str_getLength
	str	x0, [x29,1056]
	add	x0, x29, 16
	bl	strlen
	str	x0, [x29,1048]
	ldr	x1, [x29,1056]
	ldr	x0, [x29,1048]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 130
	bl	assure
	ldr	w0, [x29,1068]
	add	w0, w0, 1
	str	w0, [x29,1068]
.L10:
	ldr	w0, [x29,1068]
	cmp	w0, 9
	ble	.L11
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 1056
	add	sp, sp, 1056
	.cfi_def_cfa_offset 1040
	ret
	.cfi_endproc
.LFE3:
	.size	testGetLength, .-testGetLength
	.section	.rodata
	.align	3
.LC8:
	.string	"Testing Str_copy()"
	.text
	.align	2
	.type	testCopy, %function
testCopy:
.LFB4:
	.cfi_startproc
	sub	sp, sp, #3136
	.cfi_def_cfa_offset 3136
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 3152
	.cfi_offset 29, -3152
	.cfi_offset 30, -3144
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	strb	wzr, [x29,3128]
	mov	w0, 115
	strb	w0, [x29,3129]
	mov	w0, 100
	strb	w0, [x29,3120]
	mov	w0, 100
	strb	w0, [x29,3121]
	mov	w0, 100
	strb	w0, [x29,3112]
	mov	w0, 100
	strb	w0, [x29,3113]
	add	x0, x29, 3120
	add	x1, x29, 3128
	bl	Str_copy
	str	x0, [x29,3136]
	add	x0, x29, 3120
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 153
	bl	assure
	add	x0, x29, 3112
	add	x1, x29, 3128
	bl	strcpy
	add	x0, x29, 3120
	add	x1, x29, 3112
	mov	x2, 2
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 155
	bl	assure
	strb	wzr, [x29,3104]
	mov	w0, 115
	strb	w0, [x29,3105]
	strb	wzr, [x29,3096]
	mov	w0, 100
	strb	w0, [x29,3097]
	strb	wzr, [x29,3088]
	mov	w0, 100
	strb	w0, [x29,3089]
	add	x0, x29, 3096
	add	x1, x29, 3104
	bl	Str_copy
	str	x0, [x29,3136]
	add	x0, x29, 3096
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 163
	bl	assure
	add	x0, x29, 3088
	add	x1, x29, 3104
	bl	strcpy
	add	x0, x29, 3096
	add	x1, x29, 3088
	mov	x2, 2
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 165
	bl	assure
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	add	x0, x29, 3080
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 3080
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 3080
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 3080
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 3080
	strb	wzr, [x0,4]
	add	x0, x29, 3080
	mov	w1, 115
	strb	w1, [x0,5]
	add	x0, x29, 3072
	mov	w1, 100
	strb	w1, [x0]
	add	x0, x29, 3072
	mov	w1, 100
	strb	w1, [x0,1]
	add	x0, x29, 3072
	mov	w1, 100
	strb	w1, [x0,2]
	add	x0, x29, 3072
	mov	w1, 100
	strb	w1, [x0,3]
	add	x0, x29, 3072
	mov	w1, 100
	strb	w1, [x0,4]
	add	x0, x29, 3072
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3064
	mov	w1, 100
	strb	w1, [x0]
	add	x0, x29, 3064
	mov	w1, 100
	strb	w1, [x0,1]
	add	x0, x29, 3064
	mov	w1, 100
	strb	w1, [x0,2]
	add	x0, x29, 3064
	mov	w1, 100
	strb	w1, [x0,3]
	add	x0, x29, 3064
	mov	w1, 100
	strb	w1, [x0,4]
	add	x0, x29, 3064
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3072
	add	x1, x29, 3080
	bl	Str_copy
	str	x0, [x29,3136]
	add	x0, x29, 3072
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 176
	bl	assure
	add	x0, x29, 3064
	add	x1, x29, 3080
	bl	strcpy
	add	x0, x29, 3072
	add	x1, x29, 3064
	mov	x2, 6
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 178
	bl	assure
	mov	w0, 71
	strb	w0, [x29,3056]
	mov	w0, 101
	strb	w0, [x29,3057]
	mov	w0, 104
	strb	w0, [x29,3058]
	mov	w0, 114
	strb	w0, [x29,3059]
	mov	w0, 105
	strb	w0, [x29,3060]
	mov	w0, 103
	strb	w0, [x29,3061]
	strb	wzr, [x29,3062]
	mov	w0, 115
	strb	w0, [x29,3063]
	mov	w0, 100
	strb	w0, [x29,3048]
	mov	w0, 100
	strb	w0, [x29,3049]
	mov	w0, 100
	strb	w0, [x29,3050]
	mov	w0, 100
	strb	w0, [x29,3051]
	mov	w0, 100
	strb	w0, [x29,3052]
	mov	w0, 100
	strb	w0, [x29,3053]
	mov	w0, 100
	strb	w0, [x29,3054]
	mov	w0, 100
	strb	w0, [x29,3055]
	mov	w0, 100
	strb	w0, [x29,3040]
	mov	w0, 100
	strb	w0, [x29,3041]
	mov	w0, 100
	strb	w0, [x29,3042]
	mov	w0, 100
	strb	w0, [x29,3043]
	mov	w0, 100
	strb	w0, [x29,3044]
	mov	w0, 100
	strb	w0, [x29,3045]
	mov	w0, 100
	strb	w0, [x29,3046]
	mov	w0, 100
	strb	w0, [x29,3047]
	add	x0, x29, 3048
	add	x1, x29, 3056
	bl	Str_copy
	str	x0, [x29,3136]
	add	x0, x29, 3048
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 186
	bl	assure
	add	x0, x29, 3040
	add	x1, x29, 3056
	bl	strcpy
	add	x0, x29, 3048
	add	x1, x29, 3040
	mov	x2, 8
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 188
	bl	assure
	add	x0, x29, 3032
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 3032
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 3032
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 3032
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 3032
	strb	wzr, [x0,4]
	add	x0, x29, 3032
	mov	w1, 115
	strb	w1, [x0,5]
	add	x0, x29, 3024
	strb	wzr, [x0]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,1]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,2]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,3]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,4]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3016
	strb	wzr, [x0]
	add	x0, x29, 3016
	mov	w1, 100
	strb	w1, [x0,1]
	add	x0, x29, 3016
	mov	w1, 100
	strb	w1, [x0,2]
	add	x0, x29, 3016
	mov	w1, 100
	strb	w1, [x0,3]
	add	x0, x29, 3016
	mov	w1, 100
	strb	w1, [x0,4]
	add	x0, x29, 3016
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3024
	add	x1, x29, 3032
	bl	Str_copy
	str	x0, [x29,3136]
	add	x0, x29, 3024
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 196
	bl	assure
	add	x0, x29, 3016
	add	x1, x29, 3032
	bl	strcpy
	add	x0, x29, 3024
	add	x1, x29, 3016
	mov	x2, 6
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 198
	bl	assure
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	str	wzr, [x29,3148]
	b	.L13
.L14:
	add	x0, x29, 16
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 1016
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 2016
	add	x1, x29, 1016
	mov	x2, 1000
	bl	memcpy
	add	x0, x29, 1016
	add	x1, x29, 16
	bl	Str_copy
	str	x0, [x29,3136]
	add	x0, x29, 1016
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 215
	bl	assure
	add	x0, x29, 2016
	add	x1, x29, 16
	bl	strcpy
	add	x0, x29, 1016
	add	x1, x29, 2016
	mov	x2, 1000
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 217
	bl	assure
	ldr	w0, [x29,3148]
	add	w0, w0, 1
	str	w0, [x29,3148]
.L13:
	ldr	w0, [x29,3148]
	cmp	w0, 9
	ble	.L14
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 3136
	add	sp, sp, 3136
	.cfi_def_cfa_offset 3120
	ret
	.cfi_endproc
.LFE4:
	.size	testCopy, .-testCopy
	.section	.rodata
	.align	3
.LC9:
	.string	"Testing Str_concat()"
	.text
	.align	2
	.type	testConcat, %function
testConcat:
.LFB5:
	.cfi_startproc
	sub	sp, sp, #3136
	.cfi_def_cfa_offset 3136
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 3152
	.cfi_offset 29, -3152
	.cfi_offset 30, -3144
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	add	x0, x29, 3128
	strb	wzr, [x0]
	add	x0, x29, 3128
	mov	w1, 115
	strb	w1, [x0,1]
	add	x0, x29, 3128
	mov	w1, 115
	strb	w1, [x0,2]
	add	x0, x29, 3128
	mov	w1, 115
	strb	w1, [x0,3]
	add	x0, x29, 3128
	mov	w1, 115
	strb	w1, [x0,4]
	add	x0, x29, 3128
	mov	w1, 115
	strb	w1, [x0,5]
	add	x0, x29, 3120
	strb	wzr, [x0]
	add	x0, x29, 3120
	mov	w1, 100
	strb	w1, [x0,1]
	add	x0, x29, 3120
	mov	w1, 100
	strb	w1, [x0,2]
	add	x0, x29, 3120
	mov	w1, 100
	strb	w1, [x0,3]
	add	x0, x29, 3120
	mov	w1, 100
	strb	w1, [x0,4]
	add	x0, x29, 3120
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3112
	strb	wzr, [x0]
	add	x0, x29, 3112
	mov	w1, 100
	strb	w1, [x0,1]
	add	x0, x29, 3112
	mov	w1, 100
	strb	w1, [x0,2]
	add	x0, x29, 3112
	mov	w1, 100
	strb	w1, [x0,3]
	add	x0, x29, 3112
	mov	w1, 100
	strb	w1, [x0,4]
	add	x0, x29, 3112
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3120
	add	x1, x29, 3128
	bl	Str_concat
	str	x0, [x29,3136]
	add	x0, x29, 3120
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 240
	bl	assure
	add	x0, x29, 3112
	add	x1, x29, 3128
	bl	strcat
	add	x0, x29, 3120
	add	x1, x29, 3112
	mov	x2, 6
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 242
	bl	assure
	add	x0, x29, 3104
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 3104
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 3104
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 3104
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 3104
	strb	wzr, [x0,4]
	add	x0, x29, 3104
	mov	w1, 115
	strb	w1, [x0,5]
	add	x0, x29, 3096
	strb	wzr, [x0]
	add	x0, x29, 3096
	mov	w1, 100
	strb	w1, [x0,1]
	add	x0, x29, 3096
	mov	w1, 100
	strb	w1, [x0,2]
	add	x0, x29, 3096
	mov	w1, 100
	strb	w1, [x0,3]
	add	x0, x29, 3096
	mov	w1, 100
	strb	w1, [x0,4]
	add	x0, x29, 3096
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3088
	strb	wzr, [x0]
	add	x0, x29, 3088
	mov	w1, 100
	strb	w1, [x0,1]
	add	x0, x29, 3088
	mov	w1, 100
	strb	w1, [x0,2]
	add	x0, x29, 3088
	mov	w1, 100
	strb	w1, [x0,3]
	add	x0, x29, 3088
	mov	w1, 100
	strb	w1, [x0,4]
	add	x0, x29, 3088
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3096
	add	x1, x29, 3104
	bl	Str_concat
	str	x0, [x29,3136]
	add	x0, x29, 3096
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 250
	bl	assure
	add	x0, x29, 3088
	add	x1, x29, 3104
	bl	strcat
	add	x0, x29, 3096
	add	x1, x29, 3088
	mov	x2, 6
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 252
	bl	assure
	add	x0, x29, 3080
	strb	wzr, [x0]
	add	x0, x29, 3080
	mov	w1, 115
	strb	w1, [x0,1]
	add	x0, x29, 3080
	mov	w1, 115
	strb	w1, [x0,2]
	add	x0, x29, 3080
	mov	w1, 115
	strb	w1, [x0,3]
	add	x0, x29, 3080
	mov	w1, 115
	strb	w1, [x0,4]
	add	x0, x29, 3080
	mov	w1, 115
	strb	w1, [x0,5]
	add	x0, x29, 3072
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 3072
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 3072
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 3072
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 3072
	strb	wzr, [x0,4]
	add	x0, x29, 3072
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3064
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 3064
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 3064
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 3064
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 3064
	strb	wzr, [x0,4]
	add	x0, x29, 3064
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3072
	add	x1, x29, 3080
	bl	Str_concat
	str	x0, [x29,3136]
	add	x0, x29, 3072
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 260
	bl	assure
	add	x0, x29, 3064
	add	x1, x29, 3080
	bl	strcat
	add	x0, x29, 3072
	add	x1, x29, 3064
	mov	x2, 6
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 262
	bl	assure
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	add	x0, x29, 3056
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 3056
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 3056
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 3056
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 3056
	strb	wzr, [x0,4]
	add	x0, x29, 3056
	mov	w1, 115
	strb	w1, [x0,5]
	add	x0, x29, 3040
	mov	w1, 66
	strb	w1, [x0]
	add	x0, x29, 3040
	mov	w1, 97
	strb	w1, [x0,1]
	add	x0, x29, 3040
	mov	w1, 98
	strb	w1, [x0,2]
	add	x0, x29, 3040
	mov	w1, 101
	strb	w1, [x0,3]
	add	x0, x29, 3040
	strb	wzr, [x0,4]
	add	x0, x29, 3040
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3040
	mov	w1, 100
	strb	w1, [x0,6]
	add	x0, x29, 3040
	mov	w1, 100
	strb	w1, [x0,7]
	add	x0, x29, 3040
	mov	w1, 100
	strb	w1, [x0,8]
	add	x0, x29, 3040
	mov	w1, 100
	strb	w1, [x0,9]
	add	x0, x29, 3024
	mov	w1, 66
	strb	w1, [x0]
	add	x0, x29, 3024
	mov	w1, 97
	strb	w1, [x0,1]
	add	x0, x29, 3024
	mov	w1, 98
	strb	w1, [x0,2]
	add	x0, x29, 3024
	mov	w1, 101
	strb	w1, [x0,3]
	add	x0, x29, 3024
	strb	wzr, [x0,4]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,5]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,6]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,7]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,8]
	add	x0, x29, 3024
	mov	w1, 100
	strb	w1, [x0,9]
	add	x0, x29, 3040
	add	x1, x29, 3056
	bl	Str_concat
	str	x0, [x29,3136]
	add	x0, x29, 3040
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 275
	bl	assure
	add	x0, x29, 3024
	add	x1, x29, 3056
	bl	strcat
	add	x0, x29, 3040
	add	x1, x29, 3024
	mov	x2, 10
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 277
	bl	assure
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	add	x0, x29, 1024
	mov	x2, 1000
	mov	w1, 0
	bl	memset
	add	x0, x29, 2024
	mov	x2, 1000
	mov	w1, 0
	bl	memset
	str	wzr, [x29,3148]
	b	.L16
.L17:
	add	x0, x29, 24
	mov	w1, 500
	bl	randomString
	add	x0, x29, 1024
	mov	w1, 500
	bl	randomString
	add	x0, x29, 2024
	add	x1, x29, 1024
	mov	x2, 1000
	bl	memcpy
	add	x0, x29, 1024
	add	x1, x29, 24
	bl	Str_concat
	str	x0, [x29,3136]
	add	x0, x29, 1024
	ldr	x1, [x29,3136]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 294
	bl	assure
	add	x0, x29, 2024
	add	x1, x29, 24
	bl	strcat
	add	x0, x29, 1024
	add	x1, x29, 2024
	mov	x2, 1000
	bl	memcmp
	cmp	w0, wzr
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 296
	bl	assure
	ldr	w0, [x29,3148]
	add	w0, w0, 1
	str	w0, [x29,3148]
.L16:
	ldr	w0, [x29,3148]
	cmp	w0, 9
	ble	.L17
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 3136
	add	sp, sp, 3136
	.cfi_def_cfa_offset 3120
	ret
	.cfi_endproc
.LFE5:
	.size	testConcat, .-testConcat
	.align	2
	.type	sign, %function
sign:
.LFB6:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp,12]
	ldr	w0, [sp,12]
	cmp	w0, wzr
	bge	.L19
	mov	w0, -1
	b	.L20
.L19:
	ldr	w0, [sp,12]
	cmp	w0, wzr
	ble	.L21
	mov	w0, 1
	b	.L20
.L21:
	mov	w0, 0
.L20:
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	sign, .-sign
	.section	.rodata
	.align	3
.LC10:
	.string	"Testing Str_compare()"
	.text
	.align	2
	.type	testCompare, %function
testCompare:
.LFB7:
	.cfi_startproc
	sub	sp, sp, #2272
	.cfi_def_cfa_offset 2272
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 2304
	.cfi_offset 29, -2304
	.cfi_offset 30, -2296
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x19, [sp,16]
	.cfi_offset 19, -2288
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	puts
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	add	x0, x29, 2280
	strb	wzr, [x0]
	add	x0, x29, 2280
	mov	w1, 120
	strb	w1, [x0,1]
	add	x0, x29, 2280
	mov	w1, 120
	strb	w1, [x0,2]
	add	x0, x29, 2280
	mov	w1, 120
	strb	w1, [x0,3]
	add	x0, x29, 2280
	mov	w1, 120
	strb	w1, [x0,4]
	add	x0, x29, 2280
	mov	w1, 120
	strb	w1, [x0,5]
	add	x0, x29, 2272
	strb	wzr, [x0]
	add	x0, x29, 2272
	mov	w1, 121
	strb	w1, [x0,1]
	add	x0, x29, 2272
	mov	w1, 121
	strb	w1, [x0,2]
	add	x0, x29, 2272
	mov	w1, 121
	strb	w1, [x0,3]
	add	x0, x29, 2272
	mov	w1, 121
	strb	w1, [x0,4]
	add	x0, x29, 2272
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2280
	add	x1, x29, 2272
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2280
	add	x1, x29, 2272
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 331
	bl	assure
	add	x0, x29, 2264
	strb	wzr, [x0]
	add	x0, x29, 2264
	mov	w1, 120
	strb	w1, [x0,1]
	add	x0, x29, 2264
	mov	w1, 120
	strb	w1, [x0,2]
	add	x0, x29, 2264
	mov	w1, 120
	strb	w1, [x0,3]
	add	x0, x29, 2264
	mov	w1, 120
	strb	w1, [x0,4]
	add	x0, x29, 2264
	mov	w1, 120
	strb	w1, [x0,5]
	add	x0, x29, 2256
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2256
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2256
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2256
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2256
	strb	wzr, [x0,4]
	add	x0, x29, 2256
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2264
	add	x1, x29, 2256
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2264
	add	x1, x29, 2256
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 339
	bl	assure
	add	x0, x29, 2248
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2248
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2248
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2248
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2248
	strb	wzr, [x0,4]
	add	x0, x29, 2248
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2240
	strb	wzr, [x0]
	add	x0, x29, 2240
	mov	w1, 120
	strb	w1, [x0,1]
	add	x0, x29, 2240
	mov	w1, 120
	strb	w1, [x0,2]
	add	x0, x29, 2240
	mov	w1, 120
	strb	w1, [x0,3]
	add	x0, x29, 2240
	mov	w1, 120
	strb	w1, [x0,4]
	add	x0, x29, 2240
	mov	w1, 120
	strb	w1, [x0,5]
	add	x0, x29, 2248
	add	x1, x29, 2240
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2248
	add	x1, x29, 2240
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 347
	bl	assure
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	add	x0, x29, 2232
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2232
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2232
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2232
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2232
	strb	wzr, [x0,4]
	add	x0, x29, 2232
	mov	w1, 120
	strb	w1, [x0,5]
	add	x0, x29, 2224
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2224
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2224
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2224
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2224
	strb	wzr, [x0,4]
	add	x0, x29, 2224
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2232
	add	x1, x29, 2224
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2232
	add	x1, x29, 2224
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 358
	bl	assure
	add	x0, x29, 2216
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2216
	mov	w1, 111
	strb	w1, [x0,1]
	add	x0, x29, 2216
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2216
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2216
	strb	wzr, [x0,4]
	add	x0, x29, 2216
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2208
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2208
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2208
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2208
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2208
	strb	wzr, [x0,4]
	add	x0, x29, 2208
	mov	w1, 120
	strb	w1, [x0,5]
	add	x0, x29, 2216
	add	x1, x29, 2208
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2216
	add	x1, x29, 2208
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 366
	bl	assure
	add	x0, x29, 2200
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2200
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2200
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2200
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2200
	strb	wzr, [x0,4]
	add	x0, x29, 2200
	mov	w1, 120
	strb	w1, [x0,5]
	add	x0, x29, 2192
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2192
	mov	w1, 111
	strb	w1, [x0,1]
	add	x0, x29, 2192
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2192
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2192
	strb	wzr, [x0,4]
	add	x0, x29, 2192
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2200
	add	x1, x29, 2192
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2200
	add	x1, x29, 2192
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 374
	bl	assure
	add	x0, x29, 2184
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2184
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2184
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2184
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2184
	strb	wzr, [x0,4]
	add	x0, x29, 2184
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2176
	mov	w1, 114
	strb	w1, [x0]
	add	x0, x29, 2176
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2176
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2176
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2176
	strb	wzr, [x0,4]
	add	x0, x29, 2176
	mov	w1, 120
	strb	w1, [x0,5]
	add	x0, x29, 2184
	add	x1, x29, 2176
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2184
	add	x1, x29, 2176
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 382
	bl	assure
	add	x0, x29, 2168
	mov	w1, 114
	strb	w1, [x0]
	add	x0, x29, 2168
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2168
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2168
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2168
	strb	wzr, [x0,4]
	add	x0, x29, 2168
	mov	w1, 120
	strb	w1, [x0,5]
	add	x0, x29, 2160
	mov	w1, 82
	strb	w1, [x0]
	add	x0, x29, 2160
	mov	w1, 117
	strb	w1, [x0,1]
	add	x0, x29, 2160
	mov	w1, 116
	strb	w1, [x0,2]
	add	x0, x29, 2160
	mov	w1, 104
	strb	w1, [x0,3]
	add	x0, x29, 2160
	strb	wzr, [x0,4]
	add	x0, x29, 2160
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2168
	add	x1, x29, 2160
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2168
	add	x1, x29, 2160
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 390
	bl	assure
	add	x0, x29, 2152
	mov	w1, 66
	strb	w1, [x0]
	add	x0, x29, 2152
	mov	w1, 97
	strb	w1, [x0,1]
	add	x0, x29, 2152
	mov	w1, 98
	strb	w1, [x0,2]
	add	x0, x29, 2152
	mov	w1, 101
	strb	w1, [x0,3]
	add	x0, x29, 2152
	strb	wzr, [x0,4]
	add	x0, x29, 2152
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2136
	mov	w1, 66
	strb	w1, [x0]
	add	x0, x29, 2136
	mov	w1, 97
	strb	w1, [x0,1]
	add	x0, x29, 2136
	mov	w1, 98
	strb	w1, [x0,2]
	add	x0, x29, 2136
	mov	w1, 101
	strb	w1, [x0,3]
	add	x0, x29, 2136
	mov	w1, 82
	strb	w1, [x0,4]
	add	x0, x29, 2136
	mov	w1, 117
	strb	w1, [x0,5]
	add	x0, x29, 2136
	mov	w1, 116
	strb	w1, [x0,6]
	add	x0, x29, 2136
	mov	w1, 104
	strb	w1, [x0,7]
	add	x0, x29, 2136
	strb	wzr, [x0,8]
	add	x0, x29, 2136
	mov	w1, 120
	strb	w1, [x0,9]
	add	x0, x29, 2152
	add	x1, x29, 2136
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2152
	add	x1, x29, 2136
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 399
	bl	assure
	add	x0, x29, 2120
	mov	w1, 66
	strb	w1, [x0]
	add	x0, x29, 2120
	mov	w1, 97
	strb	w1, [x0,1]
	add	x0, x29, 2120
	mov	w1, 98
	strb	w1, [x0,2]
	add	x0, x29, 2120
	mov	w1, 101
	strb	w1, [x0,3]
	add	x0, x29, 2120
	mov	w1, 82
	strb	w1, [x0,4]
	add	x0, x29, 2120
	mov	w1, 117
	strb	w1, [x0,5]
	add	x0, x29, 2120
	mov	w1, 116
	strb	w1, [x0,6]
	add	x0, x29, 2120
	mov	w1, 104
	strb	w1, [x0,7]
	add	x0, x29, 2120
	strb	wzr, [x0,8]
	add	x0, x29, 2120
	mov	w1, 120
	strb	w1, [x0,9]
	add	x0, x29, 2112
	mov	w1, 66
	strb	w1, [x0]
	add	x0, x29, 2112
	mov	w1, 97
	strb	w1, [x0,1]
	add	x0, x29, 2112
	mov	w1, 98
	strb	w1, [x0,2]
	add	x0, x29, 2112
	mov	w1, 101
	strb	w1, [x0,3]
	add	x0, x29, 2112
	strb	wzr, [x0,4]
	add	x0, x29, 2112
	mov	w1, 121
	strb	w1, [x0,5]
	add	x0, x29, 2120
	add	x1, x29, 2112
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2120
	add	x1, x29, 2112
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 408
	bl	assure
	add	x0, x29, 2104
	mov	w1, 120
	strb	w1, [x0]
	add	x0, x29, 2104
	mov	w1, 121
	strb	w1, [x0,1]
	add	x0, x29, 2104
	strb	wzr, [x0,2]
	add	x0, x29, 2104
	mov	w1, 122
	strb	w1, [x0,3]
	add	x0, x29, 2104
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2104
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2096
	mov	w1, 121
	strb	w1, [x0]
	add	x0, x29, 2096
	mov	w1, 120
	strb	w1, [x0,1]
	add	x0, x29, 2096
	strb	wzr, [x0,2]
	add	x0, x29, 2096
	mov	w1, 122
	strb	w1, [x0,3]
	add	x0, x29, 2096
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2096
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2104
	add	x1, x29, 2096
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2104
	add	x1, x29, 2096
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 416
	bl	assure
	add	x0, x29, 2088
	mov	w1, 121
	strb	w1, [x0]
	add	x0, x29, 2088
	mov	w1, 120
	strb	w1, [x0,1]
	add	x0, x29, 2088
	strb	wzr, [x0,2]
	add	x0, x29, 2088
	mov	w1, 122
	strb	w1, [x0,3]
	add	x0, x29, 2088
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2088
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2080
	mov	w1, 120
	strb	w1, [x0]
	add	x0, x29, 2080
	mov	w1, 121
	strb	w1, [x0,1]
	add	x0, x29, 2080
	strb	wzr, [x0,2]
	add	x0, x29, 2080
	mov	w1, 122
	strb	w1, [x0,3]
	add	x0, x29, 2080
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2080
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2088
	add	x1, x29, 2080
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2088
	add	x1, x29, 2080
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 424
	bl	assure
	add	x0, x29, 2072
	mov	w1, 120
	strb	w1, [x0]
	add	x0, x29, 2072
	mov	w1, 120
	strb	w1, [x0,1]
	add	x0, x29, 2072
	strb	wzr, [x0,2]
	add	x0, x29, 2072
	mov	w1, 122
	strb	w1, [x0,3]
	add	x0, x29, 2072
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2072
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2064
	mov	w1, 121
	strb	w1, [x0]
	add	x0, x29, 2064
	strb	wzr, [x0,1]
	add	x0, x29, 2064
	mov	w1, 122
	strb	w1, [x0,2]
	add	x0, x29, 2064
	mov	w1, 122
	strb	w1, [x0,3]
	add	x0, x29, 2064
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2064
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2072
	add	x1, x29, 2064
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2072
	add	x1, x29, 2064
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 432
	bl	assure
	add	x0, x29, 2056
	mov	w1, 121
	strb	w1, [x0]
	add	x0, x29, 2056
	strb	wzr, [x0,1]
	add	x0, x29, 2056
	mov	w1, 122
	strb	w1, [x0,2]
	add	x0, x29, 2056
	mov	w1, 122
	strb	w1, [x0,3]
	add	x0, x29, 2056
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2056
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2048
	mov	w1, 120
	strb	w1, [x0]
	add	x0, x29, 2048
	mov	w1, 120
	strb	w1, [x0,1]
	add	x0, x29, 2048
	strb	wzr, [x0,2]
	add	x0, x29, 2048
	mov	w1, 122
	strb	w1, [x0,3]
	add	x0, x29, 2048
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2048
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2056
	add	x1, x29, 2048
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2056
	add	x1, x29, 2048
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 440
	bl	assure
	add	x0, x29, 2040
	mov	w1, 120
	strb	w1, [x0]
	add	x0, x29, 2040
	mov	w1, 121
	strb	w1, [x0,1]
	add	x0, x29, 2040
	mov	w1, 121
	strb	w1, [x0,2]
	add	x0, x29, 2040
	strb	wzr, [x0,3]
	add	x0, x29, 2040
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2040
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2032
	mov	w1, 121
	strb	w1, [x0]
	add	x0, x29, 2032
	mov	w1, 120
	strb	w1, [x0,1]
	add	x0, x29, 2032
	mov	w1, 120
	strb	w1, [x0,2]
	add	x0, x29, 2032
	strb	wzr, [x0,3]
	add	x0, x29, 2032
	mov	w1, 122
	strb	w1, [x0,4]
	add	x0, x29, 2032
	mov	w1, 122
	strb	w1, [x0,5]
	add	x0, x29, 2040
	add	x1, x29, 2032
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 2040
	add	x1, x29, 2032
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 448
	bl	assure
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	str	wzr, [x29,2300]
	b	.L23
.L24:
	add	x0, x29, 32
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 1032
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 32
	add	x1, x29, 1032
	bl	Str_compare
	str	w0, [x29,2296]
	add	x0, x29, 32
	add	x1, x29, 1032
	bl	strcmp
	str	w0, [x29,2292]
	ldr	w0, [x29,2296]
	bl	sign
	mov	w19, w0
	ldr	w0, [x29,2292]
	bl	sign
	cmp	w19, w0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 464
	bl	assure
	ldr	w0, [x29,2300]
	add	w0, w0, 1
	str	w0, [x29,2300]
.L23:
	ldr	w0, [x29,2300]
	cmp	w0, 9
	ble	.L24
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 2272
	add	sp, sp, 2272
	.cfi_def_cfa_offset 2240
	ret
	.cfi_endproc
.LFE7:
	.size	testCompare, .-testCompare
	.section	.rodata
	.align	3
.LC11:
	.string	"Testing Str_search()"
	.text
	.align	2
	.type	testSearch, %function
testSearch:
.LFB8:
	.cfi_startproc
	sub	sp, sp, #2432
	.cfi_def_cfa_offset 2432
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 2448
	.cfi_offset 29, -2448
	.cfi_offset 30, -2440
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	puts
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	ldrb	w0, [x0]
	strb	w0, [x29,2400]
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	ldrb	w0, [x0]
	strb	w0, [x29,2392]
	add	x0, x29, 2400
	add	x1, x29, 2392
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2400
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 488
	bl	assure
	add	x0, x29, 2384
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	ldrb	w0, [x0]
	strb	w0, [x29,2376]
	add	x0, x29, 2384
	add	x1, x29, 2376
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2384
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 496
	bl	assure
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	ldrb	w0, [x0]
	strb	w0, [x29,2368]
	add	x0, x29, 2360
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2368
	add	x1, x29, 2360
	bl	Str_search
	str	x0, [x29,2416]
	str	xzr, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 504
	bl	assure
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	add	x0, x29, 2352
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	adrp	x0, .LC14
	add	x0, x0, :lo12:.LC14
	ldrh	w0, [x0]
	strh	w0, [x29,2344]
	add	x0, x29, 2352
	add	x1, x29, 2344
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2352
	add	x0, x0, 3
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 515
	bl	assure
	add	x0, x29, 2336
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2328
	adrp	x1, .LC15
	add	x1, x1, :lo12:.LC15
	ldrh	w2, [x1]
	strh	w2, [x0]
	ldrb	w1, [x1,2]
	strb	w1, [x0,2]
	add	x0, x29, 2336
	add	x1, x29, 2328
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2336
	add	x0, x0, 2
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 523
	bl	assure
	add	x0, x29, 2320
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2312
	adrp	x1, .LC16
	add	x1, x1, :lo12:.LC16
	ldr	w2, [x1]
	str	w2, [x0]
	ldrb	w1, [x1,4]
	strb	w1, [x0,4]
	add	x0, x29, 2320
	add	x1, x29, 2312
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2320
	add	x0, x0, 1
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 531
	bl	assure
	add	x0, x29, 2304
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2296
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2304
	add	x1, x29, 2296
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2304
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 539
	bl	assure
	add	x0, x29, 2288
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2280
	adrp	x1, .LC17
	add	x1, x1, :lo12:.LC17
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2288
	add	x1, x29, 2280
	bl	Str_search
	str	x0, [x29,2416]
	str	xzr, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 547
	bl	assure
	add	x0, x29, 2272
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2264
	adrp	x1, .LC18
	add	x1, x1, :lo12:.LC18
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2272
	add	x1, x29, 2264
	bl	Str_search
	str	x0, [x29,2416]
	str	xzr, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 555
	bl	assure
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	ldr	w0, [x0]
	str	w0, [x29,2256]
	add	x0, x29, 2248
	adrp	x1, .LC20
	add	x1, x1, :lo12:.LC20
	ldrh	w2, [x1]
	strh	w2, [x0]
	ldrb	w1, [x1,2]
	strb	w1, [x0,2]
	add	x0, x29, 2256
	add	x1, x29, 2248
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2256
	add	x0, x0, 1
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 563
	bl	assure
	add	x0, x29, 2240
	adrp	x1, .LC21
	add	x1, x1, :lo12:.LC21
	ldr	w2, [x1]
	str	w2, [x0]
	ldrb	w1, [x1,4]
	strb	w1, [x0,4]
	add	x0, x29, 2232
	adrp	x1, .LC20
	add	x1, x1, :lo12:.LC20
	ldrh	w2, [x1]
	strh	w2, [x0]
	ldrb	w1, [x1,2]
	strb	w1, [x0,2]
	add	x0, x29, 2240
	add	x1, x29, 2232
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2240
	add	x0, x0, 2
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 571
	bl	assure
	add	x0, x29, 2224
	adrp	x1, .LC21
	add	x1, x1, :lo12:.LC21
	ldr	w2, [x1]
	str	w2, [x0]
	ldrb	w1, [x1,4]
	strb	w1, [x0,4]
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	ldr	w0, [x0]
	str	w0, [x29,2216]
	add	x0, x29, 2224
	add	x1, x29, 2216
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2224
	add	x0, x0, 1
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 579
	bl	assure
	add	x0, x29, 2208
	adrp	x1, .LC22
	add	x1, x1, :lo12:.LC22
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	ldr	w0, [x0]
	str	w0, [x29,2200]
	add	x0, x29, 2208
	add	x1, x29, 2200
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2208
	add	x0, x0, 2
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 587
	bl	assure
	add	x0, x29, 2192
	adrp	x1, .LC23
	add	x1, x1, :lo12:.LC23
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w2, [x1,4]
	strh	w2, [x0,4]
	ldrb	w1, [x1,6]
	strb	w1, [x0,6]
	add	x0, x29, 2184
	adrp	x1, .LC19
	add	x1, x1, :lo12:.LC19
	ldr	w1, [x1]
	str	w1, [x0]
	add	x0, x29, 2192
	add	x1, x29, 2184
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2192
	add	x0, x0, 3
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 595
	bl	assure
	add	x0, x29, 2176
	adrp	x1, .LC22
	add	x1, x1, :lo12:.LC22
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2168
	adrp	x1, .LC21
	add	x1, x1, :lo12:.LC21
	ldr	w2, [x1]
	str	w2, [x0]
	ldrb	w1, [x1,4]
	strb	w1, [x0,4]
	add	x0, x29, 2176
	add	x1, x29, 2168
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2176
	add	x0, x0, 1
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 603
	bl	assure
	add	x0, x29, 2160
	adrp	x1, .LC23
	add	x1, x1, :lo12:.LC23
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w2, [x1,4]
	strh	w2, [x0,4]
	ldrb	w1, [x1,6]
	strb	w1, [x0,6]
	add	x0, x29, 2152
	adrp	x1, .LC21
	add	x1, x1, :lo12:.LC21
	ldr	w2, [x1]
	str	w2, [x0]
	ldrb	w1, [x1,4]
	strb	w1, [x0,4]
	add	x0, x29, 2160
	add	x1, x29, 2152
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2160
	add	x0, x0, 2
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 611
	bl	assure
	add	x0, x29, 2144
	adrp	x1, .LC24
	add	x1, x1, :lo12:.LC24
	ldr	x1, [x1]
	str	x1, [x0]
	add	x0, x29, 2136
	adrp	x1, .LC21
	add	x1, x1, :lo12:.LC21
	ldr	w2, [x1]
	str	w2, [x0]
	ldrb	w1, [x1,4]
	strb	w1, [x0,4]
	add	x0, x29, 2144
	add	x1, x29, 2136
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2144
	add	x0, x0, 3
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 619
	bl	assure
	add	x0, x29, 2120
	adrp	x1, .LC25
	add	x1, x1, :lo12:.LC25
	ldr	x2, [x1]
	str	x2, [x0]
	ldrb	w1, [x1,8]
	strb	w1, [x0,8]
	add	x0, x29, 2112
	adrp	x1, .LC21
	add	x1, x1, :lo12:.LC21
	ldr	w2, [x1]
	str	w2, [x0]
	ldrb	w1, [x1,4]
	strb	w1, [x0,4]
	add	x0, x29, 2120
	add	x1, x29, 2112
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2120
	add	x0, x0, 4
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 627
	bl	assure
	add	x0, x29, 2104
	adrp	x1, .LC26
	add	x1, x1, :lo12:.LC26
	ldr	x1, [x1]
	str	x1, [x0]
	add	x0, x29, 2096
	adrp	x1, .LC27
	add	x1, x1, :lo12:.LC27
	ldr	w2, [x1]
	str	w2, [x0]
	ldrb	w1, [x1,4]
	strb	w1, [x0,4]
	add	x0, x29, 2104
	add	x1, x29, 2096
	bl	Str_search
	str	x0, [x29,2416]
	str	xzr, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 635
	bl	assure
	add	x0, x29, 2088
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2080
	adrp	x1, .LC26
	add	x1, x1, :lo12:.LC26
	ldr	x1, [x1]
	str	x1, [x0]
	add	x0, x29, 2088
	add	x1, x29, 2080
	bl	Str_search
	str	x0, [x29,2416]
	str	xzr, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 643
	bl	assure
	add	x0, x29, 2064
	adrp	x1, .LC28
	add	x1, x1, :lo12:.LC28
	ldr	x2, [x1]
	str	x2, [x0]
	ldrb	w1, [x1,8]
	strb	w1, [x0,8]
	add	x0, x29, 2056
	adrp	x1, .LC29
	add	x1, x1, :lo12:.LC29
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w1, [x1,4]
	strh	w1, [x0,4]
	add	x0, x29, 2064
	add	x1, x29, 2056
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2064
	add	x0, x0, 3
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 651
	bl	assure
	add	x0, x29, 2048
	adrp	x1, .LC30
	add	x1, x1, :lo12:.LC30
	ldr	w1, [x1]
	str	w1, [x0]
	add	x0, x29, 2040
	adrp	x1, .LC31
	add	x1, x1, :lo12:.LC31
	ldrh	w1, [x1]
	strh	w1, [x0]
	add	x0, x29, 2048
	add	x1, x29, 2040
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 2048
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 659
	bl	assure
	add	x0, x29, 2032
	adrp	x1, .LC32
	add	x1, x1, :lo12:.LC32
	ldr	w2, [x1]
	str	w2, [x0]
	ldrh	w2, [x1,4]
	strh	w2, [x0,4]
	ldrb	w1, [x1,6]
	strb	w1, [x0,6]
	add	x0, x29, 2024
	adrp	x1, .LC33
	add	x1, x1, :lo12:.LC33
	ldr	w1, [x1]
	str	w1, [x0]
	add	x0, x29, 2032
	add	x1, x29, 2024
	bl	Str_search
	str	x0, [x29,2416]
	str	xzr, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 667
	bl	assure
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	adrp	x0, stdout
	add	x0, x0, :lo12:stdout
	ldr	x0, [x0]
	bl	fflush
	str	wzr, [x29,2444]
	b	.L26
.L27:
	add	x0, x29, 24
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 1024
	mov	w1, 1
	bl	randomString
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	strstr
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 683
	bl	assure
	ldr	w0, [x29,2444]
	add	w0, w0, 1
	str	w0, [x29,2444]
.L26:
	ldr	w0, [x29,2444]
	cmp	w0, 9
	ble	.L27
	str	wzr, [x29,2440]
	b	.L28
.L29:
	add	x0, x29, 24
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 1024
	mov	w1, 2
	bl	randomString
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	strstr
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 697
	bl	assure
	ldr	w0, [x29,2440]
	add	w0, w0, 1
	str	w0, [x29,2440]
.L28:
	ldr	w0, [x29,2440]
	cmp	w0, 9
	ble	.L29
	str	wzr, [x29,2436]
	b	.L30
.L31:
	add	x0, x29, 24
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 1024
	mov	w1, 3
	bl	randomString
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	strstr
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 711
	bl	assure
	ldr	w0, [x29,2436]
	add	w0, w0, 1
	str	w0, [x29,2436]
.L30:
	ldr	w0, [x29,2436]
	cmp	w0, 9
	ble	.L31
	str	wzr, [x29,2432]
	b	.L32
.L33:
	add	x0, x29, 24
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 1024
	mov	w1, 4
	bl	randomString
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	strstr
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 725
	bl	assure
	ldr	w0, [x29,2432]
	add	w0, w0, 1
	str	w0, [x29,2432]
.L32:
	ldr	w0, [x29,2432]
	cmp	w0, 9
	ble	.L33
	str	wzr, [x29,2428]
	b	.L34
.L35:
	add	x0, x29, 24
	mov	w1, 1000
	bl	randomString
	add	x0, x29, 1024
	mov	w1, 5
	bl	randomString
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	Str_search
	str	x0, [x29,2416]
	add	x0, x29, 24
	add	x1, x29, 1024
	bl	strstr
	str	x0, [x29,2408]
	ldr	x1, [x29,2416]
	ldr	x0, [x29,2408]
	cmp	x1, x0
	cset	w0, eq
	uxtb	w0, w0
	mov	w1, 739
	bl	assure
	ldr	w0, [x29,2428]
	add	w0, w0, 1
	str	w0, [x29,2428]
.L34:
	ldr	w0, [x29,2428]
	cmp	w0, 9
	ble	.L35
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 2432
	add	sp, sp, 2432
	.cfi_def_cfa_offset 2416
	ret
	.cfi_endproc
.LFE8:
	.size	testSearch, .-testSearch
	.section	.rodata
	.align	3
.LC12:
	.string	""
	.align	3
.LC13:
	.string	"abcde"
	.align	3
.LC14:
	.string	"d"
	.align	3
.LC15:
	.string	"cd"
	.align	3
.LC16:
	.string	"bcde"
	.align	3
.LC17:
	.string	"abcdf"
	.align	3
.LC18:
	.string	"bcdef"
	.align	3
.LC19:
	.string	"aab"
	.align	3
.LC20:
	.string	"ab"
	.align	3
.LC21:
	.string	"aaab"
	.align	3
.LC22:
	.string	"aaaab"
	.align	3
.LC23:
	.string	"aaaaab"
	.align	3
.LC24:
	.string	"aaaaaab"
	.align	3
.LC25:
	.string	"aaaaaaab"
	.align	3
.LC26:
	.string	"abcdefg"
	.align	3
.LC27:
	.string	"abcg"
	.align	3
.LC28:
	.string	"aababaab"
	.align	3
.LC29:
	.string	"abaab"
	.align	3
.LC30:
	.string	"aaa"
	.align	3
.LC31:
	.string	"a"
	.align	3
.LC32:
	.string	"aabbcc"
	.align	3
.LC33:
	.string	"abc"
	.text
	.section	.rodata
	.align	3
.LC34:
	.string	"End of %s.\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29,28]
	str	x1, [x29,16]
	bl	setCpuTimeLimit
	bl	testGetLength
	bl	testCopy
	bl	testConcat
	bl	testCompare
	bl	testSearch
	ldr	x0, [x29,16]
	ldr	x1, [x0]
	adrp	x0, .LC34
	add	x0, x0, :lo12:.LC34
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align	3
	.type	__PRETTY_FUNCTION__.2654, %object
	.size	__PRETTY_FUNCTION__.2654, 13
__PRETTY_FUNCTION__.2654:
	.string	"randomString"
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-28)"
	.section	.note.GNU-stack,"",%progbits
