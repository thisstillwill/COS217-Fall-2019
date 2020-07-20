/*--------------------------------------------------------------------*/
/* builtin.h                                                          */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#ifndef BUILTIN_INCLUDED
#define BUILTIN_INCLUDED

#include <stddef.h>
#include "dynarray.h"

/*--------------------------------------------------------------------*/

/* Using the name of a command pcName and its arguments pcArgs, 
   determine if the command is a built in one. If it is, execute it and
   return 1 (TRUE), otherwise return 0 (FALSE). */

int handleBuiltIn(char* pcName, DynArray_T pcArgs);

#endif
