echo "de-BPE"
sed 's/@@ //g' bpe.cleaned-tc-tok-dev.en > tc-tok-clean_dev.en
echo "de-truecase"
../../moses-scripts/scripts/recaser/detruecase.perl < tc-tok-clean_dev.en > tok-clean_dev.en 
echo "de-tokenize"
../../moses-scripts/scripts/tokenizer/detokenizer.perl < tok-clean_dev.en > clean_dev.en 
