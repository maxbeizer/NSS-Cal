require 'test/unit'
require 'zeller_alg'

class ZellerAlgTest < Test::Unit::TestCase

  def test_01_day_of_month_is_1
    assert_equal 0 , ZellerAlg.day_of_week(9, 1, 2012)
  end
end
