
class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @tasks = @project.tasks
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect_to @project
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project was successfully destroyed.'
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
