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

  def first_block 
#this is ridiculously ugly, but could be translated into something that works
    first_block = []
    w = 0
    until w > 4
      m = 1
      until m > 3
        first_block << Month.new(m, @year).weeks_array[w].first(7).push(" ")
        m+= 1
      end
      w += 1
    end
    first_block
  end

  def flatten_block
    i = 0
    lines = []
    while i*3 < first_block.length
      line = first_block[i*3..i*3+2].flatten.join
      lines << line
      i += 1
    end
    lines
  end
end
