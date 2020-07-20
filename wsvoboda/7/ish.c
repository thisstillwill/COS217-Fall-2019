/*--------------------------------------------------------------------*/
/* ish.c                                                              */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <signal.h>
#include <assert.h>
#include "dynarray.h"
#include "syn.h"
#include "lex.h"
#include "command.h"
#include "readline.h"
#include "builtin.h"
#include "token.h"
#include "global.h"

/*--------------------------------------------------------------------*/

/* The name of the executable binary file. */
const char *pcPgmName;

/*--------------------------------------------------------------------*/

/* The file containing the temporary data generated by the program */
static FILE *psFile; /* Must be global. */

/*--------------------------------------------------------------------*/

/* A Signal handler that handles the signal iSignal. */
static void sigHandler(int iSignal)
{  
   unsigned int iTime; /* alarm time remaining */

   /* number of seconds before a SIGINT signal will be ignored again */ 
   enum {DELAY = 3};
   
   /* If a SIGINT signal is received, ignore it and start an alarm. If
      another SIGINT signal is received, check the time on the alarm. If
      there is time remaining, then exit. */
   if (iSignal == SIGINT)
   {
      iTime = alarm(DELAY);
      if (iTime > 0)
      {
         /* remove the file containing the program's temporary data */
         fclose(psFile);
         remove("temp.txt");
         exit(0);
      }
   }
}

/*--------------------------------------------------------------------*/

/* Helper function to use with DynArray_map. Given the token
   pvElement and pvExtra (unused), free pvElement. */
static void freeTokens(void *pvElement, void *pvExtra)
{
   Token_free((Token_T) pvElement);
}

/*--------------------------------------------------------------------*/

/* Uses a command name pcName and a list of arguments pcArgs to return
   a pointer to an array of pointers to null-terminated strings
   that represent the argument list available to the new program. */
static char** prepareArgs(char* pcName, DynArray_T pcArgs)
{
   char **pcArgv; /* array pointer */
   char *pcArg; /* current arg */
   size_t uLength; /* length of arg array */ 
   size_t u;

   assert(pcName != NULL);

   if (pcArgs != NULL)
   {
      /* allocate memory for the argument array */
      uLength = DynArray_getLength(pcArgs);
      pcArgv = (char**)malloc((uLength + 2) * sizeof(char*));
      if (pcArgv == NULL)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* set the values of the array */
      pcArgv[0] = pcName; /* first arg is file being executed */
      for (u = 1; u < uLength + 1; u++)
      {
         pcArg = DynArray_get(pcArgs, u - 1);
         pcArgv[u] = pcArg;
      }
      pcArgv[uLength + 1] = NULL; /* array ends with null pointer */
   }
   /* if there are no arguments, the array will only contain the name 
      of the program */
   else
   {
      pcArgv = (char**)malloc(2 * sizeof(char*));
      if (pcArgv == NULL)
      {perror(pcPgmName); exit(EXIT_FAILURE);}
      
      pcArgv[0] = pcName;
      pcArgv[1] = NULL;
   }

   return pcArgv;
}

/* Execute the command oCommand represented by the command name apcFile,
   the argument list argv, and the stdin/stdout redirect file names pcIn
   and pcOut. Return nothing if successful, and EXIT_FAILURE upon 
   failure. */
static void executeCommand(char* apcFile, char* argv[], char* pcIn,
                           char* pcOut)
{
   /* used for testing operation failure */
   int iFd; 
   int iRet;

   /* the permissions of the newly-created file. */
   enum {PERMISSIONS = 0600};

   assert(apcFile != NULL);
   
   /* TODO: redirect stdin/stdout if necessary */
   if (pcIn != NULL)
   {
      /* open file */
      iFd = open(pcIn, O_RDONLY);
      if (iFd == -1)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* close stdin */
      iRet = close(0);
      if (iRet == -1)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* duplicate file descriptor into spot taken by stdin */
      iRet = dup2(iFd, 0);
      if (iRet == -1)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* close file descriptor */
      iRet = close(iFd);
      if (iRet == -1)
      {perror(argv[0]); exit(EXIT_FAILURE);}
   }
   if (pcOut != NULL)
   {
      /* create file */
      iFd = creat(pcOut, PERMISSIONS);
      if (iFd == -1)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* close stdout */
      iRet = close(1);
      if (iRet == -1)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* duplicate file descriptor into spot taken by stdout */
      iRet = dup2(iFd, 1);
      if (iRet == -1)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* close file descriptor */
      iRet = close(iFd);
      if (iRet == -1)
      {perror(argv[0]); exit(EXIT_FAILURE);}
   }
   
   /* execute the command */
   execvp(apcFile, argv);

   {perror(pcPgmName); exit(EXIT_FAILURE);}
}

