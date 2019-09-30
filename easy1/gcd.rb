# def gcd(a, b)
#   b_factors = factors(b)
#   factors(a).select { |factor| b_factors.include?(factor) }.max
# end

# def factors(num)
#   (1..num).select { |n| num % n == 0 }
# end

def gcd(a, b)
  min = [a, b].min
  
  while min > 0
    return min if a % min == 0 && b % min == 0
    min -= 1
  end
  min
end
