FactoryGirl.define do
  factory :reply do
    body "MyText"
    association :review
    association :owner
    hidden false
  end
end
