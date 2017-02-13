require_relative '../config/environment'
# require_relative '../lib/data_fetchers/Data_Fetchers_API'

Violation.new_from_api
CLIRunner.welcome
until false
  CLIRunner.search
  puts " "
end

#Violation.find_by_code(code)
