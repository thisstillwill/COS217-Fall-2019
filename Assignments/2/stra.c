/*--------------------------------------------------------------------*/
/* stra.c                                                             */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include "str.h"
#include <assert.h>
#include <stddef.h>

/* Using a character array pcSrc[] as input, return the length of the 
   string represented within as an unsigned integer. */

size_t Str_getLength(const char pcSrc[])
{
   size_t uLength = 0;
   assert(pcSrc != NULL);
   while (pcSrc[uLength] != '\0')
      uLength++;
   return uLength;
}

/* Using two character arrays pcDest[] and pcSrc[] as input, copy the
   string represented within pcSrc[] into pcDest[] and return a pointer
   to the destination string. */

char *Str_copy(char pcDest[], const char pcSrc[])
{
   size_t i; 
   assert(pcDest != NULL && pcSrc != NULL); 
   for (i = 0; pcSrc[i] != '\0'; i++)
      pcDest[i] = pcSrc[i];
   pcDest[i] = '\0';
   return pcDest;
}

/* Using two character arrays pcDest[] and pcSrc[] as input, append the
   string represented within pcSrc[] to the end of the string 
   represented within pcDest[] and return a pointer to the destination
   string. */

char *Str_concat(char pcDest[], const char pcSrc[])
{
   size_t i;
   size_t AppendIndex = Str_getLength(pcDest);
   assert(pcDest != NULL && pcSrc != NULL);
   /* process pcSrc[] until the end of the string is reached, appending
      each character to the end of the string represented within 
      pcDest[] */
   for (i = 0; pcSrc[i] != '\0'; i++)
   {
      pcDest[AppendIndex] = pcSrc[i];
      AppendIndex++;
   }
   pcDest[AppendIndex] = '\0'; /* mark new end of string in pcDest[] */
   return pcDest;
}

/* Using two character arrays s1[] and s2[] as input, compare the two 
strings represented within. Return an integer less than, equal to, or 
greater than zero if s1 is found, respectively, to be less than, to 
match, or to be greater than s2. */

int Str_compare(const char s1[], const char s2[])
{
   size_t  i = 0;
   assert(s1 != NULL && s2 != NULL);
   /* process both arrays */
   while (1)
   {
      if (s1[i] < s2[i])
         return -1;
      else if (s1[i] > s2[i])
         return 1;
      /* continue processing if same character but not end of string */
      else if (s1[i] == s2[i] && s1[i] != '\0' && s2[i] != '\0')
         i++;
      else return 0; /* end of strings reached, so they are equal */
   }
}

/* Using two character arrays haystack[] and needle[] as input, find 
   the first occurrence of the substring represented within needle[] in
   the string represented within haystack[]. Return a pointer to the
   beginning of the substring, or NULL if the substring is not found. */

char *Str_search(const char haystack[], const char needle[])
{
      size_t i;
      size_t j;
      size_t k;
      char *p;
      assert(haystack != NULL && needle != NULL);
      /* corner cases if either haystack[] or needle[] only contain the
         null byte */
      if (needle[0] == '\0')
            return (char*) haystack;
      else if (haystack[0] == '\0')
         return NULL;
      for (i = 0; haystack[i] != '\0'; i++)
      {   
         /* if the current character being processed in haystack[]
            equals the first character in needle[], begin checking each
            of the subsequent characters in both arrays to see if they 
            match */
         if (needle[0] == haystack[i])
            {
               k = i + 1;
               for (j = 1; needle[j] != '\0'; j++)
               {
                  if (needle[j] != haystack[k])
                      break;
                  k = k + 1;
               }
               if (needle[j] == '\0')
               {
                  p = (char*) &haystack[i];
                  return p;
               }
            }
      }
      return NULL;
}
