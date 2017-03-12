require_relative "./util"
require_relative "./api_util"

class Restaurant
  def self.find_by_id(rid)
    APIUtil.open_table_get("https://platform.otqa.com/sync/listings/334882")
  end

  def self.find_by_lat_long(lat = 37.782039, long = -122.391139)
    date = Date.today
    time = "12:00"
    party_size = 5
    radius = 10

    # Returns an array of restaurant objects
    datetime = Util.format_datetime(date, time)
    url = "https://platform.otqa.com/availability?latitude=#{lat}&longitude=#{long}&party_size=#{party_size}&radius=#{radius}&forward_minutes=180&backward_minutes=0&start_date_time=#{datetime}&include_unavailable=true"
    APIUtil.open_table_get(url)
  end

  def self.find_by_location(location = "San Francisco")
    ## Used as helper to find nearby bookings
    if location == "San Francisco"
      lat, long = 37.782039, -122.391139
    else
      lat, long = Util.coordinates_from_location(location)
    end
    date = Date.today
    time = "12:00"
    party_size = 5
    radius = 10

    # Returns an array of restaurant objects
    datetime = Util.format_datetime(date, time)
    url = "https://platform.otqa.com/availability?latitude=#{lat}&longitude=#{long}&party_size=#{party_size}&radius=#{radius}&forward_minutes=180&backward_minutes=0&start_date_time=#{datetime}&include_unavailable=true"
    APIUtil.open_table_get(url)
  end

  def self.find_by_location_and_availability(location = "San Francisco", date = Date.today, time = "12:00", party_size = 5, radius = 10)
    # Returns an array of restaurant objects
    if location == "San Francisco"
      lat, long = 37.782039, -122.391139
    else
      lat, long = Util.coordinates_from_location(location)
    end
    datetime = Util.format_datetime(date, time)
    url = "https://platform.otqa.com/availability?latitude=#{lat}&longitude=#{long}&party_size=#{party_size}&radius=#{radius}&forward_minutes=30&backward_minutes=30&start_date_time=#{datetime}&include_unavailable=false"
    APIUtil.open_table_get(url)
  end

  def self.find_by_lat_long_and_availability(lat = 37.7823364, long = -122.3913973, date = Date.today, time = "12:00", party_size = 5, radius = 10)
    # Returns an array of restaurant objects
    datetime = Util.format_datetime(date, time)
    url = "https://platform.otqa.com/availability?latitude=#{lat}&longitude=#{long}&party_size=#{party_size}&radius=#{radius}&forward_minutes=30&backward_minutes=30&start_date_time=#{datetime}&include_unavailable=false"
    puts url
    APIUtil.open_table_get(url)
  end
end

puts Restaurant.find_by_lat_long_and_availability
puts Restaurant.find_by_id(30439)
