MF=	Makefile

CC=   mpicc
CFLAGS= -cc=icc -O3
LFLAGS= -lm

EXE=	fractal

SRC= \
	arralloc.c \
	fractal.c \
	read_options.c \
	write_ppm.c

INC = \
	arralloc.h \
	read_options.h \
	write_ppm.h

#
# No need to edit below this line
#

.SUFFIXES:
.SUFFIXES: .c .o

OBJ=	$(SRC:.c=.o)

.c.o:
	$(CC) $(CFLAGS) -c $<

all:	$(EXE)

$(EXE):	$(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LFLAGS)

$(OBJ):	$(MF) $(INC)

clean:
	rm -f $(OBJ) $(EXE) output.ppm core
