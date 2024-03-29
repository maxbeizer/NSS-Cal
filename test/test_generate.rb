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
    assert_equal 0 , m.week_start_day
    assert_equal 2 , n.week_start_day
    assert_equal 4 , o.week_start_day
    assert_equal 5 , p.week_start_day
  end

  def test_03a_days_in_month
    m = Month.new(9, 2012)
    n = Month.new(10, 2012)
    o = Month.new(1, 1812)
    p = Month.new(12, 2912)
    assert_equal 30 , m.days_in_month
    assert_equal 31 , n.days_in_month
    assert_equal 31 , o.days_in_month
    assert_equal 31 , p.days_in_month
  end

  def test_03b_days_in_month_leap_months
    m = Month.new(2, 2012)
    p = Month.new(2, 2000)
    assert_equal 29 , m.days_in_month
    assert_equal 29 , p.days_in_month
  end

  def test_03c_days_in_month_non_leap_months
    n = Month.new(2, 2011)
    o = Month.new(2, 1800)
    assert_equal 28 , n.days_in_month
    assert_equal 28 , o.days_in_month
  end

  def test_04_day_names
    names = DAY_NAMES
    assert_equal "Su Mo Tu We Th Fr Sa" , names
  end

  def test_05_days_array_populates_now_with_zeller
    m = Month.new(2, 2000)
    assert_equal ["   ", "   ", " 1 ", " 2 ",
                 " 3 ", " 4 ", " 5 ", " 6 ", " 7 ",
                  " 8 ", " 9 ", "10 ", "11 ", "12 ",
                  "13 ", "14 ", "15 ", "16 ", "17 ",
                  "18 ", "19 ", "20 ", "21 ", "22 ",
                  "23 ", "24 ", "25 ", "26 ", "27 ",
                  "28 ", "29 "] , m.days_array
  end

  def test_06_days_array_add_saturday_sapces
    m = Month.new(9, 2012)
    assert_equal ["   ", "   ", "   ", "   ", "   ", "   ",
                 " 1 ", " 2 ",
                 " 3 ", " 4 ", " 5 ", " 6 ", " 7 ",
                  " 8 ", " 9 ", "10 ", "11 ", "12 ",
                  "13 ", "14 ", "15 ", "16 ", "17 ",
                  "18 ", "19 ", "20 ", "21 ", "22 ",
                  "23 ", "24 ", "25 ", "26 ", "27 ",
                  "28 ", "29 ", "30 "] , m.days_array
  end

  def test_06a_days_array_add_saturday_sapces
    m = Month.new(9, 1888)
    assert_equal ["   ", "   ", "   ", "   ", "   ", "   ",
                  " 1 ", " 2 ",
                 " 3 ", " 4 ", " 5 ", " 6 ", " 7 ",
                  " 8 ", " 9 ", "10 ", "11 ", "12 ",
                  "13 ", "14 ", "15 ", "16 ", "17 ",
                  "18 ", "19 ", "20 ", "21 ", "22 ",
                  "23 ", "24 ", "25 ", "26 ", "27 ",
                  "28 ", "29 ", "30 "] , m.days_array
  end

  def test_07_title_spacing
    m = Month.new(5, 1981)
    assert_equal "      May 1981      ", m.title_spacing
  end

  def test_08_weeks_array_has_nested_arrays
    m = Month.new(5, 1981)
    assert_equal ["   ", "   ", "   ", "   ", "   ", " 1 ", " 2 ", "\n"], m.weeks_array[0]
  end

  def test_08a_weeks_array_always_has_at_least_5th_nested_array
    m = Month.new(11, 2000)
    assert_equal ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "\n"] , m.weeks_array[5]
  end

  def test_09_trailing_spaces_to_fill_out_last_week
    m = Month.new(2, 2012)
    assert_equal ["26 ", "27 ", "28 ", "29 ", "   ", "   ", "   ", "\n"] , m.weeks_array[-2]
  end 

#   def test_10_print_month_method
#     m = Month.new(2, 2012)
#     assert_equal    "February 2012      
# Su Mo Tu We Th Fr Sa  
#           1  2  3  4  
#  5  6  7  8  9 10 11  
# 12 13 14 15 16 17 18  
# 19 20 21 22 23 24 25  
# 26 27 28 29          ", m.print_month   
#   end 
end
