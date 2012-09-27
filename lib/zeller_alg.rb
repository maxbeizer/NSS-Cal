module ZellerAlg
  def self.day_of_week month, day_of_month, year
    if month < 3
      month += 12
      year -= 1
    end
  	march_offset = ((month + 1) * 26/10.0).floor
  	leap_year_offset = (year/4) + 6 * (year/100) + (year/400)
  	(day_of_month + march_offset + year + leap_year_offset) % 7
  end
end
