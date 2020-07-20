//----------------------------------------------------------------------
// bigintaddopt.s
// Author: William Svoboda
//----------------------------------------------------------------------

        .section rodata

//----------------------------------------------------------------------

        .section .data

//----------------------------------------------------------------------

        .section .bss

//----------------------------------------------------------------------

        .section .text
        
        //--------------------------------------------------------------
        // Return the larger of lLength1 and lLength2.
        // long BigInt_larger(long lLength1, long lLength2)
        //-------------------------------------------------------------

        // Enumerated constants:
        .equ TRUE, 1
        .equ FALSE, 0

        // Must be a multiple of 16
        .equ LARGER_STACK_BYTECOUNT, 32 /* 8 bytes of padding */

        // Local variable registers:
        LLARGER .req x21 // Callee-saved

        // Parameter registers:
        LLENGTH2 .req x20 // Callee-saved
        LLENGTH1 .req x19 // Callee-saved

BigInt_larger:

        // prolog
        sub sp, sp, LARGER_STACK_BYTECOUNT
        str x30, [sp] /* actually not needed to save all registers */
        str x19, [sp, 8]
        str x20, [sp, 16]
        str x21, [sp, 24]

        // Store parameters in registers
        mov LLENGTH1, x0
        mov LLENGTH2, x1

        // long lLarger

        // if (!(lLength1 > lLength2)) goto elseNotLarger
        cmp LLENGTH1, LLENGTH2
        ble elseNotLarger

        // lLarger = lLength1
        mov LLARGER, LLENGTH1

        // goto endLargerCheck
        b endLargerCheck

elseNotLarger:

        // lLarger = lLength2
        mov LLARGER, LLENGTH2

endLargerCheck:
        
        // epilog and return lLarger
        mov x0, LLARGER
        ldr x30, [sp]
        ldr x19, [sp, 8]
        ldr x20, [sp, 16]
        ldr x21, [sp, 24]
        add sp, sp, LARGER_STACK_BYTECOUNT
        ret

        .size BigInt_larger, (. - BigInt_larger) 
        
        //--------------------------------------------------------------
        // Assign the sum of oAddend1 and oAddend2 to oSum.  oSum
        // should be distinct from oAddend1 and oAddend2.  Return 0
        // (FALSE) if an overflow occurred, and 1 (TRUE) otherwise.
        // int BigInt_add(BigInt_T oAddend1, BigInt_T oAddend2,
        // BigInt_T oSum)
        //--------------------------------------------------------------

        // Enumerated constants:
        .equ MAX_DIGITS, 32768

        // Must be a multiple of 16
        .equ ADD_STACK_BYTECOUNT, 64 /* 8 bytes padding */

        // Local variable registers:
        LSUMLENGTH .req x14 /* Caller-saved */
        LINDEX .req x13 /* Caller-saved */
        ULSUM .req x12 /* Caller-saved */
        ULCARRY .req x11 /* Caller-saved */

        // Parameter registers:
        OSUM .req x10 /* Caller-saved */
        OADDEND2 .req x9 /* Caller-saved */
        OADDEND1 .req x8 /* Caller-saved */

        // Structure field offsets:
        .equ LLENGTH, 0
        .equ AULDIGITS, 8

        .global BigInt_add

BigInt_add:

        // prolog
        sub sp, sp, ADD_STACK_BYTECOUNT
        str x30, [sp]

        // Store parameters in registers
        mov OADDEND1, x0
        mov OADDEND2, x1
        mov OSUM, x2

        // unsigned long ulCarry
        // unsigned long ulSum
        // long lIndex
        // long lSumLength

        // Determine the larger length.
        // lSumLength = BigInt_larger(oAddend1->lLength,
        // oAddend2->lLength)
        mov x0, OADDEND1 /* X0 contains oAddend1 */
        add x0, x0, LLENGTH
        ldr x0, [x0] /* X0 contains lLength */
        mov x1, OADDEND2 /* X1 contains oAddend2 */
        add x1, x1, LLENGTH
        ldr x1, [x1] /* X1 contains lLength */
        bl BigInt_larger
        mov LSUMLENGTH, x0

        // Clear oSum's array if necessary.
        // if (!(oSum->lLength > lSumLength)) goto endClearCheck
        mov x0, OSUM /* X0 contains oSum */
        add x0, x0, LLENGTH
        ldr x0, [x0] /* X0 contains lLength */
        mov x1, LSUMLENGTH /* X1 contains lSumLength */
        cmp x0, x1
        ble endClearCheck

        // memset(oSum->aulDigits, 0, MAX_DIGITS *
        // sizeof(unsigned long))
        mov x0, OSUM /* X0 contains oSum */
        add x0, x0, AULDIGITS
        mov x1, 0
        mov x2, MAX_DIGITS
        lsl x2, x2, 3 /* multiply X2 by sizeof(unsigned long) */

        // save registers for later on stack
        str x8, [sp, 8] /* actually not needed to save all registers */
        str x9, [sp, 16]
        str x10, [sp, 24]
        str x11, [sp, 32]
        str x12, [sp, 40]
        str x13, [sp, 48]
        str x14, [sp, 56]
        
        bl memset

        // restore registers from stack
        ldr x8, [sp, 8]
        ldr x9, [sp, 16]
        ldr x10, [sp, 24]
        str x11, [sp, 32]
        str x12, [sp, 40]
        str x13, [sp, 48]
        str x14, [sp, 56]

