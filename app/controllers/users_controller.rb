class UsersController < ApplicationController
  #before_action :authenticate_with_token!, only: [:show] #it works

  def show
    respond_with(get_user)
  end

  def create
    user = User.new(user_params)
    user.save
    respond_with(user)
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
