class Booking < ActiveRecord::Base
  belongs_to :user
  scope :feed, -> { order(date_time: :desc) }

  def self.find_by_location_and_time(location = "San Francisco", date = Date.today, time = "12:00")
    local_restaurants = Restaurant.find_by_location(location).map
    Booking.where(:restaurant_id => local_restaurants)
  end
end
