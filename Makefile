.SUFFIXES: .F90 .o
extension = .F90

###########
# TARGETS #
###########

# default is to build with gfortran
.PHONY: all
all : pgi

# Shorthand for specific compilers (gnu, intel, pgi, nag, cray)

.PHONY: gnu
gnu:
	gfortran -Wall -Werror -O2 -ffree-form -cpp -c class_mod.F90 -o class_mod.o
	gfortran -Wall -Werror -O2 -ffree-form -cpp -c test.F90 -o test.o
	gfortran -o test.exe class_mod.o test.o

.PHONY: pgi
pgi:
	pgf90 -O2 -Mfree -c class_mod.F90 -o class_mod.o
	pgf90 -O2 -Mfree -c test.F90 -o test.o
	pgf90 -o test.exe class_mod.o test.o

# clean up previous builds
.PHONY: clean
clean:
	/bin/rm -f *.o *.mod test.exe
