require_relative '../config/environment'
# require_relative '../lib/data_fetchers/Data_Fetchers_API'

Violation.new_from_api
puts "what code do you want to look up?"
code = gets.to_s.chomp

until Violation.valid_code?(code)
  puts "That's not a valid number.  Try again."
  code = gets.to_s.chomp
end

Violation.find_by_code(code)

#Violation.find_by_code(code)
