Given(/^that I am a potential owner$/) do
end

Given(/^I am on the business listings page$/) do
  visit business_listings_path
end

Given(/^a product called "(.*?)"$/) do |product_name|
  @product = create(:product, name: product_name, package: 2)
end

When(/^I click the buy now link$/) do
  within '#gold' do
    click_link 'Sign up now'
  end
end

When(/^fill in the owner signup form$/) do
  fill_in 'Business name', with: 'Crazy Flowers'
  select 'Flowers', from: 'Category'
  select 'London & South East', from: 'Region'
  fill_in 'Website', with: 'http://www.crazycakes.co.uk'
  fill_in 'First name', with: 'John'
  fill_in 'Last name', with: 'Smith'
  fill_in 'Email', with: 'john@example.com'
  fill_in 'Username', with: 'testuser'
  fill_in 'supplier_owner_attributes_password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  select 'Gold', from: 'Package'
  check 'Agree to supplier terms'
  click_button 'Create business listing'
end

When(/^fill in the owner signup form with no username$/) do
  fill_in 'Business name', with: 'Crazy Flowers'
  select 'Flowers', from: 'Category'
  select 'London & South East', from: 'Region'
  fill_in 'Website', with: 'http://www.crazycakes.co.uk'
  fill_in 'First name', with: 'John'
  fill_in 'Last name', with: 'Smith'
  fill_in 'Email', with: 'john@example.com'
  #fill_in 'Username', with: 'testuser'
  fill_in 'supplier_owner_attributes_password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  select 'Gold', from: 'Package'
  check 'Agree to supplier terms'
  click_button 'Create business listing'
end

Then(/^I should be taken to the payment page$/) do
  expect(current_path).to eq show_buy_path(id: @product.id)
end

Then(/^see an owner signup confirmation message$/) do
  expect(page).to have_content('Your business is now officially listed')
end

Then(/^I should see an owner signup error$/) do
  expect(page).to have_content("Ooops! There are some important details missing below.")
end

Given(/^there is an owned supplier called "(.*?)"$/) do |supplier_name|
  @supplier = create(:supplier)
  owner = create(:owner, supplier: @supplier)
end

When(/^fill in the owner signup form and select the owned supplier$/) do
  fill_in 'Business name', with: 'Crazy Flowers'
  select 'Flowers', from: 'Category'
  select 'London & South East', from: 'Region'
  fill_in 'Website', with: 'http://www.crazycakes.co.uk'
  fill_in 'First name', with: 'John'
  fill_in 'Last name', with: 'Smith'
  fill_in 'Email', with: 'john@example.com'
  fill_in 'Username', with: 'testuser'
  fill_in 'supplier_owner_attributes_password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  select 'Gold', from: 'Package'
  check 'Agree to supplier terms'
  click_button 'Create business listing'
end

Then(/^I should see an error that the supplier is already claimed$/) do
  expect(page).to have_content 'already taken'
end

Given(/^there is a non\-owned supplier called "(.*?)"$/) do |supplier_name|
  @non_owned_supplier = create(:supplier, name: supplier_name)
end


When(/^fill in the owner signup form and select the "(.*?)" package$/) do |package_name|
  fill_in 'Business name', with: 'Crazy Flowers'
  select 'Flowers', from: 'Category'
  select 'London & South East', from: 'Region'
  fill_in 'Website', with: 'http://www.crazycakes.co.uk'
  fill_in 'First name', with: 'John'
  fill_in 'Last name', with: 'Smith'
  fill_in 'Email', with: 'john@example.com'
  fill_in 'Username', with: 'testuser'
  fill_in 'supplier_owner_attributes_password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  select @product.name, from: 'Package'
  check 'Agree to supplier terms'
  click_button 'Create business listing'
end

Then(/^I should bypass payment$/) do
  expect(current_path).to_not eq show_buy_path(@product)
end

Then(/^go to the edit supplier page$/) do
  expect(current_path).to eq edit_supplier_path(Owner.first.supplier)
end

Given(/^a free product called "(.*?)"$/) do |product_name|
  @product = create(:product, name: product_name, year_price: 0)
end


When(/^I click the owner signup link$/) do
  within '.premium' do
    click_link 'Sign up now'
  end
end

And(/^go to the free signup complete path$/) do
  expect(current_path).to eq free_signup_complete_path
end