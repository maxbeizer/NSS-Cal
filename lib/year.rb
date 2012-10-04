require_relative "zeller_alg"
require_relative "title"
require_relative "generate"

class Year
attr_reader :year

  def initialize (year)
    @year = year
  end

  def year_spacing
    title = @year.to_s
    title.center(64)
  end

  def month_spacing
    month_groups
  end  

  def month_names (start, finish)
    i = start
    month_groups = []    
    until i > finish
#this line needs serious work. serious.
      month_groups << Title.new(i, @year).month_name.center(20) + "  "
      i += 1
    end
    month_groups.join
  end

  def day_names
    day_name_groups = []
    day_name_groups << (DAY_NAMES + "  ") * 3
    day_name_groups.join
  end

  def week_row (week_num)
#this is ridiculously ugly, but could be translated into something that works
    week_row = []
    week_row << Month.new(1, @year).weeks_array[0].first(7).push(" ")
    week_row << Month.new(2, @year).weeks_array[0].first(7).push(" ")
    week_row << Month.new(3, @year).weeks_array[0].first(7).push(" ")
    week_row.join
  end
end
