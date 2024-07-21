# frozen_string_literal: true

class AddProjectIdToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :project_id, :integer
  end
end
