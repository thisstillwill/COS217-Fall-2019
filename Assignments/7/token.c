/*--------------------------------------------------------------------*/
/* token.c                                                            */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "token.h"

/*--------------------------------------------------------------------*/

/* A Token is an array containing a sequence of characters, as well as 
   a type designating it as either an ordinary or special token. */

struct Token
{
   /* The type of the token. */
   enum TokenType eType;

   /* The string which is the token's value */
   char *pcValue;
};

/*--------------------------------------------------------------------*/

Token_T Token_new(enum TokenType eTokenType, char *pcValue)
{
   Token_T oToken;

   assert(pcValue != NULL);

   /* allocate memory for the token */
   oToken = (struct Token*)malloc(sizeof(struct Token));
   if (oToken == NULL)
      return NULL;

   /* make a deep copy of pcValue */
   oToken->pcValue = (char*)malloc(strlen(pcValue) + 1);
   if (oToken->pcValue == NULL)
      return NULL;
   else
      strcpy(oToken->pcValue, pcValue);
   
   oToken->eType = eTokenType;
   
   return oToken;
}

/*--------------------------------------------------------------------*/

void Token_free(Token_T oToken)
{
   assert(oToken != NULL);

   free(oToken->pcValue);
   free(oToken);
}

/*--------------------------------------------------------------------*/

void Token_write(Token_T oToken)
{  
   assert(oToken != NULL);

   if (oToken->eType == TOKEN_ORDINARY)
      printf("Token: %s (ordinary)\n", oToken->pcValue);
   else
      printf("Token: %s (special)\n", oToken->pcValue); 
}

/*--------------------------------------------------------------------*/

char* Token_getToken(Token_T oToken)
{
   assert(oToken != NULL);

   return oToken->pcValue;
}

/*--------------------------------------------------------------------*/

enum TokenType Token_getType(Token_T oToken)
{
   assert(oToken != NULL);

   return oToken->eType;
}






