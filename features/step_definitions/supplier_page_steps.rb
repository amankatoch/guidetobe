Given(/^there is a supplier for Flowers in London called "(.*?)"$/) do |supplier_name|
  @region = create(:region, name: 'London')
  @category = create(:category, name: 'Flowers')
  @supplier = create(:supplier, name: supplier_name, category: @category, region: @region)
end

When(/^I visit the Flowers page for London$/) do
  visit region_category_path(@region, @category)
end

When(/^click the link "(.*?)"$/) do |supplier_name|
  click_link supplier_name
end

Then(/^I should be on the "(.*?)" supplier page$/) do |supplier_name|
  expect(current_path).to eq supplier_path(@supplier)
  within '.business_info' do
    expect(page).to have_content supplier_name
  end
end

Given(/^there is a supplier with full content$/) do
  @supplier = create(:supplier)
end

When(/^I visit the supplier page$/) do
  visit supplier_path(@supplier)
end

Then(/^I should see the correct basic supplier content on the page$/) do
  within '.business_info' do
    expect(page).to have_content @supplier.name
    expect(page).to have_content @supplier.email
    expect(page).to have_content @supplier.phone
    expect(page).to have_content "0 reviews"
    expect(page).to have_content "Rank 1/1"
  end
end

Given(/^there is a supplier with some reviews$/) do
  @supplier = create(:supplier)
  @review1 = create(:review, supplier: @supplier, overall: 5)
  @review2 = create(:review, supplier: @supplier, overall: 3)
end

Then(/^I should see the correct content for each of the reviews$/) do
  expect(page).to have_content @review1.general_content
  expect(page).to have_content @review1.like_content
  expect(page).to have_content @review1.unlike_content
  expect(page).to have_content "One thing I liked about #{@supplier.name}"
  expect(page).to have_content "One thing I didn't like about #{@supplier.name}"

  expect(page).to have_content @review2.general_content
  expect(page).to have_content @review2.like_content
  expect(page).to have_content @review2.unlike_content
end
