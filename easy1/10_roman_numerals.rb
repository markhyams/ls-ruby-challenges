class Integer 
  def to_roman
    result = self.digits.map.with_index do |number, index|
      number_to_letters(number, index)
    end
    result.reverse.join('')
  end
  
  def number_to_letters(num, tens_power)
    letters = %w(I V X L C D M)
    idx = tens_power * 2
    case num
      when (1..3) then letters[idx] * num
      when 4 then letters[idx] + letters[idx + 1]
      when (5..8) then letters[idx + 1] + letters[idx] * (num - 5)
      when 9 then letters[idx] + letters[idx + 2]
    end
  end
end
