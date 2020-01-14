if Rails.env.development? || Rails.env.test?
  namespace :dev do
    desc 'This task adds seed data'
    task populate: 'db:reset' do
      include FactoryBot::Syntax::Methods
      u = create(:user, email: 'sunny@me.com')
      c = create(:category, user: u)
      a = create(:activity, owner: u, category: c)
      5.times do
        create(:user) do |user|
          2.times do
            create(:category, user: user) do |cat|
              3.times { create(:activity, owner: user, category: cat) }
            end
          end
        end
      end
    end
  end
end
