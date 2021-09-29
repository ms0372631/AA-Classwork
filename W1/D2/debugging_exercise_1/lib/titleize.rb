# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, titleize, that accepts a string representing a title 
# and capitalizes each word in a string except 'a', 'and', 'of', 'on', or 'the'.
# The first word of the title should be capitalized no matter what.

require "byebug"

def titleize(title)
  little_words = [ "and", "the", "over", "a", "on", "of" ]
  words = title.split(" ")

  words.each.with_index do |word, i|
  
    if !little_words.include?(word) || i == 0
      word[0] = word[0].upcase
    end
  end

  words.join(" ")
end
