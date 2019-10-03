FactoryBot.define do
  factory :comment do
    content { Faker::Quote.matz }
    owner
    activity

    factory :invalid_comment do
      content {''}
    end
  end
end
