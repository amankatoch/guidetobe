Given(/^I am a potential user$/) do
end

When(/^I visit the home page$/) do
  visit regions_path
end

When(/^Click the About link in the footer$/) do
  within 'footer' do
    click_link 'About'
  end
end

When(/^Click the About link in the navigation$/) do
  within 'header' do
    click_link 'Who are we?'
  end
end

When(/^Click the FAQ link in the navigation$/) do
  within 'header' do
    click_link 'FAQ'
  end
end

Then(/^I should see the about page$/) do
  expect(page).to have_content 'About Us'
end

Then(/^I should see the FAQ page$/) do
  within 'h1' do
    expect(page).to have_content 'FAQs'
  end
end

When(/^click the Pricing link in the navigation$/) do
  within '.about_dropdown' do
    click_link 'Pricing'
  end
end

Then(/^I should see the pricing page$/) do
  within 'h1' do
    expect(page).to have_content 'Pricing'
  end
end

When(/^click the T\+Cs link in the navigation$/) do
  within '.about_dropdown' do
    click_link 'T+Cs'
  end
end

Then(/^I should see the terms and conditions page$/) do
  within 'h1' do
    expect(page).to have_content 'Terms of Use'
  end
end

Then(/^I should see the contact us page$/) do
  expect(current_path).to eq contact_path
end

And(/^Click the Contact Us link in the navigation$/) do
  within '.about_dropdown' do
    click_link 'Contact Us'
  end
end