class GroupsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def show
    @group = Group.find(params[:id])
    @request = User.find(current_user.id).membership_requests.new
  end

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new.create_group(params[:group],current_user.id)
    redirect_to groups_path
  end
end
