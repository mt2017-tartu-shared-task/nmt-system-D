echo "de-BPE"
sed 's/@@ //g' hyps_dev.en > tc-tok-clean-hyps_dev.en
echo "de-truecase"
../../moses-scripts/scripts/recaser/detruecase.perl < tc-tok-clean-hyps_dev.en > tok-clean-hyps_dev.en 
echo "de-tokenize"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < tok-clean-hyps_dev.en > clean-hyps_dev.en 
