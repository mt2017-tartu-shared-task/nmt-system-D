#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium_a1_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 12 h
#SBATCH -t 12:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=mikhail.papkov@gmail.com

#SBATCH --mem=25G

# Load python 3.6.0 for efmaral alignment
module load python-3.6.0

echo "Select part of the train set for alignment"
sed -n 1,1000000p cleaned-tc-tok-train.en > cleaned-tc-tok-train_1M.en
sed -n 1,1000000p cleaned-tc-tok-train.et > cleaned-tc-tok-train_1M.et

echo "Produce fast_aligh format"
python ../../efmaral/scripts/wpt2fastalign.py cleaned-tc-tok-train_1M.en cleaned-tc-tok-train_1M.et > ./align/aligned_train_1M_enet.fa
python ../../efmaral/align.py -i ./align/aligned_train_1M_enet.fa > ./align/alignment_train_1M_enet.moses 