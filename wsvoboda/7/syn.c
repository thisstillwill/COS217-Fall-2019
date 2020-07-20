/*--------------------------------------------------------------------*/
/* syn.c                                                              */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "dynarray.h"
#include "token.h"
#include "command.h"
#include "syn.h"
#include "global.h"

/*--------------------------------------------------------------------*/

Command_T synTokens(DynArray_T oTokens)
{  
   Command_T oCommand; /* command to return */
   Token_T curr = NULL; /* current token */
   Token_T next = NULL; /* next token */
   char *pcName; /* name of command */
   DynArray_T pcArgs; /* array of program args */
   char *pcIn = NULL; /* file name for stdin redirection */
   char *pcOut = NULL; /* file name for stdout redirection */
   size_t uLength; /* length of token array */
   size_t u;
   int iSuccessful; /* used for testing operation failure */

   char stdin[] = "<"; /* string representing stdin redirect token */
   char stdout[] = ">"; /* string representing stdout redirect token */

   assert(oTokens != NULL);

   /* Check that the first token is an ordinary token. If it is, set 
      pcName to its value. */
   if (DynArray_getLength(oTokens) == 0)
      return NULL;
   curr = DynArray_get(oTokens, 0); /* get first token */
   if (Token_getType(curr) == TOKEN_SPECIAL || curr == NULL)
   {
      fprintf(stderr, "%s: missing command name\n", pcPgmName);
      return NULL;
   }
   pcName = Token_getToken(curr);

   pcArgs = DynArray_new(0);
   if (pcArgs == NULL)
      exit(EXIT_FAILURE);

   /* Process the rest of the array. */
   uLength = DynArray_getLength(oTokens);
   for (u = 1; u < uLength; u++)
   {
      /* Get the token at the current index, and the next token if 
         possible. */
      curr = DynArray_get(oTokens, u);
      if (u < (uLength - 1))
         next = DynArray_get(oTokens, u + 1);
      if (curr == NULL)
      {
         fprintf(stderr, "%s: invalid token\n", pcPgmName);
         perror(pcPgmName);
         exit(EXIT_FAILURE);
      }
      
      /* Syntactically analyze the current token. If the current token 
         is a redirect token look at the next token. */
      if (Token_getType(curr) == TOKEN_SPECIAL)
      {
         /* stdin redirect */
         if (strcmp(Token_getToken(curr), stdin) == 0)
         {
            if (next == NULL || Token_getType(next) == TOKEN_SPECIAL)
            {
               fprintf(stderr, "%s: standard input redirection without file name\n",
                       pcPgmName);
               DynArray_free(pcArgs);
               return NULL;
            }
            if (pcIn != NULL)
            {
               fprintf(stderr, "%s: multiple redirection of standard input\n",
                       pcPgmName);
               DynArray_free(pcArgs);
               return NULL;
            }
            else
            {
               pcIn = Token_getToken(next);
               u++;
            }
         }
         /* stdout redirect */
         else if (strcmp(Token_getToken(curr), stdout) == 0)
         {
            if (next == NULL || Token_getType(next) == TOKEN_SPECIAL)
            {
               fprintf(stderr, "%s: standard output redirection without file name\n",
                       pcPgmName);
               DynArray_free(pcArgs);
               return NULL;
            }
            if (pcOut != NULL)
            {
               fprintf(stderr, "%s: multiple redirection of standard output\n",
                       pcPgmName);
               DynArray_free(pcArgs);
               return NULL;
            }
            else
            {
               pcOut = Token_getToken(next);
               u++;
            }
         }
      }
      /* command argument */
      else
      {
         iSuccessful = DynArray_add(pcArgs, Token_getToken(curr));
         if (! iSuccessful)
            exit(EXIT_FAILURE);
      }

      next = NULL;
   }

   /* Create the command. */
   if (DynArray_getLength(pcArgs) == 0)
   {
      DynArray_free(pcArgs);
      pcArgs = NULL;
   }
   oCommand = Command_new(pcName, pcArgs, pcIn, pcOut);

   return oCommand;
}
