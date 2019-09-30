class Anagram 
  def initialize(word)
    @word = word
    @char_count = create_char_count_arr(word.downcase)
  end
  
  def match(words)
    words.select do |candidate|
      next if @word.downcase == candidate.downcase
      @char_count == create_char_count_arr(candidate.downcase)
    end
  end
  
  def create_char_count_arr(word)
    ('a'..'z').map do |char|
      word.count(char)
    end
  end
end
