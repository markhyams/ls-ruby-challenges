# computes the one millionth prime in 41.1 seconds in AWS Cloud9 

class Prime
  def self.nth(n)
    raise ArgumentError if n < 1  

    prime_list = NthPrime.new(n)
    prime_list.generate_primes
    prime_list.primes.last
  end
end

class NthPrime  
  attr_reader :primes

  def initialize(n)
    @primes = [2]
    @number_of_primes = n
  end
  
  def generate_primes
    number = 3
    until @primes.size == @number_of_primes
      @primes << number if prime?(number)
      number += 2
    end
  end
  
  def prime?(number)
    largest_test_factor = Math.sqrt(number).floor
    @primes.each do |prime|
      break if prime > largest_test_factor
      return false if number % prime == 0
    end
    true
  end
end
