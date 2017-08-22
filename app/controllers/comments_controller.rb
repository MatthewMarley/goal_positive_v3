class CommentsController < ApplicationController
    
    # Add find_commentable as a before_action?
    before_action :find_commentable
    
    
    def new
        @commentable = find_commentable
        @comment = @commentable.comments.new
    end
    
    #@comment = @post.comments.create(comment_params.merge(user_id: current_user.id)) 
    
    def create
        
        @user = current_user
        @comment = @commentable.comments.new(comment_params.merge(user_id: current_user.id))
        
        if @comment.save
            flash[:success] = "Comment Sent"
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
    
    # What does this do?
    def find_commentable
        # If the params contain a goal_id, it's a comment for a goal
        @commentable = Goal.find(params[:goal_id]) if params[:goal_id]
        # If params contain an update_id and a goal_id, it's a comment for an update
        @commentable = Update.find(params[:update_id]) if (params[:update_id] && params[:goal_id])
        # If params contain a goal_id and a comment_id, it's a thread comment under a goal
        @commentable = Comment.find(params[:comment_id]) if (params[:goal_id] && params[:comment_id])
    end
    
    
    
end

#params.each do |name, value|
#    if name =~ /(.+)_id$/
#        return $1.classify.constantize.find(value)
#    end
#end