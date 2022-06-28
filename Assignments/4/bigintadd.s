//----------------------------------------------------------------------
// bigintadd.s
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
        //--------------------------------------------------------------

        // Enumerated constants:
        .equ TRUE, 1
        .equ FALSE, 0

        // Must be a multiple of 16
        .equ LARGER_STACK_BYTECOUNT, 32 /* 8 bytes of padding */

        // Local variable stack offsets:
        .equ LLARGER, 8 /* signed */

        // Parameter stack offsets:
        .equ LLENGTH2, 16 /* signed */
        .equ LLENGTH1, 24 /* signed */

BigInt_larger:

        // prolog
        sub sp, sp, LARGER_STACK_BYTECOUNT
        str x30, [sp]
        str x0, [sp, LLENGTH1]
        str x1, [sp, LLENGTH2]

        // long lLarger

        // if (!(lLength1 > lLength2)) goto elseNotLarger
        ldr x0, [sp, LLENGTH1]
        ldr x1, [sp, LLENGTH2]
        cmp x0, x1
        ble elseNotLarger

        // lLarger = lLength1
        ldr x0, [sp, LLENGTH1]
        str x0, [sp, LLARGER]

        // goto endLargerCheck
        b endLargerCheck

elseNotLarger:

        // lLarger = lLength2;
        ldr x0, [sp, LLENGTH2]
        str x0, [sp, LLARGER]

endLargerCheck: 

        // epilog and return lLarger
        ldr x0, [sp, LLARGER]
        ldr x30, [sp]
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
        
        // Local variable stack offsets:
        .equ LSUMLENGTH, 8 /* signed */
        .equ LINDEX, 16 /* signed */
        .equ ULSUM, 24 /* unsigned */
        .equ ULCARRY, 32 /* unsigned */

        // Parameter stack offsets:
        .equ OSUM, 40 /* pointer to BigInt */
        .equ OADDEND2, 48 /* pointer to BigInt */
        .equ OADDEND1, 56 /* pointer to BigInt */

        // Structure field offsets:
        .equ LLENGTH, 0
        .equ AULDIGITS, 8

        .global BigInt_add
        
BigInt_add:

        // prolog
        sub sp, sp, ADD_STACK_BYTECOUNT
        str x30, [sp]
        str x0, [sp, OADDEND1]
        str x1, [sp, OADDEND2]
        str x2, [sp, OSUM]

        // unsigned long ulCarry
        // unsigned long ulSum
        // long lIndex
        // long lSumLength

        // Determine the larger length.
        // lSumLength = BigInt_larger(oAddend1->lLength,
        // oAddend2->lLength)
        ldr x0, [sp, OADDEND1] /* X0 contains oAddend1 */
        add x0, x0, LLENGTH
        ldr x0, [x0] /* X0 contains lLength */
        ldr x1, [sp, OADDEND2] /* X0 contains oAddend2 */
        add x1, x1, LLENGTH 
        ldr x1, [x1] /* X1 contains lLength */
        bl BigInt_larger
        str x0, [sp, LSUMLENGTH]

        // Clear oSum's array if necessary.
        // if (!(oSum->lLength > lSumLength)) goto endClearCheck
        ldr x0, [sp, OSUM] /* X0 contains oSum */
        add x0, x0, LLENGTH 
        ldr x0, [x0] /* X0 contains lLength */
        ldr x1, [sp, LSUMLENGTH] /* X1 contains lSumLength */
        cmp x0, x1
        ble endClearCheck

        // memset(oSum->aulDigits, 0, MAX_DIGITS *
        // sizeof(unsigned long))
        ldr x0, [sp, OSUM] /* X0 contains oSum */
        add x0, x0, AULDIGITS
        mov x1, 0
        mov x2, MAX_DIGITS
        lsl x2, x2, 3 /* multiply X2 by sizeof(unsigned long) */
        bl memset
        
endClearCheck:  
        
        // Perform the addition.
        // ulCarry = 0
        mov x0, 0
        str x0, [sp, ULCARRY]
        // lIndex = 0;
        mov x0, 0
        str x0, [sp, LINDEX]

