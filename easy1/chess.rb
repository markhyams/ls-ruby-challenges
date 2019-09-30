def n_queens_problem(num_queens)
  all_combinations = (1..num_queens).to_a.permutation.to_a
  queen_combos = []
  
  all_combinations.each do |arr|
    matches = []
    arr.each_with_index do |value, index|
      match = 0
      arr.each_with_index do |each_value, each_index|
        match += 1 if (value - each_value).abs == (index - each_index).abs
        # next if match > 1
      end
      matches << match
    end
    
    queen_combos << arr if matches.all? { |item| item == 1 }
  end
  
  queen_combos.size
end

# (1..12).each do |n|
#   puts "Number of Queens: #{n}: #{n_queens_problem(n)} solutions."
# end

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { p n_queens_problem(10)}