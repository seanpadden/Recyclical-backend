class UsersController < ApplicationController

  def index 
    @users = User.all 
    render json: @users
  end 


  def show 
    temp = params[:id]
    @user = User.find(temp)
    render json: @user
  end 

  def create 
    user = User.find_or_create_by(user_params)
    if user.valid?
      render json: user 
    else 
      render json: { errors: user.errors.full_messages }
    end 
  end

private

  def user_params
    params.permit(:username, :password_digest)
  end 
end
