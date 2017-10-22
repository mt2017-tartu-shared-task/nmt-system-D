echo "de-BPE"
sed 's/@@ //g' hyps_small.en > tc-tok-hyps_small.en
echo "de-truecase"
../../moses-scripts/scripts/recaser/detruecase.perl < tc-tok-hyps_small.en > tok-hyps_small.en 
echo "de-tokenize"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < tok-hyps_small.en > hyps_small_d.en 
