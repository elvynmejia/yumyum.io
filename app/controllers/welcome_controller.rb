class WelcomeController < ApplicationController
  def index
  	welcome = "Welcome to my awesome app"
  	respond_with welcome
  end
end
