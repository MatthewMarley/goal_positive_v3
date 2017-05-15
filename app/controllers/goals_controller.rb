class GoalsController < ApplicationController
   
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
            redirect_to goals_path
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
            redirect_to goals_path
        else
            flash[:danger] = "Goal unable to be deleted"
            redirect_to goal_path(@goal)
        end
    end
    
    
    
    private
    def goal_params
        params.require(:goal).permit(:name, :description) 
    end
    
    def set_user
        @user = current_user 
    end
    
end