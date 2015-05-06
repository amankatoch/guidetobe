Given(/^there is a region called "(.*?)"$/) do |region_name|
  @region = create(:region, name: "London")
end

When(/^I click on the "(.*?)" link$/) do |region_name|
  within '.map' do
    click_link region_name
  end
end

Then(/^I should go to the "(.*?)" region page$/) do |arg1|
  expect(current_path).to eq region_path(@region)
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content message
end

When(/^I visit the region page for "(.*?)"$/) do |region_name|
  region = Region.find_by_name(region_name)
  visit region_path(region)
end

Given(/^there are categories$/) do
  @categories = create_list(:category, 5)
end

Then(/^I should see the categories$/) do
  expect(page).to have_content @categories.first.name
end

Given(/^I am on the "(.*?)" region page$/) do |region_name|
  region = create(:region, name: region_name )
  visit region_path(region)
end

Given(/^there is a category called "(.*?)"$/) do |category_name|
  @category = create(:category, name: category_name)
end

When(/^I click the "(.*?)" link$/) do |region_link|
  within '.left_column' do
    click_link region_link
  end
end

Then(/^I should see the "(.*?)" category page for "(.*?)"$/) do |category_name, region_name|
  expect(current_path).to eq region_category_path(Region.find_by_name(region_name), Category.find_by_name(category_name))
end

Given(/^there are (\d+) suppliers for "(.*?)" in "(.*?)"$/) do |count, category_name, region_name|
  region = create(:region, name: region_name)
  category = create(:category, name: category_name)
  create(:supplier, region_id: region.id, category_id: category.id)
end

Given(/^I am on the "(.*?)" category page for "(.*?)"$/) do |category_name, region_name|
  region = Region.find_by_name(region_name)
  category = Category.find_by_name(category_name)
  visit region_category_path(region, category)
end

Then(/^I should see (\d+) suppliers listed$/) do |count|
  expect(page).to have_content Supplier.first.name
end

Given(/^there are is a supplier for "(.*?)" in "(.*?)"$/) do |category_name, region_name|
  region = create(:region, name: region_name)
  category = create(:category, name: category_name)
  @supplier = create(:supplier, region_id: region.id, category_id: category.id)
end

Given(/^the supplier has (\d+) reviews$/) do |arg1|
  reviews = create_list(:review, 3, supplier: @supplier)
end

Then(/^I should see the review count for that supplier$/) do
  expect(page).to have_content '3 Reviews'
end

Given(/^there are (\d+) suppliers for "(.*?)" in "(.*?)" with different overall ratings$/) do |count, category_name, region_name|
  region = create(:region, name: region_name)
  category = create(:category, name: category_name)

  @supplier1 = create(:supplier, category: category, region: region)
  review1 = create(:review, supplier: @supplier1, overall: 5)
  @supplier2 = create(:supplier, category: category, region: region)
  review2 = create(:review, supplier: @supplier2, overall: 3)
  @supplier3 = create(:supplier, category: category, region: region)
  review3 = create(:review, supplier: @supplier3, overall: 1)
end

When(/^I visit the "(.*?)" category for "(.*?)"$/) do |category_name, region_name|
  visit region_category_path(Region.find_by_name(region_name), Category.find_by_name(category_name))
end

Then(/^the suppliers should be ordered by overall rating and should have the correct rank$/) do
  within "#supplier_#{@supplier1.id}" do
    expect(page).to have_content "Rank 1/3"
  end

  within "#supplier_#{@supplier2.id}" do
    expect(page).to have_content "Rank 2/3"
  end

  within "#supplier_#{@supplier3.id}" do
    expect(page).to have_content "Rank 3/3"
  end
end

Given(/^there is a region category called "(.*?)" for "(.*?)"$/) do |category_name, region_name|
  @region = create(:region, name: region_name)
  @category = create(:category, name: category_name)
end

Given(/^there are three suppliers with three total reviews$/) do
  suppliers = create_list(:supplier, 3, region: @region, category: @category)
  reviews = create_list(:review, 3, supplier: Supplier.first)
end

When(/^I visit the "(.*?)" region page$/) do |region_name|
  visit region_category_path(@region, @category)
end

Then(/^I should see the text "(.*?)"$/) do |region_category_text|
  expect(page).to have_content(region_category_text)
end











