/*--------------------------------------------------------------------*/
/* token.h                                                            */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#ifndef TOKEN_INCLUDED
#define TOKEN_INCLUDED

#include <stddef.h>

/*--------------------------------------------------------------------*/

/* A Token object can be either an ordinary token or a special token. */

enum TokenType {TOKEN_ORDINARY, TOKEN_SPECIAL};

/*--------------------------------------------------------------------*/

/* A Token_T object is an array containing a sequence of characters. */

typedef struct Token *Token_T;

/*--------------------------------------------------------------------*/

/* Return a new Token_T object whose type is eTokenType and whose value
   consists of string pcValue. The caller owns the token. */

Token_T Token_new(enum TokenType eTokenType, char *pcValue);

/*--------------------------------------------------------------------*/

/* Free oToken. */

void Token_free(Token_T oToken);

/*--------------------------------------------------------------------*/

/* Write oToken to stdout. */

void Token_write(Token_T oToken);

/*--------------------------------------------------------------------*/

/* Return a copy of the token in oToken. */

char* Token_getToken(Token_T oToken);

/*--------------------------------------------------------------------*/

/* Return a TokenType representing the type of the token in oToken. */

enum TokenType Token_getType(Token_T oToken);

#endif
