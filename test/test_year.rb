require 'test/unit'
require 'year'

class YearTest < Test::Unit::TestCase

  def test_01_year_number_accessible
    y = Year.new(2012)
    assert_equal 2012 , y.year
  end

  def test_02_year_title_centered_spacing
    y = Year.new(2012)
    assert_equal "                              2012                              ", y.year_spacing    
  end

  def test_03_print_first_3_month_names
    y = Year.new(2012)
    assert_equal "      January               February               March          ", y.month_names(1, 3) 
  end

  def test_03a_print_names_months_4_thru_6
    y = Year.new(2012)
    assert_equal "       April                  May                   June          ", y.month_names(4, 6) 
  end

  def test_03b_print_names_months_7_thru_9
    y = Year.new(2012)
    assert_equal "        July                 August              September        ", y.month_names(7, 9) 
  end

  def test_03c_print_names_months_10_thru_12
    y = Year.new(2012)
    assert_equal "      October               November              December        ", y.month_names(10, 12) 
  end

  def test_04_day_names
    y = Year.new(2012)
    assert_equal "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  " , y.day_names
  end

  def test_05_first_week_row
    y = Year.new(2012)
    assert_equal " 1  2  3  4  5  6  7            1  2  3  4               1  2  3  " , y.week_row(1)
  end
end
