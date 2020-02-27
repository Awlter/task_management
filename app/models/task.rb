# frozen_string_literal: true

class Task < ApplicationRecord
  include Decorations::Tasks
  WEIGHTED_PRIORITY = { 5 => 'important', 10 => 'urgent' }.freeze
  STATES_CYCLE = { 'open' => 'process', 'process' => 'closed' }.freeze

  DESCRIPTION_MAX_LENGTH = 40
  DESCRIPTION_MIN_LENGTH = 1

  belongs_to :user

  validates_length_of :description, maximum: DESCRIPTION_MAX_LENGTH, minimum: DESCRIPTION_MIN_LENGTH

  def closed?
    state == 'closed'
  end

  def pivot_to_next_state!
    return unless STATES_CYCLE[state]
    self.state = STATES_CYCLE[state]
  end
end
