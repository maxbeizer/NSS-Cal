require 'test/unit'
require 'zeller_alg'

class ZellerAlgTest < Test::Unit::TestCase

  def test_01_leap_years
    assert_equal 0, ZellerAlgorithm.day_of_week(9, 1, 2012)
    assert_equal 1, ZellerAlgorithm.day_of_week(9, 2, 2012)
    assert_equal 2, ZellerAlgorithm.day_of_week(9, 3, 2012)
    assert_equal 0, ZellerAlgorithm.day_of_week(9, 8, 2012)
    assert_equal 5, ZellerAlgorithm.day_of_week(4, 27, 2000)
    assert_equal 6, ZellerAlgorithm.day_of_week(4, 28, 2000)
    assert_equal 0, ZellerAlgorithm.day_of_week(4, 29, 2000)
    assert_equal 1, ZellerAlgorithm.day_of_week(4, 30, 2000)
  end

  def test_02_non_leap_years
    assert_equal 1, ZellerAlgorithm.day_of_week(9, 1, 2013)
    assert_equal 2, ZellerAlgorithm.day_of_week(9, 2, 2013)
    assert_equal 3, ZellerAlgorithm.day_of_week(9, 3, 2013)
    assert_equal 1, ZellerAlgorithm.day_of_week(9, 8, 2013)
    assert_equal 3, ZellerAlgorithm.day_of_week(4, 27, 1999)
    assert_equal 4, ZellerAlgorithm.day_of_week(4, 28, 1999)
    assert_equal 5, ZellerAlgorithm.day_of_week(4, 29, 1999)
    assert_equal 6, ZellerAlgorithm.day_of_week(4, 30, 1999)
  end
end
