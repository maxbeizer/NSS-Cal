require 'test/unit'
require 'day_names'

class DatNamesTest < Test::Unit::TestCase
 
  def test_01_day_names_exists
    assert_equal false , DayNames.days_row.nil?
  end

  def test_02_day_names_output
    assert_equal "Su Mo Tu We Th Fr Sa" , DayNames.days_row
  end    
end
