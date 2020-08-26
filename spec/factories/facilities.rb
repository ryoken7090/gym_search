FactoryBot.define do
  factory :facility do
    sequence(:name) { |n| "TEST_NAME#{n}"}

    association :city,
      factory: :city

    association :poster, factory: :second_user
  end
end
