FactoryBot.define do
  factory :dummy do
    name { "MyString" }
    age { rand(1..100) }
    born_at { "2023-11-14 17:19:42" }
    sequence(:email) { |n| "xyz@123.com" }
  end
end
