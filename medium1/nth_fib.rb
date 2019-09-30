class Fib
  def self.nth(n)
    fibs = new(n)
    fibs.generate_fibs
    fibs.fib_numbers.last
  end
  
  attr_reader :fib_numbers
  
  def initialize(n)
    @number_of_fibs = n
    @fib_numbers = [1, 1]
  end
  
  def generate_fibs
    until @fib_numbers.size == @number_of_fibs
      next_num = @fib_numbers[-1] + @fib_numbers[-2]
      @fib_numbers << next_num
    end
  end
end

p Fib.nth(2000) 