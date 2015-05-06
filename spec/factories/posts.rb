FactoryGirl.define do
  factory :post do
    title "My blog post"
    body "Some awesome content for my blog post"
    author "Mr John Author"
    published_on "2013-12-29"
    visible true

    factory :invisible_post do
      visible false
    end

  end
end
