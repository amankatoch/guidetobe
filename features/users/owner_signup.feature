Feature: Owner Signup
  As a potential owner
  I want to claim or create my supplier page
  So that I can edit the info for my business and be ahead of other suppliers

Scenario: Signup as an owner with correct information
  Given that I am a potential owner
    And I am on the business listings page
    And there is a supplier for Flowers in London called "London Flowers"
    And a product called "Gold"
  When I click the buy now link
    And fill in the owner signup form
  Then I should be taken to the payment page

Scenario: Signup as an owner with incorrect information
  Given that I am a potential owner
    And I am on the business listings page
    And there is a supplier for Flowers in London called "London Flowers"
    And a product called "Gold"
  When I click the buy now link
    And fill in the owner signup form with no username
  Then I should see an owner signup error

Scenario: Signup as an owner on a plan that does not require payment
   Given that I am a potential owner
    And I am on the business listings page
    And there is a supplier for Flowers in London called "London Flowers"
    And a free product called "Platinum"
   When I click the owner signup link
    And fill in the owner signup form and select the "Platinum" package
   Then I should bypass payment
    And go to the free signup complete path

