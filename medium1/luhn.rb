class Luhn
  attr_reader :checksum

  def self.create(num)
    num *= 10
    loop do
      return num if new(num).valid?
      num += 1
    end
  end

  def initialize(num)
    @num = num
    @checksum = calculate_checksum
  end

  def addends
    @num.digits.map.with_index do |digit, index|
      if index.odd?
        digit *= 2
        digit > 9 ? digit -= 9 : digit
      else
        digit
      end
    end.reverse
  end

  def calculate_checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end
end

p Luhn.create(873_956)
