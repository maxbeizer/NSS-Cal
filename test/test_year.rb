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
end
