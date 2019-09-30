def rotate_rightmost(number, digits)
  num_digits = number.to_s.size
  num_str = number.to_s
  (num_str[0, num_digits - digits] + num_str[-(digits - 1)..-1] + num_str[-digits]).to_i
end

# p rotate_rightmost(329175, 4) 

def max_rotation(number)
  num_digits = number.to_s.size
  while num_digits > 1
    number = rotate_rightmost(number, num_digits)
    num_digits -= 1
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(105) == 15
p max_rotation(35) == 53
p max_rotation(8_703_529_146) == 7_321_609_845