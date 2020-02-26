# frozen_string_literal: true

class Task < ApplicationRecord
  include Decorations::Tasks
  WEIGHTED_PRIORITY = { 5 => 'important', 10 => 'urgent' }.freeze

  belongs_to :user
end
