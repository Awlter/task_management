# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :state, default: 'open'
      t.integer :priorities, array: true, default: []
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
