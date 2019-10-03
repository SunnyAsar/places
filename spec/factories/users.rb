FactoryBot.define do
  factory :user, aliases: [:owner, :commenter, :liker] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'foobar' }
    password_confirmation { 'foobar' }

    factory :invalid_user do
      first_name { '' }
      last_name { '' }
    end

    factory :user_with_activities do
      transient do
        activity_count { 3 }
      end

      after :create do |user, var|
        create_list(:activity, var.activity_count, owner: user)
      end
    end

    # factory :user_with_comments do
    #   transient do
    #     comment_count { 2 }
    #   end

    #   after :create do |user, var|
    #     create_list(:comment, var.comment_count, commenter: user)
    #   end
    # end
  end
end
