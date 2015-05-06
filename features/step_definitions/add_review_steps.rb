require 'faker'

Given(/^there is a supplier called "(.*?)"$/) do |supplier_name|
  @supplier = create(:supplier, name: supplier_name)
end

Given(/^there is a owned supplier called "(.*?)" owned by "(.*?)"$/) do |supplier_name, owner_email|
  @supplier = create(:supplier, name: supplier_name)
  owner = create(:owner, email: owner_email, supplier: @supplier)
end

When(/^fill the supplier review form for "(.*?)"$/) do |supplier_name|
  supplier = Supplier.find_by_name(supplier_name)
  within '.new_review_form' do
    find(:xpath, "//input[@id='review_supplier_id']").set supplier.id
    fill_in 'Write a review', with: Faker::Lorem.characters(char_count = 80)
    fill_in 'One thing I liked', with: 'Service'
    fill_in "One thing I didn't like", with: 'Value'
    fill_in 'review[service]', with: '4'
    fill_in 'review[price]', with: '1'
    fill_in 'review[overall]', with: '2'
    check 'Agree to terms and conditions'
    click_button 'Submit review'
  end
end

Then(/^I should be redirected to the supplier page with a thank you message$/) do
  expect(current_path).to eq supplier_path(@supplier)
  expect(page).to have_content 'Thanks for your review'
end

When(/^fail to fill\-in the review content field for "(.*?)"$/) do |supplier_name|
  supplier = Supplier.find_by_name(supplier_name)
  within '.new_review_form' do
    find(:xpath, "//input[@id='review_supplier_id']").set supplier.id
    fill_in 'One thing I liked', with: 'Service'
    fill_in "One thing I didn't like", with: 'Value'
    fill_in 'review[service]', with: '4'
    fill_in 'review[price]', with: '1'
    fill_in 'review[overall]', with: '2'
    check 'Agree to terms and conditions'
    click_button 'Submit review'
  end
end

Then(/^I should see an error on the review form$/) do
  expect(page).to have_content 'Ooops! There are some important details missing below.'
end

Given(/^I am go to the region "(.*?)" and select the "(.*?)" category$/) do |region_name, category_name|
  region = Region.find_by_name(region_name)
  category = Category.find_by_name(category_name)
  visit region_path(region)
  within '.left_column' do
    click_link category_name
  end
end

Then(/^I should see the review form$/) do
  expect(page).to have_css('.new_review_form')
end

When(/^I go to the supplier page for "(.*?)"$/) do |supplier_name|
  supplier = Supplier.find_by_name(supplier_name)
  visit supplier_path(supplier)
end

Then(/^I should not have to fill in the supplier$/) do
  within '.new_review_form' do
    expect(page).to_not have_content 'Supplier'
  end
end