#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium4_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 12 hours
#SBATCH -t 12:00:00

#SBATCH --mem=50G

../OpenNMT-py/tools/clean-corpus-n.perl tc-tok-train en et cleaned-tc-tok-train 1 100
../OpenNMT-py/tools/clean-corpus-n.perl tc-tok-test en et cleaned-tc-tok-test 1 100
../OpenNMT-py/tools/clean-corpus-n.perl tc-tok-dev en et cleaned-tc-tok-dev 1 100
