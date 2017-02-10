class OrganizationUsersController < ApplicationController
  def index
    @organization_users = OrganizationUser.all
  end

  def edit; end

  def new
    @organization_user = OrganizationUser.new
  end

  def create
    @organization_user = OrganizationUser.new(organization_user_params)
    if @organization_user.save
      redirect_to @organization_user
    else
      flash[:alert] = "Organization User not saved"
      render "new"
    end
  end

  def update
    if @organization_user.update_attributes(organization_user_params)
      redirect_to @organization_user
    end
  end

  def destroy
    OrganizationUser.find(params[:id]).destroy
    flash[:success] = "Organization User deleted"
    redirect_to root_path
  end

  private

  def organization_user_params
    params.require(:organization_user).permit(:admin)
  end

  def set_organization
    @organization_user = OrganizationUser.find(params[:id])
  end
end
