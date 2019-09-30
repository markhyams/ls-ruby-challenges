class SecretHandshake
  EVENTS = ['wink', 'double blink', 'close your eyes', 'jump']
  def initialize(input)
    @binary = if input.class == String && !(input =~ /[^10]/)
                input
              elsif input.class == Integer
                input.to_s(2)
              else
                "0"
              end
  end


  def commands
    digit_arr = @binary.chars.reverse
    result = EVENTS.select.with_index do |_, index|
      digit_arr[index] == '1'
    end
    digit_arr[4] == "1" ? result.reverse : result
  end
end

p SecretHandshake.new(['hello']).commands