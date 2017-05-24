class Comment < ActiveRecord::Base
   
    #belongs_to :commentable, :polymorphic => true
    belongs_to :commentable, polymorphic: true
    validates :user_id, presence: true
    belongs_to :user
    
end