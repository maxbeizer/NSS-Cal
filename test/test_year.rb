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

  def test_05_first_block_first_array
    y = Year.new(2012)
    assert_equal [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " "] , y.month_block(1, 3)[0]
  end

  def test_06_flatten_first_block_by_3_months
    y = Year.new(2012)
    assert_equal [" 1  2  3  4  5  6  7            1  2  3  4               1  2  3  ",
 " 8  9 10 11 12 13 14   5  6  7  8  9 10 11   4  5  6  7  8  9 10  ",
 "15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17  ",
 "22 23 24 25 26 27 28  19 20 21 22 23 24 25  18 19 20 21 22 23 24  ",
 "29 30 31              26 27 28 29           25 26 27 28 29 30 31  ",
 "                                                                  "] , y.flatten_block(1)
  end

  def test_06a_flatten_second_block_by_3_months
    y = Year.new(2012)
    assert_equal [" 1  2  3  4  5  6  7         1  2  3  4  5                  1  2  ",
 " 8  9 10 11 12 13 14   6  7  8  9 10 11 12   3  4  5  6  7  8  9  ",
 "15 16 17 18 19 20 21  13 14 15 16 17 18 19  10 11 12 13 14 15 16  ",
 "22 23 24 25 26 27 28  20 21 22 23 24 25 26  17 18 19 20 21 22 23  ",
 "29 30                 27 28 29 30 31        24 25 26 27 28 29 30  ",
 "                                                                  "], y.flatten_block(2)
  end

  def test_06b_flatten_third_block_by_3_months
    y = Year.new(2012)
    assert_equal [" 1  2  3  4  5  6  7            1  2  3  4                     1  ",
 " 8  9 10 11 12 13 14   5  6  7  8  9 10 11   2  3  4  5  6  7  8  ",
 "15 16 17 18 19 20 21  12 13 14 15 16 17 18   9 10 11 12 13 14 15  ",
 "22 23 24 25 26 27 28  19 20 21 22 23 24 25  16 17 18 19 20 21 22  ",
 "29 30 31              26 27 28 29 30 31     23 24 25 26 27 28 29  ",
 "                                            30                    "] , y.flatten_block(3)
  end

  def test_06c_flatten_fourth_block_by_3_months
    y = Year.new(2012)
    assert_equal ["    1  2  3  4  5  6               1  2  3                     1  ",
 " 7  8  9 10 11 12 13   4  5  6  7  8  9 10   2  3  4  5  6  7  8  ",
 "14 15 16 17 18 19 20  11 12 13 14 15 16 17   9 10 11 12 13 14 15  ",
 "21 22 23 24 25 26 27  18 19 20 21 22 23 24  16 17 18 19 20 21 22  ",
 "28 29 30 31           25 26 27 28 29 30     23 24 25 26 27 28 29  ",
 "                                            30 31                 "], y.flatten_block(4)
  end  
end
