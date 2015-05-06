Given(/^I am on the home page$/) do
  visit regions_path
end

When(/^I click the Write a review button$/) do
  click_link 'Share your review'
end

Then(/^I should be redirected to signup\/login$/) do
  expect(current_path).to eq signup_path
end

Then(/^I should be given a prompt to register$/) do
  expect(page).to have_content('Please signup/login before posting a review')
end