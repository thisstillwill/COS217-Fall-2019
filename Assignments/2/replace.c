/*--------------------------------------------------------------------*/
/* replace.c                                                          */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include "str.h"
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

/*--------------------------------------------------------------------*/

/* If pcFrom is the empty string, then write string pcLine to stdout
   and return 0.  Otherwise write string pcLine to stdout with each
   distinct occurrence of string pcFrom replaced with string pcTo,
   and return a count of how many replacements were made.  Make no
   assumptions about the maximum number of replacements or the
   maximum number of characters in strings pcLine, pcFrom, or pcTo. */

static size_t replaceAndWrite(const char *pcLine,
                              const char *pcFrom, const char *pcTo)
{
   const char *replaceStart = pcLine;
   const char *pcEnd = pcLine;
   size_t pcFromSize = Str_getLength(pcFrom);
   size_t replacements = 0;
   assert(pcLine != NULL && pcFrom != NULL && pcTo != NULL);
   /* empty string case */
   if (*pcFrom == '\0')
   {
      printf("%s", pcLine);
      return replacements;
   }
   /* write pcLine to stdout with each distinct occurrence of pcFrom 
      replaced with pcTo */
   while (*pcEnd != '\0')
   {
      replaceStart = Str_search(replaceStart, pcFrom);
      if (replaceStart != NULL)
      {
         /* print all characters preceding substring pcFrom to stdout */
         while(pcEnd != replaceStart)
         {
            putchar (*pcEnd);
            pcEnd++;
         }
         /* print pcTo to stdout */
         printf("%s", pcTo);
         /* skip pcEnd past pcFrom in pcLine */
         pcEnd = replaceStart + pcFromSize;
         replaceStart = pcEnd;
         replacements++;
      }
      /* no more distinct occurrences of pcFrom, so write any remaining
         characters in pcLine */
      else
      {
         while(*pcEnd != '\0')
         {
            putchar(*pcEnd);
            pcEnd++;
         }
      }
   }
   return replacements;
}

/*--------------------------------------------------------------------*/

/* If argc is unequal to 3, then write an error message to stderr and
   return EXIT_FAILURE.  Otherwise...
   If argv[1] is the empty string, then write each line of stdin to
   stdout, write a message to stderr indicating that 0 replacements
   were made, and return 0.  Otherwise...
   Write each line of stdin to stdout with each distinct occurrence of
   argv[1] replaced with argv[2], write a message to stderr indicating
   how many replacements were made, and return 0.
   Assume that no line of stdin consists of more than MAX_LINE_SIZE-1
   characters. */

int main(int argc, char *argv[])
{
   enum {MAX_LINE_SIZE = 4096};
   enum {PROPER_ARG_COUNT = 3};

   char acLine[MAX_LINE_SIZE];
   char *pcFrom;
   char *pcTo;
   size_t uReplaceCount = 0;

   if (argc != PROPER_ARG_COUNT)
   {
      fprintf(stderr, "usage: %s fromstring tostring\n", argv[0]);
      return EXIT_FAILURE;
   }

   pcFrom = argv[1];
   pcTo = argv[2];

   while (fgets(acLine, MAX_LINE_SIZE, stdin) != NULL)
   {
      uReplaceCount += replaceAndWrite(acLine, pcFrom, pcTo);
   }

   fprintf(stderr, "%lu replacements\n", (unsigned long)uReplaceCount);
   return 0;
}
