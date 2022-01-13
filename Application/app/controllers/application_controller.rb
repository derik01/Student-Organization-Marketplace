class ApplicationController < ActionController::Base

  # before_action :require_login

  helper_method :current_user
  helper_method :logged_in?


  def require_login
    redirect_to new_user_path unless session.include? :user_id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?    
    !current_user.nil?
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
