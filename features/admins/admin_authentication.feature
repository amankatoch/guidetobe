Feature: Admin Authentication
  In order to Access the admin
  As a registered admin
  I want to access the admin area

Scenario: Admin Login
  Given I am a registered admin
  When I fill in the admin login form with correct credentials
  Then I should reach the admin dashboard

Scenario: Admin Failed Login
  Given I am not a registered admin
  When I fill in the admin login form with incorrect credentials
  Then I should be redirected to the admin login page

Scenario: Admin Logout
  Given I am an admin and logged in
  When I click the logout button
  Then I should be redirecto to the home page