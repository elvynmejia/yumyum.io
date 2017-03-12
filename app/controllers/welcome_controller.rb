require_relative '../../test_api_calls'

class WelcomeController < ApplicationController
  def index
    welcome = "Welcome to my awesome app"
      # welcome = APIUtil.get_restaurants
    	respond_with welcome
  end
end
