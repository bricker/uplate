class SessionsController < ApplicationController
  require 'bcrypt'
    
  def create
    if BCrypt::Password.new(USERNAME) == params[:username] and BCrypt::Password.new(PASSWORD) == params[:password]
      cookies.permanent[:auth_token] = AppConfig["auth_token"]
      redirect_to root_path, notice: 'Logged in.'
    else
      redirect_to login_path, alert: "Wrong info."
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path, notice: "Logged out."
  end
  
  private
    USERNAME = AppConfig["admin_username"]
    PASSWORD = AppConfig["admin_password"]
end
