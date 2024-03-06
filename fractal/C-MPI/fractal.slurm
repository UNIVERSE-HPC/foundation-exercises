#!/bin/bash

# Slurm job options (name, compute nodes, job time)
#SBATCH --job-name=sharpen
#SBATCH --time=0:02:0
#SBATCH --exclusive
#SBATCH --nodes=1
#SBATCH --ntasks=17
#SBATCH --cpus-per-task=1
#SBATCH --account=m22ol-YOUR_BUDGET            #REMBEMBER to change this! 
#SBATCH --partition=standard
#SBATCH --qos=short

# Load the default HPE MPI environment
module load intel-compilers-19
module load mpt

# Change to the submission directory
cd $SLURM_SUBMIT_DIR

# Set the number of threads to 1
export OMP_NUM_THREADS=1

# Launch the parallel job - 1 master and 16 workers
srun --ntasks=17 ./fractal -t 192
#srun --ntasks=17 ./fractal -t 96 -n -f J -x -2 -X 2
