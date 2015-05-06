Given(/^there is a supplier review$/) do
  @supplier = create(:supplier)
  @review = create(:review, supplier: @supplier)
end

When(/^click on the report review button$/) do
  click_link 'Report'
end

Then(/^I should be redirect to the login page$/) do
  expect(current_path).to eq login_path
end

Then(/^I should be redirect to the supplier page$/) do
  expect(current_path).to eq supplier_path(@supplier)
  expect(page).to have_content 'Thanks for reporting this review. We have been notified and will investigate it.'
end