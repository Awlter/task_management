# frozen_string_literal: true

class RemoveUniqueIndexFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_index :tasks, column: :user_id, unique: true
  end
end
