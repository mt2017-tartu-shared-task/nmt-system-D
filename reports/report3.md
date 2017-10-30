# Report on planned modifications

## Problem 1. Bad splitting

**Translation:** In this part of our website , you can find information on how
the Parliament organises its work , through a system of specialised
committees . The work of the European Parliament is important because in
many policy areas , decisions on new European laws are made jointly by
Parliament and the Council of Ministers , which represents Member States .

**Hypothesis:** This part of our website will find information on how
Parliament will organise its work through a system of different committees .

Initial segmentation for susch sentences is wrong. We can try to extract them by regular expressions 
to take a closer look and find appropriate splitting pattern.

## Problem 2. Wrong tenses

Multiple sentences show wrong tense choice (e.g. future simple instead of present simple). The reason can hide in Estonian
grammar. One possible solution is to incorporate some linguistic information. Words can be annotated with morphological 
features (tense) in such way that NMT system will see it.

Try: https://estnltk.github.io/estnltk/1.2/

## Problem 3. Parts of compound words are missing

Compound words often are translated partially (one part suffers a lack of attention). We can try to fix this by initially
splitting these words. It can possibly be done with *estnltk* mentioned above or in a custom way: examine words which are 
longer than some threshold (>10?), find frequent stems (>2?), split words into frequent components.

## Problem 4. Lack of special knowledge & terms

Our system doesn't know some physical words. This problem can be possibly solved by vocabulary expansion (few chances) or 
by corpus expansion.
