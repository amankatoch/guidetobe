Feature: Reporting a review
  As a registered bride or registered owner
  I want to be able to report a review
  So that I it can reviewed by an admin as appropriate

Scenario: Trying to report without being logged in
  Given I am a potential user
  And there is a supplier review
  When I visit the supplier page
  And click on the report review button
  Then I should be redirect to the login page

Scenario: Reporting a review when logged in as an bride
  Given I am a registered bride
  And there is a supplier review
  And I have logged in
  When I visit the supplier page
  And click on the report review button
  Then I should be redirect to the supplier page