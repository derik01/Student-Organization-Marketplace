class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create, :login]

    def new
        @user = User.new
    end

    def create
        @user = User.create(params.require(:user).permit(:username, :password))
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            flash[:error] = "Sign up invalid: User and/or password are incorrect."
            redirect_to '/signup'
        end
    end

    def login 
        @user = User.create(params.require(:user).permit(:username, :password))

        if @user.valid?
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            flash[:error] = "Log in invalid: User and/or password are incorrect."
            redirect_to '/login'
        end
    end


    def show 
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end 