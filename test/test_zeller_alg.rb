require 'test/unit'
require 'zeller_alg'

class ZellerAlgTest < Test::Unit::TestCase

  def test_01a_leap_years
    assert_equal 0, ZellerAlgorithm.day_of_week(9, 1, 2012)
  end

  def test_01b_leap_years
    assert_equal 1, ZellerAlgorithm.day_of_week(9, 2, 2012)
  end

  def test_01c_leap_years
    assert_equal 2, ZellerAlgorithm.day_of_week(9, 3, 2012)
  end

  def test_01d_leap_years
    assert_equal 5, ZellerAlgorithm.day_of_week(4, 27, 2000)
  end

  def test_01e_leap_years  
    assert_equal 6, ZellerAlgorithm.day_of_week(4, 28, 2000)
  end

  def test_02a_non_leap_years
    assert_equal 1, ZellerAlgorithm.day_of_week(9, 1, 2013)
  end

  def test_02b_non_leap_years  
    assert_equal 2, ZellerAlgorithm.day_of_week(9, 2, 2013)
  end

  def test_02c_non_leap_years  
    assert_equal 3, ZellerAlgorithm.day_of_week(4, 27, 1999)
  end

  def test_02d_non_leap_years  
    assert_equal 4, ZellerAlgorithm.day_of_week(4, 28, 1999)
  end

  def test_02e_non_leap_years
    assert_equal 5, ZellerAlgorithm.day_of_week(4, 29, 1999)
  end

  def test_02f_non_leap_years  
    assert_equal 6, ZellerAlgorithm.day_of_week(4, 30, 1999)
  end
end
