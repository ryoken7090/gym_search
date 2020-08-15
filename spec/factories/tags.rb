FactoryBot.define do
  factory :first_tag, class: Tag do
    name { "Tag_A" }
  end
  factory :second_tag, class: Tag do
    name { "Tag_B" }
  end
  factory :third_tag, class: Tag do
    name { "Tag_C" }
  end
end
