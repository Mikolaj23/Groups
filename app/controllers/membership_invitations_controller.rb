class MembershipInvitationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    
    MembershipInvitation.new.invite(current_user.id, params[:membership_invitation])
    redirect_to :back
  end
  
  def confirm
    invitation = MembershipInvitation.find(params[:id])
    invitation.confirm(current_user.id)
    redirect_to :back
  end
end
