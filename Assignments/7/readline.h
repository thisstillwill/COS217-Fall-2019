/*--------------------------------------------------------------------*/
/* readline.h                                                         */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#ifndef READLINE_INCLUDED
#define READLINE_INCLUDED

#include <stddef.h>

/*--------------------------------------------------------------------*/

/* Read a line from a file psFile and return it expressed as a string.
 */

char *readLine(FILE *psFile);

#endif
