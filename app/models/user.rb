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
    validates_confirmation_of :password
end