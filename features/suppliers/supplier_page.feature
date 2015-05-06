Feature: Supplier Page
  As a potential user or registered user
  I want to want to view reviews for a supplier
  So that I can check them out

Scenario: Finding a supplier by region and category
  Given there is a supplier for Flowers in London called "London Flowers"
  When I visit the Flowers page for London
  And click the link "London Flowers"
  Then I should be on the "London Flowers" supplier page

Scenario: Basic Content for a supplier page
  Given there is a supplier with full content
  When I visit the supplier page
  Then I should see the correct basic supplier content on the page

Scenario: Viewing all review for a supplier on their page
  Given there is a supplier with some reviews
  When I visit the supplier page
  Then I should see the correct content for each of the reviews