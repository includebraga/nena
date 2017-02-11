class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:edit, :update, :show]

  def index
    @organizations = Organization.all
  end

  def edit
  end

  def show
    @projects = @organization.projects
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      OrganizationUser.create(user_id: current_user.id, organization_id: @organization.id, admin: true)
      redirect_to @organization
    else
      flash[:alert] = "Organization not saved"
      render "new"
    end
  end

  def update
    @organization.update_attributes(organization_params)
    redirect_to @organization
  end

  def destroy
    Organization.find(params[:id]).destroy
    flash[:success] = "Organization deleted"
    redirect_to root_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :address, :avatar, :hero)
  end

  def organization_user_params
    params.permit(:admin, :organization_id, :user_email)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
