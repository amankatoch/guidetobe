FactoryGirl.define do
  factory :advertisement do
    start_date '2014-01-07'
    end_date '2014-01-07'
    contact_name 'John Walker'
    contact_email 'jonny@walker.com'
    image_url "http://myimage.com"
    ad_type "Standard"
    association :region
    association :category
    active false
  end
end