endClearCheck:  

        // Perform the addition.
        // ulCarry = 0
        mov ULCARRY, 0
        // lIndex = 0
        mov LINDEX, 0

addLoop:

        // if (!(lIndex < lSumLength)) goto endAddLoop
        mov x0, LINDEX /* X0 contains lIndex */
        mov x1, LSUMLENGTH /* X1 contains lSumLength */
        cmp x0, x1
        bge endAddLoop

        // ulSum = ulCarry
        mov ULSUM, ULCARRY

        // ulCarry = 0
        mov ULCARRY, 0

        // ulSum += oAddend1->aulDigits[lIndex]
        mov x0, OADDEND1 /* X0 contains oAddend1 */
        add x0, x0, AULDIGITS /* X0 contains oAddend1->aulDigits */
        mov x1, LINDEX /* X1 contains lIndex */
        ldr x0, [x0, x1, lsl 3]
        add ULSUM, ULSUM, x0

        // if (!(ulSum < oAddend1->aulDigits[lIndex])) goto
        // endOver1Check
        mov x0, OADDEND1 /* X0 contains oAddend1 */
        add x0, x0, AULDIGITS /* X0 contains oAddend1->aulDigits */
        mov x1, LINDEX /* X1 contains lIndex */
        ldr x0, [x0, x1, lsl 3]
        cmp ULSUM, x0
        bhs endOver1Check

        // ulCarry = 1
        mov ULCARRY, 1

endOver1Check:

        // ulSum += oAddend2->aulDigits[lIndex]
        mov x0, OADDEND2 /* X0 contains oAddend2 */
        add x0, x0, AULDIGITS /* X0 contains oAddend2->aulDigits */
        mov x1, LINDEX /* X1 contains lIndex */
        ldr x0, [x0, x1, lsl 3]
        add ULSUM, ULSUM, x0

        // if (!(ulSum < oAddend2->aulDigits[lIndex])) goto
        // endOver2Check
        mov x0, OADDEND2 /* X0 contains oAddend2 */
        add x0, x0, AULDIGITS /* X0 contains oAddend2->aulDigits */
        mov x1, LINDEX /* X1 contains lIndex */
        ldr x0, [x0, x1, lsl 3]
        cmp ULSUM, x0
        bhs endOver2Check

        // ulCarry = 1
        mov ULCARRY, 1

endOver2Check:

        // oSum->aulDigits[lIndex] = ulSum
        mov x0, OSUM
        add x0, x0, AULDIGITS
        mov x1, LINDEX
        lsl x1, x1, 3
        add x0, x0, x1
        str ULSUM, [x0]

        // lIndex++
        add LINDEX, LINDEX, 1

        // goto addLoop
        b addLoop

endAddLoop:

        // Check for a carry out of the last "column" of the addition.
        // if (!(ulCarry == 1)) goto endCarryCheck
        cmp ULCARRY, 1
        bne endCarryCheck

        // if (!(lSumLength == MAX_DIGITS)) goto notMaxDigits
        cmp LSUMLENGTH, MAX_DIGITS
        bne notMaxDigits

        // epilog and return FALSE
        mov x0, FALSE
        ldr x30, [sp]
        add sp, sp, ADD_STACK_BYTECOUNT
        ret

        .size BigInt_add, (. - BigInt_add)

notMaxDigits:

        // oSum->aulDigits[lSumLength] = 1
        mov x0, OSUM
        add x0, x0, AULDIGITS
        mov x1, LINDEX
        lsl x1, x1, 3
        add x0, x0, x1
        mov x2, 1
        str x2, [x0]

        // lSumLength++
        add LSUMLENGTH, LSUMLENGTH, 1

endCarryCheck:

        // Set the length of the sum.
        // oSum->lLength = lSumLength
        mov x0, OSUM
        add x0, x0, LLENGTH
        str LSUMLENGTH, [x0]

        // epilog and return TRUE
        mov x0, TRUE
        ldr x30, [sp]
        add sp, sp, ADD_STACK_BYTECOUNT
        ret

        .size BigInt_add, (. - BigInt_add)
