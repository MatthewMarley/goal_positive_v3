class UpdatesController < ApplicationController
    
    def new
        @update = Update.new
        @goal = Goal.find(params[:goal_id])
    end
    
    def create
        @goal = Goal.find(params[:goal_id])
        @update = Update.new(update_params)
        @update.user_id = current_user.id
        @update.goal_id = @goal.id
        if @update.save
            flash[:success] = "Your update has been added to your timeline"
            redirect_to users_path
        else
            flash[:danger] = @update.errors.full_messages.join(", ")
            render 'new'
        end
    end
    
    
    
    private
    def update_params
        params.require(:update).permit(:date, :title, :update_description) 
    end
    
    
end