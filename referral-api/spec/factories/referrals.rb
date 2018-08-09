FactoryBot.define do
  factory :referral do
    name { Faker::StarWars.character }
    email { Faker::Internet.email }
    contact_id nil
  end
end
