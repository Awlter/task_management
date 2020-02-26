# frozen_string_literal: true

module Decorations::Tasks
  extend ActiveSupport::Concern

  def state_action
    I18n.t "task.state_action.#{state}"
  end
end
