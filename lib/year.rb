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
### ----------------
#here down needs heavy refactoring, ugly. not exactly DRY
  def first_block 
    first_block = []
    w = 0
    until w > 5
      m = 1
      until m > 3
        first_block << Month.new(m, @year).weeks_array[w].first(7).push(" ")
        m+= 1
      end
      w += 1
    end
    first_block
  end

  def flatten_first_block
    i = 0
    lines = []
    while i*3 < first_block.length
      line = first_block[i*3..i*3+2].flatten.join
      lines << line
      i += 1
    end
    lines
  end

  def second_block 
    second_block = []
    w = 0
    until w > 5
      m = 4
      until m > 6
        second_block << Month.new(m, @year).weeks_array[w].first(7).push(" ")
        m+= 1
      end
      w += 1
    end
    second_block
  end

  def flatten_second_block
    i = 0
    lines = []
    while i*3 < second_block.length
      line = second_block[i*3..i*3+2].flatten.join
      lines << line
      i += 1
    end
    lines
  end

  def third_block 
    third_block = []
    w = 0
    until w > 5
      m = 7
      until m > 9
        third_block << Month.new(m, @year).weeks_array[w].first(7).push(" ")
        m+= 1
      end
      w += 1
    end
    third_block
  end

  def flatten_third_block
    i = 0
    lines = []
    while i*3 < third_block.length
      line = third_block[i*3..i*3+2].flatten.join
      lines << line
      i += 1
    end
    lines
  end

  def fourth_block 
    fourth_block = []
    w = 0
    until w > 5
      m = 10
      until m > 12
        fourth_block << Month.new(m, @year).weeks_array[w].first(7).push(" ")
        m+= 1
      end
      w += 1
    end
    fourth_block
  end

  def flatten_fourth_block
    i = 0
    lines = []
    while i*3 < fourth_block.length
      line = fourth_block[i*3..i*3+2].flatten.join
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
      puts flatten_first_block
    when 6
      puts flatten_second_block
    when 9
      puts flatten_third_block
    when 12
      puts flatten_fourth_block  
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
