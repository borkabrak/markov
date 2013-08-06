MARKOV
======

This is a Markov chain generator.

The idea is that you get a bit of text that, while randomly generated, still
*seems* like it comes from whatever was used as the 'corpus'.

[Markov chains](http://en.wikipedia.org/wiki/Markov_chain) are strings of
words where the sequence is based probabilistically on the sequence of words
in a seed corpus.

A couple of texts are included for use as corpuses -- The King James Bible,
and the complete works of Shakespeare.


HOW TO USE:
===========

* Run analyze.rb on the corpus plain text file.  This generates a file called
  'analysis.txt':

    `analyze.rb < filename >`

* Run generate.rb to generate a string.  The length is random, but should
  average around five words.

    `generate.rb`
