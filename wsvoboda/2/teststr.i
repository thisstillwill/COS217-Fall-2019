# 1 "teststr.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "teststr.c"





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
# 7 "teststr.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
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
# 28 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 1 3 4
# 34 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/bits/types.h" 1 3 4
# 27 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 28 "/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 130 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 131 "/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 36 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;

# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 32 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 33 "/usr/include/libio.h" 2 3 4
# 50 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 51 "/usr/include/libio.h" 2 3 4
# 145 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 155 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 178 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 246 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 294 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 303 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 339 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 391 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 435 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 465 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 75 "/usr/include/stdio.h" 2 3 4
# 108 "/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;




# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));














extern FILE *tmpfile (void) ;
# 209 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;

# 232 "/usr/include/stdio.h" 3 4





extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 266 "/usr/include/stdio.h" 3 4






extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 295 "/usr/include/stdio.h" 3 4

# 329 "/usr/include/stdio.h" 3 4



extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

# 351 "/usr/include/stdio.h" 3 4





extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));

# 420 "/usr/include/stdio.h" 3 4





extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 463 "/usr/include/stdio.h" 3 4

# 526 "/usr/include/stdio.h" 3 4





extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 565 "/usr/include/stdio.h" 3 4








extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 617 "/usr/include/stdio.h" 3 4





extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 638 "/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__deprecated__));


# 684 "/usr/include/stdio.h" 3 4





extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 744 "/usr/include/stdio.h" 3 4





extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 792 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 815 "/usr/include/stdio.h" 3 4

# 824 "/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

# 841 "/usr/include/stdio.h" 3 4





extern void perror (const char *__s);






# 1 "/usr/include/bits/sys_errlist.h" 1 3 4
# 854 "/usr/include/stdio.h" 2 3 4
# 943 "/usr/include/stdio.h" 3 4

# 8 "teststr.c" 2
# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 1 3 4
# 33 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

# 60 "/usr/include/string.h" 3 4


extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 92 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 123 "/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 207 "/usr/include/string.h" 3 4

# 232 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 259 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 278 "/usr/include/string.h" 3 4



extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 311 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 338 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 393 "/usr/include/string.h" 3 4


extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

# 407 "/usr/include/string.h" 3 4


extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 447 "/usr/include/string.h" 3 4
extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 642 "/usr/include/string.h" 3 4

# 9 "teststr.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/aarch64-redhat-linux/4.8.5/include/stddef.h" 1 3 4
# 33 "/usr/include/stdlib.h" 2 3 4


# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;



# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

# 162 "/usr/include/stdlib.h" 3 4


extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 181 "/usr/include/stdlib.h" 3 4


extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 372 "/usr/include/stdlib.h" 3 4


extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));

# 463 "/usr/include/stdlib.h" 3 4


extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));

# 512 "/usr/include/stdlib.h" 3 4


extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 529 "/usr/include/stdlib.h" 3 4

# 538 "/usr/include/stdlib.h" 3 4




extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));








# 561 "/usr/include/stdlib.h" 3 4


extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 711 "/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 741 "/usr/include/stdlib.h" 3 4
typedef int (*__compar_fn_t) (const void *, const void *);
# 751 "/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;



extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 770 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;












extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 856 "/usr/include/stdlib.h" 3 4



extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__)) ;



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));

# 951 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/bits/stdlib-float.h" 1 3 4
# 952 "/usr/include/stdlib.h" 2 3 4
# 964 "/usr/include/stdlib.h" 3 4

# 10 "teststr.c" 2
# 1 "/usr/include/assert.h" 1 3 4
# 65 "/usr/include/assert.h" 3 4



extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



# 11 "teststr.c" 2


# 1 "/usr/include/sys/resource.h" 1 3 4
# 25 "/usr/include/sys/resource.h" 3 4
# 1 "/usr/include/bits/resource.h" 1 3 4
# 31 "/usr/include/bits/resource.h" 3 4
enum __rlimit_resource
{

  RLIMIT_CPU = 0,



  RLIMIT_FSIZE = 1,



  RLIMIT_DATA = 2,



  RLIMIT_STACK = 3,



  RLIMIT_CORE = 4,






  __RLIMIT_RSS = 5,



  RLIMIT_NOFILE = 7,
  __RLIMIT_OFILE = RLIMIT_NOFILE,




  RLIMIT_AS = 9,



  __RLIMIT_NPROC = 6,



  __RLIMIT_MEMLOCK = 8,



