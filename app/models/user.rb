class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :invitations
  has_many :requests, :through => :groups
  has_many :membership_invitations
  has_many :membership_requests
end
