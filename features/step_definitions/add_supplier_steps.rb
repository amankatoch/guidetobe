Given(/^there are is a region called "(.*?)" and a category called "(.*?)"$/) do |region_name, category_name|
  region = create(:region, name: region_name)
  category = create(:category, name: category_name)
end

Given(/^am on the home page$/) do
  visit regions_path
end

When(/^I click the "(.*?)" button$/) do |button_text|
  click_link button_text
end

When(/^click the 'Add supplier' button$/) do
  click_link 'Add supplier'
end

When(/^fill the form with a new suppliers details for region "(.*?)" and category "(.*?)"$/) do |region_name, category_name|
  within '.add_supplier_form' do
    fill_in 'Supplier Name', with: 'New House Flowers'
    fill_in 'Email address', with: 'text@example.com'
    fill_in 'Phone', with: '02078456780'
    fill_in 'Website', with: 'http://google.com'
    select category_name, from: 'Category'
    select region_name, from: 'Region'
    click_button 'Add Supplier'
  end
end

Then(/^I should be redirected to a form for providing feedback$/) do
  expect(page).to have_content 'Thanks for helping the Guide To Be network grow.'
end

When(/^leave the supplier name blank$/) do
  within '.add_supplier_form' do
    fill_in 'Supplier Name', with: ''
    fill_in 'Email address', with: 'text@example.com'
    fill_in 'Phone', with: '02078456780'
    fill_in 'Website', with: 'http://google.com'
    select 'Flowers', from: 'Category'
    select 'London', from: 'Region'
    click_button 'Add Supplier'
  end
end

Then(/^the supplier new form should be re\-rendered with an error$/) do
  expect(page).to have_content 'Form is invalid'
end




