Given(/^I am a registered bride$/) do
  create(:bride,
          username: 'testuser',
          password: 'password', password_confirmation: 'password', email: 'bride@example.com')
end

When(/^click the login\/signup link$/) do
  visit regions_path
  within 'header' do
    click_link 'Sign up/log in'
  end
end

When(/^fill in my credentials$/) do
  within '.login_form' do
    fill_in 'username', with: 'testuser'
    fill_in 'password', with: 'password'
    click_button 'Login'
  end
end

Then(/^I should be logged into the site$/) do
  expect(current_path).to eq regions_path
end

Then(/^receive a welcome message$/) do
  expect(page).to have_content 'You have signed in successfully'
end

When(/^fill in invalid credentials$/) do
  within '.login_form' do
    fill_in 'username', with: 'testuser'
    fill_in 'password', with: 'invalid_password'
    click_button 'Login'
  end
end

Then(/^I should not be logged into the site$/) do
  expect(current_path).to_not eq regions_path
end

Then(/^should receive an error$/) do
  expect(page).to have_content 'Sorry that username or password is invalid'
end

Given(/^I have logged in$/) do
  visit signup_path
  within '.login_form' do
    fill_in 'username', with: 'testuser'
    fill_in 'password', with: 'password'
    click_button 'Login'
  end
end

When(/^I click the logout link$/) do
  within 'header' do
    click_link 'Logout'
  end
end

Then(/^I should redirect to the home page$/) do
  expect(current_path).to eq regions_path
end

Then(/^I should see a logout notification$/) do
  expect(current_path).to eq regions_path
end