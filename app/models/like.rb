class Like < ActiveRecord::Base
  attr_accessible :liker_id, :liker_type, :user_id
  belongs_to :liker, :polymorphic => true
  belongs_to :user
end
