# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_project, only: %i[index new create edit update destroy]
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = @project.tasks
  end

  def new
    @task = @project.tasks.new
  end

  def edit; end

  def create
    @task = @project.tasks.build(task_params.merge(user: current_user))
    authorize @task

    if @task.save
      TaskNotificationJob.perform_later(@task)
      flash[:notice] = 'Success result'
      redirect_to project_tasks_path(@project)
    else
      render :new
    end
  end

  def update
    authorize @task

    if @task.update(task_params)
      flash[:notice] = 'Success result'
      redirect_to project_tasks_path(@project)
    else
      render :edit
    end
  end

  def destroy
    authorize @task

    @task.destroy
    flash[:notice] = 'Successfully destroyed.'
    redirect_to project_tasks_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Project not found.'
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :end_day, :completed, :project_id)
  end
end
