#!/usr/bin/env python

import sys
import time
import numpy as np
from trafficlib import initroad, updatebcs, updateroad, gettime

def main(argv):

    # Simulation parameters
    seedval = 5743
    ncell = 100000
    maxiter = int(200000000/ncell)
    printfreq = maxiter/10

    newroad  = np.zeros(ncell+2)
    oldroad  = np.zeros(ncell+2)

    density = 0.52

    sys.stdout.write('Length of road is {0}\n'.format(ncell))
    sys.stdout.write('Number of iterations is {0}\n'.format(maxiter))
    sys.stdout.write('Target density of cars is {0}\n'.format(density))

    # Initialise road accordingly using random number generator
    sys.stdout.write('Initialising ...\n')

    ncars = initroad(oldroad, density, seedval)

    sys.stdout.write('Actual Density of cars is {0}\n\n'.format(float(ncars)/float(ncell)))

    tstart = gettime()

    for iter in range(1, maxiter+1):

        updatebcs(oldroad)

        nmove = updateroad(newroad, oldroad)

        # Copy new to old array
        oldroad[1:ncell+1] = newroad[1:ncell+1]

        if iter % printfreq == 0:

          sys.stdout.write('At iteration {0} average velocity is {1}\n'
                           .format(iter, float(nmove)/float(ncars)))

    tstop = gettime()

    sys.stdout.write('\nFinished\n\n')
    sys.stdout.write('Time taken was {0} seconds\n'.format(tstop-tstart))
    sys.stdout.write('Update rate was {0} MCOPs\n\n'
                     .format(1.0e-6*ncell*maxiter/(tstop-tstart)))

if __name__ == "__main__":
    main(sys.argv[1:])
