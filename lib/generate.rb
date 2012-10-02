require_relative "zeller_alg"
require_relative "title"

DAY_OF_MONTH = 1
DAY_NAMES = "Su Mo Tu We Th Fr Sa"

class Month
attr_reader :month, :year

  def initialize month, year
    @month = month
    @year = year
  end

  def month_name 
    Title.new(@month, @year).month_name
  end

  def title_spacing
    title = month_name + " #@year"
    title.center(20)
  end
  
  def days_in_month
    #leap year math: http://en.wikipedia.org/wiki/Leap_year
    if @year % 100 != 0 && @year % 4 == 0 || @year % 400 == 0 
      leap = 29
    else
      leap = 28
    end
    days_in_month = [nil, 31, leap, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    days_in_month[@month]
  end

  def day_of_week
    ZellerAlgorithm.day_of_week(@month, DAY_OF_MONTH, @year)
  end

  def days_array
    days_array = []
    1.upto(days_in_month) {|i| days_array.push(i.inspect + " ")}
    days_array[0..8].each {|j| j.prepend(" ")}
    days_array.unshift("   ", "   ", "   ", "   ", "   ", "   ") if day_of_week == 0
    (day_of_week - 1).times {|i| days_array.unshift("   ")}    
    days_array
  end

  def weeks_array
    weeks_array = []
    weeks_array = days_array.each_slice(7).to_a
    weeks_array = weeks_array.each {|nested| nested.push("\n")}
  end

  def print_month
    puts title_spacing
    puts DAY_NAMES
    print weeks_array.join
  end
end
