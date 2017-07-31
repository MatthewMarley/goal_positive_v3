class Goal < ActiveRecord::Base
    belongs_to :user
    has_many :updates
    has_many :comments, as: :commentable
    validates :name, presence: true, length: {maximum: 50}
    validates :description, presence: true, length: {minimum: 5, maximum: 40000}
    validates :user_id, presence: true
    validates :status, presence: true
    acts_as_votable
end