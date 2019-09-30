class PigLatin
  AY = 'ay'
  STARTING_EXCEPTIONS = ['xr', 'yt']

  def self.translate_word(string)
    first_vowel_location = string =~ /[aeiou]/
    first_vowel_location += 1 if string =~ /\A[^aeiou]*qu/
    first_vowel_location = 0 if STARTING_EXCEPTIONS.include?(string[0, 2])
    return string + AY if first_vowel_location == 0

    string[first_vowel_location..-1] + string[0..first_vowel_location - 1] + AY
  end

  def self.translate(string)
    string.split.map { |word| translate_word(word) }.join(' ')
  end
end
