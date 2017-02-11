class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  before_action :set_organization, only: [:index, :new, :create, :update]

  def index
    @projects = Organization.find(params[:organization_id]).projects
  end

  def edit; end

  def show; end

  def new
    @project = Project.new
  end

  def create
    project_params[:location_id] = Location.find_by(city: project_params[:location_name]).id
    @project = @organization.projects.create(project_params)

    if @project.save
      redirect_to organization_project_path(@organization, @project)
    else
      flash.now[:danger] = "Failed create Project"
      render "new"
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to organization_project_path(@organization, @project)
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:id, :name, :description, :initial_date, :final_date, :organization_id, :avatar, :location_name, :location, :location_id)
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
