And(/^I click the signup link in the header$/) do
  visit regions_path
  within 'header' do
    click_link 'Sign up/log in'
  end
end

And(/^I click the signup link in the footer$/) do
  visit regions_path
  within 'footer' do
    click_link 'Sign up/log in'
  end
end

Then(/^I should see the signup form$/) do
  expect(page).to have_content('Sign Up Now')
end

Given(/^I visit the signup page$/) do
  visit signup_path
end

When(/^I fill in the form with correct information$/) do
  within '.bride_signup_form' do
    fill_in 'Name', with: 'Jenny Smith'
    fill_in 'Address', with: '8 Copse Wood Way'
    fill_in 'Region', with: 'Northwood'
    fill_in 'Postcode', with: 'HA6 2UE'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Age', with: '26'
    select 'Facebook', from: 'bride_source'
    fill_in 'Wedding date', with: Date.today
    fill_in 'Place of wedding', with: 'Staines'
    fill_in 'Username', with: 'testaccount'
    fill_in 'bride_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    check 'Agree to terms of use'
    click_button 'Create my profile'
  end
end

Then(/^I should see a signup confirmation message$/) do
  expect(page).to have_content('Welcome to Guide To Be. You have signed up successfully!')
end

When(/^I fill in the form with no email address$/) do
  within '.bride_signup_form' do
    fill_in 'Name', with: 'user@example.com'
    fill_in 'Address', with: '8 Copse Wood Way'
    fill_in 'Region', with: 'Northwood'
    fill_in 'Postcode', with: 'HA6 2UE'
    fill_in 'Email', with: ''
    fill_in 'Age', with: '26'
    select 'Facebook', from: 'bride_source'
    fill_in 'Wedding date', with: Date.today
    fill_in 'Place of wedding', with: 'Staines'
    fill_in 'Username', with: 'testaccount'
    fill_in 'bride_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    check 'Agree to terms of use'
    click_button 'Create my profile'
  end
end

Then(/^I should see a signup error$/) do
  expect(page).to have_content('Ooops! There are some important details missing below.')
end

When(/^I fill in the form with the other source field filled in$/) do
  within '.bride_signup_form' do
    fill_in 'Name', with: 'Jenny Smith'
    fill_in 'Address', with: '8 Copse Wood Way'
    fill_in 'Region', with: 'Northwood'
    fill_in 'Postcode', with: 'HA6 2UE'
    fill_in 'Email', with: 'jenny@hotmail.com'
    fill_in 'Age', with: '26'
    select 'Other', from: 'bride_source'
    fill_in 'bride_source_other', with: 'Tessa told me'
    fill_in 'Wedding date', with: Date.today
    fill_in 'Place of wedding', with: 'Staines'
    fill_in 'Username', with: 'testaccount'
    fill_in 'bride_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    check 'Agree to terms of use'
    click_button 'Create my profile'
  end
end