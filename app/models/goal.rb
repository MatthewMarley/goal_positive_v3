class Goal < ActiveRecord::Base
    belongs_to :user
    has_many :updates
    has_many :comments, as: :commentable
    validates :name, presence: true, length: {maximum: 50}
    validates :description, presence: true, length: {minimum: 5, maximum: 40000}
    validates :user_id, presence: true
    validates :status, presence: true
    acts_as_votable
    
    def self.search(search)
        where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")    
    end
    
    #def self.search(search, page)
    #    paginate :per_page => 5, :page => page,
    #    :conditions => ["name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%"]
    #end
    
    def friends_with?(other_user)
        friendships.find_by(friend_id: other_user.id) 
    end
    
end

