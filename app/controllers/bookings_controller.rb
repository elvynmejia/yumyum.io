class BookingsController < ApplicationController

  def index
    bookings  = current_user.bookings.feed
    respond_with(bookings)
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.save
    respond_with @booking do |format|
      format.json { render json: @booking }
    end
  end
  private
  def booking_params
    params.require(:booking).permit(:user_id, :confirmation_number, :message, :date_time, :party_size, :restaurant_id)
  end
end
