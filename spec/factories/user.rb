FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'yoshi@nintendo.com'
    password 'password'
  end
end
