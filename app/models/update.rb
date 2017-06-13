class Update < ActiveRecord::Base
    belongs_to :user
    belongs_to :goal
    has_many :comments, as: :commentable
    
    validates :date, presence: true
    validates :title, presence: true, length: {maximum: 200}
    validates :update_description, presence: true
    validates :user_id, presence: true
    validates :goal_id, presence: true
    
    acts_as_votable
end