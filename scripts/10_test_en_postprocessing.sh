#echo "de-BPE"
#sed 's/@@ //g' bpe.cleaned-tc-tok-test.en > tc-tok-clean_test.en
echo "de-truecase"
../../moses-scripts/scripts/recaser/detruecase.perl < cleaned-tc-tok-test.en > tok-clean_test.en 
echo "de-tokenize"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < tok-clean_test.en > clean_test.en 
