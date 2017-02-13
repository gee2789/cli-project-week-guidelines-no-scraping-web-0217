require 'pry'

class Violation

  attr_reader :all_other_areas, :code, :definition, :manhattan_96th_st_below, :class_variable
  @@all = {}

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
      return self.find_by_code(input)
    else
      puts "That's not a valid number.  Try again."
      input = gets.to_s.chomp
      self.valid_code?(input)
    end
  end

  def self.find_by_code(input)
    puts @@all[input].definition
  end


  def initialize(all_other_areas:, code:, definition:, manhattan_96th_st_below:)
    @all_other_areas = all_other_areas
    @code = code
    @definition = definition
    @manhattan_96th_st_below = manhattan_96th_st_below
    @@all[code] = self
  end


end
