class UsersController < ApplicationController

  def index
    users = User.all
    respond_with(users)
  end

  def show
    respond_with(get_user)
  end

  def create
    user = User.new(user_params)
    user.save
    respond_with(user)
  end

  def update
    user = get_user.update(user_params)
    respond_with user do |format|
      format.json { render json: get_user }
    end
  end

  private
  def get_user
    puts "What is this fucking hash #{params.inspect}"
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name)
  end
end
