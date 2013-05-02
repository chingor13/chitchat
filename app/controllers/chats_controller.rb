class ChatsController < ApplicationController

  before_filter :load_user, :only => [:index]

  # GET /users/:user_id/chats
  def index
    @chats = @user.chats
  end

  # POST /chats
  def create
    @chat = Chitchat::Chat.new(params[:chat])
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

end
