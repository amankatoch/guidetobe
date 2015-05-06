Feature: Information Features
  As a potential user
  I want to signup for Guide To Be as a bride
  So that I can post a review

  Scenario: Accessing the signup form via the header
    Given I am a potential user
    When I visit the home page
    And I click the signup link in the header
    Then I should see the signup form

  Scenario: Accessing the signup form via the footer
    Given I am a potential user
    When I visit the home page
    And I click the signup link in the footer
    Then I should see the signup form

  Scenario: Signup with correct information
    Given I am a potential user
    And I visit the signup page
    When I fill in the form with correct information
    Then I should see a signup confirmation message

  Scenario: Signup with incorrect information
    Given I am a potential user
    And I visit the signup page
    When I fill in the form with no email address
    Then I should see a signup error

  Scenario: Signup using the source other field
    Given I am a potential user
    And I visit the signup page
    When I fill in the form with the other source field filled in
    Then I should see a signup confirmation message