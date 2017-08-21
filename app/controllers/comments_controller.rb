class CommentsController < ApplicationController
    
    
    def new
        @commentable = find_commentable
        @comment = @commentable.comments.new
    end
    
    #@comment = @post.comments.create(comment_params.merge(user_id: current_user.id)) 
    
    def create
        
        @user = current_user
        if(params.has_key?(:goal_id) && params.has_key?(:update_id))
            @update = Update.find(params[:update_id])
            @comment = @update.comments.new(comment_params.merge(user_id: current_user.id))
        else
            @commentable = find_commentable
            @comment = @commentable.comments.new(comment_params.merge(user_id: current_user.id))
        end
        
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
        params.each do |name, value|
            if name =~ /(.+)_id$/
                return $1.classify.constantize.find(value)
            end
        end
    end
    
    
    
end