  __RLIMIT_LOCKS = 10,



  __RLIMIT_SIGPENDING = 11,



  __RLIMIT_MSGQUEUE = 12,





  __RLIMIT_NICE = 13,




  __RLIMIT_RTPRIO = 14,





  __RLIMIT_RTTIME = 15,


  __RLIMIT_NLIMITS = 16,
  __RLIM_NLIMITS = __RLIMIT_NLIMITS


};
# 131 "/usr/include/bits/resource.h" 3 4
typedef __rlim_t rlim_t;







struct rlimit
  {

    rlim_t rlim_cur;

    rlim_t rlim_max;
  };
# 158 "/usr/include/bits/resource.h" 3 4
enum __rusage_who
{

  RUSAGE_SELF = 0,



  RUSAGE_CHILDREN = -1
# 176 "/usr/include/bits/resource.h" 3 4
};


# 1 "/usr/include/bits/time.h" 1 3 4
# 30 "/usr/include/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 180 "/usr/include/bits/resource.h" 2 3 4







struct rusage
  {

    struct timeval ru_utime;

    struct timeval ru_stime;

    __extension__ union
      {
 long int ru_maxrss;
 __syscall_slong_t __ru_maxrss_word;
      };



    __extension__ union
      {
 long int ru_ixrss;
 __syscall_slong_t __ru_ixrss_word;
      };

    __extension__ union
      {
 long int ru_idrss;
 __syscall_slong_t __ru_idrss_word;
      };

    __extension__ union
      {
 long int ru_isrss;
  __syscall_slong_t __ru_isrss_word;
      };


    __extension__ union
      {
 long int ru_minflt;
 __syscall_slong_t __ru_minflt_word;
      };

    __extension__ union
      {
 long int ru_majflt;
 __syscall_slong_t __ru_majflt_word;
      };

    __extension__ union
      {
 long int ru_nswap;
 __syscall_slong_t __ru_nswap_word;
      };


    __extension__ union
      {
 long int ru_inblock;
 __syscall_slong_t __ru_inblock_word;
      };

    __extension__ union
      {
 long int ru_oublock;
 __syscall_slong_t __ru_oublock_word;
      };

    __extension__ union
      {
 long int ru_msgsnd;
 __syscall_slong_t __ru_msgsnd_word;
      };

    __extension__ union
      {
 long int ru_msgrcv;
 __syscall_slong_t __ru_msgrcv_word;
      };

    __extension__ union
      {
 long int ru_nsignals;
 __syscall_slong_t __ru_nsignals_word;
      };



    __extension__ union
      {
 long int ru_nvcsw;
 __syscall_slong_t __ru_nvcsw_word;
      };


    __extension__ union
      {
 long int ru_nivcsw;
 __syscall_slong_t __ru_nivcsw_word;
      };
  };







enum __priority_which
{
  PRIO_PROCESS = 0,

  PRIO_PGRP = 1,

  PRIO_USER = 2

};



# 328 "/usr/include/bits/resource.h" 3 4

# 26 "/usr/include/sys/resource.h" 2 3 4


typedef __id_t id_t;




# 43 "/usr/include/sys/resource.h" 3 4
typedef int __rlimit_resource_t;
typedef int __rusage_who_t;
typedef int __priority_which_t;





extern int getrlimit (__rlimit_resource_t __resource,
        struct rlimit *__rlimits) __attribute__ ((__nothrow__ , __leaf__));
# 70 "/usr/include/sys/resource.h" 3 4
extern int setrlimit (__rlimit_resource_t __resource,
        const struct rlimit *__rlimits) __attribute__ ((__nothrow__ , __leaf__));
# 88 "/usr/include/sys/resource.h" 3 4
extern int getrusage (__rusage_who_t __who, struct rusage *__usage) __attribute__ ((__nothrow__ , __leaf__));





extern int getpriority (__priority_which_t __which, id_t __who) __attribute__ ((__nothrow__ , __leaf__));



extern int setpriority (__priority_which_t __which, id_t __who, int __prio)
     __attribute__ ((__nothrow__ , __leaf__));


# 14 "teststr.c" 2



enum {STRESS_TEST_COUNT = 10};


