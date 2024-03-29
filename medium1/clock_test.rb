require 'minitest/autorun'
require_relative 'clock'

class ClockTest < Minitest::Test
  def test_on_the_hour
    assert_equal '08:00', Clock.at(8).to_s
    assert_equal '09:00', Clock.at(9).to_s
  end

  def test_past_the_hour
    assert_equal '11:09', Clock.at(11, 9).to_s
  end

  def test_add_a_few_minutes
    clock = Clock.at(10) + 3
    assert_equal '10:03', clock.to_s
  end

  def test_add_over_an_hour
    clock = Clock.at(10) + 61
    assert_equal '11:01', clock.to_s
  end

  def test_wrap_around_at_midnight
    clock = Clock.at(23, 30) + 60
    assert_equal '00:30', clock.to_s
  end

  def test_subtract_minutes
    clock = Clock.at(10) - 90
    assert_equal '08:30', clock.to_s
  end

  def test_equivalent_clocks
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert_equal clock1, clock2
  end

  def test_inequivalent_clocks
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 36)
    clock3 = Clock.at(14, 37)
    refute_equal clock1, clock2
    refute_equal clock1, clock3
  end

  def test_wrap_around_backwards
    clock = Clock.at(0, 30) - 60
    assert_equal '23:30', clock.to_s
  end
  
  def test_subtract_minutes_1
    clock = Clock.at(10, 45) - 90
    assert_equal '09:15', clock.to_s
  end
  
  def test_add_minutes
    clock = Clock.at(10, 1) + 100
    assert_equal '11:41', clock.to_s
  end
  
  def test_add_minutes_1
    clock = Clock.at(22) + 599
    assert_equal '07:59', clock.to_s
  end

  def test_subtract_minutes_2
    clock = Clock.at(7, 59) - 600
    assert_equal '21:59', clock.to_s
  end
  
  def test_add_a_day_of_minutes
    clock = Clock.at(22) + 1439
    assert_equal '21:59', clock.to_s
  end

  def test_add_two_days_of_minutes
    clock = Clock.at(22) + 2880
    assert_equal '22:00', clock.to_s
  end
end
