FactoryBot.define do
  factory :review do
    content { "MyText" }
    machine { 1 }
    caedio { 1 }
    free_weight { 1 }
    association :facility, factory: :facility
    user { facility.poster }

  end
end
