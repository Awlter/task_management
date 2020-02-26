# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.name[0..8] }
    password { 'Asd123456' }
  end
end
