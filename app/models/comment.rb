class Comment < ActiveRecord::Base
   
    #belongs_to :commentable, :polymorphic => true
    # Comments can belong to more than one model. This is specified through using polymorphic: true
    belongs_to :commentable, polymorphic: true
    has_many :comments, as: :commentable
    validates :user_id, presence: true
    belongs_to :user
    
end