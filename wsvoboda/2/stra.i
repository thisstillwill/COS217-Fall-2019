# 1 "stra.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "stra.c"





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
# 7 "stra.c" 2
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



# 8 "stra.c" 2
# 1 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 1 3 4
# 9 "stra.c" 2




size_t Str_getLength(const char pcSrc[])
{
   size_t uLength = 0;
   ((pcSrc != ((void *)0)) ? (void) (0) : __assert_fail ("pcSrc != ((void *)0)", "stra.c", 16, __PRETTY_FUNCTION__));
   while (pcSrc[uLength] != '\0')
      uLength++;
   return uLength;
}





char *Str_copy(char pcDest[], const char pcSrc[])
{
   size_t i;
   ((pcDest != ((void *)0) && pcSrc != ((void *)0)) ? (void) (0) : __assert_fail ("pcDest != ((void *)0) && pcSrc != ((void *)0)", "stra.c", 29, __PRETTY_FUNCTION__));
   for (i = 0; pcSrc[i] != '\0'; i++)
      pcDest[i] = pcSrc[i];
   pcDest[i] = '\0';
   return pcDest;
}






char *Str_concat(char pcDest[], const char pcSrc[])
{
   size_t i;
   size_t AppendIndex = Str_getLength(pcDest);
   ((pcDest != ((void *)0) && pcSrc != ((void *)0)) ? (void) (0) : __assert_fail ("pcDest != ((void *)0) && pcSrc != ((void *)0)", "stra.c", 45, __PRETTY_FUNCTION__));



   for (i = 0; pcSrc[i] != '\0'; i++)
   {
      pcDest[AppendIndex] = pcSrc[i];
      AppendIndex++;
   }
   pcDest[AppendIndex] = '\0';
   return pcDest;
}






int Str_compare(const char s1[], const char s2[])
{
   size_t i = 0;
   ((s1 != ((void *)0) && s2 != ((void *)0)) ? (void) (0) : __assert_fail ("s1 != ((void *)0) && s2 != ((void *)0)", "stra.c", 66, __PRETTY_FUNCTION__));

   while (1)
   {
      if (s1[i] < s2[i])
         return -1;
      else if (s1[i] > s2[i])
         return 1;

      else if (s1[i] == s2[i] && s1[i] != '\0' && s2[i] != '\0')
         i++;
      else return 0;
   }
}






char *Str_search(const char haystack[], const char needle[])
{
      size_t i;
      size_t j;
      size_t k;
      char *p;
      ((haystack != ((void *)0) && needle != ((void *)0)) ? (void) (0) : __assert_fail ("haystack != ((void *)0) && needle != ((void *)0)", "stra.c", 92, __PRETTY_FUNCTION__));


      if (needle[0] == '\0')
            return (char*) haystack;
      else if (haystack[0] == '\0')
         return ((void *)0);
      for (i = 0; haystack[i] != '\0'; i++)
      {




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
      return ((void *)0);
}
