class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :membership_invitations
  has_many :membership_requests

  def member?(user)
    users.include?(user)
  end

  def create_group(params,user_id)
    group = Group.create(params)
    group.add_user_to_group(user_id,true)
  end

  def get_groups_user_is_admin(user_id)
    user = User.find(user_id)
    memberships = user.memberships.where(:admin => true)
    groups = memberships.collect {|m| m.group}
    return groups
  end

  def add_user_to_group(user_id,is_admin)
     self.memberships.create(:user_id => user_id, :admin => is_admin) 
  end
end
