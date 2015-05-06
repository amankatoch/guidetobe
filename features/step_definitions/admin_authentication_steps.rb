Given(/^I am a registered admin$/) do
  create(:admin, username: 'admin', password: 'test',
                 password_confirmation: 'test')
end

When(/^I fill in the admin login form with correct credentials$/) do
  visit new_admin_session_path
  within '.admin_login' do
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'test'
    click_button 'Login'
  end
end

Then(/^I should reach the admin dashboard$/) do
  expect(current_path).to eq admin_dashboard_path
end

Given(/^I am not a registered admin$/) do
  # nothing to do here
end

When(/^I fill in the admin login form with incorrect credentials$/) do
  visit new_admin_session_path
    within '.admin_login' do
      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'garbage'
      click_button 'Login'
    end
end

Then(/^I should be redirected to the admin login page$/) do
  expect(page).to have_content('Sorry username or password is invalid')
end

Given(/^I am an admin and logged in$/) do
  create(:admin, username: 'admin', password: 'test',
                 password_confirmation: 'test')
  visit new_admin_session_path
  within '.admin_login' do
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'test'
    click_button 'Login'
  end
end

When(/^I click the logout button$/) do
  click_link 'Logout'
end

Then(/^I should be redirecto to the home page$/) do
  expect(current_path).to eq regions_path
end