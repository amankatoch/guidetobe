Given(/^that I am the registered owner of a supplier with plan (\d+)$/) do |arg1|
  @supplier = create(:supplier)
  product = create(:product, year_price: 20, package: 2)
  @owner = create(:owner, supplier: @supplier, product: product, password: 'test', password_confirmation: 'test')
  sale = create(:finished_sale, product: @product, owner: @owner)
  create(:subscription, owner: @owner, sale: sale, product: product)
end

Given(/^there is a review for my supplier$/) do
  @review = create(:review, supplier: @supplier)
end

Given(/^I am logged in as the registered owner and on the supplier page$/) do
  visit signup_path
  within '.login_form' do
    fill_in 'Username', with: @owner.username
    fill_in 'Password', with: 'test'
    click_button 'Login'
  end
  visit supplier_path(@supplier)
end

Given(/^that I am an owner of a supplier with a free plan$/) do
  @supplier = create(:supplier)
  @owner = create(:owner, supplier: @supplier, password: 'test', password_confirmation: 'test')

  product = create(:product, year_price: 0, package: 1)
  sale = create(:finished_sale, product: product, owner: @owner)
end

When(/^I click the respond to review button$/) do
  click_link 'Respond to review'
end

Then(/^I should see the review response form$/) do
  expect(page).to have_content 'Please add your response here'
end

Then(/^I should should not see a link to reply to the review$/) do
  expect(page).to_not have_content 'Respond to review'
end

When(/^fill in the reply form$/) do
  within '.reply_form' do
    fill_in 'reply_body', with: 'blah blah blah'
    click_button 'Add reply'
  end
end

Then(/^I should see my supplier page and a notificatio that the response have been posted$/) do
  expect(current_path).to eq supplier_path(@supplier)
  expect(page).to have_content 'Thank you for posting a reply to your review'
  expect(page).to have_content 'blah blah blah'
end

Given(/^there is a reply for this review$/) do
  create(:reply, review: @review)
end