enum {STRESS_STRING_SIZE = 1000};
# 31 "teststr.c"
static void assure(int iSuccessful, int iLineNum)
{
   if (! iSuccessful)
   {
      printf("      Test at line %d failed.\n", iLineNum);
      fflush(stdout);
   }
}
# 47 "teststr.c"
static void setCpuTimeLimit(void)
{
   enum {CPU_TIME_LIMIT_IN_SECONDS = 60};
   struct rlimit sRlimit;
   sRlimit.rlim_cur = CPU_TIME_LIMIT_IN_SECONDS;
   sRlimit.rlim_max = CPU_TIME_LIMIT_IN_SECONDS;
   setrlimit(RLIMIT_CPU, &sRlimit);
}
# 63 "teststr.c"
static void randomString(char *pcStr, int iSize)
{
   int i;
   ((pcStr != ((void *)0)) ? (void) (0) : __assert_fail ("pcStr != ((void *)0)", "teststr.c", 66, __PRETTY_FUNCTION__));
   ((iSize > 0) ? (void) (0) : __assert_fail ("iSize > 0", "teststr.c", 67, __PRETTY_FUNCTION__));
   for (i = 0; i < iSize-1; i++)
      pcStr[i] = (char)(((unsigned int)rand()) & 0x7f);
   pcStr[iSize-1] = '\0';
}





static void testGetLength(void)
{
   size_t uResult1;
   size_t uResult2;

   printf("Testing Str_getLength()\n");
   fflush(stdout);

   printf("   Boundary Tests\n");
   fflush(stdout);

   {
      const char acSrc[] = {'\0', 's'};
      uResult1 = Str_getLength(acSrc);
      uResult2 = strlen(acSrc);
      assure(uResult1 == uResult2, 92);
   }

   printf("   Statement Tests\n");
   fflush(stdout);

   {
      const char acSrc[] = {'R', 'u', 't', 'h', '\0', '\0'};
      uResult1 = Str_getLength(acSrc);
      uResult2 = strlen(acSrc);
      assure(uResult1 == uResult2, 102);
   }

   {
      const char acSrc[] = {'R', 'u', 't', 'h', '\0', 's'};
      uResult1 = Str_getLength(acSrc);
      uResult2 = strlen(acSrc);
      assure(uResult1 == uResult2, 109);
   }

   {
      const char acSrc[] = {'G', 'e', 'h', 'r', 'i', 'g', '\0', 's'};
      uResult1 = Str_getLength(acSrc);
      uResult2 = strlen(acSrc);
      assure(uResult1 == uResult2, 116);
   }

   printf("   Stress Tests\n");
   fflush(stdout);

   {
      int i;
      char acSrc[STRESS_STRING_SIZE];
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc, STRESS_STRING_SIZE);
         uResult1 = Str_getLength(acSrc);
         uResult2 = strlen(acSrc);
         assure(uResult1 == uResult2, 130);
      }
   }
}





static void testCopy(void)
{
   char *pcResult;

   printf("Testing Str_copy()\n");

   printf("   Boundary Tests\n");
   fflush(stdout);

   {
      const char acSrc[] = {'\0', 's'};
      char acDest1[] = {'d', 'd'};
      char acDest2[] = {'d', 'd'};
      pcResult = Str_copy(acDest1, acSrc);
      assure(pcResult == acDest1, 153);
      (void)strcpy(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 155);
   }

   {
      const char acSrc[] = {'\0', 's'};
      char acDest1[] = {'\0', 'd'};
      char acDest2[] = {'\0', 'd'};
      pcResult = Str_copy(acDest1, acSrc);
      assure(pcResult == acDest1, 163);
      (void)strcpy(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 165);
   }

   printf("   Statement Tests\n");
   fflush(stdout);

   {
      const char acSrc[] = {'R', 'u', 't', 'h', '\0', 's'};
      char acDest1[] = {'d', 'd', 'd', 'd', 'd', 'd'};
      char acDest2[] = {'d', 'd', 'd', 'd', 'd', 'd'};
      pcResult = Str_copy(acDest1, acSrc);
      assure(pcResult == acDest1, 176);
      (void)strcpy(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 178);
   }

   {
      const char acSrc[] = {'G', 'e', 'h', 'r', 'i', 'g', '\0', 's'};
      char acDest1[] = {'d', 'd', 'd', 'd', 'd', 'd', 'd', 'd'};
      char acDest2[] = {'d', 'd', 'd', 'd', 'd', 'd', 'd', 'd'};
      pcResult = Str_copy(acDest1, acSrc);
      assure(pcResult == acDest1, 186);
      (void)strcpy(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 188);
   }

   {
      const char acSrc[] = {'R', 'u', 't', 'h', '\0', 's'};
      char acDest1[] = {'\0', 'd', 'd', 'd', 'd', 'd'};
      char acDest2[] = {'\0', 'd', 'd', 'd', 'd', 'd'};
      pcResult = Str_copy(acDest1, acSrc);
      assure(pcResult == acDest1, 196);
      (void)strcpy(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 198);
   }

   printf("   Stress Tests\n");
   fflush(stdout);

   {
      int i;
      char acSrc[STRESS_STRING_SIZE];
      char acDest1[STRESS_STRING_SIZE];
      char acDest2[STRESS_STRING_SIZE];
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc, STRESS_STRING_SIZE);
         randomString(acDest1, STRESS_STRING_SIZE);
         memcpy(acDest2, acDest1, STRESS_STRING_SIZE);
         pcResult = Str_copy(acDest1, acSrc);
         assure(pcResult == acDest1, 215);
         (void)strcpy(acDest2, acSrc);
         assure(memcmp(acDest1, acDest2, STRESS_STRING_SIZE) == 0, 217);
      }
   }
}





