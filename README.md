# Imperium (team D) In-class Machine Translation Shared Task 2017 Submission

This repository is the result of our participation in the shared task.

We went through the process of building, analyzing, and improving a neural machine translation system.

Poster: [link]() // fill later

The shared task was for Estonian-English language pair. 

It included working with ~19.000.000 sentence pairs.

Shared task main page: [link](https://github.com/mt2017-tartu-shared-task)

Shared task on course page: [link](https://courses.cs.ut.ee/2017/MT/fall/Main/SharedTask)

Sections below summarize the key milestones we went through.  

##  Baseline system

- Our baseline system was a model trained using OpenNMT with standard preprocessing, using ~16M sentences for training, ~2M as test set and ~1M as development set.
- As a result, we got 22.61 BLEU points on the shared dev set.

More details: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/reports/report1.md)

## Baseline system manual evaluation

- We manually analyzed 40 baseline translations. 
- Our main observations were that the system had problems translating Estonian compound words - some of the parts were usually missing, and that future tense often emerged in translation instead of present. We also noticed that initial sentence splitting was often wrong and caused errors.
- Take a look at our the motivating examples produced by baseline system:

1. Source: Riikidevaheline reisimine on lihtsam, kuna enam pole rahavahetuse kulu ja vaeva.
2. Reference: Travel between euro countries is easier because the costs and inconvenience of changing money have disappeared .
3. Translation: Transnational travel is easier , since the cost of money is no longer the cost and the effort .

More details: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/reports/report2.md)

## Final system

- In order to address translation issues found after our manual evaluation, we first added better sentence splitting, and then implemented compound splitting
for Estonian words using `estnltk` to make the system see all the compound parts. 
- The trained system gave us 22.54 BLEU points on the shared dev set; that means a negligible decrease compared to the baseline in terms of BLEU. 

More details: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/reports/report3.md), [link](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/reports/report4.md)

## Final system manual evaluation

- Generally speaking, our system became better with compound words: the parts that were missing before appeared in the translation. We also eliminated some simple errors with more sophisticated sentence splitting (e.g. in the baseline EOS occured in the middle of the sentence and the second half was not translated at all). The fluency remained more or less the same.
- Let us now look at what our motivating example looks like with our final system:

1. Source: Riikidevaheline reisimine on lihtsam, kuna enam pole rahavahetuse kulu ja vaeva.
2. Reference: Travel between euro countries is easier because the costs and inconvenience of changing money have disappeared .
3. Translation: Transnational travel is easier because there is no money for money exchange and trouble .

- As a result you can see that the word "exchange", which was not there before, appeared in the sentence, because we split "raha_vahetuse" ("money exchange").

Do not forget to check our poster: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/poster/mt_poster_D_A1.pdf)

## What we also tried or wanted to try

Another thing we noticed was that our system often translated predicates in the future tense when they should have been in the present.

There is no future grammatical tense in Estonian (both present and future are expressed by the present tense), so we wanted to try and predict that a sentence concerns
the future using some other markers.

Our idea was to take English reference translations of the Estonian sentences which had verbs in the present tense in them, and classify these
translations as referring or not referring to the future. It is possible to do with English sentences, because in English there are clear grammatical markers.
We used a regular expression to find these patterns and assign labels to sentences. We also tried some more sophisticated ways of detecting future in English
(like aligning the sentences and analyzing the patterns which aligned to Estonian verbs in the present tense, or analyzing NLTK postag sequences), but failed.

Then we assigned these tags obtained for English sentences to corresponding Estonian sentences and used a neural network to predict future in Estonian ([link](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/tense-prediction/tense_prediction.ipynb)). We achieved 83% accuracy.

The idea is to add our predicted tags indicating future to source sentences in the training set to simulate grammatical tense and
force the system to differentiate between present and future.


## Final words
- Test set translation: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/test-final/D.hyps.test.en)
- One of the difficult parts was dealing with Estonian, which neither of us knows. Managing the ever-changing pipeline was not easy either. Also, waiting in the queues on HPC :)
- We definitely learned a lot about modern MT. Command line skills improved drastically.


## Team members:
1. [@papkov](https://github.com/papkov)
2. [@lisskor](https://github.com/lisskor)

Project board: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-D/projects/1)

