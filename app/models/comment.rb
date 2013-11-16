class Comment < ActiveRecord::Base
  belongs_to :status_update
  belongs_to :user
  attr_accessible :body, :status_update_id, :timestamp, :user_id
  validates :body, :presence => true
  has_many :likes, :as => :liker, :dependent => :destroy
end
