# frozen_string_literal: true

class Task < ApplicationRecord
  WEIGHTED_PRIORITY = { important: 5, urgent: 10 }.freeze

  belongs_to :user
end
