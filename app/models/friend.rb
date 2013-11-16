class Friend < ActiveRecord::Base
  attr_accessible :status, :to_user_id, :user_id
  
  belongs_to :to_user, :class_name => "User", :foreign_key => "to_user_id"
  belongs_to :user
  
  scope :friends_request_pending, lambda { |current_user| where("to_user_id=? AND status=?", current_user.id, false) }
  scope :friends_details , lambda { |user_id, to_user_id| where("user_id=? AND to_user_id=?", user_id, to_user_id) }
  
end
