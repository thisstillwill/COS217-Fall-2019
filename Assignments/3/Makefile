# Dependency rules for non-file targets
all: testsymtablelist testsymtablehash
clobber: clean
	rm -f *~ \#*\#
clean:
	rm -f testsymtablelist *.o testsymtablehash *.o

# Dependency rules for file targets
testsymtablelist: testsymtable.o symtablelist.o
	gcc217 testsymtable.o symtablelist.o -o testsymtablelist
testsymtable.o: testsymtable.c symtable.h
	gcc217 -c testsymtable.c
symtablelist.o: symtablelist.c symtable.h
	gcc217 -c symtablelist.c
testsymtablehash: testsymtable.o symtablehash.o
	gcc217 testsymtable.o symtablehash.o -o testsymtablehash
symtablehash.o: symtablehash.c symtable.h
	gcc217 -c symtablehash.c
