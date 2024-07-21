# frozen_string_literal: true

class TaskMailer < ApplicationMailer
  def new_task_notification(user, task)
    @user = user
    @task = task
    @project = task.project
    mail(
      to: @user.email,
      subject: "New task in your project #{@project.title}"
    )
  end

  def task_completed_notification(user, task)
    @user = user
    @task = task
    @project = task.project
    mail(
      to: @user.email,
      subject: "Task Completed: #{@task.title}"
    )
  end
end
