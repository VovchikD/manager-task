# frozen_string_literal: true

class TaskCompletedJob < ApplicationJob
  queue_as :default

  def perform(task)
    task.project.users.each do |user|
      TaskMailer.task_completed_notification(user, task).deliver_later
    end
  end
end
