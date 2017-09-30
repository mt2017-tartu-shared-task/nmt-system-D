#!/bin/bash

#The name of the job is test_job
#SBATCH -J mt_2017_imperium3_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 12 h
#SBATCH -t 12:00:00

#SBATCH --mem=25G

echo "Train true-casing models:"
echo "English"
../OpenNMT-py/tools/train-truecaser.perl --model en-truecase.mdl --corpus tok-train.en
echo "Estonian"
../OpenNMT-py/tools/train-truecaser.perl --model et-truecase.mdl --corpus tok-train.et

echo "Do true-casing"

for lang in en et
do
 for f in {test,dev,train}.$lang
  do
   echo $f
   ../OpenNMT-py/tools/truecase.perl --model $lang-truecase.mdl < tok-$f > tc-tok-$f
  done
done
