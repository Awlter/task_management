# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should create a mock user to prevent user to input the username again after wrong authentication' do
    user = build(:user)
    post login_path, params: { 'user' => { 'username' => user.username, 'password' => '' } }
    assert_equal user.username, controller.instance_variable_get(:@user).username
  end
end
