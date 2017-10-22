#!/bin/bash

#The name of the job is test_job
#SBATCH -J mt_2017_imperium3_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 12 h
#SBATCH -t 12:00:00

#SBATCH --mem=25G

echo "Do true-casing"
../../../materials/lab3/OpenNMT-py/tools/truecase.perl --model ../et-truecase.mdl < tok-dev.et > tc-tok-dev.et
