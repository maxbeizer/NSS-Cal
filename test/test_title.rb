require 'test/unit'
require 'title'

class TitleTest < Test::Unit::TestCase

  def test_01_title_takes_params
    title = Title.new(12, 2012)
    assert_equal(12, title.month)
  end

end
