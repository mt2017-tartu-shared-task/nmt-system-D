#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium5_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 12 hours
#SBATCH -t 12:00:00

#SBATCH --mem=15G


echo "Learn BPE"

cat cleaned-tc-tok-train.et cleaned-tc-tok-train.en | ../OpenNMT-py/tools/subword-nmt/learn_bpe.py -s 10000 > eten.bpe

for lang in et en
do
	echo "Apply to train"
	../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < cleaned-tc-tok-train.$lang > bpe.cleaned-tc-tok-train.$lang
	echo "Apply to dev"
	../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < cleaned-tc-tok-dev.$lang > bpe.cleaned-tc-tok-dev.$lang
	echo "Apply to test"
	../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < tc-tok-test.$lang > bpe.tc-tok-test.$lang
done
