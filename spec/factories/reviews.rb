FactoryBot.define do
  factory :review do
    user { nil }
    facility { nil }
    content { "MyText" }
    machine { 1 }
    caedio { 1 }
    free_weight { 1 }
  end
end
