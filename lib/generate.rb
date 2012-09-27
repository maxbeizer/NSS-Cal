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

  def title_spacing
    case
    when month_name.length >= 8
      print "   "
    when month_name.length > 5
      print "    "
    when month_name.length > 3
      print "     "
    else
      print "      "   
    end
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
    1.upto(days_in_month) {|i| days_array.push(i.inspect)}
    days_array[0..8].each {|j| j.prepend(" ")}
    days_array.unshift("               ") if day_of_week == 0
    (day_of_week-1).times {|i| days_array.unshift("   ")}    
    days_array

    #IDEA: create empty array. use upto and map spaces onto 
    #      single digits and spaces (using select! ?). 
    #      Insert into a long array. take method.
    #      make new array for zeller days and flatten.
    #      join will return the string for each array .join(" ")

  end
  

  def to_s
    print title_spacing
    puts month_name + " " + @year.to_s
    puts day_names
    puts days_array
  end
end
