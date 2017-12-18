#echo "de-BPE"
#sed 's/@@ //g' bpe.tc-tok-hyps_13.en > tc-tok-hyps.en
echo "de-truecase"
../../moses-scripts/scripts/recaser/detruecase.perl < cleaned-tc-tok-dev.en > cleaned-tok-dev.en 
echo "de-tokenize"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < cleaned-tok-dev.en > cleaned-dev.en 

echo "de-truecase et"
../../moses-scripts/scripts/recaser/detruecase.perl < cleaned-tc-tok-dev.et > cleaned-tok-dev.et
echo "de-tokenize et"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < cleaned-tok-dev.et > cleaned-dev.et

