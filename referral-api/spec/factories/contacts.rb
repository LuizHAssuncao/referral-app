FactoryBot.define do
  factory :contact do
    name { Faker::StarWars.character }
    email { Faker::Internet.email }
  end
end
