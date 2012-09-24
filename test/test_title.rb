require 'test/unit'
require 'title'

class TitleTest < Test::Unit::TestCase

  def test_01_title_takes_params
    title = Title.new(12, 2012)
    assert_equal(12, title.month_num)
    assert_equal(2012, title.year)
  end

  def test_02_title_params_link_month_name
    title = Title.new(12, 2012)
    assert_equal("December", title.month_name)
  end

  def test_02a_title_params_link_month_name_alt
    title = Title.new(4, 2012)
    assert_equal("April", title.month_name)
  end

  def test_03_title_month_DNE
    title = Title.new(13, 2012)
    assert_raise ArgumentError do
      title.month_name
    end
  end
end
