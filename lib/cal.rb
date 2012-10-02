require_relative "generate"

month = ARGV[0].to_i
year = ARGV[1].to_i
puts Month.new(month, year).print_month