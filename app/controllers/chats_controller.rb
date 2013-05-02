class ChatsController < ApplicationController

  before_filter :load_user, :only => [:index]
  before_filter :load_chat, :only => [:show, :answer, :hang_up]

  # GET /users/:user_id/chats
  def index
    @chats = @user.chats
    render json: {status: 200, chats: @chats}
  end

  # POST /chats
  def create
    from = Chitchat::User.find_by_identifier(params[:from])
    to = Chitchat::User.find_by_identifier(params[:to])
    
    @chat = Chitchat::Chat.new(from: from, to: to)
    
    if @chat.save
      render json: {status: 200, chat: @chat}
    else
      render json: {status: 500, errors: @chat.errors.full_messages}
    end
  end

  # GET /chats/:id
  def show
    render json: {status: 200, chat: @chat}
  end

  # POST /chats/:id/answer
  def answer
    @chat.answer!
    render json: {status: 200}
  end

  # POST /chats/:id/hang_up
  def hang_up
    @chat.hang_up!
    render json: {status: 200}
  end
  

  protected

  def load_user
    @user = Chitchat::User.find(params[:user_id])
  end
  
  def load_chat
    @chat = Chitchat::Chat.find(params[:id])
  end

end
