require 'faker'

FactoryGirl.define do
  factory :supplier do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.domain_name }
    association :region
    association :category
    rating 0

    factory :claimed_supplier do
      address { Faker::Address.street_address }
      facebook_url { Faker::Internet.url }
      twitter_url { Faker::Internet.url }
      google_url { Faker::Internet.url }
      video_url { Faker::Internet.url }
      logo_url { Faker::Internet.url }
    end
  end
end
