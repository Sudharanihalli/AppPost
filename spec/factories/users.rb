FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "hello+#{n}@cjav.dev" }
    password { SecureRandom.hex } 
  end
end
