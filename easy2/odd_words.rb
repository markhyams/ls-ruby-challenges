=begin
Problem: string is letters, spaces, and a point. 
  Words are separated by one or more spaces
  Odd words are reversed (zere-index based)
  
Example: 

Data Structure: string, read it character by character

Algorithm: 
  - if space(s) at the beginning, ignore
  - print chars of first word (set reverse next word flag)
  - print space, ignore subsequent spaces
  - initialize empty word var
  - prepend chars to empty word var until a space is encountered
  - reset reverse word flag
  
=end

# def odd_words(string)
#   word_array = string.gsub('.', '').split
#   odd_reversed = word_array.map.with_index do |word, index|
#     index.odd? ? word.reverse : word
#   end
#   odd_reversed.join(' ') + '.'
# end

def odd_words(string)
  result = ""
  word_count = 0
  i = 0
  while i < string.length
    char = string[i]
    if char == " "
      word = false
      char_count = 0
      result << char unless word_count == 0 || result [-1] == " "
    
    elsif char != " " && char != "."
      word_count += 1 unless word
      word = true
      
      if word_count.odd?
        result << char
      else 
        char_count += 1
        result = result[0..-char_count] + char + result[-(char_count - 1), char_count - 1]
      end
      
    elsif char == "."
      while result[-1] == " "
        result[-1] = ""
      end
      result << char
    end 
    
    i += 1
  end
  result
end

p odd_words("  whats the matter with kansas.") == "whats eht matter htiw kansas."
p odd_words("hello.") == "hello."
p odd_words("whats the  matter  with kansas  .")  == "whats eht matter htiw kansas."
p odd_words("whats the matter with kansas city.") == "whats eht matter htiw kansas ytic."
p odd_words("") == ""
p odd_words(".") == "."
p odd_words("hello") == "hello"
p odd_words("hello word.") == "hello drow."
p odd_words("hello word .") == "hello drow."
p odd_words("hello   word .") == "hello drow."
p odd_words("hello word  .") == "hello drow."
p odd_words("hello word world .") == "hello drow world."



