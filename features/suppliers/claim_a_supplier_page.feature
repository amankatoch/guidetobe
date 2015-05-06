Feature: Claim a supplier page

Scenario: Starting the supplier claiming process
  Given I am a potential user
  And I am on the home page
  When I click on the "Claim a business" button
  Then I should see the business listings page

Scenario: Starting the supplier claiming process from the region page
  Given I am a potential user
  And I am on the "London" region page
  When I click on the "Claim a business" button
  Then I should see the business listings page

Scenario: Starting the supplier claiming process from a category page
  Given I am a potential user
  And I visit the "Flowers" category page for "London"
  When I click on the "Claim a business" button
  Then I should see the business listings page

Scenario: Starting the supplier claiming process from a supplier page
  Given I am a potential user
  And there is a supplier called "London Flowers"
  And I visit the supplier page for "London Flowers"
  When I click on the "Claim a business" button
  Then I should see the business listings page