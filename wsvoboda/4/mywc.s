//----------------------------------------------------------------------
// mywc.s
// Author: William Svoboda
//----------------------------------------------------------------------

        .section .rodata

printfFormatStr:
        .string "%7ld %7ld %7ld\n"
        
//----------------------------------------------------------------------
        
        .section .data

lLineCount:
        .quad 0

lWordCount:
        .quad 0

lCharCount:
        .quad 0

iInWord:
        .word 0

//----------------------------------------------------------------------
        
        .section .bss

iChar:
        .skip 4

//----------------------------------------------------------------------

        .section .text

        //--------------------------------------------------------------
        // Write to stdout counts of how many lines, words, and
        // characters are in stdin. A word is a sequence of
        // non-whitespace characters. Whitespace is defined by the
        // isspace() function. Return 0.
        // int main(void)
        //--------------------------------------------------------------

        // Must be a multiple of 16
        .equ MAIN_STACK_BYTECOUNT, 16
        
        .global main

main:
        // Prolog
        sub sp, sp, MAIN_STACK_BYTECOUNT
        str x30, [sp]

getCharLoop:

        // if ((iChar = getchar()) == EOF) goto endGetCharLoop
        // (iChar = getchar())
        bl getchar
        adr x1, iChar
        str w0, [x1] /* store the char in memory */
        // (iChar = getchar()) == EOF
        cmp w0, -1
        beq endGetCharLoop
        
        // lCharCount++
        adr x0, lCharCount
        ldr x1, [x0]
        add x1, x1, 1
        str x1, [x0]

        // if (!isspace(iChar) goto elseSpace
        adr x0, iChar
        ldr w0, [x0]
        bl isspace
        cmp w0, wzr
        beq elseSpace

        // if (!iInWord) goto endNotInWordCheck
        adr x0, iInWord
        ldr w0, [x0]
        cmp w0, wzr
        beq endNotInWordCheck

        // lWordCount++
        adr x0, lWordCount
        ldr x1, [x0]
        add x1, x1, 1
        str x1, [x0]

        // iInWord = FALSE
        adr x0, iInWord
        mov w1, 0
        str w1, [x0]

endNotInWordCheck:

        b endSpaceWordCheck
        
elseSpace:

        // if (iInWord) goto endInWordCheck
        adr x0, iInWord
        ldr w0, [x0]
        cmp w0, 1
        beq endInWordCheck

        // iInWord = TRUE
        adr x0, iInWord
        mov w1, 1
        str w1, [x0]
        
endInWordCheck: 

endSpaceWordCheck:      

        // if (!(iChar == '\n')) goto endNullCheck
        adr x0, iChar
        ldr w0, [x0]
        cmp w0, '\n'
        bne endNullCheck

        // lLineCount++
        adr x0, lLineCount
        ldr x1, [x0]
        add x1, x1, 1
        str x1, [x0]

endNullCheck:

        b getCharLoop

endGetCharLoop:

        // if (!iInWord) goto endFinalCheck
        adr x0, iInWord
        ldr w0, [x0]
        cmp w0, 0
        beq endFinalCheck

        // lWordCount++
        adr x0, lWordCount
        ldr x1, [x0]
        add x1, x1, 1
        str x1, [x0]

endFinalCheck:

        // printf("%7ld %7ld %7ld\n", lLineCount, lWordCount, lCharCount)
        adr x0, printfFormatStr
        adr x1, lLineCount
        ldr x1, [x1]
        adr x2, lWordCount
        ldr x2, [x2]
        adr x3, lCharCount
        ldr x3, [x3]
        bl printf
        
        // Epilog and return 0
        mov w0, 0
        ldr x30, [sp]
        add sp, sp, MAIN_STACK_BYTECOUNT
        ret

        .size main, (. - main)
