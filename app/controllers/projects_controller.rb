class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
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
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = 'Project was successfully destroyed.'
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
