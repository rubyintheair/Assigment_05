class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Sign up successfully!!!"
      redirect_to show_path
    else 
      flash[:error] = "Sign up again!"
      render "new"
    end 
  end 

  def show  
  end 

  def edit
  end 

  def update
    current_user.name = params[:name]
    puts params[:name]
    current_user.email = params[:email]
    current_user.password = params[:password]
    if current_user.save
      render "show"
    end 
  end 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end   


end
