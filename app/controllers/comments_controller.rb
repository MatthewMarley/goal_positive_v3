class CommentsController < ApplicationController
    
    #before_action :set_goal
    before_action :set_update
    #before_action :load_commentable
    #def new
    #    @comment = @commentable.comments.new
    #end
    
    def create
        @commentable = find_commentable
        @comment = @commentable.comments.new(comment_params)
        if @comment.save
            flash[:success] = "Comment Sent!"
            redirect_to root_path
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
    end
    
    def set_update
        @update = Update.find(params[:update_id]) 
    end
    
    
end