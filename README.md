# corpus-frequencies-in-inflection - Corpus Frequencies in Morphological Inflection: Do They Matter?

This repository contains all code from the paper Corpus Frequencies in Morphological Inflection: Do They Matter?. It is available under the CC BY-NC-SA 4.0 license. The work is described in the paper:

The paper by Tomáš Sourada and Jana Straková, presented at ITAT 2025: [Corpus Frequencies in Morphological Inflection: Do They Matter?](TBA)

[A master thesis Neural Models for Multilingual Inflection](http://hdl.handle.net/20.500.11956/199280) describes the work more profoundly, including all theoretical and technical 
details, along with additional experiments.

## Corpus frequencies in morphological inflection

The traditional approach to morphological inflection (the task of modifying a base word (lemma) to express
grammatical categories) has been, for decades, to consider lexical entries of lemma-tag-form triples uniformly,
lacking any information about their frequency distribution. However, in production deployment, one might
expect the user inputs to reflect a real-world distribution of frequencies in natural texts. With future deployment in
mind, we explore the incorporation of corpus frequency information into the task of morphological inflection along three
key dimensions during system development: (i) for train-dev-test split, we combine a lemma-disjoint
approach, which evaluates the model’s generalization capabilities, with a frequency-weighted strategy to
better reflect the realistic distribution of items across different frequency bands in training and test sets; (ii) for
evaluation, we complement the standard type accuracy (often referred to simply as accuracy), which treats all
items equally regardless of frequency, with token accuracy, which assigns greater weight to frequent words
and better approximates performance on running text; (iii) for training data sampling, we introduce a method
novel in the context of inflection, frequency-aware training, which explicitly incorporates word frequency into
the sampling process. We show that frequency-aware training outperforms uniform sampling in 26 out of 43
languages.


### On Linux
To prepare the virtual environment and data and run a toy training, run:
`bash init.sh`

This:
1) creates the venv and installs dependencies, 
2) downloads and re-splits the data, 
3) prints the re-split statistics to a file `data-stats.<datetime>.txt` (this should be the same as the provided `stats.txt`)
4) runs a toy example of training a model for two languages, with a single temperature value

For actually running some experiments, uncomment the appropriate lines in `example_run.sh` (bottom of the file) and run it (you need to have the venv and data prepared first).

To inspect what is being done, look into `example_run.sh`.
