Given(/^I click on the How to Advertise With Us link$/) do
  click_link 'How to advertise with us'
end

Given(/^I click on the Advertise button$/) do
  click_link 'Advertise'
end

When(/^I fill in the ad request form$/) do
  within '.new_ad_request' do
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Business Name', with: 'London Flowers'
    select 'Flowers', from: 'Category'
    fill_in 'Contact email', with: 'john@example.com'
    fill_in 'Contact phone number', with: '02075345678'
    select 'Phone', from: 'Contact preference'
  end
end

When(/^press the Submit Request button$/) do
  click_button 'Submit request'
end

Then(/^I should have successfully submitted an ad request$/) do
  expect(page).to have_content('Thank you for your interest in placing an ad. We shall get back to you shortly')
end