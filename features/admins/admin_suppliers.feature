Feature: Admin Suppliers
  In order to keep up-to-date on suppliers
  As an admin
  I want to be able to view, edit and remove suppliers

Background:
  Given an admin with username "Admin" and password "password"
  And 4 suppliers for the region "London" and the category "Flowers"
  And 6 suppliers for the region "Glasgow" and the category "Venues"


Scenario: Viewing all suppliers

  Given I am logged in as the admin
  When I click the link "Suppliers"
  Then I should see all the suppliers