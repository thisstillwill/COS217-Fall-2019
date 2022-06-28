/*--------------------------------------------------------------------*/
/* strp.c                                                             */
/* Author: William Svoboda                                            */
/*--------------------------------------------------------------------*/

#include "str.h"
#include <assert.h>
#include <stddef.h>

/* Using a pointer to a character array *pcSrc as input, return the
   length of the string (pointed to in memory) represented within 
   pcSrc[] as an unsigned integer. */

size_t Str_getLength(const char *pcSrc)
{
   const char *pcEnd;
   assert(pcSrc != NULL);
   pcEnd = pcSrc;
   while (*pcEnd != '\0')
      pcEnd++;
   return (size_t)(pcEnd - pcSrc);
}

/* Using two pointers to character arrays *pcDest and *pcSrc as input,
   copy the string represented within pcSrc[] into pcDest[] and return
   a pointer to the destination string. */

char *Str_copy(char *pcDest, const char *pcSrc)
{
   size_t index;
   const char *pcEnd;
   assert(pcDest != NULL && pcSrc != NULL);
   for (pcEnd = pcSrc; *pcEnd != '\0'; pcEnd++)
   {
      index = pcEnd - pcSrc;
      *(pcDest + index) = *pcEnd; 
   }
   if (*pcSrc == '\0')
      *pcDest = '\0';
   else
   *(pcDest + index + 1) = '\0';
   return pcDest;
}

/* Using two pointers to character arrays *pcDest and *pcSrc as input,
   append the string represented within pcSrc[] to the end of the string
   represented within pcDest[] and return a pointer to the destination 
   string. */

char *Str_concat(char *pcDest, const char *pcSrc)
{
   const char *pcEnd;
   size_t index;
   size_t AppendIndex = Str_getLength(pcDest);
   assert(pcDest != NULL && pcSrc != NULL);
   /* increment pcSrc until the end of the string in pcSrc[] is reached,
      appending each character to the end of the string represented
      within pcDest[]. */
   for (pcEnd = pcSrc; *pcEnd != '\0'; pcEnd++)
   {
      index = pcEnd - pcSrc;
      *(pcDest + AppendIndex + index) = *pcEnd;
   }
   if (*pcDest != '\0')
      *(pcDest + AppendIndex + index + 1) = '\0';
   return pcDest;
}

/* Using two pointers to character arrays *s1 and *s2, compare the two
strings represented within s1[] and s2[]. Return an integer less than,
equal to, or greater than zero if s1 is found, respectively, to be less
than, to match, or to be greater than s2. */

int Str_compare(const char *s1, const char *s2)
{
   const char *pcEnd = s2;
   size_t index;
   assert(s1 != NULL && s2 != NULL);
   /* process both strings */
   while (1)
   {
      index = pcEnd - s2;
      if (*(s1 + index) < *(s2 + index))
         return -1;
      if (*(s1 + index) > *(s2 + index))
         return 1;
      /* continue processing if same character but not end of string */
      else if (*(s1 + index) == *(s2 + index) && *(s1 + index) != '\0'
               && *(s2 + index) != '\0')
         pcEnd++;
      else return 0;
   }
}

/* Using two pointers to character arrays *haystack and *needle as 
   input, find the first occurrence of the substring represented within
   needle[] in the string represented within haystack[]. Return a 
   pointer to the beginning of the substring, or NULL if the substring 
   is not found. */

char *Str_search(const char *haystack, const char *needle)
{
   const char *haystackEnd;
   const char *needleEnd;
   char *p;
   size_t searchIndex;
   size_t checkIndex;
   size_t needleIndex;
   assert(haystack != NULL && needle != NULL);
   /* corner cases if either haystack[] or needle[] only contain the 
      null byte. */
   if (*needle == '\0')
      return (char*)  haystack;
   else if (*haystack == '\0')
      return NULL;
   for (haystackEnd = haystack; *haystackEnd != '\0'; haystackEnd++)
   {
      searchIndex = haystackEnd - haystack;
      /* if the current character being processed in haystack[] equals 
         the first character in needle[], begin checking each of the
         subsequent characters in both arrays to see if they match */
      if (*needle == *(haystack + searchIndex))
      {
         checkIndex = searchIndex + 1;
         for (needleEnd = needle + 1; *needleEnd != '\0'; needleEnd++)
         {
            needleIndex = needleEnd - needle;
            if (*(needle + needleIndex) != *(haystack + checkIndex))
               break;
            checkIndex = checkIndex + 1;
         }
         if (*(needle + (needleEnd - needle)) == '\0')
         {
            p = (char*) haystack + searchIndex;
            return p;
         }
      }
   }
   return NULL;
}
