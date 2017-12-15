#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium2_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 12 h
#SBATCH -t 12:00:00

#SBATCH --mem=50G


../../materials/lab3/OpenNMT-py/tools/tokenizer.perl < test.et > tok-test.et

