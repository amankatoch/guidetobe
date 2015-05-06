Feature: Dynamic Navigation
  As a registered bride/owner or a potential user
  I want to be able to use the navigation area to get around the site
  So that I can have a good experience

Scenario: Find a region
  Given that I am a potential user
  And there is a region called "London"
  And I am on the home page
  And I select "London" region from the dropdown
  Then I should arrive at the region page

Scenario: Find a category
  Given that I am a potential user
  And there is a category called "Flowers"
  And I am on the home page
  And I select "Flowers" category from the dropdown
  Then I should arrive at the categories page