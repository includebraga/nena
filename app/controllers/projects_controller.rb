class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update]
  before_action :set_organization, only: [:new, :create]
  def index
    @projects = Organization.find(params[:organization_id]).projects
  end

  def edit; end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = @organization.projects.create(project_params)
    if @project.save
      redirect_to organization_projects_path(@organization)
    else
      flash.now[:danger] = "Failed create Project"
      render "new"
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :initial_date, :final_date, :organization_id)
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
