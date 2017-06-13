class UpdatesController < ApplicationController
    
    before_action :set_goal
    
    def new
        @goal = Goal.find(params[:goal_id])
        @update = Update.new
    end
    
    def create
        @update = Update.new(update_params)
        @update.user_id = current_user.id
        @goal = Goal.find(params[:goal_id])
        @update.goal_id = @goal.id
        if @update.save
            flash[:success] = "Your update has been added to your timeline"
            redirect_to goal_path(@goal)
        else
            flash[:danger] = @update.errors.full_messages.join(", ")
            render 'new'
        end
    end
    
    def edit
        @update = Update.find(params[:id])
    end
    
    def update
        @update = Update.find(params[:id])
        if @update.update(update_params)
            flash[:success] = "Update successfully updated"
            redirect_to goal_path(@goal)
        else
            flash[:danger] = "Unable to update"
            render 'edit'
        end
    end
    
    def show
        @update = Update.find(params[:id])
        @goal = Goal.find(params[:goal_id])
        @comment = Comment.new
    end

    def destroy
        @update = Update.find(params[:id])
        if @update.destroy
            flash[:success] = "Update successfuly deleted"
            redirect_to goal_path(@goal)
        else
            flash[:danger] = "Update unable to be deleted"
            redirect_to goal_path(@goal)
        end
    end
    
    def upvote
        @goal = Goal.find(params[:goal_id])
        @update = Update.find(params[:id])
        @update.upvote_by current_user
        redirect_to :back
    end
    
    def downvote
        @goal = Goal.find(params[:goal_id])
        @update = Update.find(params[:id])
        @update.downvote_by current_user
        redirect_to :back
    end
    
    private
    def update_params
        params.require(:update).permit(:date, :title, :update_description) 
    end
    
    def require_same_user
        if @update =! current_user and !current_user.admin?
            flash[:danger] = "You do not have permission to perform that action"
            redirect_to root_path
        end
    end
    
    def set_goal
        @goal = Goal.find(params[:goal_id])
    end
    
end