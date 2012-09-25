require 'test/unit'
require 'day_names'

class DatNamesTest < Test::Unit::TestCase

  def test_01_day_names_exists
    day_names = DayNames.new
    assert_equal(false, day_names.nil?)
  end

  def test_02_day_names_output
    day_names = DayNames.new
    assert_equal("Su Mo Tu We Th Fr Sa", day_names.days_row)
  end    
end
