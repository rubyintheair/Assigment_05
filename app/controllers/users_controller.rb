class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create 
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Sign up successfully!!!"
    else 
      flash[:error] = "Sign up again!"
      render "new"
    end 
  end 

  def new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 


end
