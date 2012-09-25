class ZellerAlg
  #ZellerAlg.day_of_week 
  def self.day_of_week month, day_of_month, year 
  	march_offset = ((month + 1) * 26/10).floor
  	leap_year_offset = (year/4).floor + 6 * (year/100).floor + (year/400).floor
  	(day_of_month + march_offset + year + leap_year_offset) % 7
   

  end

 
  
  MONTH = [nil, "January", "February", "March", "April", "May", "June", "July", 
  		"August", "September", "October", "November", "December"]
  
 

  	#day_of_week = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]

end