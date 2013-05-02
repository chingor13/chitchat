class MessagesController < ApplicationController

  # POST /chats/:id/messages
  def create
    chat = Chitchat::Chat.find(params[:chat_id])
    
    user = Chitchat::User.find_by_identifier(params[:user])
    
    @message = chat.messages.build(user: user, body: params[:body])
    if @message.save
      render json: {status: 200, message: @message}
    else
      render json: {status: 422, errors: @message.errors.full_messages}
    end
  end

end
