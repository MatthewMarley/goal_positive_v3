class PagesController < ApplicationController
  
  def home
    if logged_in?
      @goals = Goal.all.order("created_at DESC")
      @filtered_goals = []
      @goals.each do |goal|
        if goal.status == "Public" || current_user.friend_with?(goal.user) && goal.status == "Semi Private" || goal.user == current_user
          @filtered_goals.push(goal)
        end
      end
      @filtered_goals = @filtered_goals.paginate(page: params[:page], per_page: 10)
    else
      @filtered_goals = Goal.all.where(:status => "Public")
      @filtered_goals = @filtered_goals.paginate(page: params[:page], per_page: 10)
    end
  end
  
  def about
    
  end
    
end