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

#SBATCH --mem=50G

#Leave this here if you need a GPU for your job
#SBATCH --partition=gpu

#SBATCH --gres=gpu:tesla:1

#The module with all the NMT / deep learning packages
module load python-2.7.13

cd ../../materials/lab3/OpenNMT-py/
python translate.py -model ../../../nmt-system-D/model/eten_model_acc_70.41_ppl_4.24_e13.pt -src ../../../nmt-system-D/data_accurat/bpe.cleaned-tc-tok-dev.et -output ../../../nmt-system-D/data_accurat/bpe.tc-tok-hyps_13.en -attn_debug -gpu 0

