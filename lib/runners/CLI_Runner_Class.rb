class CLIRunner

  def self.welcome

    puts "
    ___
       _-_-  _/\______\\__
    _-_-__  / ,-. -|-  ,-.`-.
      _-_- `( o )----( o )-'
              `-'      `-'
"
    puts "-" * 50
    puts "Welcome the NYC Parking Violation Finder"
    sleep(0.4)
    puts "-" * 50
    puts "It looks like you have a parking problem . . ."
    sleep(0.7)
    puts " "
    puts " "
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
