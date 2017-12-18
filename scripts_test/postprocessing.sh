echo "de-BPE"
sed 's/@@ //g' bpe-tc-tok-D.hyps.test.en > tc-tok-D.hyps.test.en
echo "de-truecase"
../../moses-scripts/scripts/recaser/detruecase.perl < tc-tok-D.hyps.test.en > tok-D.hyps.test.en 
echo "de-tokenize"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < tok-D.hyps.test.en > D.hyps.test.en
