# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    create(:user)
  end

  test 'should get create' do
    task = build(:task)
    post tasks_path, params: { 'task' => { 'description' => task.description, 'priorities' => { 'important' => '5', 'urgent' => '' } } }
    assert_equal Task.last.priorities, [5]
    assert_equal Task.last.description, task.description
  end
end
