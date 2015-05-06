Feature: Writing a Review
  As a registered bride
  I want to be be able to write a review
  So that I contribute to Guide To Be

Scenario: Writing a review without being logged in
  Given I am a potential user
  And I am on the home page
  When I click the Write a review button
  Then I should be redirected to signup/login
  And I should be given a prompt to register