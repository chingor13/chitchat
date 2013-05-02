class UsersController < ApplicationController

  before_filter :load_user, only: [:sign_on, :sign_off, :show]

  # GET /users/:id
  def show
    render json: {status: response.status, user: @user.to_hash}
  end

  # POST /users/:id/sign_on
  def sign_on
    @user.sign_on!
    
    render json: {status: response.status}
  end

  # POST /users/:id/sign_off
  def sign_off
    @user.sign_off!
    
    render json: {status: response.status}
  end

  protected

  def load_user
    @user = Chitchat::User.find_by_identifier!(params[:id])
  end

end
