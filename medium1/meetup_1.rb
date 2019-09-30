require 'date'

# Meetup class
class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  DAY_OF_WEEK = {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }.freeze

  WHICH_DAY = {
    teenth: 1,
    first: 1,
    second: 2,
    third: 3,
    fourth: 4
  }.freeze

  def day(day_of_week, schedule)
    @day_of_week_num = DAY_OF_WEEK[day_of_week]
    @schedule = WHICH_DAY[schedule]
    @teenth = schedule == :teenth

    date_num = schedule == :last ? meetup_date_last : meetup_date

    Date.new(@year, @month, date_num)
  end

  def first_day
    first_day = @teenth ? 13 : 1
    Date.new(@year, @month, first_day).wday
  end

  def last_day
    Date.new(@year, @month, -1).wday
  end

  def meetup_date
    day_num = @day_of_week_num - first_day
    day_num += 7 if day_num < 0
    day_num = (day_num + 1) + (7 * (@schedule - 1))
    @teenth ? day_num + 12 : day_num
  end

  def meetup_date_last
    offset = @day_of_week_num - last_day
    offset -= 7 if offset > 0
    offset - 1
  end
end
