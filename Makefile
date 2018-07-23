.SUFFIXES: .F90 .o
extension = .F90

###########
# TARGETS #
###########

# default is to build with gfortran
.PHONY: all
all : gnu

# Shorthand for specific compilers (gnu, intel, pgi, nag, cray)

.PHONY: gnu
gnu:
	gfortran -Wall -Werror -O2 -ffree-form -cpp -c class_mod.F90 -o class_mod.o
#	gfortran

.PHONY: pgi
pgi:
	pgf90 -O2 -Mfree -c class_mod.F90 -o class_mod.o

# clean up previous builds
.PHONY: clean
clean:
	/bin/rm -f *.o *.mod test.exe
