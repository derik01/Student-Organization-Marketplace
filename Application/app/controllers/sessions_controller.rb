class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      # puts @user.id
      redirect_to '/profile'
    else
      flash[:notice] = 'Invalid email/password combination'
      redirect_to '/sign_in'
    end 
  end

  def destroy
    session[:id] = nil
    # flash[:notice] = "You have been signed out!"
    redirect_to '/'
  end
end
