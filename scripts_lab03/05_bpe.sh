#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium5_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 24 hours
#SBATCH -t 24:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=mikhail.papkov@gmail.com

#SBATCH --mem=25G


echo "Apply to dev"
../../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c ../eten.bpe < tc-tok-dev.et > bpe.tc-tok-dev.et
