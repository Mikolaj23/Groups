class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @groups = Group.new.get_groups_user_is_admin(current_user.id) if user_signed_in?
    @invitation = MembershipInvitation.new
    @invitations = MembershipInvitation.where(:user_id => @user.id)


  end
end
