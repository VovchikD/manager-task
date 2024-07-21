# frozen_string_literal: true

class ChangeEndDayToDateTimeInTasks < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :end_day, :datetime
  end
end
