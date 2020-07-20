/*--------------------------------------------------------------------*/
/* lex.h                                                              */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#ifndef LEXLINE_INCLUDED
#define LEXLINE_INCLUDED

#include <stddef.h>

/*--------------------------------------------------------------------*/

/* Lexically analyze string pcLine. If pcLine contains a lexical error,
   then return NULL. Otherwise return a DynArray object containing the
   tokens in pcLine. */

DynArray_T lexLine(const char *pcLine);

#endif
