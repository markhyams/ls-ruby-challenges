require 'pry'

class Octal
  def initialize(octal)
      @octal_str = octal =~ /[^0-7]/ ? '0' : octal
  end  
  
  def to_decimal
    rev_digits = @octal_str.split('').reverse.map(&:to_i)
    result = 0
    rev_digits.each_with_index do |digit, power|
      result += (8 ** power) * digit
    end
    result
    
  end
end

p Octal.new('6789').to_decimal