require 'test/unit'
require 'generate'

class GenerateTest < Test::Unit::TestCase

  def test_01_output
    m = Month.new(9, 2012)
    assert_equal "September" , m.month.to_s
  end
end