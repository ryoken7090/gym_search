FactoryBot.define do
  factory :tagging do
    facility_id { 1 }
    tag_id { 1 }
  end
  factory :second_tagging, class: Tagging do
    facility_id { 1 }
    tag_id { 2 }
  end
end
