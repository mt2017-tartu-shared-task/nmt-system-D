echo "de-BPE"
sed 's/@@ //g' bpe.tc-tok-hyps_13.en > tc-tok-hyps.en
echo "de-truecase"
../../moses-scripts/scripts/recaser/detruecase.perl < tc-tok-hyps.en > tok-hyps.en 
echo "de-tokenize"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < tok-hyps.en > hyps_13.en 
