class Phrase
  def initialize(phrase)
    @words = phrase.split(/\s|,/)
  end

  def word_count
    @words.each_with_object(Hash.new(0)) do |word, count_hsh|
      next unless word =~ /\w/
      word = word.gsub(/^\W|\W+$/, '').downcase
      count_hsh[word] += 1
    end
  end
end
