/*--------------------------------------------------------------------*/
/* ishlex.c                                                           */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <assert.h>
#include "dynarray.h"
#include "syn.h"
#include "lex.h"
#include "command.h"
#include "token.h"
#include "readline.h"
#include "global.h"

/*--------------------------------------------------------------------*/

/* The name of the executable binary file. */
const char *pcPgmName;

/*--------------------------------------------------------------------*/

/* Helper function to use with DynArray_map. Given the token 
   pvElement and pvExtra (unused), free pvElement. */
static void freeTokens(void *pvElement, void *pvExtra)
{
   Token_free((Token_T) pvElement);
}

/*--------------------------------------------------------------------*/

/* Read a line from stdin, lexically analyze it to create an array of 
   tokens, syntactically analyze it to produce a command, and then 
   write it to stdout until EOF. Return 0. By convention, argc is the 
   argument count and argv is the argument vector. */
int main(int argc, char *argv[])
{
   char *pcLine; /* string representing line from stdin */
   DynArray_T oTokens; /* array of tokens */
   Command_T oCommand; /* command processed from tokens */
   int iRet; /* used for testing operation failure */

   pcPgmName = argv[0];

   /* 1. Write to stdout a prompt consisting of a percent sign and a
      space. */
   printf("%% ");

   /* 2. Read a line (that is, an array of characters) from stdin. */
   while((pcLine = readLine(stdin)) != NULL)
   {
      /* 3. Write that line (array of characters) to stdout. */
      printf("%s\n", pcLine);

      /* 4. Flush the stdout buffer. */
      iRet = fflush(stdout);
      if (iRet == EOF)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* 5. Pass the line (array of characters) to your lexical
         analyzer to create a DynArray object containing tokens. */
      oTokens = lexLine(pcLine);

      if (oTokens != NULL)
      {
         /* 6. Pass the DynArray object containing tokens to your 
            syntactic analyzer to create a command. */
         oCommand = synTokens(oTokens);
         if (oCommand != NULL)
         {
            /* 7. Write the command to stdout, using precisely the 
               format specified in the Supplementary Information page. 
            */
            Command_write(oCommand);
            Command_free(oCommand);
         }
         DynArray_map(oTokens, freeTokens, NULL);
         DynArray_free(oTokens);
      }

      printf("%% ");
      free(pcLine);
   }
   putchar('\n'); /* account for prompt */

   return 0;
}
