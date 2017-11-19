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


#for f in {test,dev,train}.{en,et}
#do
#  ../OpenNMT-py/tools/tokenizer.perl < ssp_$f > tok-$f
#done

# For accurat-dev
../OpenNMT-py/tools/tokenizer.perl < ssp_dev.et > tok-dev.et
../OpenNMT-py/tools/tokenizer.perl < ssp_dev.en > tok-dev.en
