FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::JapaneseMedia::Naruto.eye }
    api_key { Faker::JapaneseMedia::Naruto.demon }
  end
end
