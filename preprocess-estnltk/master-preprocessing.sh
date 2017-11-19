#!/bin/bash

jid1=$(sbatch ../scripts/02_ssp_tokenize.sh)

jid2=$(sbatch --dependency=afterok:$jid1 ../scripts/03_true_casing.sh)

jid3=$(sbatch --dependency=afterok:$jid2 ../scripts/04_clean_all.sh)

jid4=$(sbatch --dependency=afterok:$jid3 ../scripts/045_split-roots.sh)

jid5=$(sbatch --dependency=afterok:$jid4 ../scripts/05_rsp_bpe.sh)

jid6=$(sbatch --dependency=afterok:$jid5 ../scripts/06_vocabulary.sh)

jid7=$(sbatch --dependency=afterok:$jid6 ../scripts/07_train.sh)

