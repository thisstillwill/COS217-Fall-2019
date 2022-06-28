# 1 "strp.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "strp.c"





# 1 "str.h" 1





# 1 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 1 3 4
# 147 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 212 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 324 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 7 "str.h" 2






size_t Str_getLength(const char *pcSrc);




char *Str_copy(char *pcDest, const char *pcSrc);




char *Str_concat(char *pcDest, const char *pcSrc);




int Str_compare(const char *s1, const char *s2);





char *Str_search(const char *haystack, const char *needle);
# 7 "strp.c" 2
# 1 "/usr/include/assert.h" 1 3 4
# 36 "/usr/include/assert.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 375 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 392 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 393 "/usr/include/sys/cdefs.h" 2 3 4
# 376 "/usr/include/features.h" 2 3 4
# 399 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4
# 400 "/usr/include/features.h" 2 3 4
# 37 "/usr/include/assert.h" 2 3 4
# 65 "/usr/include/assert.h" 3 4



extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



# 8 "strp.c" 2
# 1 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 1 3 4
# 9 "strp.c" 2





size_t Str_getLength(const char *pcSrc)
{
   const char *pcEnd;
   ((pcSrc != ((void *)0)) ? (void) (0) : __assert_fail ("pcSrc != ((void *)0)", "strp.c", 17, __PRETTY_FUNCTION__));
   pcEnd = pcSrc;
   while (*pcEnd != '\0')
      pcEnd++;
   return (size_t)(pcEnd - pcSrc);
}





char *Str_copy(char *pcDest, const char *pcSrc)
{
   size_t index;
   const char *pcEnd;
   ((pcDest != ((void *)0) && pcSrc != ((void *)0)) ? (void) (0) : __assert_fail ("pcDest != ((void *)0) && pcSrc != ((void *)0)", "strp.c", 32, __PRETTY_FUNCTION__));
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






char *Str_concat(char *pcDest, const char *pcSrc)
{
   const char *pcEnd;
   size_t index;
   size_t AppendIndex = Str_getLength(pcDest);
   ((pcDest != ((void *)0) && pcSrc != ((void *)0)) ? (void) (0) : __assert_fail ("pcDest != ((void *)0) && pcSrc != ((void *)0)", "strp.c", 55, __PRETTY_FUNCTION__));



   for (pcEnd = pcSrc; *pcEnd != '\0'; pcEnd++)
   {
      index = pcEnd - pcSrc;
      *(pcDest + AppendIndex + index) = *pcEnd;
   }
   if (*pcDest != '\0')
      *(pcDest + AppendIndex + index + 1) = '\0';
   return pcDest;
}






int Str_compare(const char *s1, const char *s2)
{
   const char *pcEnd = s2;
   size_t index;
   ((s1 != ((void *)0) && s2 != ((void *)0)) ? (void) (0) : __assert_fail ("s1 != ((void *)0) && s2 != ((void *)0)", "strp.c", 78, __PRETTY_FUNCTION__));

   while (1)
   {
      index = pcEnd - s2;
      if (*(s1 + index) < *(s2 + index))
         return -1;
      if (*(s1 + index) > *(s2 + index))
         return 1;

      else if (*(s1 + index) == *(s2 + index) && *(s1 + index) != '\0'
               && *(s2 + index) != '\0')
         pcEnd++;
      else return 0;
   }
}







char *Str_search(const char *haystack, const char *needle)
{
   const char *haystackEnd;
   const char *needleEnd;
   char *p;
   size_t searchIndex;
   size_t checkIndex;
   size_t needleIndex;
   ((haystack != ((void *)0) && needle != ((void *)0)) ? (void) (0) : __assert_fail ("haystack != ((void *)0) && needle != ((void *)0)", "strp.c", 109, __PRETTY_FUNCTION__));


   if (*needle == '\0')
      return (char*) haystack;
   else if (*haystack == '\0')
      return ((void *)0);
   for (haystackEnd = haystack; *haystackEnd != '\0'; haystackEnd++)
   {
      searchIndex = haystackEnd - haystack;



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
   return ((void *)0);
}
