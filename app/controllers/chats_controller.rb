class ChatsController < ApplicationController

  before_filter :load_user, :only => [:index]
  before_filter :load_chat, :only => [:show, :answer, :hang_up]

  # GET /users/:user_id/chats
  def index
    @chats = @user.chats
  end

  # POST /chats
  def create
    @chat = Chitchat::Chat.new(params[:chat])
  end

  # GET /chats/:id
  def show
    
  end

  # POST /chats/:id/answer
  def answer
    @chat.answer!
  end

  # POST /chats/:id/hang_up
  def hang_up
    @chat.hang_up!
  end
  

  protected

  def load_user
    @user = Chitchat::User.find(params[:user_id])
  end
  
  def load_chat
    @user = Chitchat::Chat.find(params[:id])
  end

end
