# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  after_update :send_task_completed_notification, if: :saved_change_to_completed?

  private

  def send_task_completed_notification
    return unless completed

    TaskCompletedJob.perform_later(self)
  end
end