static void testConcat(void)
{
   char *pcResult;

   printf("Testing Str_concat()\n");

   printf("   Boundary Tests\n");
   fflush(stdout);

   {
      const char acSrc[] = {'\0', 's', 's', 's', 's', 's'};
      char acDest1[] = {'\0', 'd', 'd', 'd', 'd', 'd'};
      char acDest2[] = {'\0', 'd', 'd', 'd', 'd', 'd'};
      pcResult = Str_concat(acDest1, acSrc);
      assure(pcResult == acDest1, 240);
      (void)strcat(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 242);
   }

   {
      const char acSrc[] = {'R', 'u', 't', 'h', '\0', 's'};
      char acDest1[] = {'\0', 'd', 'd', 'd', 'd', 'd'};
      char acDest2[] = {'\0', 'd', 'd', 'd', 'd', 'd'};
      pcResult = Str_concat(acDest1, acSrc);
      assure(pcResult == acDest1, 250);
      (void)strcat(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 252);
   }

   {
      const char acSrc[] = {'\0', 's', 's', 's', 's', 's'};
      char acDest1[] = {'R', 'u', 't', 'h', '\0', 'd'};
      char acDest2[] = {'R', 'u', 't', 'h', '\0', 'd'};
      pcResult = Str_concat(acDest1, acSrc);
      assure(pcResult == acDest1, 260);
      (void)strcat(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 262);
   }

   printf("   Statement Tests\n");
   fflush(stdout);

   {
      const char acSrc[] = {'R', 'u', 't', 'h', '\0', 's'};
      char acDest1[] =
         {'B', 'a', 'b', 'e', '\0', 'd', 'd', 'd', 'd', 'd'};
      char acDest2[] =
         {'B', 'a', 'b', 'e', '\0', 'd', 'd', 'd', 'd', 'd'};
      pcResult = Str_concat(acDest1, acSrc);
      assure(pcResult == acDest1, 275);
      (void)strcat(acDest2, acSrc);
      assure(memcmp(acDest1, acDest2, sizeof(acDest1)) == 0, 277);
   }

   printf("   Stress Tests\n");
   fflush(stdout);

   {
      int i;
      char acSrc[STRESS_STRING_SIZE];
      char acDest1[STRESS_STRING_SIZE] = {'\0'};
      char acDest2[STRESS_STRING_SIZE] = {'\0'};
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc, STRESS_STRING_SIZE/2);
         randomString(acDest1, STRESS_STRING_SIZE/2);
         memcpy(acDest2, acDest1, STRESS_STRING_SIZE);
         pcResult = Str_concat(acDest1, acSrc);
         assure(pcResult == acDest1, 294);
         (void)strcat(acDest2, acSrc);
         assure(memcmp(acDest1, acDest2, STRESS_STRING_SIZE) == 0, 296);
      }
   }
}





static int sign(int i)
{
   if (i < 0) return -1;
   if (i > 0) return 1;
   return 0;
}





