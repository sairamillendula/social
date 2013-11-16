class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :gender, :dob
  validates :name, :gender, :presence => true
  # attr_accessible :title, :body
  has_many :friends
  has_many :to_users, :class_name => "Friend"
  has_many :status_updates, :dependent => :destroy
  has_many :to_user_update, :class_name => "StatusUpdate", :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
end
