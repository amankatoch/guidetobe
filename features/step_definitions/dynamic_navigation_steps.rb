Given(/^that I am a potential user$/) do
end

Then(/^I should arrive at the region page$/) do
  expect(current_path).to eq region_path(@region)
end

Then(/^I should arrive at the categories page$/) do
  expect(current_path).to eq category_path(@category)
end

Given(/^I select "(.*?)" region from the dropdown$/) do |region_name|
  within '.dropdown_city_link' do
    click_link region_name
  end
end

Given(/^I select "(.*?)" category from the dropdown$/) do |category_name|
  within '.dropdown_category_link' do
    click_link category_name
  end
end