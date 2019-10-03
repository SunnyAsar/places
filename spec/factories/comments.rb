FactoryBot.define do
  factory :comment do
    content { "MyText" }
    commenter_id { "" }
    activity { nil }
  end
end
