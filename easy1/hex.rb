# convert to hex

class Hex
  def initialize(hex_str)
    hex_str = '0' if hex_str =~ /[^0-9a-fA-F]/
    @hex_digits = hex_str.downcase.chars.map { |digit| digit_to_dec(digit)}
  end
  
  def digit_to_dec(digit)
    case digit 
    when 'a' then 10
    when 'b' then 11
    when 'c' then 12
    when 'd' then 13
    when 'e' then 14
    when 'f' then 15
    else digit.to_i
    end
  end
  
  def to_decimal
    result = 0
    @hex_digits.reverse.each_with_index do |digit, power|
      result += (16 ** power) * digit 
    end
    result
  end
end

p Hex.new('1283ab32FE').to_decimal
p Hex.new('hello').to_decimal
p Hex.new('10').to_decimal
