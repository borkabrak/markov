#!/usr/bin/env ruby
#
#   Generate some markovian chainery.  Optionally provide a first word.


require 'json'

analysis = 'analysis.txt'

corpus = JSON.parse(IO.read(analysis))

output = ""

word = (ARGV[0] || corpus.keys[Random.rand(corpus.length)]).downcase

(0..100).each do |i|

    output += "#{word} "
    
    data = corpus[word]

    # Load a weighted array with candidates for next word
    list = []
    data.each do |k, v|
        v.to_i.times { list.push(k) }
    end
    
    word = list[Random.rand(list.length)]

    break if (Random.rand(100 + i) > 95)

end

output = "#{(output.gsub(/ i /) { " I " }).strip}.".sub(/./) { |f| f.upcase }

puts output
