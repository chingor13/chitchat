class MessagesController < ApplicationController
  before_filter :load_chat

  def index
    @messages = @chat.messages
  end

  def new
    @message = ChitChat::Message.new(params[:message])
  end

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
