FactoryGirl.define do
  factory :subscription do
    start_date { Date.today }
    end_date { Date.today + 1.year }
    association :owner
    association :sale
    association :product

    factory :invalid_subscription do
      end_date { Date.today - 1.month }
    end
  end
end
