class Clock
  def self.at(hour, minute = 0)
    new(hour, minute)
  end
  
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end
  
  def +(add_minutes)
    @minute += add_minutes
    normalize
    self
  end
  
  def -(subtract_minutes)
    self.+(-subtract_minutes)
  end
  
  def ==(other_clock)
    to_s == other_clock.to_s 
  end
  
  def to_s
    "#{leading_zero(@hour)}:#{leading_zero(@minute)}"
  end
  
  private
  
  def normalize
    while @minute > 59
      @minute -= 60
      @hour += 1
    end
    
    while @minute < 0
      @minute += 60
      @hour -= 1
    end
    
    @hour %= 24
  end
  
  def leading_zero(int)
    sprintf("%02d", int)
  end
end