class Booking < ActiveRecord::Base
  belongs_to :user
  has_many :atteendees, dependent: :destroy
  scope :feed, -> { order(date_time: :desc) }

  def self.find_by_location_and_time(location = "San Francisco", date = Date.today, time = "12:00")
    local_restaurants = Restaurant.find_by_location(location).map(&:rid)

    Booking.includes(:attendees).where(:restaurant_id => local_restaurants)
    # Restaurant Picture, Name, Number of People, , Link to open table URL, ?Tag List
  end

  def self.find_by_lat_long_and_time(lat = 37.7823364, long = -122.3913973, date = Date.today, time = "12:00")
    local_restaurants = Restaurant.find_by_lat_long(lat, long).map(&:rid)
    Booking.includes(:attendees).where(:restaurant_id => local_restaurants)
  end
end
