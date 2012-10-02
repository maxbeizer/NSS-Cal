class Title
  attr_reader :month_num, :year

  MONTH_NAME_ARRAY = [nil, "January", "February", 
                "March", "April", "May", "June", "July", "August", 
                "September", "October", "November", "December"]

  def month_name
    raise ArgumentError, "Month Does Not Exist" if MONTH_NAME_ARRAY[@month_num].nil?
    MONTH_NAME_ARRAY[@month_num]
  end
  
  def initialize(month_num, year)
    @month_num = month_num.to_i
    @year = year
  end
end