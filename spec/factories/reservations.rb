FactoryBot.define do
  factory :reservation do
    reservation_id { "MyString" }
    party_size { 1 }
    total_amount { "9.99" }
    info { "MyText" }
    activity { nil }
    user { nil }
  end
end
