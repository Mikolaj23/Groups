class HomeController < ApplicationController
  def index
    @users = User.all
    @groups = Group.all    
    if user_signed_in?
      @invitations = MembershipInvitation.new.get_user_invitations(current_user.id)
    end
 end
end
