FactoryGirl.define do
  factory :invoice do
    date "2014-01-07"
    reference "ABCE"
    email "MyString"
    association :advertisement
    amount "60"
    paid false
    stripe_token ""

    factory :paid_invoice do
      paid true
      stripe_token '123dfghjfdsadfda'
    end
  end
end
