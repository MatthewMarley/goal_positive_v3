class UsersController < ApplicationController
    
    def index
        @users = User.all 
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            # This automatically logs in the user upon signup
            session[:user_id] = @user.id
            flash[:success] = "Welcome to GoalPositive #{@user.username}"
            redirect_to root_path
        else
            flash[:error] = "Unable to sign up for GoalPositive"
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    
    private
    def user_params
        params.require(:user).permit(:email, :username, :password)
    end
    
    
end