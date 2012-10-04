require 'test/unit'
require 'year'

class YearTest < Test::Unit::TestCase

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
end
