FactoryBot.define do
  factory :user do
    username { Faker::Name.name}
    email { Faker::Internet.safe_email }
    password 'password'
  end
end
