class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :login]

  def new
  end

  # def login
  #   @user = User.find(username: params[:username])    
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to '/welcome'
  #   else
  #     message = "Login invalid: User and/or password are incorrect."
  #     redirect_to '/login', notice: message
  #   end 
  # end

  def create
    @user = User.find(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      message = "Sign Up invalid: User and/or password are incorrect."
      redirect_to '/login', notice: message
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to '/'
  end

end
