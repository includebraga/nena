class ProjectsController < ApplicationController
  before_action :set_project, only: [:update]
  def index
    @projects = Organization.find(params[:organization_id]).projects
  end

  def edit; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      flash[:alert] = "Project not saved"
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
    params.require(:project).permit(:name, :description, :address)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
