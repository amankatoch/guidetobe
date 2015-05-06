require 'faker'

FactoryGirl.define do
  factory :city_request do
    region "London"
    email { Faker::Internet.email }
    wedding_date "2013-11-18"
  end
end
