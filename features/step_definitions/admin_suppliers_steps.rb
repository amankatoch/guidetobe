Given(/^an admin with username "(.*?)" and password "(.*?)"$/) do |username, password|
  @password = password
  @admin = create(:admin, username: username, password: password, password_confirmation: password)
end

Given(/^(\d+) suppliers for the region "(.*?)" and the category "(.*?)"$/) do |supplier_count, region_name, category_name|
  create_list(:supplier, supplier_count.to_i, category: create(:category, name: category_name), region: create(:region, name: region_name))
end

Given(/^I am logged in as the admin$/) do
  visit new_admin_session_path
  fill_in 'Username', with: @admin.username
  fill_in 'Password', with: @password
  click_button 'Login'
end

When(/^I click the link "(.*?)"$/) do |link_name|
  click_link link_name
end

Then(/^I should see all the suppliers$/) do
  supplier_1 = Supplier.first
  within 'table' do
    expect(page).to have_content supplier_1.name
  end
end