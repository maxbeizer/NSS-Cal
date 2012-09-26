require "zeller_alg"
require "day_names"
require "title"

DAY_OF_MONTH = 1

class Month
attr_reader :month, :year

  def initialize month, year
    @month = month
    @year = year
  end

  def month_name 
    Title.new(@month, @year).month_name
  end
  
  def days_in_month
    if !(@year % 100 == 0) && @year % 4 == 0 || @year % 400 == 0
      leap = 29
    else
      leap = 28
    end
    days_in_month = [nil, 31, leap, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    days_in_month[@month]
  end

  def day_of_week
    ZellerAlg.day_of_week(@month, DAY_OF_MONTH, @year)
  end
end