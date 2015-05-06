require 'faker'

FactoryGirl.define do
  factory :owner do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password "password"
    password_confirmation "password"
    association :supplier, factory: :supplier
    terms "1"
    association :product, factory: :product

    factory :invalid_owner do
      first_name ""
    end
  end
end