static void testCompare(void)
{
   int iResult1;
   int iResult2;

   printf("Testing Str_compare()\n");

   printf("   Boundary Tests\n");
   fflush(stdout);

   {
      const char acSrc1[] = {'\0', 'x', 'x', 'x', 'x', 'x'};
      const char acSrc2[] = {'\0', 'y', 'y', 'y', 'y', 'y'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 331);
   }

   {
      const char acSrc1[] = {'\0', 'x', 'x', 'x', 'x', 'x'};
      const char acSrc2[] = {'R', 'u', 't', 'h', '\0', 'y'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 339);
   }

   {
      const char acSrc1[] = {'R', 'u', 't', 'h', '\0', 'y'};
      const char acSrc2[] = {'\0', 'x', 'x', 'x', 'x', 'x'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 347);
   }

   printf("   Statement Tests\n");
   fflush(stdout);

   {
      const char acSrc1[] = {'R', 'u', 't', 'h', '\0', 'x'};
      const char acSrc2[] = {'R', 'u', 't', 'h', '\0', 'y'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 358);
   }

   {
      const char acSrc1[] = {'R', 'o', 't', 'h', '\0', 'y'};
      const char acSrc2[] = {'R', 'u', 't', 'h', '\0', 'x'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 366);
   }

   {
      const char acSrc1[] = {'R', 'u', 't', 'h', '\0', 'x'};
      const char acSrc2[] = {'R', 'o', 't', 'h', '\0', 'y'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 374);
   }

   {
      const char acSrc1[] = {'R', 'u', 't', 'h', '\0', 'y'};
      const char acSrc2[] = {'r', 'u', 't', 'h', '\0', 'x'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 382);
   }

   {
      const char acSrc1[] = {'r', 'u', 't', 'h', '\0', 'x'};
      const char acSrc2[] = {'R', 'u', 't', 'h', '\0', 'y'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 390);
   }

   {
      const char acSrc1[] = {'B', 'a', 'b', 'e', '\0', 'y'};
      const char acSrc2[] =
         {'B', 'a', 'b', 'e', 'R', 'u', 't', 'h', '\0', 'x'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 399);
   }

   {
      const char acSrc1[] =
         {'B', 'a', 'b', 'e', 'R', 'u', 't', 'h', '\0', 'x'};
      const char acSrc2[] = {'B', 'a', 'b', 'e', '\0', 'y'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 408);
   }

   {
      const char acSrc1[] = {'x', 'y', '\0', 'z', 'z', 'z'};
      const char acSrc2[] = {'y', 'x', '\0', 'z', 'z', 'z'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 416);
   }

   {
      const char acSrc1[] = {'y', 'x', '\0', 'z', 'z', 'z'};
      const char acSrc2[] = {'x', 'y', '\0', 'z', 'z', 'z'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 424);
   }

   {
      const char acSrc1[] = {'x', 'x', '\0', 'z', 'z', 'z'};
      const char acSrc2[] = {'y', '\0', 'z', 'z', 'z', 'z'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 432);
   }

   {
      const char acSrc1[] = {'y', '\0', 'z', 'z', 'z', 'z'};
      const char acSrc2[] = {'x', 'x', '\0', 'z', 'z', 'z'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 440);
   }

   {
      const char acSrc1[] = {'x', 'y', 'y', '\0', 'z', 'z'};
      const char acSrc2[] = {'y', 'x', 'x', '\0', 'z', 'z'};
      iResult1 = Str_compare(acSrc1, acSrc2);
      iResult2 = strcmp(acSrc1, acSrc2);
      assure(sign(iResult1) == sign(iResult2), 448);
   }

   printf("   Stress Tests\n");
   fflush(stdout);

   {
      int i;
      char acSrc1[STRESS_STRING_SIZE];
      char acSrc2[STRESS_STRING_SIZE];
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc1, STRESS_STRING_SIZE);
         randomString(acSrc2, STRESS_STRING_SIZE);
         iResult1 = Str_compare(acSrc1, acSrc2);
         iResult2 = strcmp(acSrc1, acSrc2);
         assure(sign(iResult1) == sign(iResult2), 464);
      }
   }
}





