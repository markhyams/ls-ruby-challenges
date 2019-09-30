class SumOfMultiples
  def initialize(*factors)
    @factors = factors
    @factors = [3, 5] if @factors.empty?
  end

  def to(limit)
    result = []
    @factors.each do |factor|
      multiple = factor
      while multiple < limit
        result << multiple
        multiple += factor
      end
    end
    result.uniq.sum
  end

  def self.to(l)
    new.to(l)
  end
end
