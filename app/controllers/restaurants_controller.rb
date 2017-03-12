class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.find_by_lat_long_and_availability
    # puts restaurants
    render json: @restaurants
  end

  # def show
  #   @restaurant = Restaurant.find_by_id(params[:restaurant_id])
  #
  # end
end
