class UsersController < ApplicationController

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
