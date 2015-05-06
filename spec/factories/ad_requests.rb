require 'faker'

FactoryGirl.define do
  factory :ad_request do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    supplier_name { Faker::Company.name }
    association :category
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    contact_preference "phone"
  end
end
