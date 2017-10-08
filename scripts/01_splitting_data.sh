#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium1_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 12 h
#SBATCH -t 12:00:00

#SBATCH --mem=50G

echo "Concatenate all corpora"
cat raw/*.en > all.en
cat raw/*.et > all.et

echo "Tab-join and shuffle et and en corpora"
paste all.{et,en} | shuf > mixed-data.both

echo "Split corpus"
sed -n 1,2000000p mixed-data.both | cut -f 1 > test.et
sed -n 1,2000000p mixed-data.both | cut -f 2 > test.en
sed -n 2000001,3000000p mixed-data.both | cut -f 1 > dev.et
sed -n 2000001,3000000p mixed-data.both | cut -f 2 > dev.en
sed -n 3000001,19051439p mixed-data.both | cut -f 1 > train.et
sed -n 3000001,19051439p mixed-data.both | cut -f 2 > train.en
