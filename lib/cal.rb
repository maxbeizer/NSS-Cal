require_relative "generate"
require_relative "year"


if  ARGV.length == 1
  year = ARGV[0].to_i
  puts Year.new(year).print_year	
else
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  puts Month.new(month, year).print_month
end
