class GoalsController < ApplicationController
    
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
   
    def index
        @goals = Goal.all
    end
    
    def new
        @goal = Goal.new
    end
    
    def create
        @goal = Goal.new(goal_params)
        @goal.user_id = current_user.id
        if @goal.save
            flash[:success] = "Your goal was successfully created!"
            redirect_to user_path(current_user)
        else
            flash.now[:danger] = "Your goal was unable to save"
            render 'new'
        end
    end
    
    def show
        @goal = Goal.find(params[:id])
    end
    
    def edit
        @goal = Goal.find(params[:id])
    end
    
    def update
        @goal = Goal.find(params[:id])
        if @goal.update(goal_params)
            flash[:success] = "Goal successfully updated"
            redirect_to goal_path(@goal)
        else
            flash[:danger] = "Goal unable to be updated"
            redirect_to goal_path(@goal)
        end
    end
    
    def destroy
        @goal = Goal.find(params[:id])
        if @goal.destroy
            flash[:success] = "Goal successfully destroyed"
            redirect_to user_path(current_user)
        else
            flash[:danger] = "Goal unable to be destroyed"
            redirect_to user_path(current_user)
        end
    end
    
    
    
    private
    def goal_params
        params.require(:goal).permit(:name, :description) 
    end
    
    def set_user
        @user = current_user 
    end
    
    def require_same_user
        if current_user != @goal.user and !current_user.admin?
            flash[:danger] = "YOu do not have permission to amend this goal"
            redirect_to root_path
        end
    end
    
    def set_goal
        @goal = Goal.find(params[:id])
    end
    
end