#!/bin/bash

# Slurm job options (name, compute nodes, job time)
#SBATCH --job-name=sharpen
#SBATCH --time=0:01:0
#SBATCH --exclusive
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --tasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --account=YOUR_individual_budget     # <-------- REMEMBER TO CHANGE THIS
#SBATCH --partition=standard
#SBATCH --qos=short

# Load the default HPE MPI environment
module load mpt
module load intel-compilers-19

# Change to the submission directory
cd $SLURM_SUBMIT_DIR

# Set the number of threads to 1
#   This prevents any threaded system libraries from automatically
#   using threading.
export OMP_NUM_THREADS=1

# Launch the parallel job
#   Using 36 MPI processes on 1 node
#   srun picks up the distribution from the sbatch options
srun --cpu-bind=cores ./sharpen
