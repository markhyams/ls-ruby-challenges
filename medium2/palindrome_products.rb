require 'pry'

class Palindromes
  attr_reader :all_palindromes
  def initialize(limits)
    @upper = limits[:max_factor]
    @lower = limits[:min_factor] || 1
    @all_palindromes = {}
  end
  
  def generate
    (@lower..@upper).each do |factor1|
      
      (factor1..@upper).each do |factor2|
        num = factor1 * factor2
        if is_palindrome?(num)
          factors = [factor1, factor2]
          if @all_palindromes[num]
            @all_palindromes[num] << factors
          else
            @all_palindromes[num] = [factors]
          end
        end
      end
    end
    
  end
  
  def largest
    max_palindrome = @all_palindromes.keys.max
    Palindrome.new(@all_palindromes[max_palindrome], max_palindrome)
  end
  
  def smallest
    min_palindrome = @all_palindromes.keys.min
    Palindrome.new(@all_palindromes[min_palindrome], min_palindrome)
  end
  
  private
  
  def is_palindrome?(num)
    num == num.digits.join('').to_i
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(factors, value)
    @factors = factors
    @value = value
  end
end
