require 'pry'

class Violation

  attr_reader :all_other_areas, :code, :definition, :manhattan_96th_st_below, :class_variable
  @@all = {}

  def self.new_from_api
    parking_data = Parking_API.new
    result = parking_data.violation_data.map do |hash|
      all_other_areas = hash["all_other_areas"]
      code = hash["code"]
      definition = hash["definition"]
      manhattan_96th_st_below = hash["manhattan_96th_st_below"]
      self.new(all_other_areas: all_other_areas, code: code, definition: definition, manhattan_96th_st_below: manhattan_96th_st_below)
    end
  end

  def self.valid_code?(code)
    if @@all.keys.include?(code)
      return true
    else
      return false
    end
  end

  def self.find_by_code(code)
    puts @@all[code].definition
  end


  def initialize(all_other_areas:, code:, definition:, manhattan_96th_st_below:)
    @all_other_areas = all_other_areas
    @code = code
    @definition = definition
    @manhattan_96th_st_below = manhattan_96th_st_below
    @@all[code] = self
  end


end
