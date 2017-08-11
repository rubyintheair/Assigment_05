class SessionsController < ApplicationController

  def new 
  end 

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome back, banh beo #{@user.name}!"
        redirect_to users_path
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
    session[:user_id] = nil
    redirect_to root_path
  end 

end
