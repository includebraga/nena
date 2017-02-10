class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def edit; end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to @organization
    else
      flash[:alert] = "Organization not saved"
      render "new"
    end
  end

  def update
    if @organization.update_attributes(organization_params)
      redirect_to @organization
    end
  end

  def destroy
    Organization.find(params[:id]).destroy
    flash[:success] = "Organization deleted"
    redirect_to root_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :address)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
