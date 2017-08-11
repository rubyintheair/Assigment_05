class SessionsController < ApplicationController
  def index
    @user = User.create 
  end

  def create 
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to users_path
        flash[:success] = "Welcome back, banh beo #{@user.name}!"
      else
        flash[:error] = "#{error.full_message.to_sentence}"
        render "index"
      end
    else 
      flash[:error] = "#{error.full_message.to_sentence}"
      redirect_to root_path
    end 
  end 

  def destroy 
  end 

end