static void testSearch(void)
{
   const char *pcResult1;
   const char *pcResult2;

   printf("Testing Str_search()\n");

   printf("   Boundary Tests\n");
   fflush(stdout);

   {
      const char acHaystack[] = "";
      const char acNeedle[] = "";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 488);
   }

   {
      const char acHaystack[] = "abcde";
      const char acNeedle[] = "";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 496);
   }

   {
      const char acHaystack[] = "";
      const char acNeedle[] = "abcde";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 504);
   }

   printf("   Statement Tests\n");
   fflush(stdout);

   {
      const char acHaystack[] = "abcde";
      const char acNeedle[] = "d";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 515);
   }

   {
      const char acHaystack[] = "abcde";
      const char acNeedle[] = "cd";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 523);
   }

   {
      const char acHaystack[] = "abcde";
      const char acNeedle[] = "bcde";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 531);
   }

   {
      const char acHaystack[] = "abcde";
      const char acNeedle[] = "abcde";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 539);
   }

   {
      const char acHaystack[] = "abcde";
      const char acNeedle[] = "abcdf";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 547);
   }

      {
      const char acHaystack[] = "abcde";
      const char acNeedle[] = "bcdef";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 555);
   }

   {
      const char acHaystack[] = "aab";
      const char acNeedle[] = "ab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 563);
   }

   {
      const char acHaystack[] = "aaab";
      const char acNeedle[] = "ab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 571);
   }

   {
      const char acHaystack[] = "aaab";
      const char acNeedle[] = "aab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 579);
   }

   {
      const char acHaystack[] = "aaaab";
      const char acNeedle[] = "aab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 587);
   }

   {
      const char acHaystack[] = "aaaaab";
      const char acNeedle[] = "aab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 595);
   }

   {
      const char acHaystack[] = "aaaab";
      const char acNeedle[] = "aaab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 603);
   }

   {
      const char acHaystack[] = "aaaaab";
      const char acNeedle[] = "aaab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 611);
   }

   {
      const char acHaystack[] = "aaaaaab";
      const char acNeedle[] = "aaab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 619);
   }

   {
      const char acHaystack[] = "aaaaaaab";
      const char acNeedle[] = "aaab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 627);
   }

   {
      const char acHaystack[] = "abcdefg";
      const char acNeedle[] = "abcg";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 635);
   }

   {
      const char acHaystack[] = "abcde";
      const char acNeedle[] = "abcdefg";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 643);
   }

   {
      const char acHaystack[] = "aababaab";
      const char acNeedle[] = "abaab";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 651);
   }

   {
      const char acHaystack[] = "aaa";
      const char acNeedle[] = "a";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 659);
   }

      {
      const char acHaystack[] = "aabbcc";
      const char acNeedle[] = "abc";
      pcResult1 = Str_search(acHaystack, acNeedle);
      pcResult2 = strstr(acHaystack, acNeedle);
      assure(pcResult1 == pcResult2, 667);
   }

   printf("   Stress Tests\n");
   fflush(stdout);

   {
      int i;
      char acSrc1[STRESS_STRING_SIZE];
      char acSrc2[STRESS_STRING_SIZE];
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc1, STRESS_STRING_SIZE);
         randomString(acSrc2, 1);
         pcResult1 = Str_search(acSrc1, acSrc2);
         pcResult2 = strstr(acSrc1, acSrc2);
         assure(pcResult1 == pcResult2, 683);
      }
   }

   {
      int i;
      char acSrc1[STRESS_STRING_SIZE];
      char acSrc2[STRESS_STRING_SIZE];
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc1, STRESS_STRING_SIZE);
         randomString(acSrc2, 2);
         pcResult1 = Str_search(acSrc1, acSrc2);
         pcResult2 = strstr(acSrc1, acSrc2);
         assure(pcResult1 == pcResult2, 697);
      }
   }

   {
      int i;
      char acSrc1[STRESS_STRING_SIZE];
      char acSrc2[STRESS_STRING_SIZE];
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc1, STRESS_STRING_SIZE);
         randomString(acSrc2, 3);
         pcResult1 = Str_search(acSrc1, acSrc2);
         pcResult2 = strstr(acSrc1, acSrc2);
         assure(pcResult1 == pcResult2, 711);
      }
   }

   {
      int i;
      char acSrc1[STRESS_STRING_SIZE];
      char acSrc2[STRESS_STRING_SIZE];
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc1, STRESS_STRING_SIZE);
         randomString(acSrc2, 4);
         pcResult1 = Str_search(acSrc1, acSrc2);
         pcResult2 = strstr(acSrc1, acSrc2);
         assure(pcResult1 == pcResult2, 725);
      }
   }

   {
      int i;
      char acSrc1[STRESS_STRING_SIZE];
      char acSrc2[STRESS_STRING_SIZE];
      for (i = 0; i < STRESS_TEST_COUNT; i++)
      {
         randomString(acSrc1, STRESS_STRING_SIZE);
         randomString(acSrc2, 5);
         pcResult1 = Str_search(acSrc1, acSrc2);
         pcResult2 = strstr(acSrc1, acSrc2);
         assure(pcResult1 == pcResult2, 739);
      }
   }
}







int main(int argc, char *argv[])
{


   setCpuTimeLimit();


   testGetLength();
   testCopy();
   testConcat();
   testCompare();
   testSearch();
   printf("End of %s.\n", argv[0]);
   return 0;
}
