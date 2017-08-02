class FriendshipsController < ApplicationController
    
    def create
        # Take current_user and build a friendship through it, passing in the id
        # of the user being befriended
        # Using .build we ensure that the user_id of the new friendship is automatically set
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        # @friend = Friendship.find(params[:friend_id])
        if @friendship.save
            flash[:success] = "#{@friendship.friend.username}" + " Successfully Added"
            redirect_to users_path
        else
            flash[:danger] = "Error in added friend"
            redirect_to users_path
        end
    end
    
    def destroy
        @friendship = current_user.friendships.find(params[:id])
        if @friendship.destroy
            flash[:success] = "Removed friendship"
            redirect_to user_path(current_user)
        else
            flash[:danger] = "Error in removing friendship"
            redirect_to user_path(current_user)
        end
    end
    
end