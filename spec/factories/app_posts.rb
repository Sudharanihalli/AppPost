FactoryBot.define do
  factory :app_post do
    title { "Example Title" }
    content { "Example Body" }
    published_at { Time.current }
  end
end
