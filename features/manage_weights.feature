Feature: Managing weights
  In order to use the weight track app
  As a user
  I want to be able to create, read, update, and delete weights

Background:
  Given I am logged in as a user

Scenario: View existing weights
  Given I have existing weights
  When I view the weights index page
  Then I will see all of my existing weights

Scenario: Add a valid weight
  And I enter a valid weight
  When I press submit
  Then the weight will be added

Scenario: Add an invalid weight
  And I enter an invalid weight
  When I press submit
  Then I will see an error message
  And the weight will not be added



