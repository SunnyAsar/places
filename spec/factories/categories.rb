FactoryBot.define do
  factory :category do
    name { Faker::Name.first_name + 'Activity' }
    user

    factory :invaid_activity do 
      name { '' }
    end
  end
end
