#!/bin/bash

#SBATCH --job-name=seurat      ## job name
#SBATCH -A alcalof_lab      ## account to charge
#SBATCH -p free  ## run on the standard partition
#SBATCH --nodes=1               ## number of nodes the job will use
#SBATCH --ntasks=1              ## number of processes to launch
#SBATCH --mem=60G             # requesting 4 GB (1 GB = 1,024 MB) memory for the job
#SBATCH --cpus-per-task=20      ## number of OpenMP threads
#SBATCH --error=slurm-%J.err ## error log file

module purge

module load openmpi/4.0.3/gcc.8.4.0
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

module load R/4.1.2

#move into working directory
cd /dfs6/pub/schea2/20210505-seurat

#run the Rscript named ##-seurat.R and generate ##-seruat.Rhistory
R --no-save --quiet < 34c-subset-germ-flox.R > 34c-subset-germ-flox.Rhistory