FactoryGirl.define do
  factory :product do
    name "Platinum"
    description "Some description about the package"
    year_price 0
    package 1

    factory :paid_product do
      year_price 100
      package 2
    end
  end
end
