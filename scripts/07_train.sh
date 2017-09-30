#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium7_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 8 days
#SBATCH -t 192:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=mikhail.papkov@gmail.com

#SBATCH --mem=150G

#Leave this here if you need a GPU for your job
#SBATCH --partition=gpu

#SBATCH --gres=gpu:tesla:1

#The module with all the NMT / deep learning packages
module load python-2.7.13

cd ../OpenNMT-py/
python train.py -data ../data/rdy -save_model ../model/eten_model -gpuid 0

