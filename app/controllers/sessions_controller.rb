class SessionsController < ApplicationController

  def new
  end

  def create
    session[:username] = params[:username]    
    redirect_to photos_path
  end

  def destroy
    session[:username] = nil
    redirect_to login_path
  end

end
