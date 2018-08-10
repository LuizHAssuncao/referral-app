FactoryBot.define do
  factory :contact do
    name { Faker::StarWars.character }
    email { Faker::Internet.email }

    transient do
      referrals_count 2
    end

    factory :contact_with_referrals do
      after(:create) do |contact, evaluator|
        create_list(:referral, evaluator.referrals_count, contact: contact)
      end
    end
  end
end
