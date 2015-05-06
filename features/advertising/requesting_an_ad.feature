Feature: Requesting an Ad
  In order to advertise on the site
  As a potential advertiser
  I should be able to submit an ad request for the admin to review

Scenario: Creating an ad request
  Given I am on the home page
  And there is a category called "Flowers"
  And I click on the How to Advertise With Us link
  And I click on the Advertise button
  When I fill in the ad request form
  And press the Submit Request button
  Then I should have successfully submitted an ad request