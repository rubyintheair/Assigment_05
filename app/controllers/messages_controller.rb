class MessagesController < ApplicationController
  def index 
    redirect_to inbox_messages_path
  end 

  def new 
    @message = Message.new
  end 

  def inbox
    @messages = current_user.recieved_messages
  end 

  def sent
    @messages = current_user.sent_messages
  end 

  def create 
    @message = current_user.sent_messages.build(message_params)
    if @message.save
      redirect_to sent_messages_path
    else
      render "new"
    end 
  end 

  def message_params
    params.require(:message).permit(:recipient_id, :body)
  end 
end
