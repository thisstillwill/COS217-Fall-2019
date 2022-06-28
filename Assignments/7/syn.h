/*--------------------------------------------------------------------*/
/* syn.h                                                              */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#ifndef SYNTOKENS_INCLUDED
#define SYNTOKENS_INCLUDED

#include <stddef.h>
#include "command.h"

/* Syntactically analyze the array oTokens. If oTokens contains a 
   syntactic error return NULL. Otherwise return a Command_T object 
   representing a command. */

Command_T synTokens(DynArray_T oTokens);

#endif
