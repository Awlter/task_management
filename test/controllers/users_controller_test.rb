# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should create a user' do
    assert_changes 'User.count' do
      post users_path, params: { user: { username: 'hehe', password: 'Qmaybee1', password_confirmation: 'Qmaybee1' } }
    end
  end
end
