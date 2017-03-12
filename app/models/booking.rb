class Booking < ActiveRecord::Base
  belongs_to :user
  has_many :atteendees, dependent: :destroy
  scope :feed, -> { order(date_time: :desc) }
end
