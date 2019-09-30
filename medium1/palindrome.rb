=begin
- same forwards and backwards. Ignore non-letters
- 'no1, 3on' is considered a palindrome.

- use range to represent alphabet
- get rid of non-letters (select only letters)
- reverse the array

=end

def palindrome?(str)
  clean_chars = str.downcase.chars.select { |char| letter?(char) }
  
  string_length = clean_chars.size
  i = -1
  reversed_chars = []
  loop do
    break if i.abs > string_length
    reversed_chars << clean_chars[i]
    i -= 1
  end
  reversed_chars == clean_chars
end

def letter?(letter)
  ('a'..'z').include?(letter.to_s.downcase)
end

p palindrome?("no1, 3on")
p palindrome?('madam')
p palindrome?("Madam I'm Adam")
p palindrome?("Was it a cat I saw?")
p palindrome?("A man, a plan, a canal, Panama.")
p palindrome?('Mark Hyams') == false
p palindrome?('rotor123')