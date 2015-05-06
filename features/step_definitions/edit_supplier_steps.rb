Given(/^I am logged in as the owner of "(.*?)"$/) do |supplier_name|
  @supplier = create(:supplier, name: supplier_name)
  @owner = create(:owner, username: 'test',
                          password: 'password', password_confirmation: 'password',
                          supplier: @supplier)
  visit signup_path
  within '.login_form' do
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'password'
    click_button 'Login'
  end
end

When(/^I click the edit my business button$/) do
  click_link 'Edit my listing'
end

Then(/^I should see the edit supplier form$/) do
  expect(current_path).to eq edit_supplier_path(@supplier)
end

Given(/^there is another supplier called "(.*?)"$/) do |supplier_name|
  create(:supplier, name: supplier_name)
end

When(/^I go to the edit supplier page for "(.*?)"$/) do |supplier_name|
  visit edit_supplier_path(Supplier.find_by_name(supplier_name))
end

Then(/^I should see an authentication error$/) do
  expect(current_path).to eq regions_path
  expect(page).to have_content 'Unauthorised. You may only edit your own business.'
end

When(/^I update the category of the supplier to "(.*?)"$/) do |category_name|
  within '.add_supplier_form' do
    select category_name, from: 'Category'
    fill_in 'Contact Email', with: 'test@example.com'
    fill_in 'Contact Phone', with: '0207834567'
    fill_in 'Facebook link', with: 'http://facebook.com'
    click_button 'Update business listing'
  end
end

Then(/^I should see the updated supplier page with the correct new category of "(.*?)"$/) do |category_name|
  expect(current_path).to eq supplier_path(Supplier.first)
  expect(page).to have_content 'Welcome to Guide To Be'
end

When(/^I click on the Edit supplier button$/) do
  click_link 'Edit Supplier'
end

When(/^I click the View Busines Page link$/) do
  click_link 'View business page'
end