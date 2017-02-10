class Parking_API

  attr_reader :violation_data

  def initialize
    @violation_data = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/dbw3-ymb4.json"))
  end

  #
  # def make_albums
  #   albums = []
  #   all_albums = music_data["tracks"]["items"]
  #   all_albums.each do |album|
  #     album_name = album["name"]
  #     albums << ExampleModel.new(album_name)
  #   end
  #   albums
  # end

end
