class Util
  def coordinates_from_location(location)
    Geocoder.search(location)
  end

  def self.format_datetime(date, time)
    # TODO fix this
    "2017-03-13T20%3A00"
  end
end
