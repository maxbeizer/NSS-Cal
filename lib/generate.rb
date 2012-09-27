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
    title = month_name + " " + @year.to_s
    title.center(20)
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
    1.upto(days_in_month) {|i| days_array.push(i.inspect + " ")}
    days_array[0..8].each {|j| j.prepend(" ")}
    days_array.unshift("   ", "   ", "   ", "   ", "   ", "   ") if day_of_week == 0
    #days_array.unshift("               ") if day_of_week == 0
    (day_of_week-1).times {|i| days_array.unshift("   ")}    
    days_array
  end

  def weeks_array
    weeks_array = []
    weeks_array = days_array.each_slice(7).to_a
    # weeks_array.push(days_array[0..6])
    # weeks_array.push(days_array[7..13])
    # weeks_array.push(days_array[14..20])
    # weeks_array.push(days_array[21..27])
    # weeks_array.push(days_array[28..30]) unless days_array[28].nil?
    # weeks_array[0].each {|i| print i}
    # weeks_array[1].each {|i| print i}
    # weeks_array[2].each {|i| print i}
    # weeks_array[3].each {|i| print i}
    # weeks_array[4].each {|i| print i}
  end

  def to_s
    puts title_spacing
    puts day_names
    weeks_array[0].each {|i| print i} 
    puts
    weeks_array[1].each {|i| print i}
    puts
    weeks_array[2].each {|i| print i}
    puts
    weeks_array[3].each {|i| print i}
    puts
    weeks_array[4].each {|i| print i}
    puts
    weeks_array[5].each {|i| print i} unless weeks_array[5].nil?
    print #otherwise will return last array twice


  end
end
