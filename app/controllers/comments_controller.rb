class CommentsController < ApplicationController
    
    #before_action :load_commentable
    
    def new
        @goal = Goal.find(params[:goal_id])
        @commentable = find_commentable
        @comment = @commentable.comments.new
    end
    
    def create
        @goal = Goal.find(params[:goal_id])
        @commentable = find_commentable
        @comment = @commentable.comments.new(comment_params)
        if @comment.save
            flash[:success] = "Comment Sent!"
            redirect_to :back
        else
            flash[:danger] = @comment.errors.full_messages
            render 'new'
        end
    end
    
    
    
    
    private
    def comment_params
        params.require(:comment).permit(:name) 
    end
    
    def find_commentable
        params.each do |name, value|
            if name =~ /(.+)_id$/
                return $1.classify.constantize.find(value)
            end
        end
        nil
    end
    
    def set_update
        @update = Update.find(params[:update_id]) 
    end
    
    def set_goal
        @goal = Goal.find(params[:goal_id]) 
    end
    
    
end