addLoop:

        // if (!(lIndex < lSumLength)) goto endAddLoop
        ldr x0, [sp, LINDEX] /* X0 contains lIndex */
        ldr x1, [sp, LSUMLENGTH] /* X0 contains lSumLength */
        cmp x0, x1
        bge endAddLoop

        // ulSum = ulCarry
        ldr x0, [sp, ULCARRY] /* X0 contains ulCarry */
        str x0, [sp, ULSUM]
        
        // ulCarry = 0
        mov x0, 0
        str x0, [sp, ULCARRY]

        // ulSum += oAddend1->aulDigits[lIndex]
        ldr x0, [sp, ULSUM] /* X0 contains ulSum */
        ldr x1, [sp, OADDEND1] /* X1 contains oAddend1 */
        add x1, x1, AULDIGITS /* X1 contains oAddend1->aulDigits */
        ldr x2, [sp, LINDEX] /* X2 contains lIndex */
        ldr x1, [x1, x2, lsl 3]
        add x0, x0, x1
        str x0, [sp, ULSUM]

        // if (!(ulSum < oAddend1->aulDigits[lIndex])) goto
        // endOver1Check
        ldr x0, [sp, ULSUM] /* X0 contains ulSum */
        ldr x1, [sp, OADDEND1] /* X1 contains oAddend1 */
        add x1, x1, AULDIGITS /* X1 contains oAddend1->aulDigits */
        ldr x2, [sp, LINDEX] /* X2 contains lIndex */
        ldr x1, [x1, x2, lsl 3]
        cmp x0, x1
        bhs endOver1Check

        // ulCarry = 1
        mov x0, 1
        str x0, [sp, ULCARRY]

endOver1Check:

        // ulSum += oAddend2->aulDigits[lIndex]
        ldr x0, [sp, ULSUM] /* X0 contains ulSum */
        ldr x1, [sp, OADDEND2] /* X1 contains oAddend2 */
        add x1, x1, AULDIGITS /* X1 contains oAddend2->aulDigits */
        ldr x2, [sp, LINDEX] /* X2 contains lIndex */
        ldr x1, [x1, x2, lsl 3]
        add x0, x0, x1
        str x0, [sp, ULSUM]

        // if (!(ulSum < oAddend2->aulDigits[lIndex])) goto
        // endOver2Check
        ldr x0, [sp, ULSUM] /* X0 contains ulSum */
        ldr x1, [sp, OADDEND2] /* X1 contains oAddend2 */
        add x1, x1, AULDIGITS /* X1 contains oAddend2->aulDigits */
        ldr x2, [sp, LINDEX] /* X2 contains lIndex */
        ldr x1, [x1, x2, lsl 3]
        cmp x0, x1
        bhs endOver2Check

        // ulCarry = 1
        mov x0, 1
        str x0, [sp, ULCARRY]

endOver2Check:

        // oSum->aulDigits[lIndex] = ulSum
        ldr x0, [sp, OSUM]
        add x0, x0, AULDIGITS
        ldr x1, [sp, LINDEX]
        lsl x1, x1, 3
        add x0, x0, x1
        ldr x2, [sp, ULSUM]
        str x2, [x0]

        // lIndex++
        ldr x0, [sp, LINDEX] /* X0 contains lIndex */
        mov x1, x0
        add x1, x1, 1
        str x1, [sp, LINDEX]

        // goto addLoop
        b addLoop
        
endAddLoop:

        // Check for a carry out of the last "column" of the addition.
        // if (!(ulCarry == 1)) goto endCarryCheck
        ldr x0, [sp, ULCARRY] /* X0 contains ulCarry */
        cmp x0, 1
        bne endCarryCheck

        // if (!(lSumLength == MAX_DIGITS)) goto notMaxDigits
        ldr x0, [sp, LSUMLENGTH] /* X0 contains lSumLength */
        cmp x0, MAX_DIGITS
        bne notMaxDigits

        // epilog and return FALSE
        mov x0, FALSE
        ldr x30, [sp]
        add sp, sp, ADD_STACK_BYTECOUNT
        ret

        .size BigInt_add, (. - BigInt_add)
        
notMaxDigits:

        // oSum->aulDigits[lSumLength] = 1
        ldr x0, [sp, OSUM] /* X0 contains oSum */
        add x0, x0, AULDIGITS
        ldr x1, [sp, LSUMLENGTH]
        lsl x1, x1, 3
        add x0, x0, x1
        mov x2, 1
        str x2, [x0]

        // lSumLength++
        ldr x0, [sp, LSUMLENGTH] /* X0 contains lSumLength */
        mov x1, x0
        add x1, x1, 1
        str x1, [sp, LSUMLENGTH]
        
endCarryCheck:  

        // Set the length of the sum.
        // oSum->lLength = lSumLength
        ldr x0, [sp, OSUM] /* X0 contains lSumLength */
        add x0, x0, LLENGTH
        ldr x1, [sp, LSUMLENGTH]
        str x1, [x0]

        // epilog and return TRUE
        mov x0, TRUE
        ldr x30, [sp]
        add sp, sp, ADD_STACK_BYTECOUNT
        ret

        .size BigInt_add, (. - BigInt_add)
