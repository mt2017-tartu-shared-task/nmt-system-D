echo "de-BPE"
sed 's/@@ //g' hyps.en > tc-tok-hyps.en
echo "de-truecase"
../../moses-scripts/scripts/recaser/detruecase.perl < tc-tok-hyps.en > tok-hyps.en 
echo "de-tokenize"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < tok-hyps.en > hyps_d.en 
