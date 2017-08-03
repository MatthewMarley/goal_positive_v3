class PagesController < ApplicationController
  
  def home
    # @goals = Goal.where(status: 'Public').all.order("created_at DESC")
    @all_goals = Goal.all.order("created_at DESC")
  end
  
  def about
    
  end
    
end