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
      month_groups << Title.new(i, @year).month_name.center(20) + "  "
      i += 1
    end
    month_groups.join
  end
end
