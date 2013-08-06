#!/usr/bin/env ruby
#
#   Generate an analysis of word adjacencies from a corpus text
#
#   The resulting data structure is of the form:
#
#   data = {
#       word => {
#           nextword => <number of times `nextword` follows `word`>
#           ...
#       ...
#   }

require 'json'
corpus = IO.read(ARGV[0]).split(/[\W\d]+/)
data = {}
(0..corpus.length - 1 ).each do |i|

# There has, I mean, *got* to be a more efficient way to do this

    thisword = corpus[i].downcase
    nextword = corpus[ i + 1 ] == nil ? "" : corpus[ i + 1 ].downcase

    if ( data[thisword] == nil )
        data[thisword] = {} 
    end

    data[thisword][nextword] = 
        (data[thisword][nextword] == nil ? 
        1 : 
        ( data[thisword][nextword] + 1 ))
    
end

File.open('analysis.txt', 'w') { |file| file.write JSON.pretty_generate(data) }
