require_relative "zeller_alg"
require_relative "title"

FIRST_OF_MONTH = 1
DAY_NAMES = "Su Mo Tu We Th Fr Sa"
SATURDAY_START = 0

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

  def week_start_day
    ZellerAlgorithm.day_of_week(@month, FIRST_OF_MONTH, @year)
  end

  def days_array
    days_array = []
    #add total days in month with trailing space to line it up
    1.upto(days_in_month) {|day| days_array.push(day.inspect + " ")}
    #add leading space to all single digit numbers
    days_array[0..8].each {|digit| digit.prepend(" ")}
    #shift start day for saturday-- must keep as separate spaces for alignment
    if week_start_day == SATURDAY_START
      days_array.unshift("   ", "   ", "   ", "   ", "   ", "   ") 
    else
      #start day for other than Sat. is "-1" because Mon. has no spaces
      (week_start_day - 1).times {|space| days_array.unshift("   ")}    
    end
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
