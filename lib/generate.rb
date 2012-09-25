require "zeller_alg"
require "day_names"
require "title"

class Month
attr_reader :month, :year

  def initialize month, year
    @month = month
    @year = year
  end

  def month_name month
    Title.new.month_name(month)
  end
  
  def days_in_month

  end

  def day_of_week
    ZellerAlg.day_of_week
  end
end