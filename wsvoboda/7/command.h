/*--------------------------------------------------------------------*/
/* command.h                                                          */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#ifndef COMMAND_INCLUDED
#define COMMAND_INCLUDED

#include <stddef.h>
#include "dynarray.h"

/*--------------------------------------------------------------------*/

/* A Command_T object is a set of strings representing a command. */

typedef struct Command *Command_T;

/*--------------------------------------------------------------------*/

/* Return a new Command_T object whose command name is pcName, whose
   command arguments are pcArgs, and whose stdin/stdout redirection file
   names are pcIn and pcOut. */

Command_T Command_new(char *pcName, DynArray_T pcArgs, char *pcIn,
                      char *pcOut);

/*--------------------------------------------------------------------*/

/* Free oCommand. */

void Command_free(Command_T oCommand);

/*--------------------------------------------------------------------*/

/* Write oCommand to stdout. */

void Command_write(Command_T oCommand);

/*--------------------------------------------------------------------*/

/* Return the command name in oCommand. */

char* Command_getName(Command_T oCommand);

/*--------------------------------------------------------------------*/

/* Return the array containing the command arguments in 
   oCommand, or NULL if there aren't any. */

DynArray_T Command_getArgs(Command_T oCommand);

/*--------------------------------------------------------------------*/

/* Return the file name used for stdin redirection in
   oCommand, or NULL if it doesn't exist. */

char* Command_getIn(Command_T oCommand);

/*--------------------------------------------------------------------*/

/* Return the file name used for stdout redirection in 
   oCommand, or NULL if it doesn't exist */

char* Command_getOut(Command_T oCommand);

#endif
