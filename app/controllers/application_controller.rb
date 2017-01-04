require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def new
    authenticate_user
  end

  def current_user
    @current_user ||= session[:name]
  end

  # def cart
  #   session[:cart] ||= []
  #   @cart = session[:cart]
  #   @cart
  # end

private
  def authenticate_user
    if !logged_in?
      flash[:notice] = 'You must be logged in to view this'
      redirect_to login_path
    end
  end

  def logged_in?
    !!session[:name]
  end

  
end
