class CLIRunner
  def self.welcome
    puts "-" * 30
    puts "Welcome the NYC Parking Violation Finder"
    sleep(0.04)
    puts "-" * 30
    puts "It looks like you have a problem . . ."
    sleep(0.04)
  end
  def self.search
    puts "Please enter a Violation Code you want info on or 'exit'.. "
    input  = gets.to_s.chomp
    if input =="exit"
      exit
    elsif Violation.valid_code?(input)
    end
  end
end
