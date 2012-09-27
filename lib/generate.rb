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

  def days_array
    days_array = []
    days_array.push("               ") if day_of_week == 0
    (day_of_week-1).times {|i| days_array.push("   ")}
    1.upto(days_in_month) {|i| days_array.push(i)}
    #HACK: must add leading space for single digit numbers
    
    days_array

    #IDEA: create empty array. use upto and map spaces onto 
    #      single digits and spaces (using select! ?). 
    #      Insert into a long array. take method.
    #      make new array for zeller days and flatten.
    #      join will return the string for each array .join(" ")

  end

  def to_s
    puts month_name + " " + @year.to_s
    puts day_names
    puts days_put
  end
end
