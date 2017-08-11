class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Sign up successfully!!!"
      redirect_to users_path
    else 
      flash[:error] = "Sign up again!"
      render "new"
    end 
  end 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 

end
