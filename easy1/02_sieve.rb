class Sieve
  def initialize(final_num)
    @booleans = [false] * 2 + [true] * (final_num - 1)
  end
  
  def primes
    p = 2

    loop do 
      marked_number = false
      index = p * 2
      while index < @booleans.size
        if @booleans[index]
          marked_number = true 
          @booleans[index] = false
        end
        index += p
      end
      
      loop do
        p += 1
        break if @booleans[p]
      end

      return array_of_primes unless marked_number
    end
  end
  
  def array_of_primes
    result = []
    @booleans.each_with_index do |item, index|
      result << index if item
    end
    result  
  end
end

# p Sieve.new(100).primes

require 'prime'

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { p Sieve.new(10_000_000).primes == Prime.entries(10_000_000) }
# => 'true', 'Seconds: ~ 0.32'

# benchmark { Sieve.new(10_000_000).primes }
# -> Seconds: 0.24 (on AWS Cloud9)
# -> Seconds: 0.18 (on local machine: Intel Core i5 8250U)
