require 'pry'
class SessionsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def new
  end

  def create
    if !params[:name] || params[:name].empty?
      redirect_to login_path
    else
      session[:name] = params[:name]
      redirect_to home_path
    end
  end

  def destroy
    session[:name] = nil
    flash[:notice] = 'You have been logged out!'
    redirect_to login_path
  end

end
