class SessionsController < ApplicationController
  require 'digest/sha1'
    
  def create
    if Digest::SHA1.hexdigest(params[:username]) == USERNAME and Digest::SHA1.hexdigest(params[:password]) == PASSWORD
      cookies.permanent[:auth_token] = AppConfig["auth_token"]
      redirect_to root_path, notice: 'Logged in.'
    else
      redirect_to login_path, alert: "Wrong info."
    end
    rescue
      redirect_to root_path, alert: "There's an error - please tell Bryan, he will fix it."
  end
  
  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path, notice: "Logged out."
  end
  
  private
    USERNAME = AppConfig["admin_username"]
    PASSWORD = AppConfig["admin_password"]
end
