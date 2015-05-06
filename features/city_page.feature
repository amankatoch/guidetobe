Feature: Region Page
  As a potential user or a registered user
  I want to visit an individual region page
  So that I can see service categories and advertisements

Scenario: Visiting the region page
  Given there is a region called "London"
  And I am a potential user
  And I am on the home page
  When I click on the "London" link
  Then I should go to the "London" region page
  And I should see "Welcome to Guide To Be London"

Scenario: Viewing the categories for a region
  Given there is a region called "London"
  And there are categories
  And I am a potential user
  When I visit the region page for "London"
  Then I should see the categories

Scenario: Viewing individual category for a region
  Given there is a category called "Venues"
  And I am on the "London" region page
  When I click the "Venues" link
  Then I should see the "Venues" category page for "London"

Scenario: Viewing the count on the category page for a region
  Given there is a region category called "Venues" for "London"
  And there are three suppliers with three total reviews
  When I visit the "London" region page
  Then I should see the text "There are 3 reviews of 3 venue suppliers in London"

Scenario: Viewing suppliers for a region category
  Given there are 3 suppliers for "Venues" in "London"
  And I am on the "Venues" category page for "London"
  Then I should see 3 suppliers listed

Scenario: Viewing the review count for a supplier
  Given there are is a supplier for "Venues" in "London"
  And the supplier has 3 reviews
  And I am on the "Venues" category page for "London"
  Then I should see the review count for that supplier

Scenario: Viewing suppliers in order of rank
  Given there are 3 suppliers for "Venues" in "London" with different overall ratings
  When I visit the "Venues" category for "London"
  Then the suppliers should be ordered by overall rating and should have the correct rank
