class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true,
              uniqueness: { case_sensitive: false },
              length: { minimum: 3, maximum: 25 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # Before saving, change the email to lowercase. Therefore when validating uniqueness,
    # we know that it will be unique regardless of capitalization
    before_save { self.email = email.downcase }
    validates :email, presence: true,
              uniqueness: { case_sensitive: false },
              length: { maximum: 105 },
              format: { with: VALID_EMAIL_REGEX }
    has_many :goals
    has_many :comments, :as => :commentable
    
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
    
    validates_confirmation_of :password
    
    
    def friend_with?(other_user)
        friendships.find_by(friend_id: other_user.id) 
    end
    
    def self.search(search)
        where("username LIKE ?", "%#{search}%") 
    end

end