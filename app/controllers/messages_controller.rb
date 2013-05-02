class MessagesController < ApplicationController
  before_filter :load_chat

  # POST /calls/:id/messages
  def create
    @message = ChitChat::Message.new(params[:message])
    if @message.save

    else
      render :new
    end
  end

  protected

  def load_chat
    @chat = Chitchat::Chat.find(params[:chat_id])
  end
end
