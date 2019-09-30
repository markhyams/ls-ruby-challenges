class PhoneNumber
  BAD_NUMBER = "0000000000"
  
  def initialize(input_str)
    @input = input_str
  end
  
  def number
    return BAD_NUMBER if contains_letters?
    
    result = @input.gsub(/[^0-9]/, "")
    num_digits = result.size
    
    if num_digits == 11 && result[0] == "1"
      result[1..-1]
    elsif num_digits == 10
      result
    else
      BAD_NUMBER
    end
  end
  
  def contains_letters?
    !!(@input =~ /[a-z]/i)
  end
  
  def area_code
    number[0..2]
  end
  
  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end
end
