FactoryBot.define do
  factory :referral do
    name { Faker::StarWars.character }
    email { Faker::Internet.email }
    contact_id nil

    transient do
      notifiers []
    end

    before(:create) do |referral, evaluator|
      referral.notifiers = evaluator.notifiers
    end
  end
end
