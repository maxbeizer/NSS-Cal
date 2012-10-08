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

  def day_names
    day_name_groups = []
    day_name_groups << (DAY_NAMES + "  ") * 3
    day_name_groups.join
  end

  def month_block(month_start_num, month_end_num) 
    month_block = []
    w = 0
    until w > 5
      m = month_start_num
      until m > month_end_num
        month_block << Month.new(m, @year).weeks_array[w].first(7).push(" ")
        m+= 1
      end
      w += 1
    end
    month_block
  end

  def flatten_block(block_num)
    case block_num
    when 1
      block = month_block(1, 3)
    when 2
      block = month_block(4, 6)
    when 3
      block = month_block(7, 9)
    when 4
      block = month_block(10, 12)
    end
    i = 0
    lines = []
    while i*3 < block.length
      line = block[i*3..i*3+2].flatten.join
      lines << line
      i += 1
    end
    lines
  end

  def print_block(start, finish)
    puts month_names(start, finish)
    puts day_names
    case finish
    when 3
      puts flatten_block(1)
    when 6
      puts flatten_block(2)
    when 9
      puts flatten_block(3)
    when 12
      puts flatten_block(4)  
    end
  end

  def print_year
    puts year_spacing
    print_block(1, 3)
    print_block(4, 6)
    print_block(7, 9)
    print_block(10, 12)
  end
end
