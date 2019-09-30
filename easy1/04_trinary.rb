class Trinary
  def initialize(str)
    str = '0' if str =~ /[^012]/
    @tri_digits = str.chars.map(&:to_i)
  end

  # def to_decimal
  #   power = @tri_str.size
  #   @tri_digits.reduce(0) do |sum, digit|
  #     power -=1
  #     (3 ** power) * digit + sum
  #   end
  # end

  def to_decimal
    @tri_digits.reverse.map.with_index do |digit, power|
      (3 ** power) * digit
    end.sum
  end
end

p Trinary.new('21210')
