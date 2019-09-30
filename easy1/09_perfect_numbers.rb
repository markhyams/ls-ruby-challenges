class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1
    
    result = [1]
    factor = 2
    while factor < number
      result << factor if number % factor == 0
      factor += 1
    end
    sum_factors = result.sum
    
    if sum_factors > number
      'abundant'
    elsif sum_factors == number
      'perfect'
    else
      'deficient'
    end
  end
end

p (1..100).select { |num| PerfectNumber.classify(num) == 'abundant'}