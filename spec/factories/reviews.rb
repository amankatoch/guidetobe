require 'faker'

FactoryGirl.define do
  factory :review do
    general_content { Faker::Lorem.characters(char_count = 150) }
    like_content { Faker::Lorem.sentence }
    unlike_content { Faker::Lorem.sentence }
    insider_tip { Faker::Lorem.sentence }
    service { rand(1..5) }
    price { rand(1..5) }
    overall { rand(1..5) }
    association :supplier
    association :bride
    terms "1"

    factory :hidden_review do
        hidden true
    end
  end
end
