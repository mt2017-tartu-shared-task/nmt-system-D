# Milestone 1: Hand in the baseline system and translation  [Report]
Imperium team:
 * @papkov
 * @liss_kor
 
## Our project board:
![screen1](https://raw.githubusercontent.com/mt2017-tartu-shared-task/nmt-system-D/master/reports/pboard1.png)


## This milestone tasks description:
### Corpus Preparation
Starting from raw data, we applied following preprocessing steps:
* corpora concatenating: we got one big parallel text corpus of __19051439__ lines 
* data shuffling: to feed sentences to NMT system later in the random order  
* data splitting: __~16M__ training examples, __2M__ test examples, and __1M__ development examples

All steps were performed via SLURM: __https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/scripts/01_splitting_data.sh__

### Preprocessing:
1. Tokenizing: __https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/scripts/02_tokenize.sh__
2. True-casing: __https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/scripts/03_true-casing.sh__
3. Cleaning: __https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/scripts/04_clean.sh__
4. BPE :__https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/scripts/05_bpe.sh__ (we used joint vocabulary of size __50k__)

We used [Moses](http://www.statmt.org/moses/) scripts to do basic preprocessing, and [BPE](https://github.com/rsennrich/subword-nmt) for the subword segmentation. 

### Model Training
We used 1 Tesla P100 GPU Machine provided by [HPC center of the University of Tartu](https://www.hpc.ut.ee/en_US/web/guest/home) to train our model with vocablary of size __50000__. The model we trained is the default [OpenNMT-py](https://github.com/OpenNMT/OpenNMT-py) model, which consists of a 2-layer LSTM with 500 hidden units on both the encoder/decoder.

We had trained our best model for ~__5__ days, __13__ epochs. Development set perplexity was __4.15__. We __waited to the end__ to stop the training process. 

You can find the script we used to run training here: __https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/scripts/07_train.sh__.

Model itself is available here: __https://owncloud.ut.ee/owncloud/index.php/s/vqF24u6vhcFPFmd__

### Translating and Evaluating Results
We performed an inference and got unpostprocessed English hyps file. 
For translation we took first 50000 lines of test set.

We used this file, processed reference file, and BLEU metric to evaluate the translation performance of our model, and got __34.92__ points.

_________________________________________________________________________________________________________________
For the next milestone, we will focus on some more advanced evaluation and error analysis technics.    
