/*--------------------------------------------------------------------*/
/* decomment.c                                                        */
/* Author: William Svoboda                                            */
/* NetID: wsvoboda                                                    */
/*--------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>

/* records current line number in main while reading from stdin */
int currentLine = 1;
int lineStart; /* records line number of most recent comment read */

enum Statetype {NORMAL, IN_STRING_LITERAL, STRING_LITERAL_BUFFER,
                IN_CHAR_LITERAL, CHAR_LITERAL_BUFFER,
                WARNING_IN_COMMENT, IN_COMMENT, WARNING_OUT_COMMENT};

/*--------------------------------------------------------------------*/

/* Implement the NORMAL state of the DFA. c is the current DFA 
character. Write c to stdout or switch states as specified by the DFA.
Return the next state */

enum Statetype handleNormalState(int c)
{
   enum Statetype state;
   if (c == '\"')
   {
      putchar(c);
      state = IN_STRING_LITERAL;
   }
   else if (c == '\'')
   {
      putchar(c);
      state = IN_CHAR_LITERAL;
   }
   else if (c == '/')
   {
      state = WARNING_IN_COMMENT;
   }
   else
   {
      putchar(c);
      state = NORMAL;
   }
   return state;
}

/*--------------------------------------------------------------------*/

/* Implement the IN_STRING_LITERAL state of the DFA. c is the current
DFA character. Write c to stdout and switch states as specified by the
DFA. Return the next state */

enum Statetype handleInStringLiteralState(int c)
{
   enum Statetype state;
   if (c == '\"')
   {
      putchar(c);
      state = NORMAL;
   }
   else if (c == '\\')
   {
      putchar(c);
      state = STRING_LITERAL_BUFFER;
   }
   else
   {
      putchar(c);
      state = IN_STRING_LITERAL;
   }
   return state;
}

/*--------------------------------------------------------------------*/

/* Implement the STRING_LITERAL_BUFFER state of the DFA. c is the 
current DFA character. Write c to std out and switch states back to
IN_STRING_LITERAL as specified by the DFA. Handles escaped characters.
Return the next state */

enum Statetype handleStringLiteralBufferState(int c)
{
   enum Statetype state;
   putchar(c);
   state = IN_STRING_LITERAL;
   return state;
}

/*--------------------------------------------------------------------*/

/* Implement the IN_CHAR_LITERAL state of the DFA. c is the current DFA
character. Write c to stdout and switch states as specified by the DFA.
Return the next state */

enum Statetype handleInCharLiteralState(int c)
{
   enum Statetype state;
   if (c == '\'')
   {
      putchar(c);
      state = NORMAL;
   }
   else if (c == '\\')
   {
      putchar(c);
      state = CHAR_LITERAL_BUFFER;
   }
   else {
      putchar(c);
      state = IN_CHAR_LITERAL;
   }
   return state;
}

/*--------------------------------------------------------------------*/

/* Implement the CHAR_LITERAL_BUFFER state of the DFA. c is the current
DFA character. Write c to stdout and switch states back to
IN_CHAR_LITERAL as specified by the DFA. Handles escaped characters.
Return the next character */

enum Statetype handleCharLiteralBufferState(int c)
{
   enum Statetype state;
   putchar(c);
   state = IN_CHAR_LITERAL;
   return state;
}

/*--------------------------------------------------------------------*/

/* Implement the WARNING_IN_COMMENT state of the DFA. c is the current
DFA character. Write c to stdout or switch states as specified by the 
DFA. Return the next state  */

enum Statetype handleWarningInCommentState(int c)
{
   enum Statetype state;
   if (c == '*')
   {
      putchar(' ');
      lineStart = currentLine;
      state = IN_COMMENT;
   }
   else if (c == '\"')
   {
      putchar('/');
      putchar(c);
      state = IN_STRING_LITERAL;
   }
   else if (c == '\'')
   {
      putchar('/');
      putchar(c);
      state = IN_CHAR_LITERAL;
   }
   else if (c == '/')
   {
      putchar(c);
      state = WARNING_IN_COMMENT;
   }
   else
   {
      putchar('/');
      putchar(c);
      state = NORMAL;
   }
   return state;
}

/*--------------------------------------------------------------------*/

/* Implement the IN_COMMENT state of the DFA. c is the current DFA
character. Switch states as specified by the DFA. Handles multiline
comments and preserves line numbering. Return the next state */

enum Statetype handleInCommentState(int c)
{
   enum Statetype state;
   if (c == '*')
   {
      state = WARNING_OUT_COMMENT;
   }
   else if (c == '\n')
   {
      putchar(c);
      state = IN_COMMENT;
   }
   else
   {
      state = IN_COMMENT;
   }
   return state;
}

/*--------------------------------------------------------------------*/

/* Implement the WARNING_OUT_COMMENT state of the DFA. c is the current
DFA character. Switch states as specified by the DFA. Handles multiline
comments and preserves line numbering. Return the next state */

enum Statetype handleWarningOutCommentState(int c)
{
   enum Statetype state;
   if (c == '/')
   {
      state = NORMAL;
   }
   else if (c == '*')
   {
      state = WARNING_OUT_COMMENT;
   }
   else if (c == '\n')
   {
      putchar(c);
      state = IN_COMMENT;
   }
   else
   {
      state = IN_COMMENT;
   }
   return state;
}

/*--------------------------------------------------------------------*/

/* Read text from stdin. Filters out comments using a DFA approach,
inserting blank lines as necessary to preserve line numbering and 
writing the result to stdout. Detects unterminated comments and returns 
EXIT_FAILURE, otherwise returns 0. */

int main(void)
{
   int c;
/* state indicates the DFA state */
   enum Statetype state = NORMAL;
   while ((c = getchar()) != EOF)
   {
      /* increment number of lines encountered in file if necessary */
      if (c == '\n')
      {
         currentLine++;
      }
      switch (state)
      {
         case NORMAL:
            state = handleNormalState(c);
            break;
         case IN_STRING_LITERAL:
            state = handleInStringLiteralState(c);
            break;
         case STRING_LITERAL_BUFFER:
            state = handleStringLiteralBufferState(c);
            break;
         case IN_CHAR_LITERAL:
            state = handleInCharLiteralState(c);
            break;
         case CHAR_LITERAL_BUFFER:
            state = handleCharLiteralBufferState(c);
            break;
         case WARNING_IN_COMMENT:
            state = handleWarningInCommentState(c);
            break;
         case IN_COMMENT:
            state = handleInCommentState(c);
            break;
         case WARNING_OUT_COMMENT:
            state = handleWarningOutCommentState(c);
            break;
      }
   }
   /* handle corner case when forward slash last character before EOF */
   if ( state == WARNING_IN_COMMENT)
   {
      putchar('/');
   }
   /* print line number of unterminated comment to stderr */
   if ((state == IN_COMMENT) || (state == WARNING_OUT_COMMENT))
      {
         fprintf(stderr, "Error: line %d: unterminated comment\n",
                 lineStart);
         return EXIT_FAILURE;
      }
      else return 0;
}
