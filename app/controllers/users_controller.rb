class UsersController < ApplicationController
    
    def index
        @users = User.all 
        if params[:search]
            @users = User.search(params[:search]).order("created_at DESC")
        else
            @users = User.all.order("created_at DESC")
        end
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
            #flash[:danger] = "Unable to sign up for GoalPositive"
            flash[:danger] = @user.errors.full_messages.join(", ")
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
        @user_goals = @user.goals
    end
    
    
    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
    
    
end