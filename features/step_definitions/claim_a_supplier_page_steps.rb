When(/^I click on the "(.*?)" button$/) do |button_title|
  click_link button_title
end

Then(/^I should see the business listings page$/) do
  expect(current_path).to eq business_listings_path
end

Given(/^I visit the "(.*?)" category page for "(.*?)"$/) do |category_name, region_name|
  category = create(:category, name: category_name)
  region = create(:region, name: region_name)

  visit region_category_path(region, category)
end

Given(/^I visit the supplier page for "(.*?)"$/) do |supplier_name|
  supplier = Supplier.find_by_name(supplier_name)
  visit supplier_path(supplier)
end