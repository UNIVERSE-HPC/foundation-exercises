MF=	Makefile

#COMPILER
FC=	mpif90 
CC=	mpicc -cc=cc

FFLAGS=	-O3 -DF_MPI_PRACTICAL
CFLAGS= $(FFLAGS)
LFLAGS=

EXE=	sharpen

FSRC= \
	sharpen.f90	\
	dosharpen.f90 	\
	filter.f90	\
	fio.f90

CSRC=	utilities.c

#
# No need to edit below this line
#

.SUFFIXES:
.SUFFIXES: .f90 .c .o

OBJ=	$(FSRC:.f90=.o) $(CSRC:.c=.o)

.f90.o:
	$(FC) $(FFLAGS) -c $<

.c.o:
	$(CC) $(CFLAGS) -c $<

all:	$(EXE)

$(EXE):	$(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ) $(LFLAGS)

$(OBJ):	$(MF)

tar:
	tar cvf $(EXE).tar $(MF) $(SRC) fuzzy.pgm submit.sh

clean:
	rm -f $(OBJ) $(EXE) core
