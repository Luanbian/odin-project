# frozen_string_literal: true

def caesar_cypher(content, fixed_number)
  content_array = content.split('')
  encrypted = content_array.map do |word|
    (word.ord + fixed_number).chr
  end
  encrypted.join
end

puts caesar_cypher('what a string', 5)
