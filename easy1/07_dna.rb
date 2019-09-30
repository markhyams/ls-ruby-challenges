class DNA 
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(other_strand)
    result, index = [0, 0]
    while @strand[index] && other_strand[index]
      result += 1 unless other_strand[index] == @strand[index]
      index += 1
    end
    result
  end
end