/* Read a line from stdin, lexically analyze it to create an array of 
   tokens, syntactically analyze it to produce a command, and then 
   execute it until EOF. Return 0. By convention, argc is the argument
   count and argv is the argument vector. */
int main(int argc, char *argv[])
{
   char **apcArgv; /* pointer to program arg list */
   char *apcFile; /* program name */
   char *pcIn; /* file name for stdin redirection */
   char *pcOut; /* file name for stdout redirection */
   char *pcLine; /* string representing line from stdin */
   DynArray_T oTokens; /* array of tokens */
   DynArray_T pcArgs; /* array of program args */
   Command_T oCommand; /* command processed from tokens */
   pid_t iPid; /* process id */
   int iRet; /* tests operation failure */
   void (*pfRet)(int); /* tests signal handler installation  */


   /* Install sigHandler as the handler for SIGINT signals. */
   pfRet = signal(SIGINT, sigHandler);
   if (pfRet == SIG_ERR)
   {perror(pcPgmName); exit(EXIT_FAILURE);}

   /* Ignore SIGALRM signals. */
   pfRet = signal(SIGALRM, SIG_IGN);
   if (pfRet == SIG_ERR)
   {perror(pcPgmName); exit(EXIT_FAILURE);}

   /* Initialize psFile to the file used for storing temporary data. */
   psFile = fopen("temp.txt", "w");
   
   /* Initialize the program name. */
   pcPgmName = argv[0];

   /* 1. Write to stdout a prompt consisting of a percent sign and a
      space. */
   printf("%% ");

   /* 2. Read a line (that is, an array of characters) from stdin. */
   while((pcLine = readLine(stdin)) != NULL)
   {
      /* 3. Write that line (array of characters) to stdout. */
      printf("%s\n", pcLine);

      /* 4. Flush the stdout buffer. */
      iRet = fflush(stdout);
      if (iRet == EOF)
      {perror(pcPgmName); exit(EXIT_FAILURE);}

      /* 5. Pass the line (array of characters) to your lexical
         analyzer to create a DynArray object containing tokens. */
      oTokens = lexLine(pcLine);

      if (oTokens != NULL)
      {
         /* 6. Pass the DynArray object containing tokens to your 
            syntactic analyzer to create a command. */
         oCommand = synTokens(oTokens);
         if (oCommand != NULL)
         {
            /* 7. Execute the command. */
            pcArgs = Command_getArgs(oCommand);
            pcIn = Command_getIn(oCommand);
            pcOut = Command_getOut(oCommand);
            apcFile = Command_getName(oCommand);

            /* Pass to built in function handler. */
            if (!handleBuiltIn(apcFile, pcArgs))
            {
               apcArgv = prepareArgs(apcFile, pcArgs);
               
               iRet = fflush(stdin);
               if (iRet == EOF)
               {perror(pcPgmName); exit(EXIT_FAILURE);}
               iRet = fflush(stdout);
               if (iRet == EOF)
               {perror(pcPgmName); exit(EXIT_FAILURE);}
               
               iPid = fork();
               if (iPid == -1)
               {perror(pcPgmName); exit(EXIT_FAILURE);}

               /* In child. */
               if (iPid == 0)
               {
                  /* Reset signal handling. */
                  pfRet = signal(SIGINT, SIG_DFL);
                  if (pfRet == SIG_ERR)
                  {perror(pcPgmName); exit(EXIT_FAILURE);}
                  pfRet = signal(SIGALRM, SIG_DFL);
                  if (pfRet == SIG_ERR)
                  {perror(pcPgmName); exit(EXIT_FAILURE);}
                  
                  executeCommand(apcFile, apcArgv, pcIn, pcOut);  
               }
               /* In parent. */
               else
               {
                  /* Ignore SIGINT signals. */
                  pfRet = signal(SIGINT, SIG_IGN);
                  if (pfRet == SIG_ERR)
                  {perror(pcPgmName); exit(EXIT_FAILURE);}
                  
                  /* Wait for child to finish. */
                  (void) wait(NULL);
               }
               
               /* Reinstall signal handler. */
               pfRet = signal(SIGINT, sigHandler);
               if (pfRet == SIG_ERR)
               {perror(pcPgmName); exit(EXIT_FAILURE);}
               
               free(apcArgv);
            }
            Command_free(oCommand);
         }
         DynArray_map(oTokens, freeTokens, NULL);
         DynArray_free(oTokens);
      }

      printf("%% ");
      free(pcLine);
   }
   /* remove the file containing the program's temporary data */
   fclose(psFile);
   remove("temp.txt");
   putchar('\n'); /* account for prompt */
   return 0;
}