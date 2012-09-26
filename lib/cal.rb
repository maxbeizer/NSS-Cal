require_relative "generate"

month = ARGV[0]
year = ARGV[1]
puts Month.new(month, year).to_s