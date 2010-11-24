class MembershipRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def request(user_id,params)
    @user = User.find(user_id)
    @group = Group.find(params[:group_id])
    @user.membership_requests.create(params) if not @group.member?(@user)
  end

  def confirm(admin_id)
    group = Group.find(self.group_id)
    group.add_user_to_group(self.user_id,false) if not group.member?(user_id)
    self.accepting_admin_id = admin_id
    self.accepted = true
    self.save
  end
end
