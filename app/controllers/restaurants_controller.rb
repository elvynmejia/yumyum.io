class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.find_by_location_and_availability(
      params[:location],
      params[:date],
      params[:time],
      params[:size],
      params[:radius]
    )
    respond_with restaurants
  end

  # def show
  #   @restaurant = Restaurant.find_by_id(params[:restaurant_id])
  #
  # end
end
