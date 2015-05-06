Feature: Logging in and out as a bride
  As a registered bride
  I want to be able to login and logout of the site
  So that I can make full use of it

Scenario: Login with correct credentials
  Given I am a registered bride
  When I visit the home page
  And click the login/signup link
  And fill in my credentials
  Then I should be logged into the site
  And receive a welcome message

Scenario: Login with invalid credentials
  Given I am a registered bride
  When I visit the home page
  And click the login/signup link
  And fill in invalid credentials
  Then I should not be logged into the site
  And should receive an error

Scenario: Logging out
  Given I am a registered bride
  And I have logged in
  When I click the logout link
  Then I should redirect to the home page
  And I should see a logout notification