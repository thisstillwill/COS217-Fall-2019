/*--------------------------------------------------------------------*/
/* str.h                                                              */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include <stddef.h>

#ifndef STR_H
#define STR_H

/* Return the length of string pcSrc as a size_t. */

size_t Str_getLength(const char *pcSrc);

/* Copy the string pcSrc into pcDest and return a pointer to the 
   destination string pcDest. */

char *Str_copy(char *pcDest, const char *pcSrc);

/* Append the string pcSrc onto the end of pcDest and return a pointer
   to the resulting string pcDest. */

char *Str_concat(char *pcDest, const char *pcSrc);

/* Compare the string s1 with s2 and return an integer <,==, or > to
zero if s1 is <, ==, or > than s2.  */

int Str_compare(const char *s1, const char *s2);

/* Find the first occurrence of the substring needle in the string 
   haystack and return a pointer to the beginning of the substring 
   or NULL if the substring is not found. */

char *Str_search(const char *haystack, const char *needle);

#endif
