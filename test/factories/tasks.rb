# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    description { Faker::Movies::HarryPotter.quote[0..30] }
    state { 'open' }
    priorities { [5, 10] }
  end
end
