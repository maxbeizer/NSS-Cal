require_relative "zeller_alg"
require_relative "title"

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

  def day_names
    "Su Mo Tu We Th Fr Sa"
  end
  
  def days_in_month
    !(@year % 100 == 0) && @year % 4 == 0 || @year % 400 == 0 ? leap = 29 : leap = 28
    days_in_month = [nil, 31, leap, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    days_in_month[@month]
  end

  def day_of_week
    ZellerAlg.day_of_week(@month, DAY_OF_MONTH, @year)
  end

  def to_s
    puts month_name + " " + @year
    puts day_names
  end
end
