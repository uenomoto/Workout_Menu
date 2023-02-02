FactoryBot.define do
  factory :user do
    nickname { Faker::Lorem.characters(number: 7) }
    introduction { Faker::Lorem.characters(number: 6) }
    prefecture { 1 }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end