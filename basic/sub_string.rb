# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(text, dictionary)
  down = text.downcase
  dictionary.each_with_object({}) do |key, res|
    count = down.scan(key).size
    res[key] = count if count.positive?
  end
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
