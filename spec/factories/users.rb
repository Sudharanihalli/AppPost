FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "hello+#{n}@cjav.dev" }
    password { SecureRandom.hex } 

    factory :subscribed_user do
      subscription_status {'active'}
    end
  end
end