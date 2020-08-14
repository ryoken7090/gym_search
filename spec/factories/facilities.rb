FactoryBot.define do
  factory :facility do
    sequence(:name) { |n| "TEST_NAME#{n}"}
  end
end
