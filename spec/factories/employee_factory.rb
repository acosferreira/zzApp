# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    trait :ana do
      name 'test'
      external_ref 'ABC123'
    end
  end
end
