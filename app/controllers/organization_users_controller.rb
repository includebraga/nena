class OrganizationUsersController < ApplicationController
  before_action :set_organization_user, only: [:new, :update]

  def index
    @organization = Organization.find(organization_user_params[:organization_id])
    @users = @organization.users
  end

  def new
    @organization_user = OrganizationUser.new
  end

  def create
    @organization_user = OrganizationUser.new(organization_user_params)
    @organization_user.save
  end

  def update
    @organization_user.update_attributes(organization_user_params)
  end

  def destroy
    OrganizationUser.find(params[:id]).destroy
    flash[:success] = "Organization User deleted"
    redirect_to root_path
  end

  private

  def organization_user_params
    params.require(:organization_user).permit(:admin, :user_id, :organization_id)
  end

  def set_organization_user
    @organization_user = OrganizationUser.find(params[:id])
  end
end
