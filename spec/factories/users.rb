FactoryBot.define do
  factory :user do
    name { "テストユーザー"}
    email {"test@example.com"}
    password {"password"}
  end

  factory :second_user, class: User do
    name { "テストユーザー2"}
    email {"test2@example.com"}
    password {"password"}
  end

  factory :third_user, class: User do
    name { "テストユーザー3"}
    email {"test3@example.com"}
    password {"password"}
  end
end
