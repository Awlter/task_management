# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should validate the username legibility' do
    user_name_with_special_charactors = build(:user, username: '!@#$%^&*')

    assert_no_difference 'User.count' do
      user_name_with_special_charactors.save
    end
  end

  test 'password should contains at least 1 upper case, 1 lower case, 1 number' do
    user_ilegal_password = build(:user, password: '123123123', password_confirmation: '123123123')

    assert_no_difference 'User.count' do
      user_ilegal_password.save
    end
  end
end
