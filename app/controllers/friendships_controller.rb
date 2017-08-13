class FriendshipsController < ApplicationController
  def new
  end 

  def create 
    current_user.friendships.create!(friendship_params)
    redirect_to users_path
  end  

  def destroy
    another_user = User.find params[:user_id]
    current_user.friends.delete(another_user)
    redirect_to users_path
  end  


  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end 
end
