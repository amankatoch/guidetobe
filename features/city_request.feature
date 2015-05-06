Feature: City Requests
  As an potential user
  I want to be able to notify the administrators that I want my city added
  So that the site can expland with new cities

Scenario: Requesting a city
  Given I am on the home page
  And click the link for requesting a new city
  When I fill in the request city form with city, email and wedding date
  Then I should see message "Thanks for giving us your details. We’ll be in touch when Guide To Be reaches you. Happy wedding planning"