class Goal < ActiveRecord::Base
    
    belongs_to :user
    has_many :updates
    has_many :comments, as: :commentable
     
end