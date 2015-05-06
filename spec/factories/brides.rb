require 'faker'

FactoryGirl.define do
  factory :bride do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    region { Faker::Address.region }
    postcode "SW5 9TH"
    email { Faker::Internet.email }
    age 26
    source "Word of mouth"
    wedding_date "2013-11-18"
    wedding_place "Staines"
    username { Faker::Internet.user_name }
    password "password"
    password_confirmation "password"
    terms "1"
    avatar "dummy"

    factory :invalid_bride do
        email nil
    end
  end
end
