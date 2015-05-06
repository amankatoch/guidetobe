Given(/^click the link for requesting a new region$/) do
  click_link 'Put your region on the map'
end

When(/^I fill in the request region form with region, email and wedding date$/) do
  within '.city_request_form' do
    fill_in 'Region', with: 'Manchester'
    fill_in 'Your email', with: 'test@example.com'
    fill_in 'Your wedding date', with: Date.today
    click_button 'Submit city request'
  end
end

Then(/^I should see message "(.*?)"$/) do |message|
  expect(page).to have_content message
end