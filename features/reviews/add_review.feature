Feature: Adding a review
  As a registered bride
  I want to be able to write a review of an existing supplier or add a new one
  So that I can give effective feedback for the benefit of other brides

Scenario: Adding a review for an existing supplier
  Given there is a supplier called "London Flowers"
  And I am a registered bride and logged in
  When I click the "Share your review" button
  And fill the supplier review form for "London Flowers"
  Then I should be redirected to the supplier page with a thank you message

Scenario: Adding a review for an existing supplier with invalid submission
  Given there is a supplier called "London Flowers"
  And I am a registered bride and logged in
  When I click the "Share your review" button
  And fail to fill-in the review content field for "London Flowers"
  Then I should see an error on the review form

Scenario: Adding a review for a supplier with an owner and getting an email notification
  Given there is a owned supplier called "London Flowers" owned by "quentin@example.com"
  And I am a registered bride and logged in
  When I click the "Share your review" button
  And fill the supplier review form for "London Flowers"
  Then I should be redirected to the supplier page with a thank you message
  And "quentin@example.com" should receive 2 emails

Scenario: Adding a review from the region categories page
  Given there is a category called "Flowers"
  And there is a region called "London"
  And I am a registered bride and logged in
  And I am go to the region "London" and select the "Flowers" category
  When I click the "Share your review" button
  Then I should see the review form

Scenario: Adding a review from the region page
  Given there is a region called "London"
  And I am a registered bride and logged in
  When I visit the region page for "London"
  And I click the "Share your review" button
  Then I should see the review form

Scenario: Adding a review directly from a supplier page
  Given there is a supplier called "London Flowers"
  And I am a registered bride and logged in
  When I go to the supplier page for "London Flowers"
  And I click the "Share your review" button
  Then I should not have to fill in the supplier