class BookingsController < ApplicationController

  def index
    bookings = Booking.find_by_location_and_time(
      params[:location],
      params[:date],
      params[:time])
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
