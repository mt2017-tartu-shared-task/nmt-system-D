#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium82_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 24 hours
#SBATCH -t 24:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=mikhail.papkov@gmail.com

#SBATCH --mem=100G

#Leave this here if you need a GPU for your job
#SBATCH --partition=gpu

#SBATCH --gres=gpu:tesla:1

#The module with all the NMT / deep learning packages
module load python-2.7.13

cd ../ONMT/OpenNMT-py/
python translate.py -model ../../model/eten_model_acc_70.76_ppl_4.15_e13.pt -src ../../data/small_bpe.tc-tok-test.et -output ../../data/hyps_small.en -gpu 0

