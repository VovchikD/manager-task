# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show destroy add_teammate remove_teammate]
  before_action :find_user, only: %i[add_teammate remove_teammate]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show; end

  def create
    authorize @project
    @project = current_user.projects.build(project_params)

    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect_to projects_path
    else
      render :new
    end
  end

  def destroy
    authorize @project

    @project.destroy
    flash[:notice] = 'Project was successfully destroyed.'
    redirect_to projects_path
  end

  def add_teammate
    authorize @project

    if @project.users << @user
      redirect_to project_path
    else
      flash[:notice] = 'User has already been taken'
    end
  end

  def remove_teammate
    authorize @project

    @project.users.delete(@user)
    redirect_to project_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
