#-----------------------------------------------------------------------
# Makefile
# Author: William Svoboda
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Build rules for non-file targets
#-----------------------------------------------------------------------

all: ishlex ishsyn ish

clobber: clean
	rm -f *~ \#*\#

clean:
	rm -f ishlex *.o ishsyn *.o ish *.o

#-----------------------------------------------------------------------
# Build rules for file targets
#-----------------------------------------------------------------------

ishlex: ishlex.o readline.o lex.o token.o dynarray.o
	gcc217 ishlex.o lex.o token.o dynarray.o readline.o -o ishlex

ishlex.o: ishlex.c readline.h lex.h token.h dynarray.h global.h
	gcc217 -c ishlex.c

readline.o: readline.c readline.h global.h
	gcc217 -c readline.c

lex.o: lex.c lex.h token.h dynarray.h global.h
	gcc217 -c lex.c

token.o: token.c token.h 
	gcc217 -c token.c

dynarray.o: dynarray.c dynarray.h
	gcc217 -c dynarray.c

ishsyn: ishsyn.o readline.o lex.o syn.o token.o command.o dynarray.o
	gcc217 ishsyn.o readline.o lex.o syn.o token.o command.o \
	dynarray.o -o ishsyn

ishsyn.o: ishsyn.c readline.h lex.h syn.h token.h command.h dynarray.h \
	global.h
	gcc217 -c ishsyn.c

syn.o: syn.c syn.h token.h command.h dynarray.h global.h
	gcc217 -c syn.c

command.o: command.c command.h dynarray.h
	gcc217 -c command.c

ish: ish.o readline.o builtin.o lex.o syn.o token.o command.o dynarray.o
	gcc217 ish.o readline.o builtin.o lex.o syn.o token.o \
	command.o dynarray.o -o ish

ish.o: ish.c readline.h builtin.h lex.h syn.h token.h command.h \
	dynarray.h global.h
	gcc217 -c ish.c

builtin.o: builtin.c builtin.h dynarray.h global.h
	gcc217 -c builtin.c

#-----------------------------------------------------------------------
# REFERENCE ONLY
#-----------------------------------------------------------------------

#gcc217 -g ishlex.c lex.c token.c dynarray.c readline.c -o ishlex

#gcc217 -g ishsyn.c dynarray.c lex.c syn.c command.c token.c readline.c
# -o ishsyn

#gcc217 -g ish.c dynarray.c lex.c syn.c command.c token.c readline.c
# builtin.c -o ish
