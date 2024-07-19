# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :description, null: true
      t.integer :end_day, null: true
      t.boolean :completed, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
