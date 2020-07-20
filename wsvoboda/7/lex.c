/*--------------------------------------------------------------------*/
/* lex.c                                                              */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include "token.h"
#include "dynarray.h"
#include "lex.h"
#include "global.h"

/*--------------------------------------------------------------------*/

/* lexLine() uses a DFA approach.  It "reads" its characters from 
   pcLine. The DFA has these three states: */
enum LexState {STATE_START, STATE_IN_TOKEN, STATE_IN_TOKEN_QUOTE};

/*--------------------------------------------------------------------*/

/* Helper function to use with DynArray_map. Given the token
   pvElement and pvExtra (unused), free pvElement. */
static void freeTokens(void *pvElement, void *pvExtra)
{
   Token_free((Token_T) pvElement);
}

DynArray_T lexLine(const char *pcLine)
{
   /* The current state of the DFA. */
   enum LexState eState = STATE_START;

   /* An index into pcLine. */
   size_t uLineIndex = 0;

   /* Pointer to a buffer in which the characters comprising each
      token are accumulated. */
   char *pcBuffer;

   /* An index into the buffer. */
   int uBufferIndex = 0;

   /* A string that will contain only one character, to
      account for any special tokens encountered. */
   char specialBuffer[2] = {'\0', '\0'};   

   char c; /* current character */
   Token_T psTokenSpecial; /* special token */
   Token_T psTokenOrdinary; /* ordinary token */
   DynArray_T oTokens; /* token array */
   int iSuccessful; /* used for testing operation failure */

   assert(pcLine != NULL);

   /* Create an empty token DynArray object. */
   oTokens = DynArray_new(0);
   if (oTokens == NULL)
      exit(EXIT_FAILURE);

   /* Allocate memory for a buffer that is large enough to store the
      largest token that might appear within pcLine. */
   pcBuffer = (char*)malloc(strlen(pcLine) + 1);
   if (pcBuffer == NULL)
      exit(EXIT_FAILURE);

   for(;;)
   {
      /* "Read" the next character from pcLine. */
      c = pcLine[uLineIndex++];

      switch (eState)
      {
         /* Handle the START state. */
         case STATE_START:
            if (c == '\0')
            {
               free(pcBuffer);
               return oTokens;
            }
            else if (c == '<' || c == '>')
            {
               /* Create a SPECIAL token. */
               specialBuffer[0] = c;
               psTokenSpecial = Token_new(TOKEN_SPECIAL, specialBuffer);
               iSuccessful = DynArray_add(oTokens, psTokenSpecial);
               if (! iSuccessful)
               exit(EXIT_FAILURE);

               eState = STATE_START;
            }
            else if (c == '\"')
            {
               eState = STATE_IN_TOKEN_QUOTE;
            }
            else if (isspace(c))
               eState = STATE_START;
            else
            {
               pcBuffer[uBufferIndex++] = c;
               eState = STATE_IN_TOKEN;
            }
            break;

         /* Handle the IN_TOKEN state. */
         case STATE_IN_TOKEN:
            if (c == '\0')
            {
               /* Create an ORDINARY token. */
               pcBuffer[uBufferIndex] = '\0';
               psTokenOrdinary = Token_new(TOKEN_ORDINARY, pcBuffer);
               iSuccessful = DynArray_add(oTokens, psTokenOrdinary);
               if (! iSuccessful)
                  exit(EXIT_FAILURE);
               uBufferIndex = 0;

               free(pcBuffer);
               return oTokens;
            }
            else if (c == '<' || c == '>')
            {
               /* Create an ORDINARY token. */
               pcBuffer[uBufferIndex] = '\0';
               psTokenOrdinary = Token_new(TOKEN_ORDINARY, pcBuffer);
               iSuccessful = DynArray_add(oTokens, psTokenOrdinary);
               if (! iSuccessful)
                  exit(EXIT_FAILURE);
               uBufferIndex = 0;
               
               /* Create a SPECIAL token. */
               specialBuffer[0] = c;
               psTokenSpecial = Token_new(TOKEN_SPECIAL, specialBuffer);
               iSuccessful = DynArray_add(oTokens, psTokenSpecial);
               if (! iSuccessful)
                  exit(EXIT_FAILURE);
               
               eState = STATE_START;
            }
            else if (c == '\"')
            {
               eState = STATE_IN_TOKEN_QUOTE;
            }
            else if (isspace(c))
            {
               /* Create an ORDINARY token. */
               pcBuffer[uBufferIndex] = '\0';
               psTokenOrdinary = Token_new(TOKEN_ORDINARY, pcBuffer);
               iSuccessful = DynArray_add(oTokens, psTokenOrdinary);
               if (! iSuccessful)
                  exit(EXIT_FAILURE);
               uBufferIndex = 0;

               eState = STATE_START;
            }
            else
            {
               pcBuffer[uBufferIndex++] = c;
               eState = STATE_IN_TOKEN;
            }
            break;

         /* Handle the IN_TOKEN_QUOTE state. */
         case STATE_IN_TOKEN_QUOTE:
            if (c == '\0')
            {
               fprintf(stderr, "%s: unmatched quote\n", pcPgmName);
               free(pcBuffer);
               DynArray_map(oTokens, freeTokens, NULL);
               DynArray_free(oTokens);
               return NULL;
            }
            else if (c == '\"')
            {
               eState = STATE_IN_TOKEN;
            }
            else if (isspace(c))
            {
               pcBuffer[uBufferIndex++] = ' ';
               eState = STATE_IN_TOKEN_QUOTE;
            }
            else
            {
               pcBuffer[uBufferIndex++] = c;
               eState = STATE_IN_TOKEN_QUOTE;
            }
            break;

         default:
            assert(0);
            
      }
   }
}
