Given(/^I am the registered owner of "(.*?)"$/) do |supplier_name|
  supplier = create(:supplier, name: supplier_name)
  @product = create(:product)
  @owner = create(:owner, supplier: supplier, password: 'test', password_confirmation: 'test', product: @product)
end

When(/^I fill in my correct owner credentials in the login form$/) do
  visit login_path
  within '.login_form' do
    fill_in 'Username', with: @owner.username
    fill_in 'Password', with: 'test'
    click_button 'Login'
  end
end

Then(/^I should be redirect to the supplier page for "(.*?)"$/) do |supplier_name|
  expect(current_path).to eq supplier_path(Supplier.find_by_name(supplier_name))
end

Then(/^I should see a welcome message$/) do
  expect(page).to have_content 'You are signed in as an owner'
end

Given(/^I am a registered owner with username "(.*?)" and password "(.*?)"$/) do |username, password|
  create(:owner, username: username, password: password, password_confirmation: password)
end

When(/^I login with username "(.*?)" and password "(.*?)"$/) do |username, password|
  visit signup_path
  within '.login_form' do
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_button 'Login'
  end
end

Then(/^I should see the navigation change to a logout button$/) do
  within '.my_business_dropdown' do
    expect(page).to have_link('Logout')
  end
end

When(/^try to write a review$/) do
  visit new_review_path
end

Then(/^I should see a review owner error notification and be redirected to home page$/) do
  expect(current_path).to eq regions_path
  expect(page).to have_content 'As a business owner you may not write reviews'
end

And(/^I have successfully subscribed to the silver package$/) do
  create(:subscription, owner_id: @owner.id)
end

And(/^I do not have a subscription$/) do
end

And(/^see a message asking me to pay$/) do
  expect(page).to have_content 'Please complete payment for your subscription'
end