class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token


    # skip_before_action :require_login, only: [:new, :create, :login]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if /\A[^@\s]+@[^@\s]+\z/.match(@user.username) == nil 
            flash[:notice] = "Invalid Username"
            redirect_to '/signup'
        elsif User.find_by(username: @user.username)
            flash[:notice] = "Username already exists"
            redirect_to '/signup'
        elsif @user.password.length < 8
            flash[:notice] = "Password length should be 8 or longer."
            redirect_to '/signup'
        else @user.valid?
            @user = User.create(params.require(:user).permit(:username, :password))
            session[:user_id] = @user.id
            redirect_to '/welcome'
        end
    end

    def show 
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end 