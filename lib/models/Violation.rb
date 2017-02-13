require 'pry'

class Violation

  attr_reader :all_other_areas, :code, :definition, :manhattan_96th_st_below, :class_variable
  @@all = {}
  @@error_count = 0
  @@insult_array = ["Come on. Are you even looking at your ticket?  Come back when you're ready.  Goodbye.", "Still can't find the number? Maybe you should call for help and come back later.  Goodbye.", "You know, illiteracy is a growing problem.  However, you're just trying to find a number.  Come back when you learn numbers.", "Look, I'm sure you're a nice person.  But I can't even right now.  Goodbye.", "So either you're really struggling with the concept of numbers, or you're just trolling me.  Regardless, I can't do this.  Goodbye"]

  def self.new_from_api
    parking_data = ParkingAPI.new
    result = parking_data.violation_data.map do |hash|
      all_other_areas = hash["all_other_areas"]
      code = hash["code"]
      definition = hash["definition"]
      manhattan_96th_st_below = hash["manhattan_96th_st_below"]
      self.new(all_other_areas: all_other_areas, code: code, definition: definition, manhattan_96th_st_below: manhattan_96th_st_below)
    end
  end

  def self.valid_code?(input)
    if @@all.keys.include?(input)
      @@error_count = 0
      puts "-" * 50
      puts "Your parking screw up is below:"
      sleep (0.7)
      puts "-" * 50
      return self.find_by_code(input)
      puts "-" * 50
      puts " "
      sleep (2)
    else
      if @@error_count < 4
      puts "-" * 50
      puts "That's not a valid number.  Please try again."
      puts "-" * 50
      sleep(0.7)
      input = gets.to_s.chomp
      @@error_count += 1
      self.valid_code?(input)

    elsif @@error_count = 5
      puts "-" * 50
      puts @@insult_array.sample
      puts "-" * 50
      sleep(0.7)
      exit
      end
    end
  end

def self.find_by_code(input)
  puts @@all[input].definition
  puts "-" * 50
end


def initialize(all_other_areas:, code:, definition:, manhattan_96th_st_below:)
  @all_other_areas = all_other_areas
  @code = code
  @definition = definition
  @manhattan_96th_st_below = manhattan_96th_st_below
  @@all[code] = self
end


end
