Feature: Information Features
  As a potential user or advertiser
  I want to find more information about Guide To Be
  So that I can decided if it right for me

Scenario: About page (from footer)
  Given I am a potential user
  When I visit the home page
  And Click the About link in the footer
  Then I should see the about page

Scenario: About page (from top menu)
  Given I am a potential user
  When I visit the home page
  And Click the About link in the navigation
  Then I should see the about page

Scenario: Contact page
   Given I am a potential user
   When I visit the home page
   And Click the Contact Us link in the navigation
   Then I should see the contact us page