class Series
  def initialize(num_str)
    @num_str = num_str
  end
  
  def slices(n)
    raise ArgumentError.new('argument is larger than string size') if n > @num_str.size
    num_slices = @num_str.size - n + 1
    result = []
    index = 0
    num_slices.times do 
      result << @num_str[index, n].split('').map(&:to_i)
      index += 1
    end
    result
  end
end

series = Series.new('01234')

p series.slices(3)