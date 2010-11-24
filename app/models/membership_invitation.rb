class MembershipInvitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def invite(admin_id,params) 
    @user = User.find(params[:user_id])
    params[:admin_id] = admin_id
    @user.membership_invitations.create(params)
  end

  def confirm(user_id)
    if self.user_id == user_id
       user = User.find(user_id)
       group = Group.find(self.group_id)
       group.add_user_to_group(user_id,false) if not group.member?(user)
    end
  end

  def get_user_invitations(user_id)
    user = User.find(user_id)
    allinv = MembershipInvitation.where(:user_id => user_id)
    allinv.delete_if { |i| Group.find(i.group_id).member?(user)}
  end
end
