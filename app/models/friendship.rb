class Friendship < ActiveRecord::Base
    # The User who initialised the friendship
    belongs_to :user
    # The User who has been befriended
    belongs_to :friend, :class_name => 'User'
    
    
    
    
end