/*--------------------------------------------------------------------*/
/* builtin.c                                                          */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <assert.h>
#include "dynarray.h"
#include "builtin.h"
#include "global.h"

/*--------------------------------------------------------------------*/

/* Enumerate true and false. */
enum bool {FALSE, TRUE};

/*--------------------------------------------------------------------*/

int handleBuiltIn(char* pcName, DynArray_T pcArgs)
{
   char env[] = "setenv"; /* string representing setenv command */
   char unenv[] = "unsetenv"; /* string representing unsetenv command */
   char cd[] = "cd"; /* string representing cd command */
   char ex[] = "exit"; /* string representing exit command */
   char empty[] = ""; /* empty string for setenv command argument */
   char home[] = "HOME"; /* string for getenv parameter */
   char *ptr; /* pointer for testing home environment variable */
   size_t uLength; /* length of argument array */
   int iRet; /* used for testing operation failure */

   assert(pcName != NULL);

   if (pcArgs != NULL)
      uLength = DynArray_getLength(pcArgs);
   
   /* *** setenv var [value] *** */
   if (strcmp(pcName, env) == 0)
   {
      if (pcArgs == NULL)
      {
         fprintf(stderr, "%s: missing variable\n", pcPgmName);
         return TRUE;
      }
      else if (uLength > 2)
      {
         fprintf(stderr, "%s: too many arguments\n", pcPgmName);
         return TRUE;
      }
      /* run the command */
      else
      {
         if (uLength == 1)
         {
            iRet = setenv(DynArray_get(pcArgs, 0), empty, TRUE);
            if (iRet == -1)
            {perror(pcPgmName); exit(EXIT_FAILURE);}
            return TRUE;
         }
         else
         {
            iRet = setenv(DynArray_get(pcArgs, 0),
                          DynArray_get(pcArgs, 1), TRUE);
            if (iRet == -1)
            {perror(pcPgmName); exit(EXIT_FAILURE);}
            return TRUE;
         }
      }
   }
   
   /* *** unsetenv var *** */
   if (strcmp(pcName, unenv) == 0)
   {
      if (pcArgs == NULL)
      {
         fprintf(stderr, "%s: missing variable\n", pcPgmName);
         return TRUE;
      }
      else if (uLength > 1)
      {
         fprintf(stderr, "%s: too many arguments\n", pcPgmName);
         return TRUE;
      }
      /* run the command */
      else
      {
         iRet = unsetenv(DynArray_get(pcArgs, 0));
         if (iRet == -1)
         {perror(pcPgmName); exit(EXIT_FAILURE);}
         return TRUE;
      }
   }

   /* *** cd [dir] *** */
   if (strcmp(pcName, cd) == 0)
   {
      if (pcArgs == NULL)
      {
         ptr = getenv(home);
         if (ptr == NULL)
         {
            fprintf(stderr, "%s: HOME not set\n", pcPgmName);
            return TRUE;
         }
      }
      else if (uLength > 1)
      {
         fprintf(stderr, "%s: too many arguments\n", pcPgmName);
         return TRUE;
      }
         /* run the command */
         if (pcArgs == NULL)
         {
            iRet = chdir(ptr);
            if (iRet == -1)
            {perror(pcPgmName); exit(EXIT_FAILURE);}
            return TRUE;
         }
         else
         {
            iRet = chdir(DynArray_get(pcArgs, 0));
            if (iRet == -1)
               /* {perror(pcPgmName); exit(EXIT_FAILURE);} */
               fprintf(stderr, "%s: No such file or directory\n", pcPgmName);
            return TRUE;
         }
      }
   
   /* *** exit *** */
   if (strcmp(pcName, ex) == 0)
   {
      if (pcArgs != NULL)
      {
         fprintf(stderr, "%s: too many arguments\n", pcPgmName);
         return TRUE;
      }
      /* run the command */
      else
      {
         exit(0);
      }
   }
   
   return FALSE; 
}
