class UsersController < ApplicationController

    # skip_before_action :require_login, only: [:new, :create, :login]

    def new
        @user = User.new
    end

    def create
        @user = User.create(params.require(:user).permit(:username, :password))
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            flash[:error] = "Sign up invalid."
            redirect_to '/signup'
        end
    end

    def show 
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end 