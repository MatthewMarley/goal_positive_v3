class Update < ActiveRecord::Base

    belongs_to :user
    belongs_to :goal
    has_many :comments, :as => :commentable
    
end