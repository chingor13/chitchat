class UsersController < ApplicationController

  # GET /users/:id
  def show
    @user = Chitchat::User.find_or_create_by_identifier!(params[:id])
    render json: {status: response.status, user: @user}
  end

  # PUT /users/:id/sign_on
  def sign_on
    @user = Chitchat::User.find_or_create_by_identifier!(params[:id])
    @user.sign_on!
    
    render json: {status: response.status}
  end

  # PUT /users/:id/sign_off
  def sign_off
    @user = Chitchat::User.find_or_create_by_identifier!(params[:id])
    @user.sign_off!
    
    render json: {status: response.status}
  end

end


