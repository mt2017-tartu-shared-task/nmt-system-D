#!/bin/bash

#The name of the job is test_job
#SBATCH -J imperium5_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 24 hours
#SBATCH -t 24:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=mikhail.papkov@gmail.com

#SBATCH --mem=25G


echo "Learn BPE"

cat cleaned-tc-tok-train-rsp.et cleaned-tc-tok-train.en | ../OpenNMT-py/tools/subword-nmt/learn_bpe.py -s 50000 > eten.bpe

echo "Estonian"

        echo "Apply to train"
        ../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < cleaned-tc-tok-train-rsp.et > bpe.cleaned-tc-tok-train.et
        echo "Apply to dev"
        ../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < cleaned-tc-tok-dev-rsp.et > bpe.cleaned-tc-tok-dev.et
        echo "Apply to test"
        ../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < tc-tok-test-rsp.et > bpe.tc-tok-test.et

echo "English"

	echo "Apply to train"
	../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < cleaned-tc-tok-train.en > bpe.cleaned-tc-tok-train.en
	echo "Apply to dev"
	../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < cleaned-tc-tok-dev.en > bpe.cleaned-tc-tok-dev.en
	echo "Apply to test"
	../OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < tc-tok-test.en > bpe.tc-tok-test.en

echo "End"
