When(/^I visit the login page$/) do
  visit signup_path
end

And(/^I click the reset password link$/) do
  click_link 'Reset your password'
end

And(/^I fill in my email address and click the rest password button$/) do
  fill_in 'Email', with: 'bride@example.com'
end

Then(/^I should return to the home page$/) do
  expect(current_path).to eq root_path
end

And(/^see the message email sent$/) do
  expect(page).to have_content 'Email sent'
end

And(/^an email should be sent to the user$/) do
  last_email.to.should include 'bride@example.com'
end