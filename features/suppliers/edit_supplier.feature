Feature: Editing a supplier
  As a registered owner of a supplier
  I want to be able to edit the details of the supplier
  So that my business is best represented on Guide To Be

Scenario: Accessing the edit page as an owner
  Given I am logged in as the owner of "London Flowers"
  When I click the edit my business button
  Then I should see the edit supplier form

Scenario: Acessing the edipt supplier page as an owner from the supplier page
  Given I am logged in as the owner of "London Flowers"
  When I visit the supplier page for "London Flowers"
  And I click on the Edit supplier button
  Then I should see the edit supplier form

Scenario: Accessing the edit page for a supplier as the wrong owner
  Given I am logged in as the owner of "London Flowers"
  And there is another supplier called "Wonderful Flowers"
  When I go to the edit supplier page for "Wonderful Flowers"
  Then I should see an authentication error

Scenario: Updating the supplier page as an owner
  Given I am logged in as the owner of "London Flowers"
  And there is a category called "Executive Flowers"
  And I click the edit my business button
  When I update the category of the supplier to "Executive Flowers"
  Then I should see the updated supplier page with the correct new category of "Executive Flowers"