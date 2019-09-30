require 'date'
require 'pry'

# Meetup class
class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @all_days = all_days_of_the_month
  end

  WHICH_DAY = {
    last: -1,
    first: 0,
    second: 1,
    third: 2,
    fourth: 3
  }.freeze

  def day(day_of_week, schedule)
    days_of_week = all_days_of_the_month.select do |this_day|
      this_day.strftime('%A').downcase == day_of_week.to_s
    end
    
    if schedule == :teenth
      days_of_week.detect do |this_day|
        (13..19).include?(this_day.day)
      end
    else
      days_of_week[WHICH_DAY[schedule]]
    end
  end
  
  def all_days_of_the_month
    result = []
    next_day = Date.new(@year, @month, 1)
    break_month = next_day.next_month.month
    until next_day.month == break_month
      result << next_day
      next_day += 1
    end
    result
  end
end

