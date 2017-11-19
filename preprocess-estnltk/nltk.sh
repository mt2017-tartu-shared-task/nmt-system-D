#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium_nltk_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 24 hours
#SBATCH -t 24:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=mikhail.papkov@gmail.com

#SBATCH --mem=50G

#The module with all the NMT / deep learning package
module load python-3.6.0
# Use local virtualenv with nltk
source activate nltkenv

