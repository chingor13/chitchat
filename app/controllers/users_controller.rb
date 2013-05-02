class UsersController < ApplicationController

  before_filter :load_user, :only => [:sign_on, :sign_off, :show]

  # GET /users/:id
  def show
  end

  # POST /users/:id/sign_on
  def sign_on
    @user.sign_on!
  end

  # POST /users/:id/sign_off
  def sign_off
    @user.sign_off!
  end

  protected

  def load_user
    @user = Chitchat::User.find(params[:id])
  end

end
