class GoalsController < ApplicationController
    
    before_action :set_goal, only: [:show, :edit, :update, :destroy, :like, :unlike]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :security, only: [:show]
   
   
    #@goals = @goals.where(:status => "Semi Private") || @goals.where(:status => "Public")
    #<% if goal.status == "Public" || (current_user.friend_with?(goal.user) && goal.status == "Semi Private") || goal.user == current_user %>
    
    def index
        @goals = Goal.all
        if logged_in?
            #@goals = Goal.where(status: ["Semi Private", "Public", "Private"]).order("created_at DESC")
            #@goals = Goal.where("status = ? OR status = ?", "Semi Private", "Public")
            #@goals = Goal.where(user_id: current_user.id)
            #@goals = Goal.where(current_user.friend_with?(Goal.user.id))
            @goals = Goal.all
            
            @goals.each do |goal|
                goals = Goal.where
            end
        else
            @goals = Goal.all.where(:status => "Public")
        end
        
        #@goals = Goal.paginate(page: params[:page], per_page: 5)
        #if params[:search]
        #    @goals = Goal.search(params[:search]).paginate(page: params[:page], per_page: 5).order("created_at DESC")
        #else
        #    @goals = Goal.all.paginate(page: params[:page], per_page: 5).order("created_at DESC")
        #end
    end
    
    
    @categories.each do |category|
      tposts = Post.where("category_id = ? and institution_id = ?", category, @institution).order("created_at DESC")
      @posts += tposts if tposts
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
            flash.now[:danger] = @goal.errors.full_messages.join(", ")
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
    
    
    def upvote
        @goal = Goal.find(params[:id])
        @goal.upvote_by current_user
        redirect_to :back
    end
    
    def downvote
        @goal = Goal.find(params[:id])
        @goal.downvote_by current_user
        redirect_to :back
    end
    
    
    
    private
    def goal_params
        params.require(:goal).permit(:name, :description, :status) 
    end
    
    def set_user
        @user = current_user 
    end
    
    def require_same_user
        if current_user != @goal.user and !current_user.admin?
            flash[:danger] = "You do not have permission to amend this goal"
            redirect_to root_path
        end
    end
    
    def security
        if logged_in? && (@goal.user == current_user || @goal.status == 'Public')
            flash[:success] = "Access Granted"
        elsif !logged_in? && @goal.status == 'Public'
            flash[:success] = "Okay just this once"
        else
            flash[:danger] = "Access denied"
            redirect_to root_path
        end
    end
    
    def set_goal
        @goal = Goal.find(params[:id])
    end
    
end