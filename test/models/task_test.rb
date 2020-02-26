# frozen_string_literal: true

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # state_action
  test 'return correnct state action text' do
    task = create(:task)

    assert_equal task.state_action, 'Start'
  end
end
