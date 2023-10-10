#!/bin/sh

#SBATCH -N 1

#SBATCH --ntasks-per-node=48

#SBATCH --time=12:00:00 

#SBATCH --job-name=Y_coumarin

#SBATCH --error=job.error

#SBATCH --output=job.output

#SBATCH --exclusive

#SBATCH --partition=small

cd $SLURM_SUBMIT_DIR

export OMP_NUM_THREADS=1

##### Please Provide the Excutable Path or environment of GPAW 

eval "$(conda shell.bash hook)"
conda activate litesoph

cd <path_to_current_task_directory>;

time mpirun  -n $SLURM_NTASKS  correspondind_executable input_file

