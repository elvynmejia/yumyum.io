class Booking < ActiveRecord::Base
  belongs_to :user
  scope :feed, -> { order(date_time: :desc) }
end
