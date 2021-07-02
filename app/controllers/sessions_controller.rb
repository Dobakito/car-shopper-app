class SessionsController < ApplicationController

  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def google_create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
