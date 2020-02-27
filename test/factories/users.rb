# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Lorem.characters(number: User::USERNAME_MIN_LENGTH + 1) }
    password { 'Asd123456' }
  end
end
