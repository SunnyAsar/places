FactoryBot.define do
  factory :activity do
    name { Faker::Name.name }
    description { Faker::Movies::Hobbit.quote }
    city { Faker::Movies::Hobbit.location }
    country { Faker::Movies::Hobbit.location }
    category
    owner

    factory :invalid_activity do
      name { '' }
      description { '' }
    end
  end
end
