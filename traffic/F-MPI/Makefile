MF=	Makefile

FC=	mpif90

FFLAGS=	-g
LFLAGS=	$(FFLAGS)

EXE=	traffic

SRC= \
	traffic.f90 \
	trafficlib.f90 \
	unirand.f90

#
# No need to edit below this line
#

.SUFFIXES:
.SUFFIXES: .f90 .o

OBJ=	$(SRC:.f90=.o)
MOD=	$(SRC:.f90=.mod)

.f90.o:
	$(FC) $(FFLAGS) -c $<

all:	$(EXE)

$(EXE):	$(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ) $(LFLAGS)

$(OBJ):	$(MF)

traffic.o:	trafficlib.o
trafficlib.o:	unirand.o

clean:
	rm -f $(OBJ) $(MOD) $(EXE) core
