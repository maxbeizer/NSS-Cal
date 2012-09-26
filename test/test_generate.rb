require 'test/unit'
require 'generate'

class GenerateTest < Test::Unit::TestCase

  def test_01_month_name
    m = Month.new(9, 2012)
    n = Month.new(10, 2012)
    o = Month.new(11, 2012)
    p = Month.new(12, 2012)
    assert_equal "September" , m.month_name
    assert_equal "October" , n.month_name
    assert_equal "November" , o.month_name
    assert_equal "December" , p.month_name
  end

  def test_02_day_of_week
    m = Month.new(9, 2012)
    n = Month.new(10, 2012)
    o = Month.new(1, 1812)
    p = Month.new(12, 2912)
    assert_equal 0 , m.day_of_week
    assert_equal 2 , n.day_of_week
    assert_equal 4 , o.day_of_week
    assert_equal 5 , p.day_of_week
  end

  def test_03_days_in_month
    m = Month.new(9, 2012)
    n = Month.new(10, 2012)
    o = Month.new(1, 1812)
    p = Month.new(12, 2912)
    assert_equal 30 , m.days_in_month
    assert_equal 31 , n.days_in_month
    assert_equal 31 , o.days_in_month
    assert_equal 31 , p.days_in_month  
  end

  def test_03a_days_in_month_leap_months
    m = Month.new(2, 2012)
    n = Month.new(2, 2011)
    o = Month.new(2, 1800)
    p = Month.new(2, 2000)
    assert_equal 29 , m.days_in_month
    assert_equal 28 , n.days_in_month
    assert_equal 28 , o.days_in_month
    assert_equal 29 , p.days_in_month  
  end

  def test_04_day_names
    m = Month.new(2, 2000)
    assert_equal "Su Mo Tu We Th Fr Sa" , m.day_names
  end
end