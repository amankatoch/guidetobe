Feature: Logging in and out as a owner
  As a registered owner
  I want to be able to login and logout of the site
  So that I can see my supplier page, edit it and and add advertising

Scenario: Owner login with correct credentials
  Given I am the registered owner of "London Flowers"
  When I fill in my correct owner credentials in the login form
  Then I should be redirect to the supplier page for "London Flowers"
  And I should see a welcome message

Scenario: Owner login and navigation changes
  Given I am a registered owner with username "test" and password "password"
  When I login with username "test" and password "password"
  Then I should see the navigation change to a logout button

Scenario: Owner login and attempt to write review
  Given I am the registered owner of "London Flowers"
  When I fill in my correct owner credentials in the login form
  And try to write a review
  Then I should see a review owner error notification and be redirected to home page


