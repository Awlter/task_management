# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test 'should get create' do
    task = build(:task)
    post tasks_path + '.js', params: { 'task' => { 'description' => task.description, 'priorities' => { 'important' => '5', 'urgent' => '' } } }
    assert_equal [5], Task.last.priorities
    assert_equal task.description, Task.last.description
  end

  test 'should update to next state' do
    task = create(:task, user: @user)
    patch task_path(task) + '.js'
    assert_equal 'process', task.reload.state
  end

  test 'should not update if the current user did not create the task' do
    task = create(:task, state: 'process')
    patch task_path(task) + '.js'
    assert_equal 'process', task.reload.state
  end

  test 'should delete a task' do
    task = create(:task, user: @user)
    delete task_path(task) + '.js'
    refute Task.find_by(id: task.id)
  end
end
