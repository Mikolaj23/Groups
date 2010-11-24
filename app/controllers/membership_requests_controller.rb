class MembershipRequestsController < ApplicationController
  before_filter :authenticate_user!

  def create
    MembershipRequest.new.request(current_user.id,params[:membership_request])
    redirect_to :back
  end

  def confirm
    request = MembershipRequest.find(params[:id])
    request.confirm(current_user.id)
    redirect_to :back    
  end
end
