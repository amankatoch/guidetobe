Feature:
  In order to navigate around the site
  As a registered owner
  I want have easy access to all areas

  Scenario: Owner Edit Business Link
    Given I am logged in as the owner of "London Flowers"
    When I click the edit my business button
    Then I go to the edit supplier page for "London Flowers"

  Scenario:
    Given I am logged in as the owner of "London Flowers"
    When I click the View Busines Page link
    Then I go to the supplier page for "London Flowers"
    


