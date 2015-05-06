Feature: Review Response
  In order to maintain my reputation and thank brides
  As a supplier owner with the right subscription level
  I want to be able to respond to reviews of my supplier

Scenario: Accessing the review response form
  Given that I am the registered owner of a supplier with plan 2
  And there is a review for my supplier
  And I am logged in as the registered owner and on the supplier page
  When I click the respond to review button
  Then I should see the review response form

Scenario: Writing a review reply
  Given that I am the registered owner of a supplier with plan 2
  And there is a review for my supplier
  And I am logged in as the registered owner and on the supplier page
  When I click the respond to review button
  And fill in the reply form
  Then I should see my supplier page and a notificatio that the response have been posted

Scenario: Accessing the review reply form if the owner is not on the right plan
  Given that I am an owner of a supplier with a free plan
  And there is a review for my supplier
  And I am logged in as the registered owner and on the supplier page
  Then I should should not see a link to reply to the review

Scenario: Trying to add a reply if one has already been written
  Given that I am the registered owner of a supplier with plan 2
  And there is a review for my supplier
  And there is a reply for this review
  And I am logged in as the registered owner and on the supplier page
  Then I should should not see a link to reply to the review