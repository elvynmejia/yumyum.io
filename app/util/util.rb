require 'geokit'

class Util
  def self.coordinates_from_location(location)
    info = Geokit::Geocoders::GoogleGeocoder.geocode("San Francisco").ll
    info.split(",").map(&:to_f)
  end

  def self.format_datetime(date, time)
    # TODO fix this
    "2017-03-13T20%3A00"
  end
end


# puts Util.coordinates_from_location("San Francisco")
