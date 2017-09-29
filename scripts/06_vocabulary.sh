#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium6_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 8 days
#SBATCH -t 192:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=mikhail.papkov@gmail.com

#SBATCH --mem=50G

#Leave this here if you need a GPU for your job
#SBATCH --partition=gpu

#SBATCH --gres=gpu:tesla:1


#The module with all the NMT / deep learning packages
module load python-2.7.13

cd ../OpenNMT-py/
python preprocess.py -train_src ../data/bpe.cleaned-tc-tok-train.et -train_tgt ../data/bpe.cleaned-tc-tok-train.en -valid_src ../data/bpe.tc-tok-dev.et -valid_tgt ../data/bpe.tc-tok-dev.en -save_data ../data/rdy -src_vocab_size 100000 -tgt_vocab_size 100000 -seed 123

