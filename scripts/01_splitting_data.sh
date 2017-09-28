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

# tab-join and shuffle et and en corpora
paste ./data/all.{et,en} | shuf > ./data/mixed-data.both

# split corpus
sed -n 1,2000000p ./data/mixed-data.both | cut -f 1 > ./data/test.et
sed -n 1,2000000p ./data/mixed-data.both | cut -f 2 > ./data/test.en
sed -n 2000001,3000000p ./data/mixed-data.both | cut -f 1 > ./data/dev.et
sed -n 2000001,3000000p ./data/mixed-data.both | cut -f 2 > ./data/dev.en
sed -n 3000001,19051439p ./data/mixed-data.both | cut -f 1 > ./data/train.et
sed -n 3000001,19051439p ./data/mixed-data.both | cut -f 2 > ./data/train.en
