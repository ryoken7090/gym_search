FactoryBot.define do
  factory :city do
    name { "テスト区" }
  end

  factory :second_city, class: City do
    name { "テスト市"}
  end
end
