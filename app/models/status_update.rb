class StatusUpdate < ActiveRecord::Base
  attr_accessible :body, :timestamp, :to_user_id, :user_id
  
  validates :body, :presence => true
  
  belongs_to :user
  belongs_to :to_user_update, :class_name => "User", :foreign_key => "to_user_id"
  has_many :comments, :dependent => :destroy
  has_many :likes, :as => :liker, :dependent => :destroy
  
  def self.find_friends_posts(current_user)
    friends = Friend.where("user_id=? AND status=?", current_user.id, true)
    items = Array.new
    items.push current_user.id
    friends.each do |f|
      items.push f.to_user_id
    end
    status_updates = StatusUpdate.where(:user_id => items).order_by_desc
  end
  
  scope :order_by_desc, order("created_at DESC")
  
end
