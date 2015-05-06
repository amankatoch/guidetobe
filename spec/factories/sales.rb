# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sale do
    email "test@example.com"
    guid "MyString"
    association :owner
    association :product
    state "pending"
    stripe_id "1234566"
    stripe_token "abcde_123"
    card_expiration Date.today
    fee_amount 10

    factory :finished_sale do
      state "finished"
    end
  end
end
