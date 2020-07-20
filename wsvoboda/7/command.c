/*--------------------------------------------------------------------*/
/* command.c                                                          */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "dynarray.h"
#include "command.h"

/*--------------------------------------------------------------------*/

/* A Command is a sequence of characters defining the name of a command,
   an array of strings representing the arguments of that command, and
   the names of files to be used for redirecting stdin and stdout 
   if necessary. */

struct Command
{
   /* The name of the command. */
   char *pcName;

   /* The arguments of the command. */
   DynArray_T pcArgs;

   /* The name of the file to which stdin is redirected. */
   char *pcIn;

   /* The name of the file to which stdin is redirected. */
   char *pcOut;
};

/*--------------------------------------------------------------------*/

Command_T Command_new(char *pcName, DynArray_T pcArgs, char *pcIn,
                      char *pcOut)
{
   Command_T oCommand;
   
   assert(pcName != NULL);

   /* allocate memory for the command */
   oCommand = (struct Command*)malloc(sizeof(struct Command));
   if (oCommand == NULL)
      return NULL;

   /* set parameters */
   oCommand->pcName = pcName;
   oCommand->pcArgs = pcArgs;
   oCommand->pcIn = pcIn;
   oCommand->pcOut = pcOut;
   
   return oCommand;
}

/*--------------------------------------------------------------------*/

void Command_free(Command_T oCommand)
{
   assert(oCommand != NULL);
   assert(oCommand->pcName != NULL);

   if (oCommand->pcArgs != NULL)
      DynArray_free(oCommand->pcArgs);

   free(oCommand);
}

/*--------------------------------------------------------------------*/

void Command_write(Command_T oCommand)
{
   char *pcArg;
   size_t u;
   size_t uLength;
   
   assert(oCommand != NULL);
   assert(oCommand->pcName != NULL);

   /* print the name of the command */
   printf("Command name: %s\n", oCommand->pcName);

   /* print each command argument */
   if (oCommand->pcArgs != NULL)
   {
      uLength = DynArray_getLength(oCommand->pcArgs);
      for (u = 0; u < uLength; u++)
      {
         pcArg = DynArray_get(oCommand->pcArgs, u);
         if (pcArg != NULL)
            printf("Command arg: %s\n", pcArg);
      }
   }

   /* print the names of the files used for redirection */
   if(oCommand->pcIn != NULL)
      printf("Command stdin: %s\n", oCommand->pcIn);
   if(oCommand->pcOut != NULL)
      printf("Command stdout: %s\n", oCommand->pcOut);
}

/*--------------------------------------------------------------------*/

char* Command_getName(Command_T oCommand)
{
   assert(oCommand != NULL);
   assert(oCommand->pcName != NULL);

   return oCommand->pcName;
}

/*--------------------------------------------------------------------*/

DynArray_T Command_getArgs(Command_T oCommand)
{
   assert(oCommand != NULL);
   assert(oCommand->pcName != NULL);

   return oCommand->pcArgs;
}

/*--------------------------------------------------------------------*/

char* Command_getIn(Command_T oCommand)
{
   assert(oCommand != NULL);
   assert(oCommand->pcName != NULL);

   return oCommand->pcIn;
}

/*--------------------------------------------------------------------*/

char* Command_getOut(Command_T oCommand)
{
   assert(oCommand != NULL);
   assert(oCommand->pcName != NULL);

   return oCommand->pcOut;
}
