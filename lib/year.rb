require_relative "zeller_alg"
require_relative "title"
require_relative "generate"

class Year
attr_reader :year

  def initialize year
    @year = year
  end

  def year_spacing
    title = @year.to_s
    title.center(64)
  end
end
